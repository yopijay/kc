import { useTheme } from "@emotion/react";
import { faPlus } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { Dialog, Stack, Typography, useMediaQuery } from "@mui/material";
import { useContext, useEffect, useState } from "react";
import { addrow } from "../index.style";
import { usePost } from "core/function/global";
import { records } from "core/api";
import { useParams } from "react-router-dom";
import { FormCntxt } from "core/context/Form";
import { ProfileCntx } from "core/context/Profile";

const card = { backgroundColor: '#FFFFFF', padding: '10px', border: 'solid 1px #F3F3F3', borderRadius: '10px' };

const Items = () => {
    const { id } = useParams();
    const { data } = useContext(ProfileCntx);
    const theme = useTheme();
    const [ open, setOpen ] = useState(false);
    const fullscreen = useMediaQuery(theme.breakpoints.down('sm'));
    const [ list, setList ] = useState([]);
    const { getValues } = useContext(FormCntxt);

    const { mutate: record, isLoading: fetching } = usePost({ fetch: records, options: { refetchOnWindowFocus: false }, onSuccess: data => setList(data) });

    useEffect(() => {
        let _data = data;
        _data['rack_id'] = id
        _data['list'] = 'items';
        
        record({ table: 'tbl_racks', data: _data });
    }, [ data, getValues, id, record ]);

    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 3 }>
            <Stack direction= "row" justifyContent= "flex-end" alignItems= "center">
                <Typography sx= { addrow } onClick= { () => setOpen(true) }><FontAwesomeIcon icon= { faPlus } style= {{ color: '#ffffff' }} size= "lg" /></Typography>
            </Stack>
            <Dialog fullScreen= { fullscreen } open= { open } maxWidth= "xs" fullWidth= { true } disableEscapeKeyDown= { true }>
                
            </Dialog>
            <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 }>
                { list?.length > 0 ?
                    list?.map((data, index) => (
                        <Stack direction= "row" justifyContent= "flex-start" alignItems= "center" sx= { card } key= { index }>
                            <Typography sx= {{ fontWeight: 'bold' }}>{ data.item_code }</Typography>
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