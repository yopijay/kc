// Libraries
import { useContext, useEffect, useRef } from "react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faEraser, faPlus, faTrash } from "@fortawesome/free-solid-svg-icons";
import { Controller, useFieldArray } from "react-hook-form";
import { Box, Grid, Skeleton, Stack, TextField, Typography } from "@mui/material";
import dayjs from "dayjs";
import { DatePicker, LocalizationProvider } from "@mui/x-date-pickers";
import { AdapterDayjs } from "@mui/x-date-pickers/AdapterDayjs";
import SignaturePad from "react-signature-canvas";
import { useParams } from "react-router-dom";

// Core
import { FormCntxt } from "core/context/Form"; // Context

// Constants
import { addrow, date, deleterow, input } from "../../../index.style"; // Styles
let defaults = {
    printed_name: '',
    signature: '',
    date_from: `${dayjs(new Date()).year()}-${dayjs(new Date()).month() + 1}-${dayjs(new Date()).date()}`,
    date_to: `${dayjs(new Date()).year()}-${dayjs(new Date()).month() + 1}-${dayjs(new Date()).date()}`, 
    time_from: '',
    time_to: ''
}

const PersonnelDeployed = ({ fetching }) => {
    const { type } = useParams();
    const { register, control, setValue, getValues } = useContext(FormCntxt);
    const { fields, append, remove } = useFieldArray({ control, name: 'personnel_deployed' });
    let _ps = useRef([]);

    useEffect(() => {
        if(!fetching) {
            if(type === 'update') {
                if(getValues().personnel_deployed !== null && (getValues().personnel_deployed).length > 0) {
                    (getValues().personnel_deployed).map((item, index) => (_ps.current[index]).fromDataURL(item.signature) )
                }
            }
        }
    }, [ fetching, type, getValues ]);
    
    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= {{ margin: '30px 0 40px 0' }}>
            <Stack direction= "row" justifyContent= "space-between" alignItems= "center" sx= {{ marginBottom: '20px' }}>
                <Typography sx= {{ fontWeight: 'bold' }}>Service Personnel Deployed</Typography>
                { getValues()?.status !== undefined && getValues()?.status !== 'done' ?
                    <Typography sx= { addrow } onClick= { () => append(defaults) }><FontAwesomeIcon icon= { faPlus } style= {{ color: '#FFFFFF' }} size= "lg" /></Typography> : ''}
            </Stack>
            {
                fields.length > 0 ?
                    fields.map((fld, index) => (
                        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" key= { index } sx= {{ margin: '15px 0' }}>
                            <Stack direction= "row" justifyContent= "flex-end" alignItems= "center">
                                { getValues()?.status !== undefined && getValues()?.status !== 'done' ?
                                    <Typography sx= { deleterow } onClick= { () => remove(index) }><FontAwesomeIcon icon= { faTrash } style= {{ color: '#FFFFFF' }} /></Typography> : ''}
                            </Stack>
                            <Grid container direction= "row" justifyContent= "flex-start" alignItems= "center" spacing= { 1 }>
                                <Grid item xs= { 12 } sm= { 6 }>
                                    <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                                        <Typography variant= "body2" gutterBottom>Printed name</Typography>
                                        { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                                            <TextField { ...register(`personnel_deployed.${index}.printed_name`) } name= { `personnel_deployed.${index}.printed_name` } 
                                                variant= "standard" InputProps= {{ disableUnderline: true }} sx= { input }
                                                disabled= { !(getValues()?.status !== undefined && getValues()?.status !== 'done') } /> }
                                    </Stack>
                                </Grid>
                                <Grid item xs= { 12 } sm= { 6 }>
                                    <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                                        <Typography variant= "body2" gutterBottom>Signature</Typography>
                                        <Stack direction= "column" justifyContent= "center" alignItems= "center" sx= {{ backgroundColor: '#f2f2f2', width: '100%', height: '80px', overflow: 'hidden' }}>
                                            <SignaturePad ref= { ref => _ps.current[index] = ref } canvasProps= {{ width: 'auto', height: '100%' }}
                                                onEnd= { e => { setValue(`personnel_deployed.${index}.signature`, e.target.toDataURL()); } } />
                                        </Stack>
                                        { getValues()?.status !== undefined && getValues()?.status !== 'done' ? <Stack direction= "row" justifyContent= "flex-end" alignItems= "center" sx= {{ width: '100%' }}>
                                            <FontAwesomeIcon icon= { faEraser } color= "#818181" size= "lg" 
                                                onClick= { () => { (_ps.current[index]).clear(); setValue(`personnel_deployed.${index}.signature`, null); } } />
                                        </Stack> : ''}
                                    </Stack>
                                </Grid>
                                <Grid item xs= { 12 } sm= { 12 }>
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
                                                                    <Controller control= { control } name= { `personnel_deployed.${index}.date_from` } 
                                                                        defaultValue= { `${dayjs(new Date()).year()}-${dayjs(new Date()).month() + 1}-${dayjs(new Date()).date()}` }
                                                                        render= { ({ field: { onChange, value } }) => (
                                                                            <LocalizationProvider dateAdapter= { AdapterDayjs }>
                                                                                <DatePicker value= { value } renderInput= { (params) => <TextField { ...params } variant= "standard" size= "small" fullWidth /> }
                                                                                    onChange= { e => { onChange(`${dayjs(e).year()}-${dayjs(e).month() + 1}-${dayjs(e).date()}`); } }
                                                                                    disabled= { !(getValues()?.status !== undefined && getValues()?.status !== 'done') } />
                                                                            </LocalizationProvider> ) } />
                                                                </Box> }
                                                        </Stack>
                                                    </Grid>
                                                    <Grid item xs= { 6 }>
                                                        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                                                            <Typography variant= "body2" gutterBottom>To</Typography>
                                                            { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                                                                <Box sx= { date }>
                                                                    <Controller control= { control } name= { `personnel_deployed.${index}.date_to` } 
                                                                        defaultValue= { `${dayjs(new Date()).year()}-${dayjs(new Date()).month() + 1}-${dayjs(new Date()).date()}` }
                                                                        render= { ({ field: { onChange, value } }) => (
                                                                            <LocalizationProvider dateAdapter= { AdapterDayjs }>
                                                                                <DatePicker value= { value } renderInput= { (params) => <TextField { ...params } variant= "standard" size= "small" fullWidth /> }
                                                                                    onChange= { e => { onChange(`${dayjs(e).year()}-${dayjs(e).month() + 1}-${dayjs(e).date()}`); } }
                                                                                    disabled= { !(getValues()?.status !== undefined && getValues()?.status !== 'done') } />
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
                                                                <TextField { ...register(`personnel_deployed.${index}.time_from`) } name= { `personnel_deployed.${index}.time_from` } variant= "standard" 
                                                                    InputProps= {{ disableUnderline: true }} sx= { input }
                                                                    disabled= { !(getValues()?.status !== undefined && getValues()?.status !== 'done') } /> }
                                                        </Stack>
                                                    </Grid>
                                                    <Grid item xs= { 6 }>
                                                        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                                                            <Typography variant= "body2" gutterBottom>To</Typography>
                                                            { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                                                                <TextField { ...register(`personnel_deployed.${index}.time_to`) } name= { `personnel_deployed.${index}.time_to` } variant= "standard" 
                                                                    InputProps= {{ disableUnderline: true }} sx= { input }
                                                                    disabled= { !(getValues()?.status !== undefined && getValues()?.status !== 'done') } /> }
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

export default PersonnelDeployed;