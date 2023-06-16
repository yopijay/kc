// Libraries
import { Autocomplete, Box, Grid, Skeleton, Stack, TextField, Typography } from "@mui/material"
import { Controller } from "react-hook-form";
import { useContext, useEffect } from "react";
import { useParams } from "react-router-dom";

// Core
import { usePost } from "core/function/global"; // Function
import { dropdown } from "core/api"; // API
import { FormCntxt } from "core/context/Form"; // Context

// Constants
import { label, select } from "../index.style"; // Styles
const branch = [{ id: 'qa', name: 'QUEZON AVE' }, { id: 'sd', name: 'STO. DOMINGO' }, { id: 'ma', name: 'MANILA' }, { id: 'ca', name: 'CAVITE' }]; // Branch
const floors = [{ id: '1f', name: '1ST FLOOR' }, { id: '2f', name: '2ND FLOOR' }, { id: '3f', name: '3RD FLOOR' }, { id: '4f', name: '4TH FLOOR' }]; // Floors

const Location = ({ fetching }) => {
    const { type } = useParams();
    const { getValues, setError, control, errors } = useContext(FormCntxt);
    const { data: rack, mutate: rck, isLoading: rckloading } = usePost({ fetch: dropdown });

    useEffect(() => {
        if(!fetching)
            rck({ table: 'tbl_racks', data: { branch: 'qa', floor: '1f' } });
            if(type !== 'new') 
                rck({ table: 'tbl_racks', data: { branch: getValues().branch, floor: getValues().floor } });
    }, [ fetching, type, getValues, rck ])

    return (
        <Grid container direction= "row" justifyContent= "flex-start" alignItems= "flex-start" spacing= { 2 }>
            <Grid item xs= { 12 } md= { 4 }>
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
        </Grid>
    );
}

export default Location;