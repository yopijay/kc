// Libraries
import { useContext } from "react";
import { useParams } from "react-router-dom";
import { Controller } from "react-hook-form";
import { Autocomplete, Box, Grid, Skeleton, Stack, TextField, Typography } from "@mui/material";

// Core
import { FormCntxt } from "core/context/Form"; // Context
import { useGet, usePost } from "core/function/global"; // Function
import { dropdown, specific } from "core/api"; // API

// Constants
import { select } from "../../index.style"; // Styles

const Classification = ({ fetching, setItem, setEqptype }) => {
    const { type } = useParams();
    const { getValues, control, setError, errors, setValue } = useContext(FormCntxt);
    const { data: category } = useGet({ key: ['ctgy_dropdown'], fetch: dropdown({ table: `tbl_category`, data: { module: 'assets' } }), options: { refetchOnWindowFocus: false } });
    const { data: items, mutate: menu, isLoading } = usePost({ fetch: dropdown });
    const { data: assts, mutate: assets, isLoading: assetloading } = usePost({ fetch: dropdown });
    const { mutate: info } = 
        usePost({ fetch: specific, 
            onSuccess: data => {
                if(Array.isArray(data))
                    for(let count = 0; count < Object.keys(data[0]).length; count++) {
                        let _name = Object.keys(data[0])[count]; 

                        if(_name !== 'series_no') { setValue(_name, data[0][_name] !== null ? _name === 'item' ? ((data[0][_name]).replace(' ', '-')).toLowerCase() : data[0][_name] : ''); }
                        setEqptype(data[0]['equipment_type']);
                    }
            }
        });

    return (
        <Grid container direction= "row" justifyContent= "flex-start" alignItems= "flex-start" spacing= { 1 }>
            <Grid item xs= { 12 } sm= { 6 } md= { 7 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography gutterBottom variant= "body2">*Category</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> : 
                        <Box sx= { select }>
                            { category?.length > 0 ? 
                                <Controller control= { control } name= "category_id" defaultValue= { 0 }
                                    render= { ({ field: { onChange, value } }) => (
                                        <Autocomplete options= { category?.sort((a, b) => a.id - b.id) } disabled= { type !== 'new' } disableClearable 
                                            getOptionLabel= { category => category.name || category.id } noOptionsText= "No results.." getOptionDisabled= { option => option.id === 0 }
                                            isOptionEqualToValue= { (option, value) => option.name === value.name || option.id === value.id } 
                                            onChange= { (e, item) => { setError('category_id', { message: '' }); onChange(item.id); 
                                                                                            menu({ table: `tbl_sub_category`, data: { category_id: item.id } }); } }
                                            renderInput= { params => ( <TextField { ...params } variant= "standard" size= "small" fullWidth /> ) } 
                                            value= { category?.find(data => { return data.id === (getValues().category_id !== undefined ? getValues().category_id : value) }) !== undefined ?
                                                category?.find(data => { return data.id === (getValues().category_id !== undefined ? getValues().category_id : value) }) : category.length === 0 ?
                                                { id: 0, name: '-- SELECT AN ITEM BELOW --' } : category[0] } />
                                    ) } /> : <Typography color= "text.disabled">You must create a category first!</Typography> }
                        </Box> }
                    <Typography variant= "body2" color= "error.dark" mt= "5px">{ errors.category_id?.message }</Typography>
                </Stack>
            </Grid>
            <Grid item xs= { 12 } sm= { 6 } md= { 5 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography gutterBottom variant= "body2">*Sub-category</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> : 
                        <Box sx= { select }>
                            { !isLoading ?
                                items !== undefined ?
                                    items?.length > 0 ? 
                                        <Controller control= { control } name= "sub_category_id" defaultValue= { 0 }
                                            render= { ({ field: { onChange, value } }) => (
                                                <Autocomplete options= { items?.sort((a, b) => a.id - b.id) } disabled= { type !== 'new' } disableClearable 
                                                    getOptionLabel= { items => items.name || items.id } noOptionsText= "No results.." getOptionDisabled= { option => option.id === 0 }
                                                    isOptionEqualToValue= { (option, value) => option.name === value.name || option.id === value.id } 
                                                    onChange= { (e, item) => { setItem(''); setError('sub_category_id', { message: '' }); onChange(item.id); 
                                                        setValue('item', ((item.name).replace(' ', '-')).toLowerCase()); 
                                                        assets({ table: 'tbl_assets', data: { category_id: getValues().category_id, sub_category_id: item.id } });
                                                    } }
                                                    renderInput= { params => ( <TextField { ...params } variant= "standard" size= "small" fullWidth /> ) } 
                                                    value= { items?.find(data => { return data.id === (getValues().sub_category_id !== undefined ? getValues().sub_category_id : value) }) !== undefined ?
                                                        items?.find(data => { return data.id === (getValues().sub_category_id !== undefined ? getValues().sub_category_id : value) }) : items.length === 0 ?
                                                        { id: 0, name: '-- SELECT AN ITEM BELOW --' } : items[0] } />
                                            ) } /> : <Typography color= "text.disabled" sx= {{ padding: '3px 0' }}>You must create a items first!</Typography> : 
                                    <Typography color= "text.disabled" sx= {{ padding: '3px 0' }}>Please select a module first!</Typography>
                                : <Typography color= "text.disabled" sx= {{ padding: '3px 0' }}>Loading...</Typography> }
                        </Box> }
                    <Typography variant= "body2" color= "error.dark">{ errors.sub_category_id?.message }</Typography>
                </Stack>
            </Grid>
            <Grid item xs= { 12 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography gutterBottom variant= "body2">*Assets</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> : 
                        <Box sx= { select }>
                            { !assetloading ?
                                assts !== undefined ?
                                    assts?.length > 0 ? 
                                        <Controller control= { control } name= "asset_id" defaultValue= { 0 }
                                            render= { ({ field: { onChange, value } }) => (
                                                <Autocomplete options= { assts?.sort((a, b) => a.id - b.id) } disabled= { type !== 'new' } disableClearable 
                                                    getOptionLabel= { assts => assts.name || assts.id } noOptionsText= "No results.." getOptionDisabled= { option => option.id === 0 }
                                                    isOptionEqualToValue= { (option, value) => option.name === value.name || option.id === value.id } 
                                                    onChange= { (e, item) => { setError('asset_id', { message: '' }); setItem(getValues().item); onChange(item.id); info({ table: 'tbl_assets', id: item.id }); } }
                                                    renderInput= { params => ( <TextField { ...params } variant= "standard" size= "small" fullWidth /> ) } 
                                                    value= { assts?.find(data => { return data.id === (getValues().asset_id !== undefined ? getValues().asset_id : value) }) !== undefined ?
                                                        assts?.find(data => { return data.id === (getValues().asset_id !== undefined ? getValues().asset_id : value) }) : assts.length === 0 ?
                                                        { id: 0, name: '-- SELECT AN ITEM BELOW --' } : assts[0] } />
                                            ) } /> : <Typography color= "text.disabled" sx= {{ padding: '3px 0' }}>You must create an asset first!</Typography> : 
                                    <Typography color= "text.disabled" sx= {{ padding: '3px 0' }}>Please select a sub-category first!</Typography>
                                : <Typography color= "text.disabled" sx= {{ padding: '3px 0' }}>Loading...</Typography> }
                        </Box> }
                    <Typography variant= "body2" color= "error.dark">{ errors.asset_id?.message }</Typography>
                </Stack>
            </Grid>
        </Grid>
    );
}

export default Classification;