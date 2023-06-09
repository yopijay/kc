// Libraries
import { Avatar, Box, Checkbox, Grid, Skeleton, Stack, TextareaAutosize, Typography } from "@mui/material";
import { useContext } from "react";
import { useParams } from "react-router-dom";

// Core
import { FormCntxt } from "core/context/Form"; // Context

// Constants
import { textarea } from "../index.style"; // Styles
import { Controller } from "react-hook-form";

const Others = ({ fetching, qr }) => {
    const { type } = useParams();
    const { register, getValues, control, setValue } = useContext(FormCntxt);

    return (
        <Grid container direction= "row" justifyContent= "flex-start" alignItems= "flex-start" spacing= { 2 }>
            <Grid item xs= { 12 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography gutterBottom variant= "body2">Item description</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "100px" /> : 
                        <TextareaAutosize name= "item_description" { ...register('item_description') } disabled= { type === 'view' } minRows= { 4 } maxRows= { 4 } style= { textarea } /> }
                </Stack>
            </Grid>
            <Grid item xs= { 12 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography gutterBottom variant= "body2">Remarks</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "100px" /> : 
                        <TextareaAutosize name= "remarks" { ...register('remarks') } disabled= { type === 'view' } minRows= { 4 } maxRows= { 4 } style= { textarea } /> }
                </Stack>
            </Grid>
            <Grid item xs= { 12 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography gutterBottom variant= "body2">Status</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> : 
                        <Box sx= {{ display: 'flex', flexDirection: 'row', justifyContent: 'flex-start', alignItems: 'center' }}>
                            <Controller control= { control } name= "status" defaultValue= { getValues().status ?? true }
                                render= { ({ field: { onChange } }) => (
                                    <Checkbox sx= {{ color: '#919eab', '&.Mui-checked': { color: '#2065d1' } }} disabled= { type === 'view' }
                                        checked= { getValues().status ?? true } onChange= { e => { setValue('status', getValues().status ?? true); onChange(e.target.checked); } } /> ) 
                                } />
                        </Box> }
                </Stack>
            </Grid>
            { type === 'view' ? <Grid item xs= { 12 }>
                <Stack direction= "column" justifyContent= "center" alignItems= "center" sx= {{ width: '100%' }}>
                    <a href= { qr } download= { getValues()?.item_code }><Avatar src= { qr } alt= "QR Code" sx= {{ width: '200px', height: '200px' }} /></a>
                </Stack>
            </Grid> : '' }
        </Grid>
    );
}

export default Others;