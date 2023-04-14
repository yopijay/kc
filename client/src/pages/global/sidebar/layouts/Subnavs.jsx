// Libraries
import { useContext, useEffect, useState } from "react";
import { Stack, Typography } from "@mui/material";
import { Link } from "react-router-dom";

// Core
import { GlobalCntx } from "core/context/Global"; // Context
import { usePost } from "core/function/global"; // Function
import { records } from "core/api"; // API
import { ProfileCntx } from "core/context/Profile"; // Context

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

const Subnavs = ({ module }) => {
    const { data } = useContext(ProfileCntx);
    const [ submodules, setSubmodules ] = useState([]);
    const { isActive, setActive, setOpen } = useContext(GlobalCntx);
    const { mutate: submodule } = usePost({ fetch: records, onSuccess: data => setSubmodules(data) });

    useEffect(() => {
        let data = {};
        data['module_id'] = module;
        data['orderby'] = 'date_created';
        data['sort'] = 'asc';
        data['searchtxt'] = '';

        submodule({ table: 'tbl_sub_module', data: data }); 
    }, [ submodule, module ] );

    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
            { submodules.length &&
                submodules.map((sub, index) => {
                    if(JSON.parse(data.permissions)?.[`module_${module}`][`submodule_${sub.id}`].list || data.user_level === 'superadmin')
                        return (
                            <Typography key= { index } component= { Link } to= { `/${(sub.module).toLowerCase()}${sub.path}` }
                                onClick= { () => { setOpen({ left: false}); localStorage.setItem('nav', (sub.name).toUpperCase()); setActive((sub.name).toUpperCase()); } }
                                sx= { isActive === (sub.name).toUpperCase() ? linkActive : linkNormal }>{ (sub.name).charAt(0).toUpperCase() + (sub.name).slice(1).toLowerCase() }</Typography> );
                }) }
        </Stack>
    );
}

export default Subnavs;