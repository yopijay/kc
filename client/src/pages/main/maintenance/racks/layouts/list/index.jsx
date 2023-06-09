// Libraries
import { faFileArrowDown, faMagnifyingGlass, faPlus } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { Box, Stack, TextField, Typography } from "@mui/material";
import { useContext, useEffect } from "react";
import { Link } from "react-router-dom";

// Core
import { ListCntxt } from "core/context/List"; // Context
import { ProfileCntx } from "core/context/Profile"; // Context
import { FormCntxt } from "core/context/Form"; // Context
import { exporttoexcel, useGet, usePost } from "core/function/global"; // Function
import { excel, look, records, submodule } from "core/api"; // API

// Layouts
import Dashboard from "./layouts/Dashboard";
import Item from "./layouts/Item";
import Loader from "./layouts/Loader";
import Sort from "./layouts/Sort";

// Constants
import { btnexport, btnicon, btntxt, search } from "./index.style"; // Design

const Index = () => {
    let name = `KC-EXPORT-RACKS-${parseInt((new Date()).getMonth()) + 1}${(new Date()).getDate()}${(new Date()).getFullYear()}`;
    const { data } = useContext(ProfileCntx);
    const { setList } = useContext(ListCntxt);
    const { register, getValues, setValue } = useContext(FormCntxt);
    const { data: sub, isFetching } = useGet({ key: ['submodule'], fetch: submodule('racks'), options: { refetchOnWindowFocus: false } });
    const { mutate: find, isLoading: finding } = usePost({ fetch: look, onSuccess: (data) => { setList(data) } });
    const { mutate: record, isLoading: fetching } = usePost({ fetch: records, options: { refetchOnWindowFocus: false }, onSuccess: (data) => { setList(data)} });

    const { mutate: original } = usePost({fetch: excel, options: { refetchOnWindowFocus: false }, onSuccess: (data) => exporttoexcel(data, 'Racks', `${name} (Admin's copy)`) });
    const { mutate: formatted } = usePost({ fetch: excel, options: { refetchOnWindowFocus: false }, onSuccess: (data) => exporttoexcel(data, 'Racks', `${name}`) });

    useEffect(() => { 
        register('orderby', { value: 'date_created' }); register('sort', { value: 'desc' });
        let data = getValues();
        data['orderby'] = 'date_created';
        data['sort'] = 'desc';
        data['searchtxt'] = '';

        record({ table: 'tbl_racks', data: data }); 
    }, [ register, record, getValues ] );

    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= {{ width: '100%', overflow: 'hidden' }} spacing= { 1 }>
            <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 }>
                <Typography variant= "h6" sx= {{ fontFamily: 'Boldstrom', color: '#535b64' }}>Racks</Typography>
                <Dashboard />
                <Stack direction= "row" justifyContent= "space-between" alignItems= "flex-start" spacing= { 1 }>
                    <form autoComplete= "off">
                        <Box sx= { search }>
                            <FontAwesomeIcon icon= { faMagnifyingGlass } size= "sm" style= {{ margin: '8px' }} />
                            <TextField { ...register('searchtxt') } variant= "standard" size= "small" fullWidth InputProps= {{ disableUnderline: true }} placeholder= "Search..." sx= {{ padding: '5px 0 0 0' }}
                                onChange= { e => { setValue('searchtxt', e.target.value); find({ table: 'tbl_racks', data: getValues() }); } } />
                        </Box>
                    </form>
                    <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 }>
                        <Stack direction= "row" justifyContent= "flex-end" alignItems= "center" sx= {{ flexGrow: 1 }} spacing= { 1 }>
                            { !isFetching && (JSON.parse(data.permissions)?.[`module_${sub?.module_id}`][`submodule_${sub?.id}`]?.export || data.user_level === 'superadmin') ? 
                                <Typography 
                                    onClick= { () => { 
                                        if(data.user_level === 'superadmin') { original({ table: 'tbl_racks', type: 'original', data: getValues() }); } 
                                        formatted({ table: 'tbl_racks', type: 'formatted', data: getValues() }); }} sx= { btnexport }>
                                    <FontAwesomeIcon icon= { faFileArrowDown } style= {{ color: '#FFFFFF' }} size= "lg" />
                                </Typography> : '' }
                            { !isFetching && (JSON.parse(data.permissions)?.[`module_${sub?.module_id}`][`submodule_${sub?.id}`]?.create || data.user_level === 'superadmin') ? 
                                <Typography component= { Link } to= "/maintenance/racks/form/new" sx= { btnicon }>
                                    <FontAwesomeIcon icon= { faPlus } style= {{ color: '#FFFFFF' }} size= "lg" />
                                </Typography> : '' }
                            { !isFetching && (JSON.parse(data.permissions)?.[`module_${sub?.module_id}`][`submodule_${sub?.id}`]?.create || data.user_level === 'superadmin') ? 
                                <Typography component= { Link } to= "/maintenance/racks/form/new" sx= { btntxt }>New Racks</Typography> : '' }
                        </Stack>
                    </Stack>
                </Stack>
            </Stack>
            <Sort refetch= { record } />
            <Box sx= {{ overflowY: 'scroll', '&::-webkit-scrollbar': { display: 'none' } }}>{ !fetching && !finding ? <Item sub= { sub } fetching= { isFetching } profile= { data } /> : <Loader /> }</Box>
        </Stack>
    );
}

export default Index;