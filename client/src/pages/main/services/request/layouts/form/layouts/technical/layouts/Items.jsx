// Libraries
import { faPlus, faTrash } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { Divider, Grid, Skeleton, Stack, TextField, Typography } from "@mui/material";
import { useContext } from "react";
import { useFieldArray } from "react-hook-form";

// Core
import { FormCntxt } from "core/context/Form"; // Context

// Constants
import { addrow, deleterow, input } from "../../../index.style"; // Styles
let defaults = {
    item: '',
    qty: '',
    unit: '', 
    description: ''
}

const Items = ({ fetching }) => {
    const { register, control } = useContext(FormCntxt);
    const { fields, append, remove } = useFieldArray({ control, name: 'items' });

    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= {{ margin: '30px 0 20px 0'}}>
            <Stack direction= "row" justifyContent= "flex-end" alignItems= "center" sx= {{ marginBottom: '20px' }}>
                <Typography sx= { addrow } onClick= { () => append(defaults) }><FontAwesomeIcon icon= { faPlus } style= {{ color: '#FFFFFF' }} size= "lg" /></Typography>
            </Stack>
            <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" divider= { <Divider orientation= "horizontal" flexItem /> }>
                {
                    fields.length > 0 ?
                        fields.map((fld, index) => (
                            <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" key= { index } sx= {{ margin: '15px 0' }}>
                                <Stack direction= "row" justifyContent= "flex-end" alignItems= "center">
                                    <Typography sx= { deleterow } onClick= { () => remove(index) }><FontAwesomeIcon icon= { faTrash } style= {{ color: '#FFFFFF' }} /></Typography>
                                </Stack>
                                <Grid container direction= "row" justifyContent= "flex-start" alignItems= "flex-start" spacing= { 1 }>
                                    <Grid item xs= { 4 } sm= { 3 }>
                                        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                                            <Typography variant= "body2" gutterBottom>Item</Typography>
                                            { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                                                <TextField { ...register(`items.${index}.item`) } name= { `items.${index}.item` } 
                                                    variant= "standard" InputProps= {{ disableUnderline: true }} sx= { input } /> }
                                        </Stack>
                                    </Grid>
                                    <Grid item xs= { 2 }>
                                        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                                            <Typography variant= "body2" gutterBottom>Qty</Typography>
                                            { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                                                <TextField { ...register(`items.${index}.qty`) } name= { `items.${index}.qty` } 
                                                    variant= "standard" InputProps= {{ disableUnderline: true }} sx= { input } /> }
                                        </Stack>
                                    </Grid>
                                    <Grid item xs= { 2 }>
                                        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                                            <Typography variant= "body2" gutterBottom>Unit</Typography>
                                            { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                                                <TextField { ...register(`items.${index}.unit`) } name= { `items.${index}.unit` } 
                                                    variant= "standard" InputProps= {{ disableUnderline: true }} sx= { input } /> }
                                        </Stack>
                                    </Grid>
                                    <Grid item xs= { 4 } sm= { 5 }>
                                        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                                            <Typography variant= "body2" gutterBottom>Description</Typography>
                                            { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                                                <TextField { ...register(`items.${index}.description`) } name= { `items.${index}.description` } 
                                                    variant= "standard" InputProps= {{ disableUnderline: true }} sx= { input } /> }
                                        </Stack>
                                    </Grid>
                                </Grid>
                            </Stack>
                        ))
                    : <Typography sx= {{ width: '100%', textAlign: 'center' }}>Please click the add button to add items</Typography>
                }
            </Stack>
        </Stack>
    );
}

export default Items;