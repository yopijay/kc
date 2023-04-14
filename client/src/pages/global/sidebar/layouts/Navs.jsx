// Libraries
import { Stack, Typography } from "@mui/material";
import { Link } from "react-router-dom";
import { useContext, useEffect, useState } from "react";

// Core
import { GlobalCntx } from "core/context/Global"; // Context
import { ProfileCntx } from "core/context/Profile"; // Context
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faChartSimple } from "@fortawesome/free-solid-svg-icons";
import { usePost } from "core/function/global";
import { records } from "core/api";

// Layouts
import Subnavs from "./Subnavs";

// Custom styles
const linkNormal = {
    textDecoration: 'none', 
    padding: '11px 15px', 
    borderRadius: '7px', 
    '&:hover': { backgroundColor: '#F47C7C2E' }, 
    transition: 'all 0.2s ease-in-out',
    color: '#444444'
}

const linkActive = {
    textDecoration: 'none', 
    padding: '11px 15px', 
    borderRadius: '7px', 
    backgroundColor: '#F47C7C61',
    color: '#444444'
}

const container = {
    padding: { 
        xs: '20px', 
        lg: '90px 0 20px 0' 
    }, 
    overflowY: 'scroll', 
    '&::-webkit-scrollbar': { display: 'none' }
}

const Navs = () => {
    const { data } = useContext(ProfileCntx);
    const [ modules, setModules ] = useState([]);
    const { isActive, setActive, setOpen } = useContext(GlobalCntx);
    const { mutate: module } = usePost({ fetch: records, onSuccess: data => setModules(data) });

    useEffect(() => {
        let data = {};
        data['orderby'] = 'name';
        data['sort'] = 'asc';
        data['searchtxt'] = '';

        module({ table: 'tbl_module', data: data }); 
    }, [ module ] );
    
    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch"  sx= { container } spacing= { 2 }>
            <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 }>
                <Typography variant= "body2" sx= {{ fontWeight: 'bold', color: '#444444' }}>Main</Typography>
                <Stack direction= "row" justifyContent= "flex-start" alignItems= "center" spacing= { 2 } 
                    component= { Link } to= "/" sx= { isActive === 'dashboard' ? linkActive : linkNormal }
                    onClick= { () => { setOpen({ left: false}); localStorage.setItem('nav', 'dashboard'); setActive('dashboard'); } }>
                    <FontAwesomeIcon icon= { faChartSimple } />
                    <Typography>Dashboard</Typography>
                </Stack>
            </Stack>
            { modules.length > 0 ?
                modules.map((mdl, index) => (
                    <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 } key= { index }>
                        { JSON.parse(data.permissions)?.[`module_${mdl.id}`]?.status || data.user_level === 'superadmin' ?
                            <Typography variant= "body2" sx= {{ fontWeight: 'bold', color: '#444444' }}>{ (mdl.name).charAt(0).toUpperCase() + (mdl.name).slice(1).toLowerCase() }</Typography> : '' }
                        { JSON.parse(data.permissions)?.[`module_${mdl.id}`]?.status || data.user_level === 'superadmin' ? <Subnavs module= { mdl.id } /> : '' }
                    </Stack>
                )) : '' }
        </Stack>
    );
}

export default Navs;