// Libraries
import { Grid, Skeleton, Stack, TextField, Typography } from "@mui/material";
import { useContext } from "react";
import { useParams } from "react-router-dom";

// Core
import { FormCntxt } from "core/context/Form"; // Context
import { input } from "../index.style";

const Account = ({ fetching }) => {
    const { type } = useParams();
    const { register, errors } = useContext(FormCntxt);

    return (
        <form autoComplete= "off">
            <Grid container direction= "row" justifyContent= "flex-start" alignItems= "flex-start" spacing= { 1 }>
                <Grid item xs= { 12 } md= { 7 }>
                    <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 }>
                        <Typography variant= "body2">*Email</Typography>
                        { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                            <TextField { ...register('email') } name= "email" variant= "standard" InputProps= {{ disableUnderline: true }} disabled= { type === 'view' } sx= { input } /> }
                        <Typography variant= "body2" sx= {{ color: '#e84118' }} gutterBottom>{ errors.email?.message }</Typography>
                    </Stack>
                </Grid>
                <Grid item xs= { 12 } md= { 7 }>
                    <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 }>
                        <Typography variant= "body2">*Password</Typography>
                        { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                            <TextField { ...register('password', { value: '' }) } name= "password" variant= "standard" InputProps= {{ disableUnderline: true }} disabled= { true } sx= { input } /> }
                        <Typography variant= "body2" sx= {{ color: '#e84118' }} gutterBottom>{ errors.password?.message }</Typography>
                    </Stack>
                </Grid>
                <Grid item xs= { 12 } md= { 7 }>
                    <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 }>
                        <Typography variant= "body2">*Confirm password</Typography>
                        { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                            <TextField { ...register('confirmpassword', { value: '' }) } name= "confirmpassword" variant= "standard" InputProps= {{ disableUnderline: true }} disabled= { true } sx= { input } /> }
                        <Typography variant= "body2" sx= {{ color: '#e84118' }} gutterBottom>{ errors.confirmpassword?.message }</Typography>
                    </Stack>
                </Grid>
            </Grid>
        </form>
    );
}

export default Account;