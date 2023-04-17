// Libraries
import { Autocomplete, Box, Checkbox, Grid, InputAdornment, Skeleton, Stack, TextField, ThemeProvider, Typography } from "@mui/material";
import { useParams } from "react-router-dom";
import { useContext, useEffect } from "react";
import { Controller } from "react-hook-form";

// Core
import { FormCntxt } from "core/context/Form"; // Context
import { dropdown, series } from "core/api"; // API
import { formatter, useGet } from "core/function/global"; // Function
import { theme } from "core/theme/form.theme"; // Theme

// Constants
import { input, select } from "../index.style"; // Styles

const txtfield = {
    MuiInput: {
        styleOverrides: {
            root: {
                '&:before': { borderBottom: 'none' },
                '&:after': { borderBottom: 'none' },
                '&.Mui-disabled:before': { borderBottom: 'none' },
                '&:hover:not(.Mui-disabled):before': { borderBottom: 'none' }
            },
            input: { textTransform: 'uppercase' }
        }
    }
}

const Form = ({ fetching }) => {
    const { type } = useParams();
    const { register, errors, getValues, check, setCheck, control, setValue, setError, maintenance, setMaintenance } = useContext(FormCntxt);
    const { data: module } = useGet({ key: ['module'], fetch: dropdown({ table: 'tbl_module', data: {} }), options: { refetchOnWindowFocus: false } });
    useGet({ key: ['smdl_series'], fetch: series('tbl_sub_module'), options: { }, onSuccess: (data) => { if(type === 'new') setValue('series_no', `SUB-MDL-${formatter(parseInt(data) + 1, 7)}`); } });

    useEffect(() => { if(type === 'new') { register('module'); } }, [ type, register ]);

    return (
        <Grid container direction= "row" justifyContent= "flex-start" alignItems= "flex-start" spacing= { 2 }>
            <Grid item xs= { 12 } sm= { 8 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography gutterBottom variant= "body2">*Series No.</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> : 
                        <ThemeProvider theme= { theme(txtfield) }>
                            <TextField { ...register('series_no') } name= "series_no" variant= "standard" InputProps= {{ disableUnderline: true }} disabled= { true } sx= { input } />
                        </ThemeProvider> }
                    <Typography variant= "body2" color= "error.dark" mt= "5px">{ errors.series_no?.message }</Typography>
                </Stack>
            </Grid>
            <Grid item xs= { 12 } sm= { 6 } md= { 7 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography gutterBottom variant= "body2">*Module</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> : 
                        <Box sx= { select }>
                            { module?.length > 0 ? 
                                <Controller control= { control } name= "module_id" defaultValue= { 0 }
                                    render= { ({ field: { onChange, value } }) => (
                                        <Autocomplete options= { module?.sort((a, b) => a.id - b.id) } disabled= { type === 'view' } disableClearable 
                                            getOptionLabel= { module => module.name || module.id } noOptionsText= "No results.." getOptionDisabled= { option => option.id === 0 }
                                            isOptionEqualToValue= { (option, value) => option.name === value.name || option.id === value.id } 
                                            onChange= { (e, item) => { setError('module_id', { message: '' }); onChange(item.id); setValue('module', `/${(item.name).toLowerCase()}`); } }
                                            renderInput= { params => ( <TextField { ...params } variant= "standard" size= "small" fullWidth /> ) } 
                                            value= { module?.find(data => { return data.id === (getValues().module_id !== undefined ? getValues().module_id : value) }) !== undefined ?
                                                module?.find(data => { return data.id === (getValues().module_id !== undefined ? getValues().module_id : value) }) : module.length === 0 ?
                                                { id: 0, name: '-- SELECT AN ITEM BELOW --' } : module[0] } />
                                    ) } /> : <Typography color= "text.disabled">You must create a module first!</Typography> }
                        </Box> }
                    <Typography variant= "body2" color= "error.dark" mt= "5px">{ errors.module_id?.message }</Typography>
                </Stack>
            </Grid>
            <Grid item xs= { 12 } sm= { 6 } md= { 5 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography gutterBottom variant= "body2">*Name</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> : 
                        <ThemeProvider theme= { theme(txtfield) }>
                            <TextField { ...register('name') } name= "name" variant= "standard" InputProps= {{ disableUnderline: true }} disabled= { type === 'view' } sx= { input }
                                onChange= { e => setValue('path', `/${((e.target.value).replace(' ', '-')).toLowerCase()}`) } />
                        </ThemeProvider> }
                    <Typography variant= "body2" color= "error.dark" mt= "5px">{ errors.name?.message }</Typography>
                </Stack>
            </Grid>
            <Grid item xs= { 12 } sm= { 6 } md= { 4 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography gutterBottom variant= "body2">*Path</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> : 
                        <TextField { ...register('path') } name= "path" variant= "standard" 
                            InputProps= {{ disableUnderline: true, startAdornment: <InputAdornment position="start">{ getValues().module }</InputAdornment> }}
                            inputProps= {{ maxLength: 4 }} disabled= { true } sx= { input } /> }
                    <Typography variant= "body2" color= "error.dark" mt= "5px">{ errors.path?.message }</Typography>
                </Stack>
            </Grid>
            <Grid item xs= { 12 } sm= { 6 } md= { 8 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography gutterBottom variant= "body2">*Maintenance</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> : 
                        <Box sx= {{ display: 'flex', flexDirection: 'row', justifyContent: 'flex-start', alignItems: 'center' }}>
                            <Checkbox sx= {{ color: '#919eab', '&.Mui-checked': { color: '#2065d1' } }} name= "is_maintenance" 
                                { ...register('is_maintenance', { onChange: () => setMaintenance(!maintenance) }) } 
                                disabled= { type === 'view' } checked= { getValues().is_maintenance !== undefined ? getValues().is_maintenance > 0 ? true : false : maintenance } />
                            <Typography gutterBottom sx= {{ marginTop: '7px' }}>
                                { getValues().is_maintenance !== undefined ? getValues().is_maintenance > 0 ? 'Under maintenance' : 'Good' : maintenance ? 'Under maintenance' : 'Good' }</Typography>
                        </Box> }
                </Stack>
            </Grid>
            <Grid item xs= { 12 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography gutterBottom variant= "body2">Status</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> : 
                        <Box sx= {{ display: 'flex', flexDirection: 'row', justifyContent: 'flex-start', alignItems: 'center' }}>
                            <Checkbox sx= {{ color: '#919eab', '&.Mui-checked': { color: '#2065d1' } }} name= "status" { ...register('status', { onChange: () => setCheck(!check) }) } 
                                disabled= { type === 'view' } checked= { getValues().status !== undefined ? getValues().status > 0 ? true : false : check } />
                            <Typography gutterBottom sx= {{ marginTop: '7px' }}>
                                { getValues().status !== undefined ? getValues().status > 0 ? 'Active' : 'Inactive' : check ? 'Active' : 'Inactive' }</Typography>
                        </Box> }
                </Stack>
            </Grid>
        </Grid>
    );
}

export default Form;