// Libraries
import { faEdit, faPlus, faTrash } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { Dialog, Stack, Typography, useMediaQuery } from "@mui/material";
import { useFieldArray } from "react-hook-form";
import { useContext, useState } from "react";
import { useTheme } from "@emotion/react";

// Core
import { FormCntxt } from "core/context/Form"; // Context

// Constants
import { addrow } from "../index.style"; // Styles
import Brands from "./modal/Brands"; // Modals
import { useParams } from "react-router-dom";

const List = ({ fetching, counts }) => {
    const { type } = useParams();
    const { control } = useContext(FormCntxt);
    const { fields, remove } = useFieldArray({ control, name: 'brands' });
    const theme = useTheme();
    const [ open, setOpen ] = useState(false);
    const [ _type, setType ] = useState('');
    const [ index, setIndex ] = useState();

    const fullscreen = useMediaQuery(theme.breakpoints.down('sm'));

    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 3 }>
            <Stack direction= "row" justifyContent= "flex-end" alignItems= "center">
                { type !== 'view' ?
                    <Typography sx= { addrow }onClick= { () => { setType('create'); setOpen(true); setIndex(fields.length); } }>
                        <FontAwesomeIcon icon= { faPlus } style= {{ color: '#ffffff' }} size= "lg" />
                    </Typography> : '' }
            </Stack>
            <Dialog fullScreen= { fullscreen } open= { open } maxWidth= "xs" fullWidth= { true } disableEscapeKeyDown= { true }>
                <Brands setOpen= { setOpen } index= { index } fetching= { fetching } type= { _type } _counts= { counts } />
            </Dialog>
            <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 }>
                { fields.length > 0 ?
                    fields.map((fld, index) => (
                        <Stack direction= "row" justifyContent= "space-between" alignItems= "center" key= { index } sx= {{ padding: '20px 15px', border: 'solid 1px #7e7e7e40', borderRadius: '8px' }}>
                            <Stack direction= "row" justifyContent= "flex-start" alignItems= "center" sx= {{ flexGrow: 1 }}>
                                <Typography variant= "body1" sx= {{ fontWeight: 'bold' }}>{ fld.brand_name }</Typography>
                            </Stack>
                            <Stack direction= "row" justifyContent= "flex-end" alignItems= "center" spacing= { 4 }>
                                <Typography variant= "h6">{ fld.items }</Typography>
                                { type !== 'view' ? <Stack direction= "row" justifyContent= "flex-start" alignItems= "center" spacing= { 1 }>
                                    <Typography sx= {{ cursor: 'pointer' }} onClick= { () => { setIndex(index); setOpen(true); setType('update') } }>
                                        <FontAwesomeIcon icon= { faEdit } size= "lg" />
                                    </Typography>
                                    <Typography sx= {{ cursor: 'pointer' }} onClick= { () => { remove(index); counts({}); } }><FontAwesomeIcon icon= { faTrash } size= "lg" /></Typography>
                                </Stack> : '' }
                            </Stack>
                        </Stack>
                    )) :
                    <Typography sx= {{ width: '100%', textAlign: 'center' }}>Please click the add button to add brands.</Typography> }
            </Stack>
        </Stack>
    );
}

export default List;