// Libraries
import { useContext } from "react";
import { useParams } from "react-router-dom";
import { Controller } from "react-hook-form";
import { Autocomplete, Box, Checkbox, Grid, Skeleton, Stack, TextField, Typography } from "@mui/material";

// Core
import { FormCntxt } from "core/context/Form"; // Context
import { series } from "core/api"; // API
import { formatter, useGet } from "core/function/global"; // Function

// Constants
import { input, select } from "../index.style"; // Styles
const branch = [{ id: 'qa', name: 'QUEZON AVE.' }, { id: 'sd', name: 'STO. DOMINGO' }, { id: 'ma', name: 'MANILA' }, { id: 'ca', name: 'CAVITE' }]; // Branch
const floors = [{ id: '1f', name: '1ST FLOOR' }, { id: '2f', name: '2ND FLOOR' }, { id: '3f', name: '3RD FLOOR' }, { id: '4f', name: '4TH FLOOR' }]; // Floors

const Form = ({ fetching }) => {
    const { type } = useParams();
    const { register, errors, getValues, control, setValue } = useContext(FormCntxt);
    useGet({ key: ['rck_series'], fetch: series('tbl_racks'), options: { }, onSuccess: (data) => { if(type === 'new') setValue('series_no', `RCK-${formatter(parseInt(data) + 1, 7)}`); } });

    return (
        <Grid container direction= "row" justifyContent= "flex-start" alignItems= "flex-start" spacing= { 2 }>
            <Grid item xs= { 12 } sm= { 9 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography gutterBottom variant= "body2">*Series No.</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> : 
                        <TextField { ...register('series_no') } name= "series_no" variant= "standard" InputProps= {{ disableUnderline: true }} disabled= { true } sx= { input } /> }
                    <Typography variant= "body2" color= "error.dark" mt= "5px">{ errors.series_no?.message }</Typography>
                </Stack>
            </Grid>
            <Grid item xs= { 12 } md= { 4 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 }>
                    <Typography variant= "body2">Branch</Typography>
                    <Box sx= { select }>
                        <Controller control= { control } name= "branch" defaultValue= "qa"
                                render= { ({ field: { onChange, value } }) => (
                                    <Autocomplete options= { branch } disableClearable getOptionLabel= { opt => opt.name || opt.id } disabled= { type !== 'new' }
                                        noOptionsText= "No results..." isOptionEqualToValue= { (option, value) => option.name === value.name || option.id === value.id }
                                        renderInput= { params => ( <TextField { ...params } variant= "standard" size= "small" fullWidth= { true } /> ) } getOptionDisabled= { option => option.id === 0 }
                                        onChange= { (e, item) => { onChange(item.id); } }
                                        value= { branch.find(data => { return data.id === (getValues().branch !== undefined ? getValues().branch : value) }) } />
                                ) } />
                    </Box>
                </Stack>
            </Grid>
            <Grid item xs= { 12 } md= { 4 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 }>
                    <Typography variant= "body2">Floors</Typography>
                    <Box sx= { select }>
                        <Controller control= { control } name= "floor" defaultValue= "1f"
                                render= { ({ field: { onChange, value } }) => (
                                    <Autocomplete options= { floors } disableClearable getOptionLabel= { opt => opt.name || opt.id } disabled= { type !== 'new' }
                                        noOptionsText= "No results..." isOptionEqualToValue= { (option, value) => option.name === value.name || option.id === value.id }
                                        renderInput= { params => ( <TextField { ...params } variant= "standard" size= "small" fullWidth= { true } /> ) } getOptionDisabled= { option => option.id === 0 }
                                        onChange= { (e, item) => { onChange(item.id); } }
                                        value= { floors.find(data => { return data.id === (getValues().floor !== undefined ? getValues().floor : value) }) } />
                                ) } />
                    </Box>
                </Stack>
            </Grid>
            <Grid item xs= { 12 } md= { 4 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 }>
                    <Typography variant= "body2">*Code</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                        <TextField { ...register('code') } name= "code" variant= "standard" InputProps= {{ disableUnderline: true }} disabled= { type === 'view' } sx= { input } /> }
                    <Typography variant= "body2" sx= {{ color: '#e84118' }} gutterBottom>{ errors.code?.message }</Typography>
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
                                        checked= { getValues().status ?? true }
                                        onChange= { e => { setValue('status', getValues().status ?? true); onChange(e.target.checked); } } /> ) 
                                } />
                        </Box> }
                </Stack>
            </Grid>
        </Grid>
    );
}

export default Form;