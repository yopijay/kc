// Libraries
import { Autocomplete, Box, Grid, Skeleton, Stack, TextField, TextareaAutosize, Typography } from "@mui/material";
import { useContext, useEffect } from "react";
import { useParams } from "react-router-dom";
import { Controller } from "react-hook-form";
import dayjs from "dayjs";
import { DatePicker, LocalizationProvider } from "@mui/x-date-pickers";
import { AdapterDayjs } from "@mui/x-date-pickers/AdapterDayjs";

// Core
import { FormCntxt } from "core/context/Form"; // Context
import { formatter, useGet } from "core/function/global"; // Function
import { series } from "core/api"; // API

// Constants
import { date, input, select, textarea } from "../index.style"; // Styles
const count_type = [{ id: 'annual', name: 'ANNUAL' }, { id: 'random', name: 'RANDOM' }]; // Count type
const branch = [{ id: 'quezon_ave', name: 'QUEZON AVE' }, { id: 'sto_domingo', name: 'STO. DOMINGO' }, { id: 'manila', name: 'MANILA' }, { id: 'cavite', name: 'CAVITE' }]; // Branch

const Info = ({ fetching, counttype, setCounttype, counts }) => {
    const { type, id } = useParams();
    const { register, errors, setValue, control, getValues } = useContext(FormCntxt);
    useGet({ key: ['inv_series'], fetch: series('tbl_physical_count'), options: {}, onSuccess: (data) => { if(type === 'new') setValue('series_no', `PC-${formatter(parseInt(data) + 1, 7)}`); } });

    useEffect(() => { setValue('brands', id !== undefined ? getValues().brands : []); counts({}); }, [ setValue, counts, counttype, id, getValues ]);

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
            <Grid item xs= { 12 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography gutterBottom variant= "body2">*Branch</Typography>
                    { fetching ? <Skeleton variant= "rectangular" height= "35px" sx= {{ borderRadius: '5px' }} /> :
                        <Box sx= { select }>
                            <Controller control= { control } name= "branch" defaultValue= { [{ id: 'quezon_ave', name: 'QUEZON AVE' }] }
                                render= { ({ field: { onChange } }) => (
                                    <Autocomplete options= { branch } multiple disableClearable disabled= { type === 'view' }
                                        getOptionLabel= { branch => branch.name || branch.id } noOptionsText= "No results.." getOptionDisabled= { option => option.id === 0 }
                                        isOptionEqualToValue= { (option, value) => option.name === value.name || option.id === value.id }
                                        onChange= { (e, item) => { onChange(item); } } renderInput= { params => ( <TextField { ...params } variant= "standard" size= "small" fullWidth= { true } /> ) }
                                        value= { (getValues()?.branch)?.length > 0 ? getValues().branch : [] } />
                                ) } />
                        </Box> }
                    <Typography variant= "body2" color= "error.dark" mt= "5px">{ errors.branch?.message }</Typography>
                </Stack>
            </Grid>
            <Grid item xs= { 12 } sm= { 4 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography variant= "body2" gutterBottom>From:</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                        <Box sx= { date }>
                            <Controller control= { control } name= "date_from" defaultValue= { `${dayjs(new Date()).year()}-${dayjs(new Date()).month() + 1}-${dayjs(new Date()).date()}` }
                                render= { ({ field: { onChange, value } }) => (
                                    <LocalizationProvider dateAdapter= { AdapterDayjs }>
                                        <DatePicker value= { value } renderInput= { (params) => <TextField { ...params } variant= "standard" size= "small" fullWidth /> }
                                            onChange= { e => { onChange(`${dayjs(e).year()}-${dayjs(e).month() + 1}-${dayjs(e).date()}`); } } disabled= { type === 'view' } />
                                    </LocalizationProvider> ) }>
                            </Controller>
                        </Box> }
                    <Typography variant= "body2" color= "error.dark" mt= "5px">{ errors.date_from?.message }</Typography>
                </Stack>
            </Grid>
            <Grid item xs= { 12 } sm= { 4 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography variant= "body2" gutterBottom>To:</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                        <Box sx= { date }>
                            <Controller control= { control } name= "date_to" defaultValue= { `${dayjs(new Date()).year()}-${dayjs(new Date()).month() + 1}-${dayjs(new Date()).date()}` }
                                render= { ({ field: { onChange, value } }) => (
                                    <LocalizationProvider dateAdapter= { AdapterDayjs }>
                                        <DatePicker value= { value } renderInput= { (params) => <TextField { ...params } variant= "standard" size= "small" fullWidth /> }
                                            onChange= { e => { onChange(`${dayjs(e).year()}-${dayjs(e).month() + 1}-${dayjs(e).date()}`); } } disabled= { type === 'view' } />
                                    </LocalizationProvider> ) }>
                            </Controller>
                        </Box> }
                    <Typography variant= "body2" color= "error.dark" mt= "5px">{ errors.date_to?.message }</Typography>
                </Stack>
            </Grid>
            <Grid item xs= { 12 } sm= { 2 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography variant= "body2" gutterBottom>*Type</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> : 
                        <Box sx= { select }>
                            <Controller control= { control } name= "type" defaultValue= { 'annual' }
                                    render= { ({ field: { onChange } }) => (
                                        <Autocomplete options= { count_type } disableClearable getOptionLabel= { opt => opt.name || opt.id }
                                            noOptionsText= "No results..." isOptionEqualToValue= { (option, value) => option.name === value.name || option.id === value.id }
                                            renderInput= { params => ( <TextField { ...params } variant= "standard" size= "small" fullWidth= { true } /> ) } getOptionDisabled= { option => option.id === 0 }
                                            onChange= { (e, item) => { onChange(item.id); setCounttype(item.id); counts({}); } } disabled= { type === 'view' }
                                            value= { count_type.find(data => { return data.id === (getValues().type !== undefined ? getValues().type : 'annual') }) } />
                                    ) } />
                        </Box> }
                </Stack>
            </Grid>
            <Grid item xs= { 12 } sm= { 2 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography variant= "body2" gutterBottom>*No. of Items</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                        <TextField { ...register('total_items') } name= "total_items" variant= "standard" InputProps= {{ disableUnderline: true }} sx= { input } disabled= { true } /> }
                    <Typography variant= "body2" color= "error.dark" mt= "5px">{ errors.total_items?.message }</Typography>
                </Stack>
            </Grid>
            <Grid item xs= { 12 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography gutterBottom variant= "body2">Remarks</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "100px" /> : 
                        <TextareaAutosize name= "remarks" { ...register('remarks') } disabled= { type === 'view' } minRows= { 4 } maxRows= { 4 } style= { textarea } /> }
                </Stack>
            </Grid>
        </Grid>
    );
}

export default Info;