// Libraries
import { Box, Checkbox, Grid, Skeleton, Stack, TextField, Typography } from "@mui/material";
import { useParams } from "react-router-dom";
import { useContext } from "react";

// Core
import { FormCntxt } from "core/context/Form"; // Context
import { series } from "core/api"; // API
import { formatter, useGet } from "core/function/global"; // Function

// Constants
import { input } from "../index.style"; // Styles
import { Controller } from "react-hook-form";


const Form = ({ fetching }) => {
    const { type } = useParams();
    const { register, errors, getValues, control, setValue } = useContext(FormCntxt);
    useGet({ key: ['mdl_series'], fetch: series('tbl_module'), options: { }, onSuccess: (data) => { if(type === 'new') setValue('series_no', `MDL-${formatter(parseInt(data) + 1, 7)}`); } });

    return (
        <Grid container direction= "row" justifyContent= "flex-start" alignItems= "flex-start" spacing= { 2 }>
            <Grid item xs= { 12 } sm= { 5 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography gutterBottom variant= "body2">*Series No.</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> : 
                        <TextField { ...register('series_no') } name= "series_no" variant= "standard" InputProps= {{ disableUnderline: true }} disabled= { true } sx= { input } /> }
                    <Typography variant= "body2" color= "error.dark" mt= "5px">{ errors.series_no?.message }</Typography>
                </Stack>
            </Grid>
            <Grid item xs= { 12 } sm= { 6 } md= { 7 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography gutterBottom variant= "body2">*Name</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> : 
                        <TextField { ...register('name') } name= "name" variant= "standard" InputProps= {{ disableUnderline: true }} disabled= { type === 'view' } sx= { input } /> }
                    <Typography variant= "body2" color= "error.dark" mt= "5px">{ errors.name?.message }</Typography>
                </Stack>
            </Grid>
            <Grid item xs= { 12 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography gutterBottom variant= "body2">Status</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> : 
                        <Box sx= {{ display: 'flex', flexDirection: 'row', justifyContent: 'flex-start', alignItems: 'center' }}>
                            <Controller control= { control } name= "status" defaultValue= { getValues().status ?? true }
                                render= { ({ field: { onChange } }) => (
                                    <Checkbox sx= {{ color: '#919eab', '&.Mui-checked': { color: '#2065d1' } }} disabled= { type === 'view' }
                                        checked= { getValues().status ?? true } onChange= { e => { setValue('status', getValues().status ?? true); onChange(e.target.checked); } } /> ) 
                                } />
                        </Box> }
                </Stack>
            </Grid>
        </Grid>
    );
}

export default Form;