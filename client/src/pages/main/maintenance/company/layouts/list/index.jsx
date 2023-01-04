// Libraries
import { faFileArrowDown, faFileArrowUp, faMagnifyingGlass, faPlus } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { Box, Stack, TextField, Typography } from "@mui/material";
import { useContext } from "react";
import { Link } from "react-router-dom";

// Core
import { ListCntxt } from "core/context/List"; // Context
import { useGet } from "core/function/global"; // Function
import { records } from "core/api"; // API

// Constants
import { btnexport, btnicon, btnimport, btntxt, search } from "./index.style"; // Design

// Layouts
import Dashboard from "./layouts/Dashboard";
import Item from "./layouts/Item";

const Index = () => {
    const { setList } = useContext(ListCntxt);
    const { isFetching } = useGet({ key: ['cmp_list'], fetch: records({ table: 'tbl_company', data: {} }), options: { refetchOnWindowFocus: false }, onSuccess: (data) => setList(data) });

    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= {{ width: '100%', height: '100%' }} spacing= { 3 }>
            <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 }>
                <Typography variant= "h6" sx= {{ fontFamily: 'Boldstrom', color: '#3C4048' }}>Company</Typography>
                <Dashboard />
                <Stack direction= "row" justifyContent= "space-between" alignItems= "center" spacing= { 1 }>
                    <form autoComplete= "off">
                        <Box sx= { search }>
                            <FontAwesomeIcon icon= { faMagnifyingGlass } size= "sm" style= {{ margin: '8px' }} />
                            <TextField variant= "standard" size= "small" fullWidth InputProps= {{ disableUnderline: true }} placeholder= "Search..." sx= {{ padding: '5px 0 0 0' }} />
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
            <Item fetching= { isFetching } />
        </Stack>
    );
}

export default Index;