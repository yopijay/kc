// Libraries
import { useContext, useEffect } from "react";
import { Box, Stack, TextField, Typography } from "@mui/material";
import { Link } from "react-router-dom";
import { btnexport, btnicon, btntxt, search } from "./index.style";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faFileArrowDown, faMagnifyingGlass, faPlus } from "@fortawesome/free-solid-svg-icons";

// Core
import { ListCntxt } from "core/context/List"; // Context
import { GlobalCntx } from "core/context/Global"; // Context
import { ProfileCntx } from "core/context/Profile"; // Context
import { FormCntxt } from "core/context/Form"; // Context
import { excel, look, records, submodule } from "core/api"; // API
import { exporttoexcel, useGet, usePost } from "core/function/global"; // Functions

// Layouts
import Dashboard from "./layouts/Dashboard";
import Sort from "./layouts/Sort";
import Item from "./layouts/Item";
import Loader from "./layouts/Loader";

const Index = () => {
    let name = `KC-EXPORT-USERS-${parseInt((new Date()).getMonth()) + 1}${(new Date()).getDate()}${(new Date()).getFullYear()}`;
    const { data } = useContext(ProfileCntx);
    const { setList } = useContext(ListCntxt);
    const { register, getValues, setValue } = useContext(FormCntxt);
    const { message, errors } = useContext(GlobalCntx);
    const { data: sub, isFetching } = useGet({ key: ['submodule'], fetch: submodule('users'), options: { refetchOnWindowFocus: false } });
    const { mutate: find, isLoading: finding } = usePost({ fetch: look, onSuccess: (data) => setList(data) });
    const { mutate: record, isLoading: fetching } = usePost({ fetch: records, options: { refetchOnWindowsFocus: false }, onSuccess: (data) => setList(data) });

    const { mutate: original } = usePost({ fetch: excel, options: { refetchOnWindowsFocus: false }, onSuccess: (data) => exporttoexcel(data, 'Users', `${name} (Admin's copy)`) });
    const { mutate: formatted } = usePost({ fetch: excel, options: { refetchOnWindowsFocus: false }, onSuccess: (data) => exporttoexcel(data, 'Users', `${name}`) });

    useEffect(() => { 
        register('id', { value: atob(localStorage.getItem('token')) }); register('orderby', { value: 'lname' }); register('sort', { value: 'desc' }); register('company_id', { value: 'all' });
        let data = getValues();
        data['id'] = atob(localStorage.getItem('token'));
        data['orderby'] = 'lname';
        data['sort'] = 'desc';
        data['company_id'] = 'all';
        data['searchtxt'] = '';

        record({ table: 'tbl_users', data: data }); 
    }, [ register, record, getValues ] );

    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= {{ width: '100%', overflow: 'hidden' }} spacing= { 1 }>
            <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 }>
                <Typography variant= "h6" sx= {{ fontFamily: 'Boldstrom', color: '#535b64' }}>Users</Typography>
                <Dashboard />
            </Stack>
            <Stack direction= "row" justifyContent= "space-between" alignItems= "center">
                <form autoComplete= "off">
                    <Box sx= { search }>
                        <FontAwesomeIcon icon= { faMagnifyingGlass } size= "sm" style= {{ margin: '8px' }} />
                        <TextField { ...register('searchtxt') } variant= "standard" size= "small" fullWidth InputProps= {{ disableUnderline: true }} placeholder= "Search..." sx= {{ padding: '5px 0 0 0' }}
                            onChange= { e => { setValue('searchtxt', e.target.value); find({ table: 'tbl_users', data: getValues() }); } } />
                    </Box>
                </form>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 }>
                    <Stack direction= "row" justifyContent= "flex-end" alignItems= "center" sx= {{ flexGrow: 1 }} spacing=  { 1 }>
                        { !isFetching && (JSON.parse(data.permissions)?.[`module_${sub?.module_id}`][`submodule_${sub?.id}`].export || data.user_level === 'superadmin') ? 
                            <Typography 
                                onClick= { () => { 
                                    if(data.user_level === 'superadmin') { original({ table: 'tbl_users', type: 'original', data: getValues() }); } 
                                    formatted({ table: 'tbl_users', type: 'formatted', data: getValues() }); }} sx= { btnexport }>
                                <FontAwesomeIcon icon= { faFileArrowDown } style= {{ color: '#FFFFFF' }} size= "lg" />
                            </Typography> : '' }
                        { !isFetching && (JSON.parse(data.permissions)?.[`module_${sub?.module_id}`][`submodule_${sub?.id}`].create || data.user_level === 'superadmin') ? 
                            <Typography component= { Link } to= "/maintenance/users/form/new" sx= { btnicon }>
                                <FontAwesomeIcon icon= { faPlus } style= {{ color: '#FFFFFF' }} size= "lg" />
                            </Typography> : '' }
                        { !isFetching && (JSON.parse(data.permissions)?.[`module_${sub?.module_id}`][`submodule_${sub?.id}`].create || data.user_level === 'superadmin') ? 
                            <Typography component= { Link } to= "/maintenance/users/form/new" sx= { btntxt }>New User</Typography> : '' }
                    </Stack>
                    <Stack direction= "column" justifyContent= "flex-start" alignItems= "flex-end">
                        <Typography variant= "body2" sx= {{ color: '#557153', textAlign: 'right' }}>{ message }</Typography>
                        { errors.map((err, index) => 
                            <Typography variant= "caption" sx= {{ color: '#F47C7C', textAlign: 'right' }} key= { index }>{ `Error on row${err.row}, ${JSON.stringify(err.errors)}` }</Typography> ) }
                    </Stack>
                </Stack>
            </Stack>
            <Sort refetch= { record } />
            <Box sx= {{ overflowY: 'scroll', '&::-webkit-scrollbar': { display: 'none' } }}>{ !fetching && !finding ? <Item sub= { sub } fetching= { isFetching } profile= { data } /> : <Loader /> }</Box>
        </Stack>
    );
}

export default Index;