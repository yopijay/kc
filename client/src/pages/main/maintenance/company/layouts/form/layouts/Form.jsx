// Libraries
import { useContext } from "react";
import { useParams } from "react-router-dom";
import { Controller } from "react-hook-form";
import { Autocomplete, Box, Checkbox, Grid, Skeleton, Stack, TextareaAutosize, TextField, Typography } from "@mui/material";

// Core
import { FormCntxt } from "core/context/Form"; // Context
import { dropdown, series } from "core/api"; // API
import { formatter, useGet } from "core/function/global"; // Function

// Constants
import { input, select, textarea } from "../index.style"; // Styles

const Form = ({ fetching }) => {
    const { type } = useParams();
    const { register, errors, getValues, control, setValue, setError } = useContext(FormCntxt);
    const { data: owner } = useGet({ key: ['owner'], fetch: dropdown({ table: 'tbl_users', data: {} }), options: { refetchOnWindowFocus: false } });
    useGet({ key: ['cmp_series'], fetch: series('tbl_company'), options: { }, onSuccess: (data) => { if(type === 'new') setValue('series_no', `CMP-${formatter(parseInt(data) + 1, 7)}`); } });

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
                    <Typography gutterBottom variant= "body2">*Owner</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> : 
                        <Box sx= { select }>
                            { owner?.length > 0 ? 
                                    <Controller control= { control } name= "owner_id" defaultValue= { 0 }
                                        render= { ({ field: { onChange, value } }) => (
                                            <Autocomplete options= { owner?.sort((a, b) => a.id - b.id) } disabled= { type === 'view' } disableClearable 
                                                getOptionLabel= { owner => owner.name || owner.id } noOptionsText= "No results.." getOptionDisabled= { option => option.id === 0 }
                                                isOptionEqualToValue= { (option, value) => option.name === value.name || option.id === value.id } 
                                                onChange= { (e, item) => { setError('owner_id', { message: '' }); onChange(item.id); } }
                                                renderInput= { params => ( <TextField { ...params } variant= "standard" size= "small" fullWidth /> ) } 
                                                value= { owner?.find(data => { return data.id === (getValues().owner_id !== undefined ? getValues().owner_id : value) }) !== undefined ?
                                                                owner?.find(data => { return data.id === (getValues().owner_id !== undefined ? getValues().owner_id : value) }) : owner.length === 0 ?
                                                                { id: 0, name: '-- SELECT AN ITEM BELOW --' } : owner[0] } />
                                        ) } /> : 
                                <Typography color= "text.disabled">You must create a user first!</Typography> }
                        </Box> }
                    <Typography variant= "body2" color= "error.dark" mt= "5px">{ errors.owner_id?.message }</Typography>
                </Stack>
            </Grid>
            <Grid item xs= { 12 } sm= { 6 } md= { 5 }>
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
                    <Typography gutterBottom variant= "body2">Address</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "100px" /> : 
                        <TextareaAutosize name= "address" { ...register('address') } disabled= { type === 'view' } minRows= { 4 } maxRows= { 4 } style= { textarea } /> }
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