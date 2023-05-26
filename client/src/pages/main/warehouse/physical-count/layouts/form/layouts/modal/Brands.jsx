// Libraries
import { Autocomplete, Box, Skeleton, Stack, TextField, Typography } from "@mui/material";
import { useContext } from "react";
import { Controller } from "react-hook-form";

// Core
import { FormCntxt } from "core/context/Form"; // Context
import { useGet, usePost } from "core/function/global"; // Function
import { count, dropdown } from "core/api"; // API

// Constants
import { input, select } from "../../index.style"; // Styles

const Brands = ({ setOpen, index, fetching, type, _counts }) => {
    const { register, getValues, control, setValue, setError } = useContext(FormCntxt);
    const { data: brand } = useGet({ key: ['dd_brands'], fetch: dropdown({ table: 'tbl_brand', data: { platform: 'client' } }), options: { refetchOnWindowFocus: false } });
    const { mutate: counts } = usePost({ fetch: count, onSuccess: data => setValue(`brands[${index}].items`, data) });

    return (
        <Stack direction= "column" justifyContent= "space-between" alignItems= "stretch" sx= {{ padding: '25px 20px', height: '100%' }} spacing= { 2 }>
            <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 } sx= {{ flexGrow: 1 }}>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography variant= "body2" gutterBottom>*Brand</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> : 
                        <Box sx= { select }>
                            { brand?.length > 0 ? 
                                <Controller control= { control } name= { `brands[${index}].brand_id` } defaultValue= { 0 }
                                    render= { ({ field: { onChange, value } }) => (
                                        <Autocomplete options= { (brand?.filter(brd => !(getValues().brands).find(brds => brd.id === brds?.brand_id)))?.sort((a, b) => a.id - b.id) } 
                                            disabled= { type === 'view' } disableClearable getOptionLabel= { brand => brand.name || brand.id } 
                                            noOptionsText= "No results.." getOptionDisabled= { option => option.id === 0 }
                                            isOptionEqualToValue= { (option, value) => option.name === value.name || option.id === value.id } 
                                            onChange= { (e, item) => { onChange(item.id); setValue(`brands[${index}].brand_name`, item.name); counts({ brand_id: item.id }); } }
                                            renderInput= { params => ( <TextField { ...params } variant= "standard" size= "small" fullWidth /> ) } 
                                            value= { brand?.find(data => { return data.id === (getValues().brand_id !== undefined ? getValues().brand_id : value) }) !== undefined ?
                                                brand?.find(data => { return data.id === (getValues().brand_id !== undefined ? getValues().brand_id : value) }) : brand.length === 0 ?
                                                { id: 0, name: '-- SELECT AN ITEM BELOW --' } : brand[0] } />
                                    ) } /> : <Typography color= "text.disabled">You must create a brand first!</Typography> }
                        </Box> }
                </Stack>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography variant= "body2" gutterBottom>No. of Items</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                        <TextField { ...register(`brands.[${index}].items`) } name= { `brands.[${index}].items` } 
                            variant= "standard" InputProps= {{ disableUnderline: true }} sx= { input } disabled= { true } /> }
                </Stack>
            </Stack>
            <Stack direction= "row" justifyContent= "flex-end" alignItems= "center" spacing= { 4 }>
                <Typography sx= {{ cursor: 'pointer' }} 
                    onClick= { () => { setValue(`brands`, getValues().brands); setOpen(false); _counts({}); setError('total_items', { message: '' }); } }>Save</Typography>
                { type === 'create' ? <Typography sx= {{ cursor: 'pointer' }} 
                    onClick= { () => { (getValues().brands).splice(index, 1); setValue(`brands`, getValues().brands); setOpen(false); setError('total_items', { message: '' }); } }>Cancel</Typography> : '' }
            </Stack>
        </Stack>
    );
}

export default Brands;