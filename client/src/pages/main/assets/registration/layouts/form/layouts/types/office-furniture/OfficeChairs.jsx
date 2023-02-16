// Libraries
import { useContext } from "react";
import { useParams } from "react-router-dom";
import { Autocomplete, Box, Grid, Skeleton, Stack, TextField, Typography } from "@mui/material";
import { Controller } from "react-hook-form";

// Core
import { FormCntxt } from "core/context/Form"; // Context
import { formatter, useGet } from "core/function/global"; // Function
import { assettag } from "core/api"; // API

// Constants
import { input, select } from "../../../index.style"; // Styles
const assembly = [{ id: 'yes', name: 'YES' }, { id: 'no', name: 'NO' }]; // Assembly
const appearance = [{ id: 'good', name: 'GOOD' }, { id: 'bad', name: 'BAD' }]; // Appearance
const armrest = [{ id: 'yes', name: 'YES' }, { id: 'no', name: 'NO' }]; // With Side arm

const OfficeChairs = ({ fetching, tag }) => {
    const { type } = useParams();
    const { register, errors, getValues, setValue, control } = useContext(FormCntxt);
    useGet({ key: ['ofc_chr_tag'], 
                    fetch: assettag({ table: 'tbl_assets', data: { category_id: getValues().category_id, sub_category_id: getValues().sub_category_id } }), options: { refetchOnWindowFocus: true },
                    onSuccess: data => { if(type === 'new') setValue('asset_tag', `ASSTS-${tag}-${formatter(parseInt(data) + 1, 7)}`); } });

    return (
        <Grid container direction= "row" justifyContent= "flex-start" alignItems= "flex-start" spacing= { 1 }>
            <Grid item xs= { 12 } sm= { 8 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography gutterBottom variant= "body2">*Asset Tag</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> : 
                        <TextField { ...register('asset_tag') } name= "asset_tag" variant= "standard" InputProps= {{ disableUnderline: true }} disabled= { true } sx= { input } /> }
                    <Typography variant= "body2" color= "error.dark" mt= "5px">{ errors.asset_tag?.message }</Typography>
                </Stack>
            </Grid>
            <Grid item xs= { 12 } sm= { 4 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography gutterBottom variant= "body2">Brand</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> : 
                        <TextField { ...register('brand') } name= "brand" variant= "standard" InputProps= {{ disableUnderline: true }} disabled= { type === 'view' } sx= { input } /> }
                    <Typography variant= "body2" color= "error.dark" mt= "5px">{ errors.brand?.message }</Typography>
                </Stack>
            </Grid>
            <Grid item xs= { 12 } sm= { 4 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography gutterBottom variant= "body2">Color</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> : 
                        <TextField { ...register('color') } name= "color" variant= "standard" InputProps= {{ disableUnderline: true }} disabled= { type === 'view' } sx= { input } /> }
                    <Typography variant= "body2" color= "error.dark" mt= "5px">{ errors.color?.message }</Typography>
                </Stack>
            </Grid>
            <Grid item xs= { 12 } sm= { 4 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography gutterBottom variant= "body2">Weight</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> : 
                        <TextField { ...register('weight') } name= "weight" variant= "standard" InputProps= {{ disableUnderline: true }} disabled= { type === 'view' } sx= { input } /> }
                    <Typography variant= "body2" color= "error.dark" mt= "5px">{ errors.weight?.message }</Typography>
                </Stack>
            </Grid>
            <Grid item xs= { 12 } sm= { 4 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography gutterBottom variant= "body2">Dimension</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> : 
                        <TextField { ...register('dimension') } name= "dimension" variant= "standard" InputProps= {{ disableUnderline: true }} disabled= { type === 'view' } sx= { input } /> }
                    <Typography variant= "body2" color= "error.dark" mt= "5px">{ errors.dimension?.message }</Typography>
                </Stack>
            </Grid>
            <Grid item xs= { 12 } sm= { 4 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography variant= "body2" gutterBottom>Assembly Required</Typography>
                    <Box sx= { select }>
                        <Controller control= { control } name= "assembly_required"
                                render= { ({ field: { onChange, value } }) => (
                                    <Autocomplete options= { assembly } disableClearable getOptionLabel= { opt => opt.name || opt.id } disabled= { type === 'view' }
                                        noOptionsText= "No results..." isOptionEqualToValue= { (option, value) => option.name === value.name || option.id === value.id }
                                        renderInput= { params => ( <TextField { ...params } variant= "standard" size= "small" fullWidth= { true } /> ) } getOptionDisabled= { option => option.id === 0 }
                                        onChange= { (e, item) => { onChange(item.id); } }
                                        value= { assembly.find(data => { return data.id === (getValues().assembly_required !== undefined ? getValues().assembly_required : value) }) } />
                                ) } />
                    </Box>
                </Stack>
            </Grid>
            <Grid item xs= { 12 } sm= { 4 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography variant= "body2" gutterBottom>With armrest</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> : 
                        <Box sx= { select }>
                            <Controller control= { control } name= "with_armrest"
                                    render= { ({ field: { onChange, value } }) => (
                                        <Autocomplete options= { armrest } disableClearable getOptionLabel= { opt => opt.name || opt.id } disabled= { type === 'view' }
                                            noOptionsText= "No results..." isOptionEqualToValue= { (option, value) => option.name === value.name || option.id === value.id }
                                            renderInput= { params => ( <TextField { ...params } variant= "standard" size= "small" fullWidth= { true } /> ) } getOptionDisabled= { option => option.id === 0 }
                                            onChange= { (e, item) => { onChange(item.id); } }
                                            value= { armrest.find(data => { return data.id === (getValues().with_armrest !== undefined ? getValues().with_armrest : value) }) } />
                                    ) } />
                        </Box> }
                </Stack>
            </Grid>
            <Grid item xs= { 12 } sm= { 4 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography variant= "body2" gutterBottom>Appearance</Typography>
                    <Box sx= { select }>
                        <Controller control= { control } name= "appearance"
                                render= { ({ field: { onChange, value } }) => (
                                    <Autocomplete options= { appearance } disableClearable getOptionLabel= { opt => opt.name || opt.id } disabled= { type === 'view' }
                                        noOptionsText= "No results..." isOptionEqualToValue= { (option, value) => option.name === value.name || option.id === value.id }
                                        renderInput= { params => ( <TextField { ...params } variant= "standard" size= "small" fullWidth= { true } /> ) } getOptionDisabled= { option => option.id === 0 }
                                        onChange= { (e, item) => { onChange(item.id); } }
                                        value= { appearance.find(data => { return data.id === (getValues().appearance !== undefined ? getValues().appearance : value) }) } />
                                ) } />
                    </Box>
                </Stack>
            </Grid>
        </Grid>
    );
}

export default OfficeChairs;