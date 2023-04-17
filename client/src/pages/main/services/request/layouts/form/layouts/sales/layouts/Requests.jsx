// Libraries
import { faEdit, faPlus, faTrash } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { Dialog, Stack, Typography, useMediaQuery } from "@mui/material";
import { useContext, useState } from "react";
import { useFieldArray } from "react-hook-form";
import dayjs from "dayjs";
import { useTheme } from "@emotion/react";

// Core
import { FormCntxt } from "core/context/Form"; // Context

// Layouts
import NatureOfRequests from "./modal/NatureOfRequests";

// Constants
import { addrow } from "../../../index.style"; // Styles
let defaults = {
    request: '',
    personnel: '',
    date_from: `${dayjs(new Date()).year()}-${dayjs(new Date()).month() + 1}-${dayjs(new Date()).date()}`,
    date_to: `${dayjs(new Date()).year()}-${dayjs(new Date()).month() + 1}-${dayjs(new Date()).date()}`,
    time_from: '',
    time_to: ''
}

const Requests = ({ fetching }) => {
    const { control, getValues } = useContext(FormCntxt);
    const { fields, append, remove } = useFieldArray({ control, name: 'requests' });
    const [ open, setOpen ] = useState(false);
    const theme = useTheme();
    const fullscreen = useMediaQuery(theme.breakpoints.down('sm'));
    const [ type, setType ] = useState('');
    const [ index, setIndex ] = useState();

    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= {{ margin: '30px 0 40px 0'}}>
            <Stack direction= "row" justifyContent= "flex-end" alignItems= "center" sx= {{ marginBottom: '20px' }}>
                { !(getValues()?.status !== undefined && getValues()?.status !== 'saved') ? 
                    <Typography sx= { addrow } onClick= { () => { setType('create'); setOpen(true); setIndex(fields.length) } }>
                        <FontAwesomeIcon icon= { faPlus } style= {{ color: '#FFFFFF' }} size= "lg" />
                    </Typography> : '' }
            </Stack>
            <Dialog fullScreen= { fullscreen } open= { open } maxWidth= "xs" fullWidth= { true }
                disableEscapeKeyDown= { true }>
                <NatureOfRequests setOpen= { setOpen } remove= { remove } index= { index } fetching= { fetching } append= { append } defaults= { defaults } type= { type } />
            </Dialog>
            <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 }>
                { fields.length > 0 ?
                    fields.map((fld, index) => (
                        <Stack direction= "row" justifyContent= "space-between" alignItems= "center" key= { index } 
                            sx= {{ padding: '20px 15px', borderRadius: '8px', border: 'solid 1px #919eab40' }}>
                            <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= {{ flexGrow: 1, overflow: 'hidden' }}>
                                <Typography><b>Nature of Request / Complaint:</b> { (fld.request).toUpperCase() }</Typography>
                                <Typography><b>Required Service Personel:</b> { (fld.personnel).toUpperCase() }</Typography>
                                <Typography><b>Date:</b> { fld.date_from } - { fld.date_to }</Typography>
                                <Typography><b>Time:</b> { (fld.time_from).toUpperCase() } - { (fld.time_to).toUpperCase() }</Typography>
                            </Stack>
                            <Stack direction= "row" justifyContent= "flex-start" alignItems= "center" spacing= { 1 }>
                                <Typography sx= {{ cursor: 'pointer' }} onClick= { () => { setIndex(index); setOpen(true); setType('update') } }>
                                    <FontAwesomeIcon icon= { faEdit } size= "lg" />
                                </Typography>
                                <Typography sx= {{ cursor: 'pointer' }} onClick= { () => remove(index) }><FontAwesomeIcon icon= { faTrash } size= "lg" /></Typography>
                            </Stack>
                        </Stack>
                    ))
                : <Typography sx= {{ width: '100%', textAlign: 'center' }}>Please click the add button to add items</Typography> }
            </Stack>
        </Stack>
    );
}

export default Requests;