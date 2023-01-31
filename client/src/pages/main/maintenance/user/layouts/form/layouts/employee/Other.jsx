// Libraries
import { Autocomplete, Box, Grid, Stack, TextField, Typography } from "@mui/material";
import { useContext } from "react";
import { Controller } from "react-hook-form";
import { useParams } from "react-router-dom";
import { DatePicker, LocalizationProvider } from "@mui/x-date-pickers";
import { AdapterDayjs } from "@mui/x-date-pickers/AdapterDayjs";
import dayjs from "dayjs";

// Core
import { FormCntxt } from "core/context/Form"; // Context

// Constants
import { date, select } from "../../index.style"; // Styles
const ul = [{ id: 'superadmin', name: 'SUPERADMIN' }, { id: 'admin', name: 'ADMIN' }, { id: 'user', name: 'USER' }]; // User Level
const branch = [{ id: 'quezon_ave', name: 'QUEZON AVE.' }, { id: 'sto_domingo', name: 'STO. DOMINGO' }, { id: 'manila', name: 'MANILA' }, { id: 'cavite', name: 'CAVITE' }]; // Branch
const es = [{ id: 'regular', name: 'REGULAR' }, { id: 'probationary', name: 'PROBATIONARY' }, { id: 'intern', name: 'INTERN' }, { id: 'agency', name: 'AGENCY' }]; // Employement Status

const Other = () => {
    const { type } = useParams();
    const { control, getValues } = useContext(FormCntxt);

    return (
        <Grid container direction= "row" justifyContent= "flex-start" alignItems= "flex-start" spacing= { 1 }>
            <Grid item xs= { 12 } md= { 4 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 }>
                    <Typography variant= "body2">*Branch</Typography>
                    <Box sx= { select }>
                        <Controller control= { control } name= "branch" defaultValue= "quezon_ave"
                                render= { ({ field: { onChange, value } }) => (
                                    <Autocomplete options= { branch } disableClearable getOptionLabel= { opt => opt.name || opt.id } disabled= { type === 'view' }
                                        noOptionsText= "No results..." isOptionEqualToValue= { (option, value) => option.name === value.name || option.id === value.id }
                                        renderInput= { params => ( <TextField { ...params } variant= "standard" size= "small" fullWidth= { true } /> ) } getOptionDisabled= { option => option.id === 0 }
                                        onChange= { (e, item) => { onChange(item.id); } }
                                        value= { branch.find(data => { return data.id === (getValues().branch !== undefined ? getValues().branch : value) }) } />
                                ) } />
                    </Box>
                </Stack>
            </Grid>
            <Grid item xs= { 12 } md= { 4 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 }>
                    <Typography variant= "body2">*Employment Status</Typography>
                    <Box sx= { select }>
                        <Controller control= { control } name= "employment_status" defaultValue= "probationary"
                                render= { ({ field: { onChange, value } }) => (
                                    <Autocomplete options= { es } disableClearable getOptionLabel= { opt => opt.name || opt.id } disabled= { type === 'view' }
                                        noOptionsText= "No results..." isOptionEqualToValue= { (option, value) => option.name === value.name || option.id === value.id }
                                        renderInput= { params => ( <TextField { ...params } variant= "standard" size= "small" fullWidth= { true } /> ) } getOptionDisabled= { option => option.id === 0 }
                                        onChange= { (e, item) => { onChange(item.id); } }
                                        value= { es.find(data => { return data.id === (getValues().employment_status !== undefined ? getValues().employment_status : value) }) } />
                                ) } />
                    </Box>
                </Stack>
            </Grid>
            <Grid item xs= { 12 } md= { 4 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 }>
                    <Typography variant= "body2">*User Level</Typography>
                    <Box sx= { select }>
                        <Controller control= { control } name= "user_level" defaultValue= "user"
                                render= { ({ field: { onChange, value } }) => (
                                    <Autocomplete options= { ul } disableClearable getOptionLabel= { opt => opt.name || opt.id } disabled= { type === 'view' }
                                        noOptionsText= "No results..." isOptionEqualToValue= { (option, value) => option.name === value.name || option.id === value.id }
                                        renderInput= { params => ( <TextField { ...params } variant= "standard" size= "small" fullWidth= { true } /> ) } getOptionDisabled= { option => option.id === 0 }
                                        onChange= { (e, item) => { onChange(item.id); } }
                                        value= { ul.find(data => { return data.id === (getValues().user_level !== undefined ? getValues().user_level : value) }) } />
                                ) } />
                    </Box>
                </Stack>
            </Grid>
            <Grid item xs= { 12 } md= { 4 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 }>
                    <Typography variant= "body2">Date hired</Typography>
                    <Box sx= { date }>
                        <Controller control= { control } name= "date_hired" defaultValue= { `${dayjs(new Date()).year()}-${dayjs(new Date()).month() + 1}-${dayjs(new Date()).date()}` }
                            render= { ({ field: { onChange, value } }) => (
                                <LocalizationProvider dateAdapter= { AdapterDayjs }>
                                    <DatePicker value= { value } renderInput= { (params) => <TextField { ...params } variant= "standard" size= "small" fullWidth /> }
                                        onChange= { e => { onChange(`${dayjs(e).year()}-${dayjs(e).month() + 1}-${dayjs(e).date()}`); } } />
                                </LocalizationProvider> ) }>
                        </Controller>
                    </Box>
                </Stack>
            </Grid>
            {/* <Grid item xs= { 12 } md= { 4 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 }>
                    <Typography variant= "body2">Date resigned</Typography>
                    <Box sx= { date }>
                        <Controller control= { control } name= "date_resigned" defaultValue= { `${dayjs(new Date()).year()}-${dayjs(new Date()).month() + 1}-${dayjs(new Date()).date()}` }
                            render= { ({ field: { onChange, value } }) => (
                                <LocalizationProvider dateAdapter= { AdapterDayjs }>
                                    <DatePicker value= { value } renderInput= { (params) => <TextField { ...params } variant= "standard" size= "small" fullWidth /> }
                                        onChange= { e => { onChange(`${dayjs(e).year()}-${dayjs(e).month() + 1}-${dayjs(e).date()}`); } } />
                                </LocalizationProvider> ) }>
                        </Controller>
                    </Box>
                </Stack>
            </Grid> */}
        </Grid>
    );
}

export default Other;