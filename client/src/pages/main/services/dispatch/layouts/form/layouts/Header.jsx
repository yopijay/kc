// Libraries
import { Box, Grid, Skeleton, Stack, TextField, Typography } from "@mui/material";
import { useContext } from "react";
import { Controller } from "react-hook-form";
import { DatePicker, LocalizationProvider } from "@mui/x-date-pickers";
import { AdapterDayjs } from "@mui/x-date-pickers/AdapterDayjs";
import dayjs from "dayjs";
import { useParams } from "react-router-dom";

// Core
import { FormCntxt } from "core/context/Form"; // Context
import { formatter, useGet } from "core/function/global"; // Function
import { series } from "core/api"; // API

// Constants
import { date, input } from "../index.style"; // Styles

const Header = ({ fetching }) => {
    const { type } = useParams();
    const { register, control, setValue } = useContext(FormCntxt);
    useGet({ key: ['srvc_series'], fetch: series('tbl_services'), options: {}, 
        onSuccess: data => {
            let _month = `${((new Date()).getMonth() + 1) < 10 ? '0' : ''}${dayjs(new Date()).month() + 1}`;

            if(type === 'new') {
                setValue('series_no', `SRVC-${formatter(parseInt(data) + 1, 7)}`);
                setValue('service_request_no', `${((new Date()).getFullYear()).toString().substring(2)}${_month}-${formatter(parseInt(data) + 1, 3)}`);
            }
        }
    });

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
                                <Controller control= { control } name= "date_prepared" defaultValue= { `${dayjs(new Date()).year()}-${dayjs(new Date()).month() + 1}-${dayjs(new Date()).date()}` }
                                    render= { ({ field: { onChange, value } }) => (
                                        <LocalizationProvider dateAdapter= { AdapterDayjs }>
                                            <DatePicker value= { value } renderInput= { (params) => <TextField { ...params } variant= "standard" size= "small" fullWidth /> }
                                                onChange= { e => { onChange(`${dayjs(e).year()}-${dayjs(e).month() + 1}-${dayjs(e).date()}`); } }
                                                disabled= { true } />
                                        </LocalizationProvider> ) }>
                                </Controller>
                            </Box> }
                    </Stack>
                    <Stack direction= "row" justifyContent= "flex-start" alignItems= "center" spacing= { 1 }>
                        <Typography variant= "body2">Date requested by customer:</Typography>
                        { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                            <Box sx= { date }>
                                <Controller control= { control } name= "date_requested" defaultValue= { `${dayjs(new Date()).year()}-${dayjs(new Date()).month() + 1}-${dayjs(new Date()).date()}` }
                                    render= { ({ field: { onChange, value } }) => (
                                        <LocalizationProvider dateAdapter= { AdapterDayjs }>
                                            <DatePicker value= { value } renderInput= { (params) => <TextField { ...params } variant= "standard" size= "small" fullWidth /> }
                                                onChange= { e => { onChange(`${dayjs(e).year()}-${dayjs(e).month() + 1}-${dayjs(e).date()}`); } }
                                                disabled= { true } />
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