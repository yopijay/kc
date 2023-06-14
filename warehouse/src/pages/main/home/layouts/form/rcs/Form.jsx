// Libraries
import { Box, Grid, Skeleton, Stack, TextField, TextareaAutosize, Typography } from "@mui/material";
import { useContext } from "react";

// Core
import { FormCntxt } from "core/context/Form"; // Context

// Constants
import { input, textarea } from "./index.style"; // Styles

const Form = ({ fetching }) => {
    const { register, getValues, setValue, errors } = useContext(FormCntxt);

    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 3 }>
            <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                <Typography><b>Item code:</b> { getValues()?.item_code }</Typography>
                <Typography><b>Item description:</b> { getValues()?.item_description }</Typography>
                <Typography><b>Brand:</b> { getValues()?.brand}</Typography>
            </Stack>
            <Box>
                <Grid container direction= "row" justifyContent= "flex-start" alignItems= "flex-start" spacing= { 2 }>
                    <Grid item xs= { 12 } sm= { 6 }>
                        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                            <Typography gutterBottom variant= "body2">*Mother Box</Typography>
                            { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                                <TextField type= "number" { ...register('qty_mother_box') } name= "qty_mother_box" variant= "standard" defaultValue= "0" 
                                    disabled= { getValues().rcs_date !== null }
                                    onChange= { (e) => {
                                        setValue('total', ((parseInt(e.target.value !== '' ? e.target.value : 0) * parseInt(getValues().qty_per_mother_box)) +
                                            parseInt(getValues().qty_small_box) * parseInt(getValues().qty_per_small_box)) + parseInt(getValues().tingi)); } }
                                    InputProps= {{ inputProps: { min: 0 }, disableUnderline: true }} sx= { input } /> }
                            <Typography variant= "body2" color= "error.dark" mt= "5px">{ errors.qty_mother_box?.message }</Typography>
                        </Stack>
                    </Grid>
                    <Grid item xs= { 12 } sm= { 6 }>
                        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                            <Typography gutterBottom variant= "body2">*Quantity Per Mother Box</Typography>
                            { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                                <TextField type= "number" { ...register('qty_per_mother_box') } name= "qty_per_mother_box" variant= "standard" defaultValue= "0" 
                                    disabled= { getValues().rcs_date !== null }
                                    onChange= { (e) => { setValue('total', ((parseInt(getValues().qty_mother_box) * parseInt(e.target.value !== '' ? e.target.value : 0)) +
                                        parseInt(getValues().qty_small_box) * parseInt(getValues().qty_per_small_box)) + parseInt(getValues().tingi)); } }
                                    InputProps= {{ inputProps: { min: 0 }, disableUnderline: true }} sx= { input } /> }
                            <Typography variant= "body2" color= "error.dark" mt= "5px">{ errors.qty_per_mother_box?.message }</Typography>
                        </Stack>
                    </Grid>
                    <Grid item xs= { 12 } sm= { 6 }>
                        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                            <Typography gutterBottom variant= "body2">*Small Box</Typography>
                            { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                                <TextField type= "number" { ...register('qty_small_box') } name= "qty_small_box" variant= "standard" defaultValue= "0"
                                    disabled= { getValues().rcs_date !== null }
                                    onChange= { (e) => { setValue('total', ((parseInt(getValues().qty_mother_box) * parseInt(getValues().qty_per_mother_box)) +
                                        parseInt(e.target.value !== '' ? e.target.value : 0) * parseInt(getValues().qty_per_small_box)) + parseInt(getValues().tingi)); } } 
                                    InputProps= {{ inputProps: { min: 0 }, disableUnderline: true }} sx= { input } /> }
                            <Typography variant= "body2" color= "error.dark" mt= "5px">{ errors.qty_small_box?.message }</Typography>
                        </Stack>
                    </Grid>
                    <Grid item xs= { 12 } sm= { 6 }>
                        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                            <Typography gutterBottom variant= "body2">*Quantity Per Small Box</Typography>
                            { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                                <TextField type= "number" { ...register('qty_per_small_box') } name= "qty_per_small_box" variant= "standard" defaultValue= "0" 
                                    disabled= { getValues().rcs_date !== null }
                                    onChange= { (e) => { setValue('total', ((parseInt(getValues().qty_mother_box) * parseInt(getValues().qty_per_mother_box)) +
                                        parseInt(getValues().qty_small_box) * parseInt(e.target.value !== '' ? e.target.value : 0)) + parseInt(getValues().tingi)); } } 
                                    InputProps= {{ inputProps: { min: 0 }, disableUnderline: true }} sx= { input } /> }
                            <Typography variant= "body2" color= "error.dark" mt= "5px">{ errors.qty_per_small_box?.message }</Typography>
                        </Stack>
                    </Grid>
                    <Grid item xs= { 12 } sm= { 6 }>
                        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                            <Typography gutterBottom variant= "body2">*Tingi</Typography>
                            { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                                <TextField type= "number" { ...register('tingi') } name= "tingi" variant= "standard" defaultValue= "0" disabled= { getValues().rcs_date !== null }
                                    onChange= { (e) => { setValue('total', ((parseInt(getValues().qty_mother_box) * parseInt(getValues().qty_per_mother_box)) +
                                        parseInt(getValues().qty_small_box) * parseInt(getValues().qty_per_small_box)) + parseInt(e.target.value !== '' ? e.target.value : 0)); } } 
                                    InputProps= {{ inputProps: { min: 0 }, disableUnderline: true }} sx= { input } /> }
                            <Typography variant= "body2" color= "error.dark" mt= "5px">{ errors.tingi?.message }</Typography>
                        </Stack>
                    </Grid>
                    <Grid item xs= { 12 } sm= { 6 }>
                        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                            <Typography gutterBottom variant= "body2">*Total</Typography>
                            { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                                <TextField type= "number" { ...register('total') } name= "total" variant= "standard" defaultValue= "0" disabled
                                    InputProps= {{ inputProps: { min: 0 }, disableUnderline: true }} sx= { input } /> }
                        </Stack>
                    </Grid>
                    <Grid item xs= { 12 }>
                        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                            <Typography gutterBottom variant= "body2">Remarks</Typography>
                            { fetching ? <Skeleton variant= "rounded" height= "100px" /> : 
                                <TextareaAutosize name= "remarks" { ...register('remarks') } minRows= { 4 } maxRows= { 4 } style= { textarea } disabled= { getValues().rcs_date !== null } /> }
                        </Stack>
                    </Grid>
                    <Grid item xs= { 12 }>
                        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                            <Typography gutterBottom variant= "body2">Comments</Typography>
                            { fetching ? <Skeleton variant= "rounded" height= "100px" /> : 
                                <TextareaAutosize name= "comments" { ...register('comments') } minRows= { 4 } maxRows= { 4 } style= { textarea } disabled= { getValues().rcs_date !== null } /> }
                        </Stack>
                    </Grid>
                </Grid>
            </Box>
        </Stack>
    );
}

export default Form;