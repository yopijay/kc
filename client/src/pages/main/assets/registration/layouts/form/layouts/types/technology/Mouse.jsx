// Libraries
import { Autocomplete, Box, Grid, Skeleton, Stack, TextField, Typography } from "@mui/material";
import { useContext } from "react";
import { useParams } from "react-router-dom";
import { Controller } from "react-hook-form";
import dayjs from "dayjs";
import { DatePicker, LocalizationProvider } from "@mui/x-date-pickers";
import { AdapterDayjs } from "@mui/x-date-pickers/AdapterDayjs";

// Core
import { FormCntxt } from "core/context/Form"; // Context
import { formatter, useGet } from "core/function/global"; // Function
import { assettag } from "core/api"; // API

// Constants
import { date, input, select } from "../../../index.style"; // Styles
const intrfce = [{ id: 'usb', name: 'USB' }, { id: 'bluetooth', name: 'Bluetooth' }]; // Interface
const orientation = [{ id: 'right-handed', name: 'RIGHT HANDED' }, { id: 'left-handed', name: 'LEFT HANDED' }]; // Orientation

const Mouse = ({ fetching, tag }) => {
    const { type } = useParams();
    const { register, errors, control, getValues, setValue } = useContext(FormCntxt);
    useGet({ key: ['mouse_tag'],
                    fetch: assettag({ table: 'tbl_assets', data: { category_id: getValues().category_id, sub_category_id: getValues().sub_category_id } }), options: { refetchOnWindowFocus: true },
                    onSuccess: data => { if(type === 'new') setValue('asset_tag', `ASSTS-${tag}-${formatter(parseInt(data) + 1, 7)}`); } });

    return (
        <Grid container direction= "row" justifyContent= "flex-start" alignItems= "flex-start" spacing= { 1 }>
            <Grid item xs= { 12 } sm= { 6 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography gutterBottom variant= "body2">*Asset Tag</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                        <TextField { ...register('asset_tag') } name= "asset_tag" variant= "standard" InputProps= {{ disableUnderline: true }} disabled= { true } sx= { input } /> }
                    <Typography variant= "body2" color= "error.dark">{ errors.asset_tag?.message }</Typography>
                </Stack>
            </Grid>
            <Grid item xs= { 12 } sm= { 6 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography gutterBottom variant= "body2">Serial No. / Product ID</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                        <TextField { ...register('serial_no') } name= "serial_no" variant= "standard" InputProps= {{ disableUnderline: true }} disabled= { type === 'view' } sx= { input } /> }
                    <Typography variant= "body2" color= "error.dark">{ errors.serial_no?.message }</Typography>
                </Stack>
            </Grid>
            <Grid item xs= { 12 } sm= { 4 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography gutterBottom variant= "body2">Brand</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                        <TextField { ...register('brand') } name= "brand" variant= "standard" InputProps= {{ disableUnderline: true }} disabled= { type === 'view' } sx= { input } /> }
                    <Typography variant= "body2" color= "error.dark">{ errors.brand?.message }</Typography>
                </Stack>
            </Grid>
            <Grid item xs= { 12 } sm= { 8 } md= { 4 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography gutterBottom variant= "body2">Model</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                        <TextField { ...register('model') } name= "model" variant= "standard" InputProps= {{ disableUnderline: true }} disabled= { type === 'view' } sx= { input } /> }
                    <Typography variant= "body2" color= "error.dark">{ errors.model?.message }</Typography>
                </Stack>
            </Grid>
            <Grid item xs= { 6 } sm= { 3 } md= { 4 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography gutterBottom variant= "body2">Color</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                        <TextField { ...register('color') } name= "color" variant= "standard" InputProps= {{ disableUnderline: true }} disabled= { type === 'view' } sx= { input } /> }
                    <Typography variant= "body2" color= "error.dark">{ errors.color?.message }</Typography>
                </Stack>
            </Grid>
            <Grid item xs= { 6 } sm= { 3 } md= { 4 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography gutterBottom variant= "body2">DPI</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                        <TextField { ...register('dpi') } type= "number" name= "dpi" variant= "standard" InputProps= {{ disableUnderline: true }} disabled= { type === 'view' } sx= { input } /> }
                    <Typography variant= "body2" color= "error.dark">{ errors.dpi?.message }</Typography>
                </Stack>
            </Grid>
            <Grid item xs= { 5 } sm= { 3 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography variant= "body2" gutterBottom>Interface</Typography>
                    <Box sx= { select }>
                        <Controller control= { control } name= "interface"
                                render= { ({ field: { onChange, value } }) => (
                                    <Autocomplete options= { intrfce } disableClearable getOptionLabel= { opt => opt.name || opt.id } disabled= { type === 'view' }
                                        noOptionsText= "No results..." isOptionEqualToValue= { (option, value) => option.name === value.name || option.id === value.id }
                                        renderInput= { params => ( <TextField { ...params } variant= "standard" size= "small" fullWidth= { true } /> ) } 
                                        getOptionDisabled= { option => option.id === 0 } onChange= { (e, item) => { onChange(item.id); } }
                                        value= { intrfce.find(data => { return data.id === (getValues().interface !== undefined ? getValues().interface : value) }) } />
                                ) } />
                    </Box>
                </Stack>
            </Grid>
            <Grid item xs= { 7 } sm= { 3 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography variant= "body2" gutterBottom>Orientation</Typography>
                    <Box sx= { select }>
                        <Controller control= { control } name= "orientation"
                                render= { ({ field: { onChange, value } }) => (
                                    <Autocomplete options= { orientation } disableClearable getOptionLabel= { opt => opt.name || opt.id } disabled= { type === 'view' }
                                        noOptionsText= "No results..." isOptionEqualToValue= { (option, value) => option.name === value.name || option.id === value.id }
                                        renderInput= { params => ( <TextField { ...params } variant= "standard" size= "small" fullWidth= { true } /> ) } 
                                        getOptionDisabled= { option => option.id === 0 } onChange= { (e, item) => { onChange(item.id); } }
                                        value= { orientation.find(data => { return data.id === (getValues().orientation !== undefined ? getValues().orientation : value) }) } />
                                ) } />
                    </Box>
                </Stack>
            </Grid>
            <Grid item xs= { 8 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography gutterBottom variant= "body2">Date purchased</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                        <Box sx= { date }>
                            <Controller control= { control } name= "date_purchased"
                                render= { ({ field: { onChange, value } }) => (
                                    <LocalizationProvider dateAdapter= { AdapterDayjs }>
                                        <DatePicker value= { value } renderInput= { (params) => <TextField { ...params } variant= "standard" size= "small" fullWidth /> }
                                            onChange= { e => { onChange(`${dayjs(e).year()}-${dayjs(e).month() + 1}-${dayjs(e).date()}`); } } />
                                    </LocalizationProvider> ) }>
                            </Controller>
                        </Box> }
                    <Typography variant= "body2" color= "error.dark">{ errors.date_purchased?.message }</Typography>
                </Stack>
            </Grid>
            <Grid item xs= { 4 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography gutterBottom variant= "body2">Warranty</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                        <TextField { ...register('warranty') } name= "warranty" variant= "standard" type= "number" 
                            InputProps= {{ disableUnderline: true }} disabled= { type === 'view' } sx= { input } /> }
                    <Typography variant= "body2" color= "error.dark">{ errors.warranty?.message }</Typography>
                </Stack>
            </Grid>
        </Grid>
    );
}

export default Mouse;