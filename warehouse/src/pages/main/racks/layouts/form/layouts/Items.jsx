// Libraries
import { useTheme } from "@emotion/react";
import { faPlus } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { Dialog, Stack, Typography, useMediaQuery } from "@mui/material";
import { useContext, useEffect, useState } from "react";
import { useParams } from "react-router-dom";

// Core
import { FormCntxt } from "core/context/Form"; // Context
import { ProfileCntx } from "core/context/Profile"; // Profile
import { usePost } from "core/function/global"; // Function
import { records } from "core/api"; // API

// Constants
import Products from "./Products"; // Dialog
import { addrow } from "../index.style"; // Styles
const card = { backgroundColor: '#FFFFFF', padding: '20px', border: 'solid 1px #F3F3F3', borderRadius: '10px' };

const Items = () => {
    const { id } = useParams();
    const { data } = useContext(ProfileCntx);
    const theme = useTheme();
    const [ open, setOpen ] = useState(false);
    const fullscreen = useMediaQuery(theme.breakpoints.down('sm'));
    const [ list, setList ] = useState([]);
    const [ prodid, setProdid ] = useState();
    const { getValues } = useContext(FormCntxt);

    const { mutate: record } = usePost({ fetch: records, options: { refetchOnWindowFocus: false }, onSuccess: data => setList(data) });

    useEffect(() => {
        let _data = data;
        _data['rack_id'] = id
        _data['list'] = 'items';
        
        record({ table: 'tbl_racks', data: _data });
    }, [ data, getValues, id, record ]);

    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 3 }>
            <Stack direction= "row" justifyContent= "flex-end" alignItems= "center">
                <Typography sx= { addrow } onClick= { () => { setOpen(true); setProdid(null) } }><FontAwesomeIcon icon= { faPlus } style= {{ color: '#ffffff' }} size= "lg" /></Typography>
            </Stack>
            <Dialog fullScreen= { fullscreen } open= { open } maxWidth= "xs" fullWidth= { true } disableEscapeKeyDown= { true }><Products id= { prodid } /></Dialog>
            <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 }>
                { list?.length > 0 ?
                    list?.map((data, index) => (
                        <Stack direction= "row" justifyContent= "space-between" alignItems= "center" sx= { card } key= { index }>
                            <Typography sx= {{ fontWeight: 'bold', flexGrow: 1 }}>{ data.item_code }</Typography>
                            <Typography>{ data.total }</Typography>
                        </Stack>
                    )) :
                    <Stack direction= "row" justifyContent= "center" alignItems= "center" sx= { card }>
                        <Typography variant= "body2">No record/s found!</Typography>
                    </Stack> }
            </Stack>
        </Stack>
    );
}

export default Items;