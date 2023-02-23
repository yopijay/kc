// Libraries
import { useContext } from "react";
import { Controller } from "react-hook-form";
import { useParams } from "react-router-dom";
import { Autocomplete, Box, Grid, Skeleton, Stack, TextField, Typography } from "@mui/material";

// Core
import { dropdown } from "core/api"; // API
import { FormCntxt } from "core/context/Form"; // Context
import { useGet, usePost } from "core/function/global"; // Function

// Constants
import { input, label, select } from "../index.style"; // Styles
const branch = [{ id: 0, name: '-- SELECT AN ITEM BELOW --' }, 
                            { id: 'quezon_ave', name: 'QUEZON AVE.' }, 
                            { id: 'sto_domingo', name: 'STO. DOMINGO' }, 
                            { id: 'manila', name: 'MANILA' }, 
                            { id: 'cavite', name: 'CAVITE' }]; // Branch

const Employee = ({ fetching }) => {
    const { type } = useParams();
    const { register, control, getValues, setError, errors, setValue } = useContext(FormCntxt);
    const { data: company } = useGet({ key: ['dd_company'], fetch: dropdown({ table: 'tbl_company', data: {} }), options: { refetchOnWindowFocus: false } });
    const { data: department, mutate: dpt, isLoading: dptloading } = usePost({ fetch: dropdown });
    const { data: users, mutate: usr, isLoading: usrloading } = usePost({ fetch: dropdown });

    return (
        <Grid container direction= "row" justifyContent= "flex-start" alignItems= "flex-start" spacing= { 1 }>
            <Grid item xs= { 12 } md= { 8 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography gutterBottom variant= "body2">*Series No.</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> : 
                        <TextField { ...register('series_no') } name= "series_no" variant= "standard" InputProps= {{ disableUnderline: true }} disabled= { true } sx= { input } /> }
                    <Typography variant= "body2" color= "error.dark" mt= "5px">{ errors.series_no?.message }</Typography>
                </Stack>
            </Grid>
            <Grid item xs= { 12 } sm= { 5 }>
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
                                            onChange= { (e, item) => { setError('company_id', { message: '' }); onChange(item.id); dpt({ table: 'tbl_department', data: { id: item.id } }); } }
                                            renderInput= { params => ( <TextField { ...params } variant= "standard" size= "small" fullWidth /> ) } 
                                            value= { company?.find(data => { return data.id === (getValues().company_id !== undefined ? getValues().company_id : value) }) !== undefined ?
                                                company?.find(data => { return data.id === (getValues().company_id !== undefined ? getValues().company_id : value) }) : company.length === 0 ?
                                                { id: 0, name: '-- SELECT AN ITEM BELOW --' } : company[0] } />
                                    ) } /> : <Typography color= "text.disabled">You must create a user first!</Typography> }
                        </Box> }
                    <Typography variant= "body2" color= "error.dark" mt= "5px">{ errors.company_id?.message }</Typography>
                </Stack>
            </Grid>
            <Grid item xs= { 12 } sm= { 5 }>
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
                                                    onChange= { (e, item) => { setError('department_id', { message: '' }); onChange(item.id); setValue('branch', 0); } } 
                                                    renderInput= { params => ( <TextField { ...params } variant= "standard" size= "small" fullWidth /> ) } 
                                                    value= { department?.find(data => { return data.id === (getValues().department_id !== undefined ? getValues().department_id : value) }) !== undefined ?
                                                        department?.find(data => { return data.id === (getValues().department_id !== undefined ? getValues().department_id : value) }) : 
                                                            department.length === 0 ? { id: 0, name: '-- SELECT AN ITEM BELOW --' } : department[0] } />
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
            <Grid item xs= { 12 } sm= { 2 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography variant= "body2" gutterBottom>*Branch</Typography>
                    { getValues().department_id !== undefined ?
                        <Box sx= { select }>
                            <Controller control= { control } name= "branch" defaultValue= { 0 }
                                    render= { ({ field: { onChange, value } }) => (
                                        <Autocomplete options= { branch } disableClearable getOptionLabel= { opt => opt.name || opt.id } disabled= { type === 'view' }
                                            noOptionsText= "No results..." isOptionEqualToValue= { (option, value) => option.name === value.name || option.id === value.id }
                                            renderInput= { params => ( <TextField { ...params } variant= "standard" size= "small" fullWidth= { true } /> ) } getOptionDisabled= { option => option.id === 0 }
                                            onChange= { (e, item) => { 
                                                onChange(item.id); 
                                                usr({ table: 'tbl_users', data: { company_id: getValues().company_id, department_id: getValues().department_id, branch: item.id } });
                                            } }
                                            value= { branch.find(data => { return data.id === (getValues().branch !== undefined ? getValues().branch : value) }) } />
                                    ) } />
                        </Box> :
                        <Stack direction= "row" justifyContent= "flex-start" alignItems= "center">
                            <Typography color= "text.disabled" sx= { label }>Please select a department first!</Typography>
                        </Stack> }
                    <Typography variant= "body2" color= "error.dark" mt= "5px">{ errors.branch?.message }</Typography>
                </Stack>
            </Grid>
            <Grid item xs= { 12 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography variant= "body2" gutterBottom>*Employee</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> : 
                        !usrloading ? 
                            users !== undefined ? 
                                users?.length > 0 ? 
                                    <Box sx= { select }>
                                        <Controller control= { control } name= "users_id" defaultValue= { 0 }
                                            render= { ({ field: { onChange, value } }) => (
                                                <Autocomplete options= { users?.sort((a, b) => a.id - b.id) } disabled= { type === 'view' } disableClearable 
                                                    getOptionLabel= { users => users.name || users.id } noOptionsText= "No results.." getOptionDisabled= { option => option.id === 0 }
                                                    isOptionEqualToValue= { (option, value) => option.name === value.name || option.id === value.id } 
                                                    onChange= { (e, item) => { 
                                                        setError('users_id', { message: '' }); 
                                                        onChange(item.id); 
                                                    } } renderInput= { params => ( <TextField { ...params } variant= "standard" size= "small" fullWidth /> ) } 
                                                    value= { users?.find(data => { return data.id === (getValues().users_id !== undefined ? getValues().users_id : value) }) !== undefined ?
                                                        users?.find(data => { return data.id === (getValues().users_id !== undefined ? getValues().users_id : value) }) : users.length === 0 ?
                                                        { id: 0, name: '-- SELECT AN ITEM BELOW --' } : users[0] } />
                                            ) } />
                                    </Box> :
                                    <Typography color= "text.disabled" component= { Stack } sx= { label } 
                                        direction= "row" justifyContent= "flex-start" alignItems= "center">You must create a department first!</Typography> :
                                <Typography color= "text.disabled" component= { Stack } sx= { label } 
                                    direction= "row" justifyContent= "flex-start" alignItems= "center">Please select a department first!</Typography> :
                            <Typography color= "text.disabled" component= { Stack } sx= { label } 
                                direction= "row" justifyContent= "flex-start" alignItems= "center">Loading...</Typography> }
                    <Typography variant= "body2" color= "error.dark" mt= "5px">{ errors.users_id?.message }</Typography>
                </Stack>
            </Grid>
        </Grid>
    );
}

export default Employee;