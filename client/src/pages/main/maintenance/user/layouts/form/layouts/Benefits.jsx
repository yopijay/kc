// Libraries
import { Grid, Skeleton, Stack, TextField, Typography } from "@mui/material";
import { useContext } from "react";
import { useParams } from "react-router-dom";

// Core
import { FormCntxt } from "core/context/Form"; // Context

// Constants
import { input } from "../index.style";

const Benefits = ({ fetching }) => {
    const { type } = useParams();
    const { register, errors } = useContext(FormCntxt);

    return (
        <form autoComplete= "off">
            <Grid container direction= "row" justifyContent= "flex-start" alignItems= "flex-start" spacing= { 1 }>
                <Grid item xs= { 12 } md= { 6 }>
                    <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 }>
                        <Typography variant= "body2">Vacation Leave Credits</Typography>
                        { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                            <TextField { ...register('vl', { value: 0 }) } name= "vl" variant= "standard" InputProps= {{ disableUnderline: true }} disabled= { true } sx= { input } /> }
                        <Typography variant= "body2" sx= {{ color: '#e84118' }} gutterBottom>{ errors.vl?.message }</Typography>
                    </Stack>
                </Grid>
                <Grid item xs= { 12 } md= { 6 }>
                    <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 }>
                        <Typography variant= "body2">Sick Leave Credits</Typography>
                        { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                            <TextField { ...register('sl', { value: 0 }) } name= "sl" variant= "standard" InputProps= {{ disableUnderline: true }} disabled= { true } sx= { input } /> }
                        <Typography variant= "body2" sx= {{ color: '#e84118' }} gutterBottom>{ errors.sl?.message }</Typography>
                    </Stack>
                </Grid>
            </Grid>
        </form>
    );
}

export default Benefits;