// Libraries
import { useContext } from "react";
import { useParams } from "react-router-dom";

// Core
import { FormCntxt } from "core/context/Form"; // Context
import { Grid, Skeleton, Stack, TextField, Typography } from "@mui/material";
import { input } from "../index.style";

const Quantity = ({ fetching, setTotalqty }) => {
    const { type } = useParams();
    const { register, errors, getValues, setError } = useContext(FormCntxt);

    return (
        <Grid container direction= "row" justifyContent= "flex-start" alignItems= "flex-start" spacing= { 2 }>
            <Grid item xs= { 6 } md= { 4 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography gutterBottom variant= "body2">*Mother box { `(Qty.)` }</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> : 
                        <TextField { ...register('mother_box') } name= "mother_box" variant= "standard" InputProps= {{ disableUnderline: true }} 
                            disabled= { type === 'update' } sx= { input } defaultValue= { 0 } type= "number"
                            onChange= { e => { 
                                setTotalqty(((e.target.value !== '' ? parseInt(e.target.value) : 0) * 
                                                    (getValues().qty_per_mother_box !== '' ? parseInt(getValues().qty_per_mother_box) : 0))
                                    + ((getValues().small_box !== '' ? parseInt(getValues().small_box) : 0) * 
                                            (getValues().qty_per_small_box !== '' ? parseInt(getValues().qty_per_small_box) : 0))
                                    + (getValues().tingi !== '' ? parseInt(getValues().tingi) : 0)); } } /> }
                    <Typography variant= "body2" color= "error.dark" mt= "5px">{ errors.mother_box?.message }</Typography>
                </Stack>
            </Grid>
            <Grid item xs= { 6 } md= { 4 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography gutterBottom variant= "body2">*Qty per Mother box</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> : 
                        <TextField { ...register('qty_per_mother_box') } name= "qty_per_mother_box" variant= "standard" InputProps= {{ disableUnderline: true }} 
                            disabled= { type === 'update' } sx= { input } defaultValue= { 0 } type= "number"
                            onChange= { e => { 
                                setTotalqty(((getValues().mother_box !== '' ? parseInt(getValues().mother_box) : 0) * 
                                                        (e.target.value !== '' ? parseInt(e.target.value) : 0))
                                    + ((getValues().small_box !== '' ? parseInt(getValues().small_box) : 0) * 
                                            (getValues().qty_per_small_box !== '' ? parseInt(getValues().qty_per_small_box) : 0))
                                    + (getValues().tingi !== '' ? parseInt(getValues().tingi) : 0)); setError('total', { message: '' }); } } /> }
                    <Typography variant= "body2" color= "error.dark" mt= "5px">{ errors.qty_per_mother_box?.message }</Typography>
                </Stack>
            </Grid>
            <Grid item xs= { 6 } md= { 4 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography gutterBottom variant= "body2">*Small box { `(Qty.)` }</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> : 
                        <TextField { ...register('small_box') } name= "small_box" variant= "standard" InputProps= {{ disableUnderline: true }} 
                            disabled= { type === 'update' } sx= { input } defaultValue= { 0 } type= "number"
                            onChange= { e => {
                                setTotalqty(((getValues().mother_box !== '' ? parseInt(getValues().mother_box) : 0) * 
                                                        (getValues().qty_per_mother_box !== '' ? parseInt(getValues().qty_per_mother_box) : 0))
                                    + ((e.target.value !== '' ? parseInt(e.target.value) : 0) * 
                                            (getValues().qty_per_small_box !== '' ? parseInt(getValues().qty_per_small_box) : 0))
                                    + (getValues().tingi !== '' ? parseInt(getValues().tingi) : 0)); } } /> }
                    <Typography variant= "body2" color= "error.dark" mt= "5px">{ errors.small_box?.message }</Typography>
                </Stack>
            </Grid>
            <Grid item xs= { 6 } md= { 4 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography gutterBottom variant= "body2">*Qty per Small box</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> : 
                        <TextField { ...register('qty_per_small_box') } name= "qty_per_small_box" variant= "standard" InputProps= {{ disableUnderline: true }} 
                            disabled= { type === 'update' } sx= { input } defaultValue= { 0 } type= "number"
                            onChange= { e => {
                                setTotalqty(((getValues().mother_box !== '' ? parseInt(getValues().mother_box) : 0) * 
                                                        (getValues().qty_per_mother_box !== '' ? parseInt(getValues().qty_per_mother_box) : 0))
                                    + ((getValues().small_box !== '' ? parseInt(getValues().small_box) : 0) * 
                                            (e.target.value !== '' ? parseInt(e.target.value) : 0))
                                    + (getValues().tingi !== '' ? parseInt(getValues().tingi) : 0)); setError('total', { message: '' }); } } /> }
                    <Typography variant= "body2" color= "error.dark" mt= "5px">{ errors.qty_per_small_box?.message }</Typography>
                </Stack>
            </Grid>
            <Grid item xs= { 6 } md= { 4 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography gutterBottom variant= "body2">*Tingi</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> : 
                        <TextField { ...register('tingi') } name= "tingi" variant= "standard" InputProps= {{ disableUnderline: true }} 
                            disabled= { type === 'update' } sx= { input } defaultValue= { 0 } type= "number"
                            onChange= { e => {
                                setTotalqty(((getValues().mother_box !== '' ? parseInt(getValues().mother_box) : 0) * 
                                                        (getValues().qty_per_mother_box !== '' ? parseInt(getValues().qty_per_mother_box) : 0))
                                    + ((getValues().small_box !== '' ? parseInt(getValues().small_box) : 0) * 
                                            (getValues().qty_per_small_box !== '' ? parseInt(getValues().qty_per_small_box) : 0))
                                    + (e.target.value !== '' ? parseInt(e.target.value) : 0)); setError('total', { message: '' }); } } /> }
                    <Typography variant= "body2" color= "error.dark" mt= "5px">{ errors.tingi?.message }</Typography>
                </Stack>
            </Grid>
        </Grid>
    );
}

export default Quantity;