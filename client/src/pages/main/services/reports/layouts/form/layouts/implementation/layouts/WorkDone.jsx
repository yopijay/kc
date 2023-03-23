// Libraries
import { useContext } from "react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faPlus, faTrash } from "@fortawesome/free-solid-svg-icons";
import { Controller, useFieldArray } from "react-hook-form";
import { Box, Grid, Skeleton, Stack, TextareaAutosize, TextField, Typography } from "@mui/material";
import dayjs from "dayjs";
import { DatePicker, LocalizationProvider } from "@mui/x-date-pickers";
import { AdapterDayjs } from "@mui/x-date-pickers/AdapterDayjs";

// Core
import { FormCntxt } from "core/context/Form"; // Context

// Constants
import { addrow, date, deleterow, input, textarea } from "../../../index.style"; // Styles
let defaults = {
    particulars: '',
    date_from: `${dayjs(new Date()).year()}-${dayjs(new Date()).month() + 1}-${dayjs(new Date()).date()}`,
    date_to: `${dayjs(new Date()).year()}-${dayjs(new Date()).month() + 1}-${dayjs(new Date()).date()}`, 
    time_from: '',
    time_to: ''
}

const WorkDone = ({ fetching }) => {
    const { register, control } = useContext(FormCntxt);
    const { fields, append, remove } = useFieldArray({ control, name: 'work_done' });

    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= {{ margin: '30px 0 40px 0' }}>
            <Stack direction= "row" justifyContent= "space-between" alignItems= "center" sx= {{ marginBottom: '20px' }}>
                <Typography sx= {{ fontWeight: 'bold' }}>Work Done</Typography>
                <Typography sx= { addrow } onClick= { () => append(defaults) }><FontAwesomeIcon icon= { faPlus } style= {{ color: '#FFFFFF' }} size= "lg" /></Typography> 
            </Stack>
            {
                fields.length > 0 ?
                    fields.map((fld, index) => (
                        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" key= { index } sx= {{ margin: '15px 0' }}>
                            <Stack direction= "row" justifyContent= "flex-end" alignItems= "center">
                                <Typography sx= { deleterow } onClick= { () => remove(index) }><FontAwesomeIcon icon= { faTrash } style= {{ color: '#FFFFFF' }} /></Typography>
                            </Stack>
                            <Grid container direction= "row" justifyContent= "flex-start" alignItems= "flex-end" spacing= { 1 }>
                                <Grid item xs= { 12 } sm= { 6 }>
                                    <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                                        <Typography variant= "body2" gutterBottom>Particulars</Typography>
                                            { fetching ? <Skeleton variant= "rectangular" height= "100px" sx= {{ borderRadius: '5px' }} /> : 
                                                <TextareaAutosize name= { `work_done.${index}.particulars` } { ...register(`work_done.${index}.particulars`) } minRows= { 4 } maxRows= { 4 } style= { textarea } /> }
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
                                                                    <Controller control= { control } name= { `work_done.${index}.date_from` } 
                                                                        defaultValue= { `${dayjs(new Date()).year()}-${dayjs(new Date()).month() + 1}-${dayjs(new Date()).date()}` }
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
                                                                    <Controller control= { control } name= { `work_done.${index}.date_to` } 
                                                                        defaultValue= { `${dayjs(new Date()).year()}-${dayjs(new Date()).month() + 1}-${dayjs(new Date()).date()}` }
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
                                                                <TextField { ...register(`work_done.${index}.time_from`) } name= { `work_done.${index}.time_from` } variant= "standard" 
                                                                    InputProps= {{ disableUnderline: true }} sx= { input } /> }
                                                        </Stack>
                                                    </Grid>
                                                    <Grid item xs= { 6 }>
                                                        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                                                            <Typography variant= "body2" gutterBottom>To</Typography>
                                                            { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                                                                <TextField { ...register(`work_done.${index}.time_to`) } name= { `work_done.${index}.time_to` } variant= "standard" 
                                                                    InputProps= {{ disableUnderline: true }} sx= { input } /> }
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
    );
}

export default WorkDone;