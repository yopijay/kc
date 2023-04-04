// Libraries
import { Autocomplete, Box, Grid, Skeleton, Stack, TextField, Typography } from "@mui/material";
import { useContext, useEffect } from "react";
import { Controller } from "react-hook-form";
import { useParams } from "react-router-dom";

// Core
import { FormCntxt } from "core/context/Form"; // Context
import { dropdown } from "core/api"; // API
import { useGet, usePost } from "core/function/global"; // Function

// Contants
import { label, select } from "../../index.style"; // Styles

const Company = ({ fetching }) => {
    const { type } = useParams();
    const { control, getValues, setError, errors, setValue } = useContext(FormCntxt);
    const { data: company } = useGet({ key: ['dd_company'], fetch: dropdown({ table: 'tbl_company', data: {} }), options: { refetchOnWindowFocus: false } });
    const { data: department, mutate: dpt, isLoading: dptloading } = usePost({ fetch: dropdown });
    const { data: position, mutate: pst, isLoading: pstloading } = usePost({ fetch: dropdown });

    useEffect(() => {
        if(!fetching) {
            if(type !== 'new') {
                dpt({ table: 'tbl_department', data: { id: getValues().company_id } });
                pst({ table: `tbl_position`, data: { company_id: getValues().company_id, department_id: getValues().department_id } });
            }
        }
    }, [ fetching, type, dpt, pst, getValues ]);

    return (
        <Grid container direction= "row" justifyContent= "flex-start" alignItems= "flex-start" spacing= { 1 }>
            <Grid item xs= { 12 } md= { 4 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography variant= "body2" gutterBottom>*Company</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> : 
                        <Box sx= { select }>
                            { company?.length > 0 ? 
                                <Controller control= { control } name= "company_id" defaultValue= { 0 }
                                    render= { ({ field: { onChange, value } }) => (
                                        <Autocomplete options= { company?.sort((a, b) => a.id - b.id) } disabled= { type === 'view' } disableClearable 
                                            getOptionLabel= { company => company.name || company.id } noOptionsText= "No results.." getOptionDisabled= { option => option.id === 0 }
                                            isOptionEqualToValue= { (option, value) => option.name === value.name || option.id === value.id } 
                                            onChange= { (e, item) => { 
                                                setError('company_id', { message: '' }); 
                                                onChange(item.id); 
                                                dpt({ table: 'tbl_department', data: { id: item.id } });
                                                setValue('department_id', 0);
                                                setValue('position_id', 0);
                                            } }
                                            renderInput= { params => ( <TextField { ...params } variant= "standard" size= "small" fullWidth /> ) } 
                                            value= { company?.find(data => { return data.id === (getValues().company_id !== undefined ? getValues().company_id : value) }) !== undefined ?
                                                company?.find(data => { return data.id === (getValues().company_id !== undefined ? getValues().company_id : value) }) : company.length === 0 ?
                                                { id: 0, name: '-- SELECT AN ITEM BELOW --' } : company[0] } />
                                    ) } /> : <Typography color= "text.disabled">You must create a user first!</Typography> }
                        </Box> }
                    <Typography variant= "body2" color= "error.dark" mt= "5px">{ errors.company_id?.message }</Typography>
                </Stack>
            </Grid>
            <Grid item xs= { 12 } md= { 4 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography variant= "body2" gutterBottom>*Department</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> : 
                        !dptloading ? 
                            department !== undefined ? 
                                department?.length > 0 ? 
                                    <Box sx= { select }>
                                        <Controller control= { control } name= "department_id" defaultValue= { 0 }
                                            render= { ({ field: { onChange, value } }) => (
                                                <Autocomplete options= { department?.sort((a, b) => a.id - b.id) } disabled= { type === 'view' } disableClearable 
                                                    getOptionLabel= { department => department.name || department.id } noOptionsText= "No results.." getOptionDisabled= { option => option.id === 0 }
                                                    isOptionEqualToValue= { (option, value) => option.name === value.name || option.id === value.id } 
                                                    onChange= { (e, item) => { 
                                                        setError('department_id', { message: '' }); 
                                                        onChange(item.id); 
                                                        pst({ table: 'tbl_position', data: { company_id: getValues().company_id, department_id: item.id} }); 
                                                    } } renderInput= { params => ( <TextField { ...params } variant= "standard" size= "small" fullWidth /> ) } 
                                                    value= { department?.find(data => { return data.id === (getValues().department_id !== undefined ? getValues().department_id : value) }) !== undefined ?
                                                        department?.find(data => { return data.id === (getValues().department_id !== undefined ? getValues().department_id : value) }) : department.length === 0 ?
                                                        { id: 0, name: '-- SELECT AN ITEM BELOW --' } : department[0] } />
                                            ) } />
                                    </Box> :
                                    <Typography color= "text.disabled" component= { Stack } sx= { label } 
                                        direction= "row" justifyContent= "flex-start" alignItems= "center">You must create a department first!</Typography> :
                                <Typography color= "text.disabled" component= { Stack } sx= { label } 
                                    direction= "row" justifyContent= "flex-start" alignItems= "center">Please select a company first!</Typography> :
                            <Typography color= "text.disabled" component= { Stack } sx= { label } 
                                direction= "row" justifyContent= "flex-start" alignItems= "center">Loading...</Typography> }
                    <Typography variant= "body2" color= "error.dark" mt= "5px">{ errors.department_id?.message }</Typography>
                </Stack>
            </Grid>
            <Grid item xs= { 12 } md= { 4 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography variant= "body2" gutterBottom>*Positon</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> : 
                        !pstloading ? 
                            position !== undefined ? 
                                position?.length > 0 ? 
                                    <Box sx= { select }>
                                        <Controller control= { control } name= "position_id" defaultValue= { 0 }
                                            render= { ({ field: { onChange, value } }) => (
                                                <Autocomplete options= { position?.sort((a, b) => a.id - b.id) } disabled= { type === 'view' } disableClearable 
                                                    getOptionLabel= { position => position.name || position.id } noOptionsText= "No results.." getOptionDisabled= { option => option.id === 0 }
                                                    isOptionEqualToValue= { (option, value) => option.name === value.name || option.id === value.id } 
                                                    onChange= { (e, item) => { 
                                                        setError('position_id', { message: '' }); 
                                                        onChange(item.id);
                                                    } } renderInput= { params => ( <TextField { ...params } variant= "standard" size= "small" fullWidth /> ) } 
                                                    value= { position?.find(data => { return data.id === (getValues().position_id !== undefined ? getValues().position_id : value) }) !== undefined ?
                                                        position?.find(data => { return data.id === (getValues().position_id !== undefined ? getValues().position_id : value) }) : position.length === 0 ?
                                                        { id: 0, name: '-- SELECT AN ITEM BELOW --' } : position[0] } />
                                            ) } />
                                    </Box> :
                                    <Typography color= "text.disabled" component= { Stack } sx= { label } 
                                        direction= "row" justifyContent= "flex-start" alignItems= "center">You must create a position first!</Typography> :
                                <Typography color= "text.disabled" component= { Stack } sx= { label } 
                                    direction= "row" justifyContent= "flex-start" alignItems= "center">Please select a department first!</Typography> :
                            <Typography color= "text.disabled" component= { Stack } sx= { label } 
                                direction= "row" justifyContent= "flex-start" alignItems= "center">Loading...</Typography> }
                    <Typography variant= "body2" color= "error.dark" mt= "5px">{ errors.position_id?.message }</Typography>
                </Stack>
            </Grid>
        </Grid>
    );
}

export default Company;