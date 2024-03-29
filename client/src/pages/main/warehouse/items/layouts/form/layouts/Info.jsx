// Libraries
import { useContext, useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import { Controller } from "react-hook-form";
import { Autocomplete, Box, Grid, Skeleton, Stack, TextField, ThemeProvider, Typography } from "@mui/material";

// Core
import { FormCntxt } from "core/context/Form"; // Context
import { dropdown, series } from "core/api"; // API
import { formatter, useGet } from "core/function/global"; // Function

// Layouts
import Location from "./Location";
import Quantity from "./Quantity";
import Others from "./Others";

// Constants
import { input, select } from "../index.style"; // Styles
import { theme } from "core/theme/form.theme";
const uom = [{ id: 'pc', name: 'PC/S' }]; // Unit of measures

const _input = {
    MuiInput: {
        styleOverrides: {
            root: {
                '&:before': { borderBottom: 'none' },
                '&:after': { borderBottom: 'none' },
                '&.Mui-disabled:before': { borderBottom: 'none' },
                '&:hover:not(.Mui-disabled):before': { borderBottom: 'none' }
            }
        }
    }
}

const Info = ({ fetching, qr }) => {
    const { type } = useParams();
    const { register, errors, getValues, control, setValue, setError } = useContext(FormCntxt);
    const [ totalqty, setTotalqty ] = useState(0);
    const { data: brand } = useGet({ key: ['dd_brands'], fetch: dropdown({ table: 'tbl_brand', data: { platform: 'client' } }), options: { refetchOnWindowFocus: false } });
    useGet({ key: ['itm_series'], fetch: series('tbl_items'), options: { }, onSuccess: (data) => { if(type === 'new') setValue('series_no', `ITM-${formatter(parseInt(data) + 1, 7)}`); } });

    useEffect(() => { setValue('total', totalqty); }, [ setValue, totalqty ]);

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
            <Grid item xs= { 12 } sm= { 4 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography gutterBottom variant= "body2">*Brand</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> : 
                        <Box sx= { select }>
                            { brand?.length > 0 ? 
                                <Controller control= { control } name= "brand_id" defaultValue= { 0 }
                                    render= { ({ field: { onChange, value } }) => (
                                        <Autocomplete options= { brand?.sort((a, b) => a.id - b.id) } disabled= { type === 'view' } disableClearable 
                                            getOptionLabel= { brand => brand.name || brand.id } noOptionsText= "No results.." getOptionDisabled= { option => option.id === 0 }
                                            isOptionEqualToValue= { (option, value) => option.name === value.name || option.id === value.id } 
                                            onChange= { (e, item) => { setError('brand_id', { message: '' }); onChange(item.id); } }
                                            renderInput= { params => ( <TextField { ...params } variant= "standard" size= "small" fullWidth /> ) } 
                                            value= { brand?.find(data => { return data.id === (getValues().brand_id !== undefined ? getValues().brand_id : value) }) !== undefined ?
                                                brand?.find(data => { return data.id === (getValues().brand_id !== undefined ? getValues().brand_id : value) }) : brand.length === 0 ?
                                                { id: 0, name: '-- SELECT AN ITEM BELOW --' } : brand[0] } />
                                    ) } /> : <Typography color= "text.disabled">You must create a brand first!</Typography> }
                        </Box> }
                    <Typography variant= "body2" color= "error.dark" mt= "5px">{ errors.brand_id?.message }</Typography>
                </Stack>
            </Grid>
            <Grid item xs= { 12 }><ThemeProvider theme= { theme(_input) }><Location fetching= { fetching } /></ThemeProvider></Grid>
            <Grid item xs= { 12 } sm= { 6 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography gutterBottom variant= "body2">*Item Code</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> : 
                        <TextField { ...register('item_code') } name= "item_code" variant= "standard" InputProps= {{ disableUnderline: true }} disabled= { type === 'view' } sx= { input } /> }
                    <Typography variant= "body2" color= "error.dark" mt= "5px">{ errors.item_code?.message }</Typography>
                </Stack>
            </Grid>
            <Grid item xs= { 12 } md= { 2 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography variant= "body2" gutterBottom>*UOM</Typography>
                    <Box sx= { select }>
                        <Controller control= { control } name= "uom"
                                render= { ({ field: { onChange, value } }) => (
                                    <Autocomplete options= { uom } disableClearable getOptionLabel= { opt => opt.name || opt.id } disabled= { type === 'view' }
                                        noOptionsText= "No results..." isOptionEqualToValue= { (option, value) => option.name === value.name || option.id === value.id }
                                        renderInput= { params => ( <TextField { ...params } variant= "standard" size= "small" fullWidth= { true } /> ) } getOptionDisabled= { option => option.id === 0 }
                                        onChange= { (e, item) => { onChange(item.id); } }
                                        value= { uom?.find(data => { return data.id === (getValues().uom !== undefined ? getValues().uom : value) }) !== undefined ?
                                                        uom?.find(data => { return data.id === (getValues().uom !== undefined ? getValues().uom : value) }) : uom.length === 0 ?
                                                        { id: 0, name: '-- SELECT AN ITEM BELOW --' } : uom[0] } />
                                ) } />
                    </Box>
                </Stack>
            </Grid>
            <Grid item xs= { 12 } sm= { 4 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography gutterBottom variant= "body2">*Total</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> : 
                        <TextField { ...register('total') } name= "total" variant= "standard" InputProps= {{ disableUnderline: true }} disabled= { true } sx= { input } /> }
                    <Typography variant= "body2" color= "error.dark" mt= "5px">{ errors.total?.message }</Typography>
                </Stack>
            </Grid>
            <Grid item xs= { 12 }><Quantity fetching= { fetching } setTotalqty= { setTotalqty } totalqty= { totalqty } /></Grid>
            <Grid item xs= { 12 }><Others fetching= { fetching } qr= { qr } /></Grid>
        </Grid>
    );
}

export default Info;