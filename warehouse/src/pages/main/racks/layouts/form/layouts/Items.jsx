// Libraries
import { useTheme } from "@emotion/react";
import { faPlus } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import {  Dialog, Stack, ThemeProvider, Typography, useMediaQuery } from "@mui/material";
import { useContext, useEffect, useState } from "react";
import { useParams } from "react-router-dom";

// Core
import { FormCntxt } from "core/context/Form"; // Context
import { ProfileCntx } from "core/context/Profile"; // Profile
import { usePost } from "core/function/global"; // Function
import { records } from "core/api"; // API
import { theme } from "core/theme/form.theme"; // Theme

// Constants
import Products from "./Products"; // Dialog
import { addrow } from "../index.style"; // Styles
const card = { backgroundColor: '#FFFFFF', padding: '20px', border: 'solid 1px #F3F3F3', borderRadius: '10px' };

const input = {
    MuiInput: {
        styleOverrides: {
            root: {
                '&:before': { borderBottom: 'none' },
                '&:after': { borderBottom: 'none' },
                '&.Mui-disabled:before': { borderBottom: 'none' },
                '&:hover:not(.Mui-disabled):before': { borderBottom: 'none' }
            },
            input: { textTransform: 'uppercase' }
        }
    }
}

const Items = () => {
    const { id } = useParams();
    const { data } = useContext(ProfileCntx);
    const _theme = useTheme();
    const [ open, setOpen ] = useState(false);
    const fullscreen = useMediaQuery(_theme.breakpoints.down('sm'));
    const [ list, setList ] = useState([]);
    const [ prodid, setProdId ] = useState();
    const { getValues, setValue } = useContext(FormCntxt);

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
                <Typography sx= { addrow } 
                    onClick= { () => { 
                        setOpen(true); setProdId(null); 
                        setValue('brand_id', null); setValue('item_code', null); setValue('rcs', null); } }>
                    <FontAwesomeIcon icon= { faPlus } style= {{ color: '#ffffff' }} size= "lg" />
                </Typography>
            </Stack>
            <Dialog fullScreen= { fullscreen } open= { open } maxWidth= "xs" fullWidth= { true } disableEscapeKeyDown= { true }>
                <ThemeProvider theme= { theme(input) }>
                    <Products id= { prodid } setOpen= { setOpen } record= { record } rack= { id } />
                </ThemeProvider>
            </Dialog>
            <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 }>
                { list?.length > 0 ?
                    list?.map((data, index) => (
                        <Stack direction= "row" justifyContent= "space-between" alignItems= "center" sx= { card } key= { index } style= {{ cursor: 'pointer' }}
                            onClick= { () => { setProdId(data.id); setOpen(true); } }>
                            <Typography sx= {{ fontWeight: 'bold', flexGrow: 1 }}>{ data.item_code }</Typography>
                            <Stack direction= "row" justifyContent= "flex-start" alignItems= "center" spacing= { 1 }>
                                { data.rcs !== null ? <Typography sx= {{ color: `${ data.rcs_date !== null ? '#7D8F69' : '#E67E22' }`, fontWeight: 'bold' }}>RCS</Typography> : '' }
                                { data.ras !== null ? <Typography sx= {{ color: `${ data.ras_date !== null ? '#7D8F69' : '#E67E22' }`, fontWeight: 'bold' }}>RAS</Typography> : '' }
                                { data.ras_date !== null && data.rcs_date !== null && (data.rcs_total !== data.ras_total) ? 
                                    <Typography sx= {{ color: `${ data.des_date !== null ? '#7D8F69' : '#E67E22' }`, fontWeight: 'bold' }}>DES</Typography> : '' }
                            </Stack>
                        </Stack>
                    )) : <Stack direction= "row" justifyContent= "center" alignItems= "center" sx= { card }><Typography variant= "body2">No record/s found!</Typography></Stack> }
            </Stack>
        </Stack>
    );
}

export default Items;