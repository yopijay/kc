// Libraries
import { Grid, Skeleton, Stack, TextField, Typography } from "@mui/material";
import { useContext } from "react";

// Core
import { FormCntxt } from "core/context/Form"; // Context

// Constants
import { input } from "../../../index.style"; // Styles

const Signature = ({ fetching }) => {
    const { register, errors, getValues } = useContext(FormCntxt);

    return (
        <Grid container direction= "row" justifyContent= "flex-start" alignItems= "flex-start" spacing= { 1 } sx= {{ marginTop: '10px' }}>
            <Grid item xs= { 12 } sm= { 6 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 }>
                    <Stack direction= "column" justifyContent= "center" alignItems= "center" sx= {{ backgroundColor: '#F2F2F2', width: '100%', height: '120px', overflow: 'hidden' }}>
                        { getValues()?.requested_by_signature !== null ? <img src= { getValues()?.requested_by_signature } alt= "signature_rb" /> : '' }
                    </Stack>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                        <TextField { ...register('requested_by') } name= "requested_by" variant= "standard" InputProps= {{ disableUnderline: true }} sx= { input } disabled= { true } /> }
                    <Typography variant= "body2" gutterBottom>Requested by</Typography>
                    <Typography variant= "body2" color= "error.dark" mt= "5px">{ errors.requested_by?.message }</Typography>
                </Stack>
            </Grid>
            <Grid item xs= { 12 } sm= { 6 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 }>
                    <Stack direction= "column" justifyContent= "center" alignItems= "center" sx= {{ backgroundColor: '#F2F2F2', width: '100%', height: '120px', overflow: 'hidden' }}>
                        { getValues()?.noted_by_sup_signature !== null ? <img src= { getValues()?.noted_by_sup_signature } alt= "signature_nb" /> : '' }
                    </Stack>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                        <TextField { ...register('noted_by_sup') } name= "noted_by_sup" variant= "standard" InputProps= {{ disableUnderline: true }} sx= { input } disabled= { true } /> }
                    <Typography variant= "body2" gutterBottom>{ `Noted by (Immediate Superior)` }</Typography>
                    <Typography variant= "body2" color= "error.dark" mt= "5px">{ errors.noted_by_sup?.message }</Typography>
                </Stack>
            </Grid>
        </Grid>
    );
}

export default Signature;
