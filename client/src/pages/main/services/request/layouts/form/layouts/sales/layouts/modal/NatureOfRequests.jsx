// Libraries
import { Box, Skeleton, Stack, TextField, Typography } from "@mui/material";
import { useContext } from "react";
import { Controller } from "react-hook-form";
import dayjs from "dayjs";
import { DatePicker, LocalizationProvider } from "@mui/x-date-pickers";
import { AdapterDayjs } from "@mui/x-date-pickers/AdapterDayjs";

// Core
import { FormCntxt } from "core/context/Form"; // Context

// Constants
import { date, input } from "../../../../index.style"; // Styles

const NatureOfRequests = ({ setOpen, remove, index, fetching, type }) => {
    const { register, getValues, control, setValue } = useContext(FormCntxt);

    return (
        <Stack direction= "column" justifyContent= "space-between" alignItems= "stretch" sx= {{ padding: '25px 20px', height: '100%' }} spacing= { 2 }>
            <Typography sx= {{ fontFamily: 'Gilroy Bold', fontSize: '115%' }}>Requests</Typography>
            <Box sx= {{ flexGrow: 1 }}>
                <form autoComplete= "off">
                    <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 2 } sx= {{ flexGrow: 1 }}>
                        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                            <Typography variant= "body2" gutterBottom>Nature of Request / Complaint</Typography>
                            { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                                <TextField { ...register(`requests.${index}.request`) } name= { `requests.${index}.request` } 
                                    variant= "standard" InputProps= {{ disableUnderline: true }} sx= { input }
                                    disabled= { getValues()?.status !== undefined && getValues()?.status !== 'saved' } /> }
                        </Stack>
                        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                            <Typography variant= "body2" gutterBottom>Service Personnel</Typography>
                            { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                                <TextField { ...register(`requests.${index}.personnel`) } name= { `requests.${index}.personnel` } 
                                    variant= "standard" InputProps= {{ disableUnderline: true }} sx= { input }
                                    disabled= { getValues()?.status !== undefined && getValues()?.status !== 'saved' } /> }
                        </Stack>
                        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                            <Typography variant= "body2" gutterBottom>Date</Typography>
                            <Stack direction= "row" justifyContent= "space-between" alignItems= "flex-start" spacing= { 1 }>
                                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= {{ flexGrow: 1 }}>
                                    <Typography variant= "body2" gutterBottom>From</Typography>
                                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                                        <Box sx= { date }>
                                            <Controller control= { control } name= { `requests.${index}.date_from` } 
                                                defaultValue= { `${dayjs(new Date()).year()}-${dayjs(new Date()).month() + 1}-${dayjs(new Date()).date()}` }
                                                render= { ({ field: { onChange, value } }) => (
                                                    <LocalizationProvider dateAdapter= { AdapterDayjs }>
                                                        <DatePicker value= { value } renderInput= { (params) => <TextField { ...params } variant= "standard" size= "small" fullWidth /> }
                                                            onChange= { e => { onChange(`${dayjs(e).year()}-${dayjs(e).month() + 1}-${dayjs(e).date()}`); } }
                                                            disabled= { getValues()?.status !== undefined && getValues()?.status !== 'saved' } />
                                                    </LocalizationProvider> ) }>
                                            </Controller>
                                        </Box> }
                                </Stack>
                                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= {{ flexGrow: 1 }}>
                                    <Typography variant= "body2" gutterBottom>To</Typography>
                                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                                        <Box sx= { date }>
                                            <Controller control= { control } name= { `requests.${index}.date_to` } 
                                                defaultValue= { `${dayjs(new Date()).year()}-${dayjs(new Date()).month() + 1}-${dayjs(new Date()).date()}` }
                                                render= { ({ field: { onChange, value } }) => (
                                                    <LocalizationProvider dateAdapter= { AdapterDayjs }>
                                                        <DatePicker value= { value } renderInput= { (params) => <TextField { ...params } variant= "standard" size= "small" fullWidth /> }
                                                            onChange= { e => { onChange(`${dayjs(e).year()}-${dayjs(e).month() + 1}-${dayjs(e).date()}`); } }
                                                            disabled= { getValues()?.status !== undefined && getValues()?.status !== 'saved' } />
                                                    </LocalizationProvider> ) }>
                                            </Controller>
                                        </Box> }
                                </Stack>
                            </Stack>
                        </Stack>
                        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                            <Typography variant= "body2" gutterBottom>Time</Typography>
                            <Stack direction= "row" justifyContent= "space-between" alignItems= "flex-start" spacing= { 1 }>
                                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= {{ flexGrow: 1 }}>
                                    <Typography variant= "body2" gutterBottom>From</Typography>
                                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                                        <TextField { ...register(`requests.${index}.time_from`) } name= { `requests.${index}.time_from` } variant= "standard" 
                                            InputProps= {{ disableUnderline: true }} sx= { input } disabled= { getValues()?.status !== undefined && getValues()?.status !== 'saved' } /> }
                                </Stack>
                                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= {{ flexGrow: 1 }}>
                                    <Typography variant= "body2" gutterBottom>To</Typography>
                                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                                        <TextField { ...register(`requests.${index}.time_to`) } name= { `requests.${index}.time_to` } variant= "standard" 
                                            InputProps= {{ disableUnderline: true }} sx= { input } disabled= { getValues()?.status !== undefined && getValues()?.status !== 'saved' } /> }
                                </Stack>
                            </Stack>
                        </Stack>
                    </Stack>
                </form>
            </Box>
            <Stack direction= "row" justifyContent= "flex-end" alignItems= "center" spacing= { 4 }>
                <Typography sx= {{ cursor: 'pointer' }} onClick= { () => { setValue('requests', getValues().requests); setOpen(false); } }>Save</Typography>
                { type === 'create' ? <Typography sx= {{ cursor: 'pointer' }} onClick= { () => { remove(index); setOpen(false); } }>Cancel</Typography> : '' }
            </Stack>
        </Stack>
    );
}

export default NatureOfRequests;