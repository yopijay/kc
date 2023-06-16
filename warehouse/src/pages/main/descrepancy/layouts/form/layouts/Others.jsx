// Libraries
import { Grid, Skeleton, Stack, TextareaAutosize, Typography } from "@mui/material";
import { useContext } from "react";
import { useParams } from "react-router-dom";

// Core
import { FormCntxt } from "core/context/Form"; // Context

// Constants
import { textarea } from "../index.style"; // Styles

const Others = ({ fetching }) => {
    const { type } = useParams();
    const { register } = useContext(FormCntxt);

    return (
        <Grid container direction= "row" justifyContent= "flex-start" alignItems= "flex-start" spacing= { 2 }>
            <Grid item xs= { 12 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography gutterBottom variant= "body2">Item description</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "100px" /> : 
                        <TextareaAutosize name= "item_description" { ...register('item_description') } disabled= { type === 'update' } minRows= { 4 } maxRows= { 4 } style= { textarea } /> }
                </Stack>
            </Grid>
            <Grid item xs= { 12 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography gutterBottom variant= "body2">Remarks</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "100px" /> : 
                        <TextareaAutosize name= "remarks" { ...register('remarks') } disabled= { type === 'update' } minRows= { 4 } maxRows= { 4 } style= { textarea } /> }
                </Stack>
            </Grid>
        </Grid>
    );
}

export default Others;