// Libraries
import { Autocomplete, Box, Grid, Skeleton, Stack, TextField, Typography } from "@mui/material";
import { useContext, useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import { Controller } from "react-hook-form";

// Core
import { FormCntxt } from "core/context/Form"; // Context
import { ProfileCntx } from "core/context/Profile"; // Context
import { formatter, useGet, usePost } from "core/function/global"; // Function
import { dropdown, series } from "core/api"; // API

// Constants
import { input, label, select } from "../index.style"; // Styles
import Quantity from "./Quantity";
import Others from "./Others";
const branch = [{ id: 'qa', name: 'QUEZON AVE' }, { id: 'sd', name: 'STO. DOMINGO' }, { id: 'ma', name: 'MANILA' }, { id: 'ca', name: 'CAVITE' }]; // Branch
const floors = [{ id: '1f', name: '1ST FLOOR' }, { id: '2f', name: '2ND FLOOR' }, { id: '3f', name: '3RD FLOOR' }, { id: '4f', name: '4TH FLOOR' }]; // Floors
const uom = [{ id: 'pc', name: 'PC/S' }]; // Unit of measures

const Form = ({ fetching }) => {
    const { type } = useParams();
    const { data } = useContext(ProfileCntx);
    const [ totalqty, setTotalqty ] = useState(0);
    const { register, errors, control, setError, getValues, setValue } = useContext(FormCntxt);
    const { data: brands } = useGet({ key: ['brands'], fetch: dropdown({ table: 'tbl_brands', data: { brands: data.brands, platform: 'warehouse' } }), options: { refetchWindowFocus: false } });
    const { data: rack, mutate: rck, isLoading: rckloading } = usePost({ fetch: dropdown });
    useGet({ key: ['itm_series'], fetch: series('tbl_items'), options: { }, onSuccess: (data) => { if(type === 'new') setValue('series_no', `ITM-${formatter(parseInt(data) + 1, 7)}`); } });

    useEffect(() => { setValue('total', totalqty); rck({ table: 'tbl_racks', data: { branch: 'qa', floor: '1f' } }); }, [ setValue, totalqty, fetching, type, rck, getValues ]);

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
                            { brands?.length > 0 ? 
                                <Controller control= { control } name= "brand_id" defaultValue= { 0 }
                                    render= { ({ field: { onChange, value } }) => (
                                        <Autocomplete options= { brands?.sort((a, b) => a.id - b.id) } disabled= { type === 'update' } disableClearable 
                                            getOptionLabel= { brand => brand.name || brand.id } noOptionsText= "No results.." getOptionDisabled= { option => option.id === 0 }
                                            isOptionEqualToValue= { (option, value) => option.name === value.name || option.id === value.id } 
                                            onChange= { (e, item) => { setError('brand_id', { message: '' }); onChange(item.id); } }
                                            renderInput= { params => ( <TextField { ...params } variant= "standard" size= "small" fullWidth /> ) } 
                                            value= { brands?.find(data => { return data.id === (getValues().brand_id !== undefined ? getValues().brand_id : value) }) !== undefined ?
                                                brands?.find(data => { return data.id === (getValues().brand_id !== undefined ? getValues().brand_id : value) }) : brands.length === 0 ?
                                                { id: 0, name: '-- SELECT AN ITEM BELOW --' } : brands[0] } />
                                    ) } /> : <Typography color= "text.disabled">You must create a brand first!</Typography> }
                        </Box> }
                    <Typography variant= "body2" color= "error.dark" mt= "5px">{ errors.brand_id?.message }</Typography>
                </Stack>
            </Grid><Grid item xs= { 12 } md= { 4 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography variant= "body2" gutterBottom>*Branch</Typography>
                    <Box sx= { select }>
                        <Controller control= { control } name= "branch" defaultValue= "qa"
                                render= { ({ field: { onChange, value } }) => (
                                    <Autocomplete options= { branch } disableClearable getOptionLabel= { opt => opt.name || opt.id } disabled= { type === 'update' }
                                        noOptionsText= "No results..." isOptionEqualToValue= { (option, value) => option.name === value.name || option.id === value.id }
                                        renderInput= { params => ( <TextField { ...params } variant= "standard" size= "small" fullWidth= { true } /> ) } getOptionDisabled= { option => option.id === 0 }
                                        onChange= { (e, item) => { onChange(item.id); rck({ table: 'tbl_racks', data: { branch: item.id, floor: getValues().floor } }); } }
                                        value= { branch.find(data => { return data.id === (getValues().branch !== undefined ? getValues().branch : value) }) } />
                                ) } />
                    </Box>
                </Stack>
            </Grid>
            <Grid item xs= { 12 } md= { 4 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography variant= "body2" gutterBottom>*Floors</Typography>
                    <Box sx= { select }>
                        <Controller control= { control } name= "floor" defaultValue= "1f"
                                render= { ({ field: { onChange, value } }) => (
                                    <Autocomplete options= { floors } disableClearable getOptionLabel= { opt => opt.name || opt.id } disabled= { type === 'update' }
                                        noOptionsText= "No results..." isOptionEqualToValue= { (option, value) => option.name === value.name || option.id === value.id }
                                        renderInput= { params => ( <TextField { ...params } variant= "standard" size= "small" fullWidth= { true } /> ) } getOptionDisabled= { option => option.id === 0 }
                                        onChange= { (e, item) => { onChange(item.id); rck({ table: 'tbl_racks', data: { branch: getValues().branch, floor: item.id } }); } }
                                        value= { floors.find(data => { return data.id === (getValues().floor !== undefined ? getValues().floor : value) }) } />
                                ) } />
                    </Box>
                </Stack>
            </Grid>
            <Grid item xs= { 12 } md= { 4 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography variant= "body2" gutterBottom>*Rack</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> : 
                        !rckloading ?
                            rack !== undefined ?
                                rack?.length > 0 ?
                                    <Box sx= { select }>
                                        <Controller control= { control } name= "rack_id" defaultValue= { 0 }
                                            render= { ({ field: { onChange, value } }) => (
                                                <Autocomplete options= { rack?.sort((a, b) => a.id - b.id) } disabled= { type === 'update' } disableClearable
                                                    getOptionLabel= { rack => rack.name || rack.id } noOptionsText= "No results.." getOptionDisabled= { option => option.id === 0 }
                                                    isOptionEqualToValue= { (option, value) => option.name === value.name || option.id === value.id }
                                                    onChange= { (e, item) => {
                                                        setError('rack_id', { message: '' });
                                                        onChange(item.id);
                                                    } } renderInput= { params => <TextField { ...params } variant= "standard" size= "small" fullWidth /> }
                                                    value= { rack?.find(data => { return data.id === (getValues().rack_id !== undefined ? getValues().rack_id : value) }) !== undefined ?
                                                        rack?.find(data => { return data.id === (getValues().rack_id !== undefined ? getValues().rack_id : value) }) : rack.length === 0 ? 
                                                        { id: 0, name: '-- SELECT AN ITEM BELOW --' } : rack[0] } />
                                            ) } />
                                    </Box> :
                                    <Typography color= "text.disabled" component= { Stack } sx= { label }
                                        direction= "row" justifyContent= "flex-start" alignItems= "center">You must create a rack first!</Typography> :
                                <Typography color= "text.disabled" component= { Stack } sx= { label }
                                    direction= "row" justifyContent= "flex-start" alignItems= "center">Please select a branch or floor first!</Typography> :
                            <Typography color= "text.disabled" component= { Stack } sx= { label }
                                direction= "row" justifyContent= "flex-start" alignItems= "center">Loading...</Typography> }
                    <Typography variant= "body2" color= "error.dark" mt= "5px">{ errors.rack_id?.message }</Typography>
                </Stack>
            </Grid>
            <Grid item xs= { 12 } sm= { 6 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography gutterBottom variant= "body2">*Item Code</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> : 
                        <TextField { ...register('item_code') } name= "item_code" variant= "standard" InputProps= {{ disableUnderline: true }} disabled= { type === 'update' } sx= { input } /> }
                    <Typography variant= "body2" color= "error.dark" mt= "5px">{ errors.item_code?.message }</Typography>
                </Stack>
            </Grid>
            <Grid item xs= { 12 } sm= { 3 } md= { 2 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography variant= "body2" gutterBottom>*UOM</Typography>
                    <Box sx= { select }>
                        <Controller control= { control } name= "uom"
                                render= { ({ field: { onChange, value } }) => (
                                    <Autocomplete options= { uom } disableClearable getOptionLabel= { opt => opt.name || opt.id } disabled= { type === 'update' }
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
            <Grid item xs= { 12 } sm= { 3 } md= { 4 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography gutterBottom variant= "body2">*Total</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> : 
                        <TextField { ...register('total') } name= "total" variant= "standard" InputProps= {{ disableUnderline: true }} disabled= { true } sx= { input } /> }
                    <Typography variant= "body2" color= "error.dark" mt= "5px">{ errors.total?.message }</Typography>
                </Stack>
            </Grid>
            <Grid item xs= { 12 }><Quantity fetching= { fetching } setTotalqty= { setTotalqty } /></Grid>
            <Grid item xs= { 12 }><Others fetching= { fetching } /></Grid>
        </Grid> 
    );
}

export default Form;