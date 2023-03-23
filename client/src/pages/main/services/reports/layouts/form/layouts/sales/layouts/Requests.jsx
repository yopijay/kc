// Libraries
import { Box, Divider, Grid, Skeleton, Stack, TextField, Typography } from "@mui/material";
import { useContext } from "react";
import { Controller, useFieldArray } from "react-hook-form";
import { DatePicker, LocalizationProvider } from "@mui/x-date-pickers";
import { AdapterDayjs } from "@mui/x-date-pickers/AdapterDayjs";
import dayjs from "dayjs";

// Core
import { FormCntxt } from "core/context/Form"; // Context

// Constants
import { date, input } from "../../../index.style"; // Styles

const Requests = ({ fetching }) => {
    const { register, control } = useContext(FormCntxt);
    const { fields } = useFieldArray({ control, name: 'requests' });

    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= {{ margin: '30px 0 40px 0'}}>
            <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" divider={ <Divider orientation="horizontal" flexItem /> }>
                {
                    fields.length > 0 ?
                        fields.map((fld, index) => (
                            <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" key= { index } sx= {{ margin: '15px 0' }}>
                                <Grid container direction= "row" justifyContent= "flex-start" alignItems= "flex-end" spacing= { 1 }>
                                    <Grid item xs= { 6 } sm= { 3 }>
                                        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                                            <Typography variant= "body2" gutterBottom>Nature of Request / Complaint</Typography>
                                            { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                                                <TextField { ...register(`requests.${index}.request`) } name= { `requests.${index}.request` } 
                                                    variant= "standard" InputProps= {{ disableUnderline: true }} sx= { input } disabled= { true } /> }
                                        </Stack>
                                    </Grid>
                                    <Grid item xs= { 6 } sm= { 3 }>
                                        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                                            <Typography variant= "body2" gutterBottom>Service Personnel</Typography>
                                            { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                                                <TextField { ...register(`requests.${index}.personnel`) } name= { `requests.${index}.personnel` } 
                                                    variant= "standard" InputProps= {{ disableUnderline: true }} sx= { input } disabled= { true } /> }
                                        </Stack>
                                    </Grid>
                                    <Grid item xs= { 12 } sm= { 6 }>
                                        <Grid container direction= "row" justifyContent= "flex-start" alignItems= "flex-end" spacing= { 1 }>
                                            <Grid item xs= { 6 }>
                                                <Stack direction= "column" justifyContent= "flex-start" alignItems= "center">
                                                    <Typography variant= "body2" sx= {{ fontWeight: 'bold', textTransform: 'uppercase', fontSize: '105%' }} gutterBottom>Date</Typography>
                                                    <Grid container direction= "row" justifyContent= "flex-start" alignItems= "flex-start" spacing= { 1 }>
                                                        <Grid item xs= { 6 }>
                                                            <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                                                                <Typography variant= "body2" gutterBottom>From</Typography>
                                                                { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                                                                    <Box sx= { date }>
                                                                        <Controller control= { control } name= { `requests.${index}.date_from` } 
                                                                            defaultValue= { `${dayjs(new Date()).year()}-${dayjs(new Date()).month() + 1}-${dayjs(new Date()).date()}` }
                                                                            render= { ({ field: { onChange, value } }) => (
                                                                                <LocalizationProvider dateAdapter= { AdapterDayjs }>
                                                                                    <DatePicker value= { value } renderInput= { (params) => <TextField { ...params } variant= "standard" size= "small" fullWidth /> }
                                                                                        onChange= { e => { onChange(`${dayjs(e).year()}-${dayjs(e).month() + 1}-${dayjs(e).date()}`); } }
                                                                                        disabled= { true } />
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
                                                                        <Controller control= { control } name= { `requests.${index}.date_to` } 
                                                                            defaultValue= { `${dayjs(new Date()).year()}-${dayjs(new Date()).month() + 1}-${dayjs(new Date()).date()}` }
                                                                            render= { ({ field: { onChange, value } }) => (
                                                                                <LocalizationProvider dateAdapter= { AdapterDayjs }>
                                                                                    <DatePicker value= { value } renderInput= { (params) => <TextField { ...params } variant= "standard" size= "small" fullWidth /> }
                                                                                        onChange= { e => { onChange(`${dayjs(e).year()}-${dayjs(e).month() + 1}-${dayjs(e).date()}`); } }
                                                                                        disabled= { true } />
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
                                                                    <TextField { ...register(`requests.${index}.time_from`) } name= { `requests.${index}.time_from` } variant= "standard" 
                                                                        InputProps= {{ disableUnderline: true }} sx= { input } disabled= { true } /> }
                                                            </Stack>
                                                        </Grid>
                                                        <Grid item xs= { 6 }>
                                                            <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                                                                <Typography variant= "body2" gutterBottom>To</Typography>
                                                                { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                                                                    <TextField { ...register(`requests.${index}.time_to`) } name= { `requests.${index}.time_to` } variant= "standard" 
                                                                        InputProps= {{ disableUnderline: true }} sx= { input } disabled= { true } /> }
                                                            </Stack>
                                                        </Grid>
                                                    </Grid>
                                                </Stack>
                                            </Grid>
                                        </Grid>
                                    </Grid>
                                </Grid>
                            </Stack>
                        ))
                    : <Typography sx= {{ width: '100%', textAlign: 'center' }}>Please click the add button to add items</Typography>
                }
            </Stack>
        </Stack>
    );
}

export default Requests;