// Libraries
import { Autocomplete, Box, Grid, Skeleton, Stack, TextField, Typography } from "@mui/material";
import { useContext } from "react";
import { Controller } from "react-hook-form";

// Core
import { dropdown } from "core/api"; // API
import { ProfileCntx } from "core/context/Profile"; // Context
import { useGet } from "core/function/global"; // Function
import { FormCntxt } from "core/context/Form"; // Context

// Constants
import { select } from "../index.style"; // Styles

const Counter = ({ fetching }) => {
    const { data } = useContext(ProfileCntx);
    const { control, errors, getValues, setError } = useContext(FormCntxt);
    const { data: ras } =
        useGet({ key: ['ras_dd'], fetch: dropdown({ table: 'tbl_physical_count_personnels', 
                        data: { platform: 'warehouse', physical_count_id: data.physical_count_id, user_id: data.user_id, type: 'ras' } }),
                        options: { refetchOnWindowFocus: false } });

    return (
        <Grid container direction= "row" justifyContent= "flex-start" alignItems= "flex-start" spacing= { 2 } sx= {{ marginBottom: '20px' }}>
            <Grid item xs= { 12 } md= { 4 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography variant= "body2" gutterBottom>*Assign RAS Counter</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> : <Box sx= { select }>
                        { ras?.length > 0 ?
                            <Controller control= { control } name= "count_by"
                                render= { ({ field: { onChange, value } }) => (
                                    <Autocomplete options= { ras?.sort((a, b) => a.id - b.id) } disableClearable disabled= { getValues()?.date_counted !== null }
                                        getOptionLabel= { pnl => pnl.name || pnl.id } noOptionsText= "No results..." getOptionDisabled= { option => option.id === 0 }
                                        isOptionEqualToValue= { (option, value) => option.name === value.name || option.id === value.id }
                                        onChange= { (e, item) => { setError('count_by', { message: '' }); onChange(item.id); } }
                                        renderInput= { params => <TextField { ...params } variant= "standard" size= "small" fullWidth /> }
                                        value= { ras?.find(data => { return data.id === (getValues().count_by !== undefined ? getValues().count_by : value) }) !== undefined ?
                                                            ras?.find(data => { return data.id === (getValues().count_by !== undefined ? getValues().count_by : value) }) : ras.length === 0 ?
                                                            { id: 0, name: '-- SELECT AN ITEM BELOW --' } : ras[0] } />
                                ) } />
                            : <Typography color= "text.disabled">You must create a user first!</Typography> }
                    </Box> }
                    <Typography variant= "body2" color= "error.dark">{ errors.count_by?.message }</Typography>
                </Stack>
            </Grid>
        </Grid>
    );
}

export default Counter;