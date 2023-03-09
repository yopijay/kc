// Libraries
import { Grid, Skeleton, Stack, TextField, Typography } from "@mui/material";
import { useContext } from "react";

// Core
import { FormCntxt } from "core/context/Form"; // Context

// Constants
import { input } from "../../../index.style"; // Styles

const Customer = ({ fetching }) => {
    const { register } = useContext(FormCntxt);
    
    return (
        <Grid container direction= "row" justifyContent= "flex-start" alignItems= "flex-start" spacing= { 1 }>
            <Grid item xs= { 12 }>
                <Stack direction= "column" justifyContent= "flex-start" alignContent= "stretch">
                    <Typography gutterBottom variant= "body2">Customer</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                        <TextField { ...register('customer') } name= "customer" variant= "standard" InputProps= {{ disableUnderline: true }} sx= { input } /> }
                </Stack>
            </Grid>
            <Grid item xs= { 6 }>
                <Stack direction= "column" justifyContent= "flex-start" alignContent= "stretch">
                    <Typography gutterBottom variant= "body2">Project</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                        <TextField { ...register('project') } name= "project" variant= "standard" InputProps= {{ disableUnderline: true }} sx= { input } /> }
                </Stack>
            </Grid>
            <Grid item xs= { 6 }>
                <Stack direction= "column" justifyContent= "flex-start" alignContent= "stretch">
                    <Typography gutterBottom variant= "body2">SO No.</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                        <TextField { ...register('so_no') } name= "so_no" variant= "standard" InputProps= {{ disableUnderline: true }} sx= { input } /> }
                </Stack>
            </Grid>
            <Grid item xs= { 6 }>
                <Stack direction= "column" justifyContent= "flex-start" alignContent= "stretch">
                    <Typography gutterBottom variant= "body2">Service location</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                        <TextField { ...register('service_location') } name= "service_location" variant= "standard" InputProps= {{ disableUnderline: true }} sx= { input } /> }
                </Stack>
            </Grid>
            <Grid item xs= { 6 }>
                <Stack direction= "column" justifyContent= "flex-start" alignContent= "stretch">
                    <Typography gutterBottom variant= "body2">PO No.</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                        <TextField { ...register('po_no') } name= "po_no" variant= "standard" InputProps= {{ disableUnderline: true }} sx= { input } /> }
                </Stack>
            </Grid>
            <Grid item xs= { 12 }>
                <Stack direction= "column" justifyContent= "flex-start" alignContent= "stretch">
                    <Typography gutterBottom variant= "body2">Contact Person</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                        <TextField { ...register('contact_person') } name= "contact_person" variant= "standard" InputProps= {{ disableUnderline: true }} sx= { input } /> }
                </Stack>
            </Grid>
            <Grid item xs= { 6 }>
                <Stack direction= "column" justifyContent= "flex-start" alignContent= "stretch">
                    <Typography gutterBottom variant= "body2">Position</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                        <TextField { ...register('position') } name= "position" variant= "standard" InputProps= {{ disableUnderline: true }} sx= { input } /> }
                </Stack>
            </Grid>
            <Grid item xs= { 6 }>
                <Stack direction= "column" justifyContent= "flex-start" alignContent= "stretch">
                    <Typography gutterBottom variant= "body2">Contact number</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                        <TextField { ...register('contact_number') } name= "contact_number" variant= "standard" InputProps= {{ disableUnderline: true }} sx= { input } /> }
                </Stack>
            </Grid>
        </Grid>
    );
}

export default Customer;