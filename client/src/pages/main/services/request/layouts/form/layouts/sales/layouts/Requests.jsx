// Libraries
import { faPlus } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { Box, Grid, Skeleton, Stack, TextField, Typography } from "@mui/material";
import { useContext } from "react";
import { Controller } from "react-hook-form";
import { DatePicker, LocalizationProvider } from "@mui/x-date-pickers";
import { AdapterDayjs } from "@mui/x-date-pickers/AdapterDayjs";
import dayjs from "dayjs";

// Core
import { FormCntxt } from "core/context/Form"; // Context

// Constants
import { addrow, date, input } from "../../../index.style"; // Styles

const Requests = ({ fetching }) => {
    const { register, control } = useContext(FormCntxt);

    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= {{ margin: '30px 0 20px 0'}}>
            <Stack direction= "row" justifyContent= "flex-end" alignItems= "center" sx= {{ marginBottom: '20px' }}>
                <Typography sx= { addrow }>
                    <FontAwesomeIcon icon= { faPlus } style= {{ color: '#FFFFFF' }} size= "lg" />
                </Typography>
            </Stack>
            <Grid container direction= "row" justifyContent= "flex-start" alignItems= "flex-start" spacing= { 1 }>
                <Grid item xs= { 7 }>
                    <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                        <Typography variant= "body2" gutterBottom>Nature of Request / Complaint</Typography>
                        { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                            <TextField { ...register('request') } name= "request" variant= "standard" InputProps= {{ disableUnderline: true }} sx= { input } /> }
                    </Stack>
                </Grid>
                <Grid item xs= { 5 }>
                    <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                        <Typography variant= "body2" gutterBottom>Service Personnel</Typography>
                        { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                            <TextField { ...register('personnel') } name= "personnel" variant= "standard" InputProps= {{ disableUnderline: true }} sx= { input } /> }
                    </Stack>
                </Grid>
                <Grid item xs= { 12 }>
                    <Grid container direction= "row" justifyContent= "flex-start" alignItems= "flex-start" spacing= { 1 } sx= {{ marginTop: '10px' }}>
                        <Grid item xs= { 6 }>
                            <Stack direction= "column" justifyContent= "flex-start" alignItems= "center">
                                <Typography variant= "body2" sx= {{ fontWeight: 'bold', textTransform: 'uppercase', fontSize: '105%' }} gutterBottom>Date</Typography>
                                <Grid container direction= "row" justifyContent= "flex-start" alignItems= "flex-start" spacing= { 1 }>
                                    <Grid item xs= { 6 }>
                                        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                                            <Typography variant= "body2" gutterBottom>From</Typography>
                                            { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                                                <Box sx= { date }>
                                                    <Controller control= { control } name= "date_purchased"
                                                        render= { ({ field: { onChange, value } }) => (
                                                            <LocalizationProvider dateAdapter= { AdapterDayjs }>
                                                                <DatePicker value= { value } renderInput= { (params) => <TextField { ...params } variant= "standard" size= "small" fullWidth /> }
                                                                    onChange= { e => { onChange(`${dayjs(e).year()}-${dayjs(e).month() + 1}-${dayjs(e).date()}`); } } />
                                                            </LocalizationProvider> ) }>
                                                    </Controller>
                                                </Box> }
                                        </Stack>
                                    </Grid>
                                    <Grid item xs= { 6 }>
                                        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                                            <Typography variant= "body2" gutterBottom>To</Typography>
                                            { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                                                <Box sx= { date }>
                                                    <Controller control= { control } name= "date_purchased"
                                                        render= { ({ field: { onChange, value } }) => (
                                                            <LocalizationProvider dateAdapter= { AdapterDayjs }>
                                                                <DatePicker value= { value } renderInput= { (params) => <TextField { ...params } variant= "standard" size= "small" fullWidth /> }
                                                                    onChange= { e => { onChange(`${dayjs(e).year()}-${dayjs(e).month() + 1}-${dayjs(e).date()}`); } } />
                                                            </LocalizationProvider> ) }>
                                                    </Controller>
                                                </Box> }
                                        </Stack>
                                    </Grid>
                                </Grid>
                            </Stack>
                        </Grid>
                        <Grid item xs= { 6 }>
                            <Stack direction= "column" justifyContent= "flex-start" alignItems= "center">
                                <Typography variant= "body2" sx= {{ fontWeight: 'bold', textTransform: 'uppercase', fontSize: '105%' }} gutterBottom>Time</Typography>
                                <Grid container direction= "row" justifyContent= "flex-start" alignItems= "flex-start" spacing= { 1 }>
                                    <Grid item xs= { 6 }>
                                        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                                            <Typography variant= "body2" gutterBottom>From</Typography>
                                            { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                                                <TextField { ...register('time_from') } name= "time_from" variant= "standard" InputProps= {{ disableUnderline: true }} sx= { input } /> }
                                        </Stack>
                                    </Grid>
                                    <Grid item xs= { 6 }>
                                        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                                            <Typography variant= "body2" gutterBottom>To</Typography>
                                            { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                                                <TextField { ...register('time_to') } name= "time_to" variant= "standard" InputProps= {{ disableUnderline: true }} sx= { input } /> }
                                        </Stack>
                                    </Grid>
                                </Grid>
                            </Stack>
                        </Grid>
                    </Grid>
                </Grid>
            </Grid>
        </Stack>
    );
}

export default Requests;