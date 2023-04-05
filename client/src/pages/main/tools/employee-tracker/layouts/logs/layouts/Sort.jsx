// Libraries
import { useContext, useEffect } from "react";
import { Autocomplete, Box, Grid, Skeleton, TextField } from "@mui/material";
import { DatePicker, LocalizationProvider } from "@mui/x-date-pickers";
import { AdapterDayjs } from "@mui/x-date-pickers/AdapterDayjs";
import dayjs from "dayjs";
import { Controller } from "react-hook-form";

// Core
import { FormCntxt } from "core/context/Form"; // Context
import { useGet } from "core/function/global"; // Function
import { filter } from "core/api"; // API

// Constants
const branch = [{ id: 'all', name: 'ALL' }, { id: 'quezon_ave', name: 'QUEZON AVE.' }, { id: 'sto_domingo', name: 'STO. DOMINGO' }, { id: 'manila', name: 'MANILA' }, { id: 'cavite', name: 'CAVITE' }]; // Branch
const select = {
    width: '100%',
    border: 'solid 1px #dfe4ea',
    padding: {
        xs: '12px 8px 9px 8px',
        md: '9px 10px 6px 10px'
    },
    marginBottom: '5px',
    borderRadius: '5px'
}

const date = {
    border: 'solid 1px #dfe4ea',
    padding: {
        xs: '12px 8px 9px 8px',
        md: '9px 10px 6px 10px'
    },
    marginBottom: '5px',
    borderRadius: '5px'
}

const Sort = ({ record, dash }) => {
    const { getValues, control, setValue } = useContext(FormCntxt);
    const { data: location, isFetching } = useGet({ key: ['dd_location'], fetch: filter({ table: 'tbl_tracker', data: {} }) });

    useEffect(() => {
        setValue('branch', getValues().branch !== undefined ? getValues().branch : 'all');
        setValue('tracker_id', getValues().tracker_id !== undefined ? getValues().tracker_id : 'all');
        setValue('date', getValues().date !== undefined ? getValues().date : `${dayjs(new Date()).year()}-${dayjs(new Date()).month() + 1}-${dayjs(new Date()).date()}`);
    }, [ setValue, getValues ]);

    return (
        <Grid container direction= "row" justifyContent= "flex-start" alignItems= "center" spacing= { 1 }>
            <Grid item xs= { 12 } sm= { 4 } md= { 3 }>
                <Box sx= { select }>
                    <Controller control= { control } name= "branch" defaultValue= "all"
                            render= { ({ field: { onChange, value } }) => (
                                <Autocomplete options= { branch } disableClearable getOptionLabel= { opt => opt.name || opt.id } 
                                    noOptionsText= "No results..." isOptionEqualToValue= { (option, value) => option.name === value.name || option.id === value.id }
                                    renderInput= { params => ( <TextField { ...params } variant= "standard" size= "small" fullWidth= { true } /> ) } getOptionDisabled= { option => option.id === 0 }
                                    onChange= { (e, item) => { onChange(item.id); dash({ table: 'tbl_employee_tracker', data: { branch: item.id } }); record({ table: 'tbl_employee_tracker', data: getValues() }); } }
                                    value= { branch.find(data => { return data.id === (getValues().branch !== undefined ? getValues().branch : value) }) } />
                            ) } />
                </Box>
            </Grid>
            <Grid item xs= { 12 } sm= { 4 } md= { 3 }>
                { isFetching ? <Skeleton variant= "rounded" height= "35px" /> : 
                    <Box sx= { select }>
                        <Controller control= { control } name= "tracker_id" defaultValue= "all"
                                render= { ({ field: { onChange, value } }) => (
                                    <Autocomplete options= { location } disableClearable getOptionLabel= { opt => opt.name || opt.id }
                                        noOptionsText= "No results..." isOptionEqualToValue= { (option, value) => option.name === value.name || option.id === value.id }
                                        renderInput= { params => ( <TextField { ...params } variant= "standard" size= "small" fullWidth= { true } /> ) } getOptionDisabled= { option => option.id === 0 }
                                        onChange= { (e, item) => { onChange(item.id); record({ table: 'tbl_employee_tracker', data: getValues() }); } } 
                                        value= { location.find(data => { return data.id === (getValues().tracker_id !== undefined ? getValues().tracker_id : value !== undefined ? value: 'all') }) } />
                                ) } />
                    </Box> }
            </Grid>
            <Grid item xs= { 12 } sm= { 4 } md= { 3 }>
                <Box sx= { date }>
                    <Controller control= { control } name= "date" defaultValue= { `${dayjs(new Date()).year()}-${dayjs(new Date()).month() + 1}-${dayjs(new Date()).date()}` }
                        render= { ({ field: { onChange, value } }) => (
                            <LocalizationProvider dateAdapter= { AdapterDayjs }>
                                <DatePicker value= { value } renderInput= { (params) => <TextField { ...params } variant= "standard" size= "small" fullWidth /> }
                                    onChange= { e => { onChange(`${dayjs(e).year()}-${dayjs(e).month() + 1}-${dayjs(e).date()}`); record({ table: 'tbl_employee_tracker', data: getValues() }); } } />
                            </LocalizationProvider> ) }>
                    </Controller>
                </Box>
            </Grid>
        </Grid>
    );
}

export default Sort;