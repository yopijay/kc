// Libraries
import { faEdit, faPlus, faTrash } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { Dialog, Stack, Typography, useMediaQuery } from "@mui/material";
import { useFieldArray } from "react-hook-form";
import { useContext, useState } from "react";
import { useTheme } from "@emotion/react";
import { useParams } from "react-router-dom";

// Core
import { FormCntxt } from "core/context/Form"; // Context

// Constants
import Personnel from "./modal/Personnel"; // Modals
import { addrow } from "../index.style"; // Styles

const List = () => {
    const { type } = useParams();
    const { control } = useContext(FormCntxt);
    const { fields, remove } = useFieldArray({ control, name: 'personnel' });
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
                <Personnel setOpen= { setOpen } index= { index } type= { _type } />
            </Dialog>
            <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 }>
                { fields.length > 0 ?
                    fields.map((fld, index) => (
                        <Stack direction= "row" justifyContent= "space-between" alignItems= "center" key= { index } sx= {{ padding: '20px', backgroundColor: '#f1f1f1', borderRadius: '8px' }}>
                            <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= {{ flexGrow: 1 }}>
                                <Typography variant= "body1" sx= {{ fontWeight: 'bold' }}>{ fld.employee.name }</Typography>
                                <Typography variant= "body2">{ ((fld.branch).replaceAll('_', ' ')).toUpperCase() }</Typography>
                                <Typography variant= "body2">{ (fld.type).toUpperCase() }</Typography>
                            </Stack>
                            <Stack direction= "row" justifyContent= "flex-end" alignItems= "center" spacing= { 4 }>
                                { type !== 'view' ? <Stack direction= "row" justifyContent= "flex-start" alignItems= "center" spacing= { 1 }>
                                    <Typography sx= {{ cursor: 'pointer' }} onClick= { () => { setIndex(index); setOpen(true); setType('update') } }>
                                        <FontAwesomeIcon icon= { faEdit } size= "lg" />
                                    </Typography>
                                    <Typography sx= {{ cursor: 'pointer' }} onClick= { () => { remove(index); } }><FontAwesomeIcon icon= { faTrash } size= "lg" /></Typography>
                                </Stack> : '' }
                            </Stack>
                        </Stack>
                    )) :
                    <Typography sx= {{ width: '100%', textAlign: 'center' }}>Please click the add button to add personnel.</Typography> }
            </Stack>
        </Stack>
    );
}

export default List;