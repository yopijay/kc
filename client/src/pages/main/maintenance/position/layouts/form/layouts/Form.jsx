// Libraries
import { Autocomplete, Box, Checkbox, Grid, Skeleton, Stack, TextareaAutosize, TextField, Typography } from "@mui/material";
import { useParams } from "react-router-dom";
import { useContext, useEffect } from "react";
import { Controller } from "react-hook-form";

// Core
import { FormCntxt } from "core/context/Form"; // Context
import { dropdown, series } from "core/api"; // API
import { formatter, useGet, usePost } from "core/function/global"; // Function

// Constants
import { input, select, textarea } from "../index.style"; // Styles

const Form = ({ fetching }) => {
    const { type } = useParams();
    const { register, errors, getValues, control, setValue, setError } = useContext(FormCntxt);
    const { data: company } = useGet({ key: ['dd_company'], fetch: dropdown({ table: 'tbl_company', data: {} }), options: { refetchOnWindowFocus: false } });
    const { data: department, mutate: menu, isLoading } = usePost({ fetch: dropdown });
    useGet({ key: ['pst_series'], fetch: series('tbl_position'), options: {}, onSuccess: (data) => { if(type === 'new') setValue('series_no', `PST-${formatter(parseInt(data) + 1, 7)}`); } });

    useEffect(() => { if(!fetching) { if(type !== 'new') { menu({ table: `tbl_department`, data: { id: getValues()?.company_id } }); } } }, [fetching, type, menu, getValues]);

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
                    <Typography gutterBottom variant= "body2">*Company</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> : 
                        <Box sx= { select }>
                            { company?.length > 0 ? 
                                <Controller control= { control } name= "company_id" defaultValue= { 0 }
                                    render= { ({ field: { onChange, value } }) => (
                                        <Autocomplete options= { company?.sort((a, b) => a.id - b.id) } disabled= { type === 'view' } disableClearable 
                                            getOptionLabel= { company => company.name || company.id } noOptionsText= "No results.." getOptionDisabled= { option => option.id === 0 }
                                            isOptionEqualToValue= { (option, value) => option.name === value.name || option.id === value.id } 
                                            onChange= { (e, item) => { setError('company_id', { message: '' }); onChange(item.id); menu({ table: 'tbl_department', data: { id: item.id } }); } }
                                            renderInput= { params => ( <TextField { ...params } variant= "standard" size= "small" fullWidth /> ) } 
                                            value= { company?.find(data => { return data.id === (getValues().company_id !== undefined ? getValues().company_id : value) }) !== undefined ?
                                                company?.find(data => { return data.id === (getValues().company_id !== undefined ? getValues().company_id : value) }) : company.length === 0 ?
                                                { id: 0, name: '-- SELECT AN ITEM BELOW --' } : company[0] } />
                                    ) } /> : <Typography color= "text.disabled">You must create a user first!</Typography> }
                        </Box> }
                    <Typography variant= "body2" color= "error.dark" mt= "5px">{ errors.company_id?.message }</Typography>
                </Stack>
            </Grid>
            <Grid item xs= { 12 } sm= { 6 } md= { 5 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography gutterBottom variant= "body2">*Department</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> : 
                        <Box sx= { select }>
                            { !isLoading ?
                                department !== undefined ?
                                    department?.length > 0 ? 
                                        <Controller control= { control } name= "department_id" defaultValue= { 0 }
                                            render= { ({ field: { onChange, value } }) => (
                                                <Autocomplete options= { department?.sort((a, b) => a.id - b.id) } disabled= { type === 'view' } disableClearable 
                                                    getOptionLabel= { department => department.name || department.id } noOptionsText= "No results.." getOptionDisabled= { option => option.id === 0 }
                                                    isOptionEqualToValue= { (option, value) => option.name === value.name || option.id === value.id } 
                                                    onChange= { (e, item) => { setError('department_id', { message: '' }); onChange(item.id); } }
                                                    renderInput= { params => ( <TextField { ...params } variant= "standard" size= "small" fullWidth /> ) } 
                                                    value= { department?.find(data => { return data.id === (getValues().department_id !== undefined ? getValues().department_id : value) }) !== undefined ?
                                                        department?.find(data => { return data.id === (getValues().department_id !== undefined ? getValues().department_id : value) }) : 
                                                        department.length === 0 ? { id: 0, name: '-- SELECT AN ITEM BELOW --' } : department[0] } />
                                            ) } /> : <Typography color= "text.disabled" sx= {{ padding: '3px 0' }}>You must create a user first!</Typography> : 
                                    <Typography color= "text.disabled" sx= {{ padding: '3px 0' }}>Please select a company first!</Typography>
                                : <Typography color= "text.disabled" sx= {{ padding: '3px 0' }}>Loading...</Typography> }
                        </Box> }
                    <Typography variant= "body2" color= "error.dark" mt= "5px">{ errors.department_id?.message }</Typography>
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
                    <Typography gutterBottom variant= "body2">Description</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "100px" /> : 
                        <TextareaAutosize name= "description" { ...register('description') } disabled= { type === 'view' } minRows= { 4 } maxRows= { 4 } style= { textarea } /> }
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