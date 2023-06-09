// Libraries
import { Autocomplete, Box, Grid, Skeleton, Stack, TextField, Typography } from "@mui/material";
import { useContext } from "react";
import { Controller } from "react-hook-form";
import { useParams } from "react-router-dom";

// Core
import { FormCntxt } from "core/context/Form"; // Context
import { ProfileCntx } from "core/context/Profile"; // Context
import { dropdown } from "core/api"; // Context
import { useGet } from "core/function/global"; // Function

// Constants
import { select } from "./index.style"; // Styles
const usertype = [{ id: 'ras', name: 'RAS' }, { id: 'rcs', name: 'RCS' }]; // User type

const Form = ({ fetching }) => {
    const { type } = useParams();
    const { data } = useContext(ProfileCntx);
    const { control, getValues, errors } = useContext(FormCntxt);
    const { data: personnel } = 
        useGet({ key: ['personnel'], fetch: dropdown({ table: 'tbl_physical_count_personnels', data: { platform: 'client' } }), options: { refetchOnWindowFocus: false } });

    return (
        <Grid container direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 }>
            <Grid item>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography variant= "body2" gutterBottom>*Assigned to</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> : 
                        <Box sx= { select }>
                            <Controller control= { control } name= "branch"
                                render= { ({ field: { onChange } }) => (
                                    <Autocomplete options= { ([{ id: '', name: '-- SELECT AN ITEM BELOW --' }].concat(JSON.parse(data.branches))).sort((a, b) => a.id - b.id) }
                                        disableClearable getOptionLabel= { branch => branch.name || branch.id } noOptionsText= "No results..." getOptionDisabled= { option => option.id === '' }
                                        isOptionEqualToValue= { (option, value) => option.name === value.name || option.id === value.id }
                                        onChange= { (e, item) => { onChange(item.id) } } renderInput= { params => <TextField { ...params } variant= "standard" size= "small" fullWidth /> }
                                        value= { ([{ id: '', name: '-- SELECT AN ITEM BELOW --' }].concat(JSON.parse(data.branches)))
                                                        .find(data => { return data.id === (getValues()?.branch !== undefined ? getValues()?.branch : '' ) }) } />
                                ) } />
                        </Box> }
                    <Typography variant= "body2" color= "error.dark" mt= "5px">{ errors.branch?.message }</Typography>
                </Stack>
            </Grid>
            <Grid item>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography variant= "body2" gutterBottom>*Employee</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> : 
                        <Box sx= { select }>
                            { personnel?.length > 0 ?
                                <Controller control= { control } name= "employee"
                                    render= { ({ field: { onChange } }) => (
                                        <Autocomplete disableClearable disabled= { type !== 'new' }
                                            options= { type !== 'new' ? personnel.sort((a, b) => a.id - b.id) : 
                                                (personnel?.filter(emp => !(JSON.parse(data.personnels)).find(pnl => emp.id === pnl.employee?.id)))?.sort((a, b) => a.id - b.id) }
                                            getOptionLabel= { employee => employee.name || employee.id } noOptionsText= "No results..." getOptionDisabled= { option => option.id === 0 }
                                            isOptionEqualToValue= { (option, value) => option.id === value.id || option.name === value.name }
                                            onChange= { (e, item) => onChange({ id: item.id, name: item.name }) }
                                            renderInput= { params => ( <TextField { ...params } variant= "standard" size= "small" fullWidth /> ) }
                                            value= { getValues()?.employee !== undefined ? getValues()?.employee : { id: 0, name: '-- SELECT AN ITEM BELOW --' } } />
                                    ) } />
                                : <Typography color= "text.disabled">You must create a user first!</Typography> }
                        </Box> }
                    <Typography variant= "body2" color= "error.dark" mt= "5px">{ errors.employee?.message }</Typography>
                </Stack>
            </Grid>
            <Grid item>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography variant= "body2" gutterBottom>*Type</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> : 
                        <Box sx= { select }>
                            <Controller control= { control } name= "type"
                                render= { ({ field: { onChange } }) => (
                                    <Autocomplete options= { ([{ id: '', name: '-- SELECT AN ITEM BELOW --' }].concat(usertype)).sort((a, b) => a.id - b.id) }
                                        disableClearable getOptionLabel= { ut => ut.name || ut.id } noOptionsText= "No results..." getOptionDisabled= { option => option.id === '' }
                                        isOptionEqualToValue= { (option, value) => option.name === value.name || option.id === value.id }
                                        onChange= { (e, item) => { onChange(item.id); } } renderInput= { params => <TextField { ...params } variant= "standard" size= "small" fullWidth /> }
                                        value= { ([{ id: '', name: '-- SELECT AN ITEM BELOW --' }].concat(usertype))
                                                            .find(data => { return data.id === (getValues()?.type !== undefined ? getValues()?.type : '') }) } />
                                ) } />
                        </Box> }
                    <Typography variant= "body2" color= "error.dark" mt= "5px">{ errors.type?.message }</Typography>
                </Stack>
            </Grid>
        </Grid>
    );
}

export default Form;