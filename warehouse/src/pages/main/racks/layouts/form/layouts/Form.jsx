// Libraries
import { Autocomplete, Box, Grid, Skeleton, Stack, TextField, Typography } from "@mui/material";

// Layouts
import { useParams } from "react-router-dom";
import { useContext } from "react";
import { FormCntxt } from "core/context/Form";
import { input, select } from "../index.style";
import { Controller } from "react-hook-form";
const branch = [{ id: 'qa', name: 'QUEZON AVE.' }, { id: 'sd', name: 'STO. DOMINGO' }, { id: 'ma', name: 'MANILA' }, { id: 'ca', name: 'CAVITE' }]; // Branch
const floors = [{ id: '1f', name: '1ST FLOOR' }, { id: '2f', name: '2ND FLOOR' }, { id: '3f', name: '3RD FLOOR' }, { id: '4f', name: '4TH FLOOR' }]; // Floors

const Form = ({ fetching }) => {
    const { type } = useParams();
    const { register, errors, getValues, control } = useContext(FormCntxt);

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
        </Grid>
    );
}

export default Form;