// Libraries
import { useContext } from "react";
import { useParams } from "react-router-dom";
import { Box, Checkbox, Grid, Skeleton, Stack, TextareaAutosize, Typography } from "@mui/material";

// Core
import { FormCntxt } from "core/context/Form"; // Context
import { formatter, useGet } from "core/function/global"; // Function
import { series } from "core/api"; // API

// Layouts
import Employee from "./Employee";
import Assets from "./Assets";

// Constants
import { textarea } from "../index.style"; // Styles

const Form = ({ fetching }) => {
    const { type } = useParams();
    const { register, getValues, check, setCheck, setValue } = useContext(FormCntxt);
    useGet({ key: ['issuance_series'], fetch: series(`tbl_assign_asset`), options: { }, onSuccess: data => { if(type === 'new') setValue('series_no', `ISSUANCE-${formatter(parseInt(data) + 1, 7)}`); } });

    return (
        <Grid container direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 }>
            <Grid item><Employee fetching= { fetching } /></Grid>
            <Grid item>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography  sx= {{ fontWeight: 'bold', whiteSapce: 'nowrap', overflow: 'hidden', textOverflow: 'ellipsis', marginBottom: '20px' }}>Assets</Typography>
                    <Assets fetching= { fetching } />
                </Stack>
            </Grid>
            <Grid item>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography gutterBottom variant= "body2">Remarks</Typography>
                    { fetching ? <Skeleton variant= "rectangular" height= "100px" sx= {{ borderRadius: '5px' }} /> : 
                        <TextareaAutosize name= "remarks" { ...register('remarks') } minRows= { 4 } maxRows= { 4 } style= { textarea } disabled= { type === 'view' } /> }
                </Stack>
            </Grid>
            <Grid item>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography gutterBottom variant= "body2">Status</Typography>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> : 
                        <Box sx= {{ display: 'flex', flexDirection: 'row', justifyContent: 'flex-start', alignItems: 'center' }}>
                            <Checkbox sx= {{ color: '#919eab', '&.Mui-checked': { color: '#2065d1' } }} name= "status" { ...register('status', { onChange: () => setCheck(!check) }) } 
                                disabled= { type === 'view' } checked= { getValues().status !== undefined ? getValues().status > 0 ? true : false : check } />
                            <Typography gutterBottom sx= {{ marginTop: '7px' }}>
                                { getValues().status !== undefined ? getValues().status > 0 ? 'Active' : 'Inactive' : check ? 'Active' : 'Inactive' }</Typography>
                        </Box> }
                </Stack>
            </Grid>
        </Grid>
    );
}

export default Form;