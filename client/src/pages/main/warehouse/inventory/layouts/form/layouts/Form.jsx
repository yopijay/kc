// Libraries
import { Autocomplete, Box, Grid, Skeleton, Stack, TextField, Typography } from "@mui/material";
import { useContext, useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import { Controller } from "react-hook-form";
import { DatePicker, LocalizationProvider } from "@mui/x-date-pickers";
import dayjs from "dayjs";
import { AdapterDayjs } from "@mui/x-date-pickers/AdapterDayjs";

// Core
import { FormCntxt } from "core/context/Form"; // Context
import { formatter, useGet, usePost } from "core/function/global"; // Function
import { count, dropdown, series } from "core/api"; // API

// Constants
import { date, input, select } from "../index.style"; // Styles
const count_type = [{ id: 'annual', name: 'ANNUAL' }, { id: 'specific', name: 'SPECIFIC' }]; // Count type
const branch = [{ id: 'quezon_ave', name: 'QUEZON AVE' }, { id: 'sto_domingo', name: 'STO. DOMINGO' }, { id: 'manila', name: 'MANILA' }, { id: 'cavite', name: 'CAVITE' }]; // Branch

const Form = ({ fetching }) => {
    const { type } = useParams();
    const { register, errors, setValue, control, getValues } = useContext(FormCntxt);
    const [ counttype, setCounttype ] = useState('annual');
    const { data: brands, isFetching: brandfetching } = useGet({ key: ['dd_brand'], fetch: dropdown({ table: 'tbl_brand', data: {} }) });
    useGet({ key: ['inv_series'], fetch: series('tbl_inventory'), options: { }, onSuccess: (data) => { if(type === 'new') setValue('series_no', `INV-${formatter(parseInt(data) + 1, 7)}`); } });
    const { mutate: items } = usePost({ fetch: count, onSuccess: data => setValue('total_items', data) });

    useEffect(() => { setValue('brands', []); items([]); }, [ setValue, items ]);

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
                                <Controller control= { control } name= "branch" defaultValue= { [] }
                                    render= { ({ field: { onChange } }) => (
                                        <Autocomplete options= { branch } multiple disableClearable disabled= { type === 'view' }
                                            getOptionLabel= { branch => branch.name || branch.id } noOptionsText= "No results.." getOptionDisabled= { option => option.id === 0 }
                                            isOptionEqualToValue= { (option, value) => option.name === value.name || option.id === value.id }
                                            onChange= { (e, item) => { onChange(item); } }
                                            renderInput= { params => ( <TextField { ...params } variant= "standard" size= "small" fullWidth= { true } /> ) }
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
                </Stack>
            </Grid>
            <Grid item xs= { 12 } sm= { 2 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography variant= "body2" gutterBottom>*Type</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> : 
                        <Box sx= { select }>
                            <Controller control= { control } name= "type" defaultValue= "annual"
                                    render= { ({ field: { onChange, value } }) => (
                                        <Autocomplete options= { count_type } disableClearable getOptionLabel= { opt => opt.name || opt.id }
                                            noOptionsText= "No results..." isOptionEqualToValue= { (option, value) => option.name === value.name || option.id === value.id }
                                            renderInput= { params => ( <TextField { ...params } variant= "standard" size= "small" fullWidth= { true } /> ) } getOptionDisabled= { option => option.id === 0 }
                                            onChange= { (e, item) => { onChange(item.id); setCounttype(item.id); } } disabled= { type === 'view' }
                                            value= { count_type.find(data => { return data.id === (getValues().type !== undefined ? getValues().type : value) }) } />
                                    ) } />
                        </Box> }
                </Stack>
            </Grid>
            <Grid item xs= { 12 } sm= { 2 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography variant= "body2" gutterBottom>*No. of Items</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                        <TextField { ...register('total_items') } name= "total_items" variant= "standard" InputProps= {{ disableUnderline: true }} sx= { input }
                            disabled= { true } /> }
                </Stack>
            </Grid>
            { counttype === 'specific' || getValues()?.type === 'specific' ?
                <Grid item xs= { 12 }>
                    <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                        <Typography gutterBottom variant= "body2">*Brands</Typography>
                        { brandfetching ? <Skeleton variant= "rectangular" height= "35px" sx= {{ borderRadius: '5px' }} /> : brands?.length > 0 ?
                            <Box sx= { select }>
                                <Controller control= { control } name= "brands" defaultValue= { [] }
                                    render= { ({ field: { onChange } }) => (
                                        <Autocomplete options= { brands } multiple disableClearable disabled= { type === 'view' }
                                            getOptionLabel= { brands => brands.name || brands.id } noOptionsText= "No results.." getOptionDisabled= { option => option.id === 0 }
                                            isOptionEqualToValue= { (option, value) => option.name === value.name || option.id === value.id }
                                            onChange= { (e, item) => { onChange(item); items(item) } }
                                            renderInput= { params => ( <TextField { ...params } variant= "standard" size= "small" fullWidth= { true } /> ) }
                                            value= { (getValues()?.brands)?.length > 0 ? getValues().brands : [] } />
                                    ) } /> 
                            </Box> : '' }
                        <Typography variant= "body2" color= "error.dark" mt= "5px">{ errors.brands?.message }</Typography>
                    </Stack>
                </Grid> : '' }
        </Grid>
    );
}

export default Form;