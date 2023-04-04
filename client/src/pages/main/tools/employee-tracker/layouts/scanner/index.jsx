// Libraries
import { faEllipsisVertical } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { Autocomplete, Box, Grid, Stack, TextField, Typography } from "@mui/material";
import { useContext } from "react";
import { Controller } from "react-hook-form";
import QrReader from "react-qr-reader";
import { Link } from "react-router-dom";

// Core
import { FormCntxt } from "core/context/Form"; // Context
import { errorToast, successToast, useGet, usePost } from "core/function/global";
import { dropdown, tracker } from "core/api";
import { DatePicker, LocalizationProvider } from "@mui/x-date-pickers";
import dayjs from "dayjs";
import { AdapterDayjs } from "@mui/x-date-pickers/AdapterDayjs";

// Constants
const branch = [{ id: 'quezon_ave', name: 'QUEZON AVE.' }, { id: 'sto_domingo', name: 'STO. DOMINGO' }, { id: 'manila', name: 'MANILA' }, { id: 'cavite', name: 'CAVITE' }]; // Branch
const card = {
    padding: '30px 15px',
    flexGrow: 1,
    backgroundColor: '#ffffff',
    borderRadius: '8px',
    border: 'solid 1px #919eab40',
    overflowY: 'scroll',
    '&::-webkit-scrollbar': { display: 'none' }
}

const btnicon = {
    color: '#444444',
    borderRadius: '7px',
    padding: {
        xs: '5px 12px',
        md: '4px 10px'
    },
    transition: 'all 0.2s ease-in-out',
    '&:hover': { transform: 'scale(1.1)' }
}

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

const Index = () => {
    const { control, getValues, setError, errors } = useContext(FormCntxt);
    const { data: location } = useGet({ key: ['dd_location'], fetch: dropdown({ table: 'tbl_tracker', data: {} }), options: { refetchOnWindowFocus: false } });
    const { mutate: track } = usePost({ fetch: tracker, onSuccess: data => { if(data.result === 'error') { errorToast(data.message, 3000); } else { successToast(data.message, 3000); } } });

    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= {{ width: '100%', height: '100%', paddingBottom: '20px' }} spacing= { 3 }>
            <Stack direction= "row" justifyContent= "space-between" alignItems= "center">
                <Typography variant= "h6" sx= {{ fontFamily: 'Boldstrom', color: '#3c4048' }}>Employee Tracker</Typography>
                <Typography sx= { btnicon } component= { Link } to= "/tools/employee-tracker/logs" ><FontAwesomeIcon icon= { faEllipsisVertical } size= "lg" /></Typography>
            </Stack>
            <Box sx= { card }>
                <Grid container direction= "row" justifyContent= "flex-start" alignItems= "flex-start" spacing= { 1 } sx= {{ marginBottom: '30px' }}>
                    <Grid item xs= { 12 } md= { 5 }>
                        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                            <Typography variant= "body2" gutterBottom>*Location</Typography>
                            <Box sx= { select }>
                                { location?.length > 0 ? 
                                    <Controller control= { control } name= "tracker_id" defaultValue= { 0 }
                                        render= { ({ field: { onChange, value } }) => (
                                            <Autocomplete options= { location?.sort((a, b) => a.id - b.id) } disableClearable 
                                                getOptionLabel= { location => location.name || location.id } noOptionsText= "No results.." getOptionDisabled= { option => option.id === 0 }
                                                isOptionEqualToValue= { (option, value) => option.name === value.name || option.id === value.id } 
                                                onChange= { (e, item) => { setError('tracker_id', { message: '' }); onChange(item.id); } }
                                                renderInput= { params => ( <TextField { ...params } variant= "standard" size= "small" fullWidth /> ) } 
                                                value= { location?.find(data => { return data.id === (getValues().tracker_id !== undefined ? getValues().tracker_id : value) }) !== undefined ?
                                                    location?.find(data => { return data.id === (getValues().tracker_id !== undefined ? getValues().tracker_id : value) }) : location.length === 0 ?
                                                    { id: 0, name: '-- SELECT AN ITEM BELOW --' } : location[0] } />
                                        ) } /> : <Typography color= "text.disabled">You must create a location first!</Typography> }
                            </Box>
                            <Typography variant= "body2" color= "error.dark" mt= "5px">{ errors.tracker_id?.message }</Typography>
                        </Stack>
                    </Grid>
                    <Grid item xs= { 12 } md= { 4 }>
                        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                            <Typography variant= "body2" gutterBottom>Branch</Typography>
                            <Box sx= { select }>
                                <Controller control= { control } name= "branch" defaultValue= "quezon_ave"
                                        render= { ({ field: { onChange, value } }) => (
                                            <Autocomplete options= { branch } disableClearable getOptionLabel= { opt => opt.name || opt.id }
                                                noOptionsText= "No results..." isOptionEqualToValue= { (option, value) => option.name === value.name || option.id === value.id }
                                                renderInput= { params => ( <TextField { ...params } variant= "standard" size= "small" fullWidth= { true } /> ) } getOptionDisabled= { option => option.id === 0 }
                                                onChange= { (e, item) => { onChange(item.id); } }
                                                value= { branch.find(data => { return data.id === (getValues().branch !== undefined ? getValues().branch : value) }) } />
                                        ) } />
                            </Box>
                        </Stack>
                    </Grid>
                    <Grid item xs= { 12 } md= { 3 }>
                        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                            <Typography variant= "body2" gutterBottom>Date</Typography>
                            <Box sx= { date }>
                                <Controller control= { control } name= "date" defaultValue= { `${dayjs(new Date()).year()}-${dayjs(new Date()).month() + 1}-${dayjs(new Date()).date()}` }
                                    render= { ({ field: { onChange, value } }) => (
                                        <LocalizationProvider dateAdapter= { AdapterDayjs }>
                                            <DatePicker value= { value } renderInput= { (params) => <TextField { ...params } variant= "standard" size= "small" fullWidth /> }
                                                onChange= { e => { onChange(`${dayjs(e).year()}-${dayjs(e).month() + 1}-${dayjs(e).date()}`); } } />
                                        </LocalizationProvider> ) }>
                                </Controller>
                            </Box>
                        </Stack>
                    </Grid>
                </Grid>
                <QrReader delay={ 3000 } onError= { err => console.log(err) } style= {{ width: '100%' }} facingMode= "user"
                    onScan={ data => { 
                            if(data !== null) { 
                                let _data = getValues();
                                let errors = [];
                                _data['id'] = data;

                                if(getValues().tracker_id === undefined || getValues().tracker_id === 0) { errors.push({ name: 'tracker_id', message: 'This field is required!' }); }

                                if(!(errors.length > 0)) { track(_data); }
                                else { errors.forEach(err => setError(err.name, { message: err.message })); }
                            }
                        }
                    } />
            </Box>
        </Stack>
    );
}

export default Index;