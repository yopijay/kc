// Libraries
import { faFileArrowDown, faFileArrowUp, faMagnifyingGlass, faPlus } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { Box, Skeleton, Stack, TextField, Typography } from "@mui/material";
import { useContext } from "react";
import { Link } from "react-router-dom";

// Core
import { ListCntxt } from "core/context/List"; // Context
import { useGet, usePost } from "core/function/global"; // Function
import { look, records } from "core/api"; // API

// Constants
import { btnexport, btnicon, btnimport, btntxt, search } from "./index.style"; // Design

// Layouts
import Dashboard from "./layouts/Dashboard";
import Item from "./layouts/Item";

const Index = () => {
    const { setList } = useContext(ListCntxt);
    const { mutate: find, isLoading: finding } = usePost({ fetch: look, onSuccess: (data) => setList(data) });
    const { isFetching: fetching } = useGet({ key: ['cmp_list'], fetch: records({ table: 'tbl_company', data: {} }), options: { refetchOnWindowFocus: false }, onSuccess: (data) => setList(data) });

    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= {{ width: '100%', height: '100%' }} spacing= { 3 }>
            <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 }>
                <Typography variant= "h6" sx= {{ fontFamily: 'Boldstrom', color: '#3C4048' }}>Company</Typography>
                <Dashboard />
                <Stack direction= "row" justifyContent= "space-between" alignItems= "center" spacing= { 1 }>
                    <form autoComplete= "off">
                        <Box sx= { search }>
                            <FontAwesomeIcon icon= { faMagnifyingGlass } size= "sm" style= {{ margin: '8px' }} />
                            <TextField variant= "standard" size= "small" fullWidth InputProps= {{ disableUnderline: true }} placeholder= "Search..." sx= {{ padding: '5px 0 0 0' }}
                                onChange= { e => { find({ table: 'tbl_company', data: { condition: e.target.value !== '' ? (e.target.value).toUpperCase() : e.target.value } }); } } />
                        </Box>
                    </form>
                    <Stack direction= "row" justifyContent= "flex-end" alignItems= "center" sx= {{ flexGrow: 1 }} spacing= { 1 }>
                        <Typography component= { Link } to= "/maintenance/company/form/new" sx= { btnimport }><FontAwesomeIcon icon= { faFileArrowUp } style= {{ color: '#FFFFFF' }} size= "lg" /></Typography>
                        <Typography component= { Link } to= "/maintenance/company/form/new" sx= { btnexport }><FontAwesomeIcon icon= { faFileArrowDown } style= {{ color: '#FFFFFF' }} size= "lg" /></Typography>
                        <Typography component= { Link } to= "/maintenance/company/form/new" sx= { btnicon }><FontAwesomeIcon icon= { faPlus } style= {{ color: '#FFFFFF' }} size= "lg" /></Typography>
                        <Typography component= { Link } to= "/maintenance/company/form/new" sx= { btntxt }>New Company</Typography>
                    </Stack>
                </Stack>
            </Stack>
            { !fetching && !finding ? <Item /> :  
                <Stack direction= "row" justifyContent= "space-between" alignItems= "center" sx= {{ backgroundColor: '#FFFFFF', padding: '10px 20px', border: 'solid 1px #F3F3F3', borderRadius: '10px' }} spacing= { 2 }>
                    <Stack direction= "column" justifyContent= "flex-start" alignItems= "flex-start" spacing= { 1 } sx= {{ flexGrow: 1 }}>
                        <Skeleton variant= "rounded" sx= {{ width: '50%', height: '10px' }} />
                        <Skeleton variant= "rounded" sx= {{ width: '25%', height: '10px' }} />
                        <Skeleton variant= "rounded" sx= {{ width: '27%', height: '10px' }} />
                    </Stack>
                    <Stack direction= "row" justifyContent= "flex-start" alignItems= "center" spacing= { 2 }>
                        <Skeleton variant= "circular" sx= {{ width: '10px', height: '10px' }} />
                        <Stack direction= "row" justifyContent= "flex-start" alignItems= "center" spacing= { 1 }>
                            <Skeleton variant= "rounded" sx= {{ padding: '15px' }} />
                            <Skeleton variant= "rounded" sx= {{ padding: '15px' }} />
                        </Stack>
                    </Stack>
                </Stack> }
        </Stack>
    );
}

export default Index;