// Libraries
import { Autocomplete, Box, Checkbox, Grid, Skeleton, Stack, TextField, Typography } from "@mui/material";
import { useParams } from "react-router-dom";
import { useContext, useEffect } from "react";
import { Controller } from "react-hook-form";

// Core
import { FormCntxt } from "core/context/Form"; // Context
import { dropdown, series } from "core/api"; // API
import { formatter, useGet, usePost } from "core/function/global"; // Function

// Constants
import { input, select } from "../index.style"; // Styles
const module = [{ id: 'supplies', name: 'SUPPLIES' }, { id: 'assets', name: 'ASSETS' }]; // Module

const Form = ({ fetching }) => {
    const { type } = useParams();
    const { register, errors, getValues, check, setCheck, control, setValue, setError } = useContext(FormCntxt);
    const { data: category, mutate: menu, isLoading } = usePost({ fetch: dropdown });
    useGet({ key: ['itm_series'], fetch: series('tbl_sub_category'), options: { }, onSuccess: (data) => { if(type === 'new') setValue('series_no', `ITM-${formatter(parseInt(data) + 1, 7)}`); } });

    useEffect(() => { if(!fetching) { menu({ table: 'tbl_category', data: { module: getValues()?.module } }); } }, [ fetching, menu, getValues ]);

    return (
        <Grid container direction= "row" justifyContent= "flex-start" alignItems= "flex-start" spacing= { 2 }>
            <Grid item xs= { 12 } sm= { 8 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography gutterBottom variant= "body2">*Series No.</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> : 
                        <TextField { ...register('series_no') } name= "series_no" variant= "standard" InputProps= {{ disableUnderline: true }} disabled= { true } sx= { input } /> }
                    <Typography variant= "body2" color= "error.dark" mt= "5px">{ errors.series_no?.message }</Typography>
                </Stack>
            </Grid>
            <Grid item xs= { 12 } sm= { 6 } md= { 7 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography gutterBottom variant= "body2">*Module</Typography>
                    <Box sx= { select }>
                        <Controller control= { control } name= "module" defaultValue= "supplies"
                                render= { ({ field: { onChange, value } }) => (
                                    <Autocomplete options= { module } disableClearable getOptionLabel= { opt => opt.name || opt.id } disabled= { type !== 'new' }
                                        noOptionsText= "No results..." isOptionEqualToValue= { (option, value) => option.name === value.name || option.id === value.id }
                                        renderInput= { params => ( <TextField { ...params } variant= "standard" size= "small" fullWidth= { true } /> ) } getOptionDisabled= { option => option.id === 0 }
                                        onChange= { (e, item) => { onChange(item.id); menu({ table: 'tbl_category', data: { module: getValues().module } }); } }
                                        value= { module.find(data => { return data.id === (getValues().module !== undefined ? getValues().module : value) }) } />
                                ) } />
                    </Box>
                </Stack>
            </Grid>
            <Grid item xs= { 12 } sm= { 6 } md= { 5 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography gutterBottom variant= "body2">*Category</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> : 
                        <Box sx= { select }>
                            { !isLoading ?
                                category !== undefined ?
                                    category?.length > 0 ? 
                                        <Controller control= { control } name= "category_id" defaultValue= { 0 }
                                            render= { ({ field: { onChange, value } }) => (
                                                <Autocomplete options= { category?.sort((a, b) => a.id - b.id) } disabled= { type === 'view' } disableClearable 
                                                    getOptionLabel= { category => category.name || category.id } noOptionsText= "No results.." getOptionDisabled= { option => option.id === 0 }
                                                    isOptionEqualToValue= { (option, value) => option.name === value.name || option.id === value.id } 
                                                    onChange= { (e, item) => { setError('category_id', { message: '' }); onChange(item.id); } }
                                                    renderInput= { params => ( <TextField { ...params } variant= "standard" size= "small" fullWidth /> ) } 
                                                    value= { category?.find(data => { return data.id === (getValues().category_id !== undefined ? getValues().category_id : value) }) !== undefined ?
                                                        category?.find(data => { return data.id === (getValues().category_id !== undefined ? getValues().category_id : value) }) : category.length === 0 ?
                                                        { id: 0, name: '-- SELECT AN ITEM BELOW --' } : category[0] } />
                                            ) } /> : <Typography color= "text.disabled" sx= {{ padding: '3px 0' }}>You must create a category first!</Typography> : 
                                    <Typography color= "text.disabled" sx= {{ padding: '3px 0' }}>Please select a module first!</Typography>
                                : <Typography color= "text.disabled" sx= {{ padding: '3px 0' }}>Loading...</Typography> }
                        </Box> }
                    <Typography variant= "body2" color= "error.dark">{ errors.category_id?.message }</Typography>
                </Stack>
            </Grid>
            <Grid item xs= { 12 } sm= { 6 } md= { 6 }>
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