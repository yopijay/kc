// Libraries
import { Autocomplete, Box, Stack, TextField, Typography } from "@mui/material";
import { useContext } from "react";
import { Controller } from "react-hook-form";

// Core
import { ProfileCntx } from "core/context/Profile"; // Context
import { FormCntxt } from "core/context/Form"; // Context
import { formatter, successToast, useGet, usePost } from "core/function/global"; // Function
import { dropdown, save, series, specific } from "core/api"; // API

// Constants
import { input, select } from "../index.style"; // Styles

const Products = ({ id, setOpen, record, rack }) => {
    const { data } = useContext(ProfileCntx);
    const { register, errors, control, getValues, handleSubmit, setError, setValue } = useContext(FormCntxt);
    const { data: brands } = useGet({ key: ['brands'], fetch: dropdown({ table: 'tbl_brands', data: { brands: data.brands, platform: 'warehouse' } }), options: { refetchWindowFocus: false } });
    useGet({ key: ['itm_series'], fetch: series('tbl_items'), options: { }, onSuccess: (data) => { setValue('itm_series_no', id === null ? `ITM-${formatter(parseInt(data) + 1, 7)}` : ''); } });
    const { data: personnel } = 
        useGet({ key: ['rcs'], fetch: dropdown({ table: 'tbl_physical_count_personnels', data: { platform: 'warehouse', physical_count_id: data.physical_count_id, user_id: data.user_id, type: 'rcs' } }), 
                        options: { refetchWindowFocus: false } });
                        
    useGet({ key: ['itm_specific'], fetch: specific({ table: 'tbl_items', id: id ?? null }), options: { enabled: id !== null, refetchWindowFocus: false },
        onSuccess: data => {
            setValue('itm_series_no', data[0].series_no);
            setValue('brand_id', data[0].brand_id);
            setValue('item_code', data[0].item_code);
            setValue('rcs', data[0].rcs);
        } 
    });

    const { mutate: rcs } = 
        usePost({ fetch: save,
            onSuccess: res => {
                if(res.result === 'error') { (res.error).forEach((err, index) => { setError(err.name, { type: index === 0 ? 'focus' : '', message: err.message }, { shouldFocus: index === 0 }); }); }
                else { 
                    let _data = data;
                    _data['rack_id'] = rack;
                    _data['list'] = 'items';

                    successToast(res.message, 3000);
                    record({ table: 'tbl_racks', data: _data });
                    setOpen(false);
                }
            }
        });

    return (
        <Stack direction= "column" justifyContent= "space-between" alignItems= "stretch" sx= {{ padding: '25px 20px', height: '100%' }} spacing= { 2 }>
            <form autoComplete= "off">
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 2 } sx= {{ flexGrow: 1 }}>
                    <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                        <Typography variant= "body2" gutterBottom>*Series no.</Typography>
                        <TextField name= "itm_series_no" { ...register('itm_series_no') } variant= "standard" InputProps= {{ disableUnderline: true }} disabled sx= { input } />
                        <Typography variant= "body2" color= "error.dark">{ errors.itm_series_no?.message }</Typography>
                    </Stack>
                    <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                        <Typography variant= "body2" gutterBottom>*Brand</Typography>
                        <Box sx= { select }>
                            { brands?.length > 0 ?
                                <Controller control= { control } name= "brand_id"
                                    render= { ({ field: { onChange, value } }) => (
                                        <Autocomplete options= { brands?.sort((a, b) => a.id - b.id) } disableClearable getOptionLabel= { brand => brand.name || brand.id } 
                                            noOptionsText= "No results.." getOptionDisabled= { option => option.id === 0 } disabled= { id !== null }
                                            isOptionEqualToValue= { (option, value) => option.name === value.name || option.id === value.id } 
                                            onChange= { (e, item) => { setError('brand_id', { message: '' }); onChange(item.id); } }
                                            renderInput= { params => ( <TextField { ...params } variant= "standard" size= "small" fullWidth /> ) } 
                                            value= { brands?.find(data => { return data.id === (getValues().brand_id !== undefined ? getValues().brand_id : value) }) !== undefined ?
                                                brands?.find(data => { return data.id === (getValues().brand_id !== undefined ? getValues().brand_id : value) }) : brands.length === 0 ?
                                                { id: 0, name: '-- SELECT AN ITEM BELOW --' } : brands[0] } />
                                    ) } /> : <Typography color= "text.disabled">You must create a brand first!</Typography> }
                        </Box>
                        <Typography variant= "body2" color= "error.dark">{ errors.brand_id?.message }</Typography>
                    </Stack>
                    <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                        <Typography variant= "body2" gutterBottom>*Item Code</Typography>
                        <TextField name= "item_code" { ...register('item_code') } variant= "standard" InputProps= {{ disableUnderline: true }} sx= { input } disabled= { id !== null } />
                        <Typography variant= "body2" color= "error.dark">{ errors.item_code?.message }</Typography>
                    </Stack>
                    <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                        <Typography variant= "body2" gutterBottom>*Assign to</Typography>
                        <Box sx= { select }>
                            { personnel?.length > 0 ?
                                <Controller control= { control } name= "rcs"
                                    render= { ({ field: { onChange, value } }) => (
                                        <Autocomplete options= { personnel?.sort((a, b) => a.id - b.id) } disableClearable 
                                            getOptionLabel= { pnl => pnl.name || pnl.id } noOptionsText= "No results.." getOptionDisabled= { option => option.id === 0 }
                                            isOptionEqualToValue= { (option, value) => option.name === value.name || option.id === value.id } 
                                            onChange= { (e, item) => { setError('rcs', { message: '' }); onChange(item.id); } }
                                            renderInput= { params => ( <TextField { ...params } variant= "standard" size= "small" fullWidth /> ) } 
                                            value= { personnel?.find(data => { return data.id === (getValues().rcs !== undefined ? getValues().rcs : value) }) !== undefined ?
                                                            personnel?.find(data => { return data.id === (getValues().rcs !== undefined ? getValues().rcs : value) }) : personnel.length === 0 ?
                                                            { id: 0, name: '-- SELECT AN ITEM BELOW --' } : personnel[0] } />
                                    ) } />
                                : <Typography color= "text.disabled">You must create a user first!</Typography> }
                        </Box>
                        <Typography variant= "body2" color= "error.dark">{ errors.rcs?.message }</Typography>
                    </Stack>
                </Stack>
            </form>
            <Stack direction= "row" justifyContent= "flex-end" alignItems= "center" spacing= { 2 }>
                <Typography style= {{ cursor: 'pointer' }} onClick= { () => setOpen(false) }>Cancel</Typography>
                <Typography style= {{ cursor: 'pointer' }}
                    onClick= { handleSubmit(form => {
                        let errors = [];
                        form['item_id'] = id;
                        form['rcs_created_by'] = atob(localStorage.getItem('token'));
                        form['physical_count_id'] = data.physical_count_id;

                        if(form.brand_id === null) { errors.push({ name: 'brand_id', message: 'This field is required!' }); }
                        if(form.item_code === '' || form.item_code === null) { errors.push({ name: 'item_code', message: 'This field is required!'}); }
                        if(form.rcs === null) { errors.push({ name: 'rcs', message: 'This field is required!' }); }

                        if(!(errors.length > 0)) { rcs({ table: 'tbl_physical_count_rcs', data: form }); }
                        else { errors.forEach(err => setError(err.name, { message: err.message })); }
                    }) }>Save</Typography>
            </Stack>
        </Stack>
    );
}

export default Products;