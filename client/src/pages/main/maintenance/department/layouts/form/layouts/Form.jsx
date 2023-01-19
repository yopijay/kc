// Libraries
import { Autocomplete, Box, Checkbox, Grid, Skeleton, Stack, TextareaAutosize, TextField, Typography } from "@mui/material";
import { useParams } from "react-router-dom";
import { useContext } from "react";
import { Controller } from "react-hook-form";

// Core
import { FormCntxt } from "core/context/Form"; // Context
import { dropdown, series } from "core/api"; // API
import { formatter, useGet } from "core/function/global"; // Function

// Constants
import { input, select, textarea } from "../index.style"; // Styles

const Form = ({ fetching }) => {
    const { type } = useParams();
    const { register, errors, getValues, check, setCheck, control, setValue, setError } = useContext(FormCntxt);
    const { data: head } = useGet({ key: ['head'], fetch: dropdown({ table: 'tbl_users', data: {} }), options: { refetchOnWindowFocus: false } });
    const { data: company } = useGet({ key: ['company'], fetch: dropdown({ table: 'tbl_company', data: {} }), options: { refetchOnWindowFocus: false } });
    useGet({ key: ['dpt_series'], fetch: series('tbl_department'), options: { }, onSuccess: (data) => { if(type === 'new') setValue('series_no', `DPT-${formatter(parseInt(data) + 1, 7)}`); } });

    return (
        <Grid container direction= "row" justifyContent= "flex-start" alignItems= "flex-start" spacing= { 2 }>
            <Grid item xs= { 12 } sm= { 8 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography gutterBottom>*Series No.</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> : 
                        <TextField { ...register('series_no') } name= "series_no" variant= "standard" InputProps= {{ disableUnderline: true }} disabled= { true } sx= { input } /> }
                    <Typography variant= "body2" color= "error.dark" mt= "5px">{ errors.series_no?.message }</Typography>
                </Stack>
            </Grid>
            <Grid item xs= { 12 } sm= { 6 } md= { 7 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography gutterBottom>*Company</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> : 
                        <Box sx= { select }>
                            { company?.length > 0 ? 
                                <Controller control= { control } name= "company_id" defaultValue= { 0 }
                                    render= { ({ field: { onChange, value } }) => (
                                        <Autocomplete options= { company?.sort((a, b) => a.id - b.id) } disabled= { type === 'view' } disableClearable 
                                            getOptionLabel= { company => company.name || company.id } noOptionsText= "No results.." getOptionDisabled= { option => option.id === 0 }
                                            isOptionEqualToValue= { (option, value) => option.name === value.name || option.id === value.id } 
                                            onChange= { (e, item) => { setError('company_id', { message: '' }); onChange(item.id); } }
                                            renderInput= { params => ( <TextField { ...params } variant= "standard" size= "small" fullWidth /> ) } 
                                            value= { company?.find(data => { return data.id === (getValues().company_id !== undefined ? getValues().company_id : value) }) !== undefined ?
                                                company?.find(data => { return data.id === (getValues().company_id !== undefined ? getValues().company_id : value) }) : company.length === 0 ?
                                                { id: 0, name: '-- SELECT AN ITEM BELOW --' } : company[0] } />
                                    ) } /> : <Typography color= "text.disabled">You must create a user first!</Typography> }
                        </Box> }
                    <Typography variant= "body2" color= "error.dark" mt= "5px">{ errors.company_id?.message }</Typography>
                </Stack>
            </Grid>
            <Grid item xs= { 12 } sm= { 6 } md= { 6 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography gutterBottom>*Department head</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> : 
                        <Box sx= { select }>
                            { head?.length > 0 ? 
                                <Controller control= { control } name= "department_head_id" defaultValue= { 0 }
                                    render= { ({ field: { onChange, value } }) => (
                                        <Autocomplete options= { head?.sort((a, b) => a.id - b.id) } disabled= { type === 'view' } disableClearable getOptionLabel= { head => head.name || head.id } 
                                            noOptionsText= "No results.." getOptionDisabled= { option => option.id === 0 }
                                            isOptionEqualToValue= { (option, value) => option.name === value.name || option.id === value.id } 
                                            onChange= { (e, item) => { setError('department_head_id', { message: '' }); onChange(item.id); } }
                                            renderInput= { params => ( <TextField { ...params } variant= "standard" size= "small" fullWidth /> ) } 
                                            value= { head?.find(data => { return data.id === (getValues().department_head_id !== undefined ? getValues().department_head_id : value) }) !== undefined ?
                                                head?.find(data => { return data.id === (getValues().department_head_id !== undefined ? getValues().department_head_id : value) }) : head.length === 0 ?
                                                { id: 0, name: '-- SELECT AN ITEM BELOW --' } : head[0] } />
                                    ) } /> : <Typography color= "text.disabled">You must create a user first!</Typography> }
                        </Box>
                    }
                    <Typography variant= "body2" color= "error.dark" mt= "5px">{ errors.department_head_id?.message }</Typography>
                </Stack>
            </Grid>
            <Grid item xs= { 12 } sm= { 6 } md= { 6 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography gutterBottom>*Name</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> : 
                        <TextField { ...register('name') } name= "name" variant= "standard" InputProps= {{ disableUnderline: true }} disabled= { type === 'view' } sx= { input } /> }
                    <Typography variant= "body2" color= "error.dark" mt= "5px">{ errors.name?.message }</Typography>
                </Stack>
            </Grid>
            <Grid item xs= { 12 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography gutterBottom>Description</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "100px" /> : 
                        <TextareaAutosize name= "description" { ...register('description') } disabled= { type === 'view' } minRows= { 4 } maxRows= { 4 } style= { textarea } /> }
                </Stack>
            </Grid>
            <Grid item xs= { 12 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography gutterBottom>Status</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> : 
                        <Box sx= {{ display: 'flex', flexDirection: 'row', justifyContent: 'flex-start', alignItems: 'center' }}>
                            <Checkbox sx= {{ color: '#919eab', '&.Mui-checked': { color: '#2065d1' } }} name= "status" { ...register('status', { onChange: () => setCheck(!check) }) } 
                                disabled= { type === 'view' } checked= { getValues().status !== undefined ? getValues().status > 0 ? true : false : check } />
                            <Typography gutterBottom sx= {{ marginTop: '7px' }}>{ getValues().status !== undefined ? getValues().status > 0 ? 'Active' : 'Inactive' : check ? 'Active' : 'Inactive' }</Typography>
                        </Box> }
                </Stack>
            </Grid>
        </Grid>
    );
}

export default Form;