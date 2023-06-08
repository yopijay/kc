// Libraries
import { Autocomplete, Box, Container, Stack, TextField, Typography } from "@mui/material";
import dayjs from "dayjs";
import { Controller } from "react-hook-form";
import { useContext } from "react";

// Core
import { useGet, usePost } from "core/function/global"; // Functions
import { authentication, schedule } from "core/api"; // API
import { FormCntxt } from "core/context/Form"; // Context

// Constants
import { btn, input, label, select, title } from "./index.style"; // Styles

const Index = () => {
    let date = `${dayjs(new Date()).year()}-${dayjs(new Date()).month() + 1}-${dayjs(new Date()).date()}`;
    const { control, errors, register, handleSubmit, setError } = useContext(FormCntxt);
    const { data: sched } = useGet({ key: ['schedule'], fetch: schedule(date), options: { refetchOnWindowFocus: false } });
    const { mutate: signin } = usePost({ fetch: authentication, onSuccess: data => { 
        if(data.result === 'error') { (data.error).forEach((err, index) => setError(err.name, { type: index === 0 ? 'focus' : '', message: err.message }, { shouldFocus: index === 0 })) }
        else { localStorage.setItem('token', btoa(data.id)); window.location.href = '/'; }
    }});

    return (
        <Container maxWidth= "xs">
            <Stack direction= "row" justifyContent= "center" alignItems= "center" sx= {{ height: '100vh' }}>
                <Stack direction= "column" justifyContent= "flfex-start" alignItems= "stretch" sx= {{ width: '100%' }} spacing= { 4 }>
                    <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                        <Stack direction= "row" justifyContent= "flex-start" alignItems= "center" spacing= { 1 }>
                            <Typography variant= "body2" sx= { title }>Sign in to</Typography>
                            <Typography variant= "body2" color= "error.dark" sx= { title }>KC Warehouse</Typography>
                        </Stack>
                        <Typography variant= "body2">Enter your details below.</Typography>
                    </Stack>
                    { sched?.length > 0 ?
                        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 }>
                            <form autoComplete= "off">
                                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 }>
                                    <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                                        <Typography variant= "body2" sx= { label } gutterBottom>*Branch</Typography>
                                        <Box sx= { select }>
                                            <Controller control= { control } name= "branch" defaultValue= { '' }
                                                render= { ({ field: { onChange } }) => (
                                                    <Autocomplete options= { ([{ id: '', name: '-- SELECT AN ITEM BELOW --' }].concat(JSON.parse(sched?.[0].branch))).sort((a, b) => a.id - b.id) }
                                                        disableClearable getOptionLabel= { branch => branch.name || branch.id } noOptionsText= "No results..." 
                                                        getOptionDisabled= { option => option.id === '' }
                                                        isOptionEqualToValue= { (option, value) => option.name === value.name || option.id === value.id }
                                                        onChange= { (e, item) => { onChange(item.id); } } 
                                                        renderInput= { params => <TextField { ...params } variant= "standard" size= "small" fullWidth /> } /> ) } />
                                        </Box>
                                        <Typography variant= "body2" color= "error.dark" mt= "5px">{ errors.branch?.message }</Typography>
                                    </Stack>
                                    <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                                        <Typography variant= "body2" sx= { label } gutterBottom>*Employee no.</Typography>
                                        <TextField { ...register('employee_no') } name= "employee_no" variant= "standard" InputProps= {{ disableUnderline: true }} sx= { input } />
                                        <Typography variant= "body2" color= "error.dark" mt= "5px">{ errors.employee_no?.message }</Typography>
                                    </Stack>
                                    <Typography variant= "body1" sx= { btn } 
                                         onClick= { handleSubmit(data => { 
                                            let errors = [];

                                            if(data.branch === '') { errors.push({ name: 'branch', message: 'This field is required!' }); }
                                            if(data.employee_no === '') { errors.push({ name: 'employee_no', message: 'This field is required!' }); }

                                            if(!(errors.length > 0)) { data['date'] = date; signin(data); }
                                            else { errors.forEach(err => setError(err.name, { message: err.message })); }
                                        } ) }>Sign in</Typography>
                                </Stack>
                            </form>
                        </Stack>:
                        <Typography variant= "body2" color= "error.dark" sx= { title }>No physical count scheduled today!</Typography> }
                </Stack>
            </Stack>
        </Container>
    );
}

export default Index;