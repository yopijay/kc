// Libraries
import { Box, Grid, Skeleton, Stack, TextField, Typography } from "@mui/material";
import { useContext } from "react";
import { Controller } from "react-hook-form";
import { DatePicker, LocalizationProvider } from "@mui/x-date-pickers";
import { AdapterDayjs } from "@mui/x-date-pickers/AdapterDayjs";
import dayjs from "dayjs";

// Core
import { FormCntxt } from "core/context/Form"; // Context

// Constants
import { date, input } from "../index.style"; // Styles

const Header = ({ fetching }) => {
    const { register, control } = useContext(FormCntxt);

    return (
        <Grid container direction= "row" justifyContent= "flex-start" alignItems= "flex-start" spacing= { 2 }>
            <Grid item xs= { 12 } md= { 6 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "flex-start">
                    <Typography variant= "h6" sx= {{ fontFamily: 'Boldstrom', color: '#444444' }}>S-Power Corporation</Typography>
                    <Typography sx= {{ fontWeight: 'bold', textTransform: 'uppercase' }}>Service Request</Typography>
                </Stack>
            </Grid>
            <Grid item xs= { 12 } md= { 6 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "flex-end" spacing= { 1 }>
                    <Stack direction= "row" justifyContent= "flex-start" alignItems= "center" spacing= { 1 }>
                        <Typography variant= "body2">Service Request No.:</Typography>
                        { fetching ? <Skeleton variant= "rounded" height= "35px" /> : 
                            <TextField { ...register('service_request_no') } name= "service_request_no" variant= "standard" InputProps= {{ disableUnderline: true }} disabled= { true } sx= { input } /> }
                    </Stack>
                    <Stack direction= "row" justifyContent= "flex-start" alignItems= "center" spacing= { 1 }>
                        <Typography variant= "body2">Date prepared:</Typography>
                        { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                            <Box sx= { date }>
                                <Controller control= { control } name= "date_prepared"
                                    render= { ({ field: { onChange, value } }) => (
                                        <LocalizationProvider dateAdapter= { AdapterDayjs }>
                                            <DatePicker value= { value } renderInput= { (params) => <TextField { ...params } variant= "standard" size= "small" fullWidth /> }
                                                onChange= { e => { onChange(`${dayjs(e).year()}-${dayjs(e).month() + 1}-${dayjs(e).date()}`); } } />
                                        </LocalizationProvider> ) }>
                                </Controller>
                            </Box> }
                    </Stack>
                    <Stack direction= "row" justifyContent= "flex-start" alignItems= "center" spacing= { 1 }>
                        <Typography variant= "body2">Date requested by customer:</Typography>
                        { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                            <Box sx= { date }>
                                <Controller control= { control } name= "date_requested"
                                    render= { ({ field: { onChange, value } }) => (
                                        <LocalizationProvider dateAdapter= { AdapterDayjs }>
                                            <DatePicker value= { value } renderInput= { (params) => <TextField { ...params } variant= "standard" size= "small" fullWidth /> }
                                                onChange= { e => { onChange(`${dayjs(e).year()}-${dayjs(e).month() + 1}-${dayjs(e).date()}`); } } />
                                        </LocalizationProvider> ) }>
                                </Controller>
                            </Box> }
                    </Stack>
                </Stack>
            </Grid>
        </Grid>
    );
}

export default Header;