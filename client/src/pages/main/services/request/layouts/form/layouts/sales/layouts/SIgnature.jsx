// Libraries
import { Box, Grid, Skeleton, Stack, TextField, Typography } from "@mui/material";
import { useContext } from "react";

// Core
import { FormCntxt } from "core/context/Form"; // Context

// Constants
import { input } from "../../../index.style"; // Styles

const Signature = ({ fetching }) => {
    const { register } = useContext(FormCntxt);
    return (
        <Grid container direction= "row" justifyContent= "flex-start" alignItems= "flex-start" spacing= { 1 } sx= {{ marginTop: '10px' }}>
            <Grid item xs= { 12 } sm= { 6 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 }>
                    <Box sx= {{ width: '100%', height: '120px', backgroundColor: '#F2F2F2', borderRadius: '10px' }} />
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                        <TextField { ...register('requested_by') } name= "requested_by" variant= "standard" InputProps= {{ disableUnderline: true }} sx= { input } /> }
                    <Typography variant= "body2" gutterBottom>Requested by</Typography>
                </Stack>
            </Grid>
            <Grid item xs= { 12 } sm= { 6 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 }>
                    <Box sx= {{ width: '100%', height: '120px', backgroundColor: '#F2F2F2', borderRadius: '10px' }} />
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                        <TextField { ...register('noted_by_sup') } name= "noted_by_sup" variant= "standard" InputProps= {{ disableUnderline: true }} sx= { input } /> }
                    <Typography variant= "body2" gutterBottom>{ `Noted by (Immediate Superior)` }</Typography>
                </Stack>
            </Grid>
        </Grid>
    );
}

export default Signature;