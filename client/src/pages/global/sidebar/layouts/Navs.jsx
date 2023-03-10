// Libraries
import { Stack, Typography } from "@mui/material";
import { Link } from "react-router-dom";
import { useContext } from "react";

// Core
import { GlobalCntx } from "core/context/Global"; // Context
import { Navs as links } from "core/constants/Navs";

// Custom styles
const linkNormal = {
    textDecoration: 'none', 
    padding: '11px 15px', 
    borderRadius: '7px', 
    '&:hover': { backgroundColor: '#F47C7C2E' }, 
    transition: 'all 0.2s ease-in-out'
}

const linkActive = {
    textDecoration: 'none', 
    padding: '11px 15px', 
    borderRadius: '7px', 
    backgroundColor: '#F47C7C61'
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
    // const { data } = useContext(ProfileCntx);
    const { isActive, setActive, setOpen } = useContext(GlobalCntx);
    // const { data: navs } = useGet({ key: ['component'], fetch: component(localStorage.getItem('token')), options: { refetchOnWindowFocus: false } });

    // useEffect(() => { groupBy(navs, 'module') }, [ navs ]);
    
    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch"  sx= { container } spacing= { 2 }>
            {/* <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 }>
                <Typography variant= "body2" sx= {{ fontWeight: 'bold', color: '#444444' }}>Main</Typography>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography variant= "body1" component= { Link } to= "/" color= "text.secondary"
                        onClick= { () => { setOpen({ left: false}); localStorage.setItem('nav', 'dashboard'); setActive('dashboard'); } }
                        sx= { isActive === 'dashboard' ? linkActive : linkNormal }>Dashboard</Typography>
                </Stack>
            </Stack> */}
            {/* <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 }>
                <Typography variant= "body2" sx= {{ fontWeight: 'bold', color: '#444444' }}>Setup</Typography>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    { data.user_level === 'superadmin' ? 
                        <Typography variant= "body1" component= { Link } to= "/setup/module" color= "text.secondary"
                            onClick= { () => { setOpen({ left: false}); localStorage.setItem('nav', 'module'); setActive('module'); } }
                            sx= { isActive === 'module' ? linkActive : linkNormal }>Module</Typography> : '' }
                    { data.user_level === 'superadmin' ? 
                        <Typography variant= "body1" component= { Link } to= "/setup/sub-module" color= "text.secondary"
                            onClick= { () => { setOpen({ left: false}); localStorage.setItem('nav', 'sub-module'); setActive('sub-module'); } }
                            sx= { isActive === 'sub-module' ? linkActive : linkNormal }>Sub-module</Typography> : '' }
                    { (navs?.filter(sub => sub.module === 'setup'))?.map((nav, index) => (
                        <Typography key= { index } variant= "body1" component= { Link } to= { `/${nav.module}${nav.path}` } color= "text.secondary"
                            onClick= { () => { setOpen({ left: false}); localStorage.setItem('nav', nav.sub_module); setActive(nav.sub_module); } } 
                            sx= { isActive === nav.sub_module ? linkActive : linkNormal }>{ (nav.sub_module).charAt(0).toUpperCase() + (nav.sub_module).slice(1) }</Typography>
                    )) }
                </Stack>
            </Stack> */}
            { links().map((ctgy, index) => (
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 } key= { index }>
                    <Typography variant= "body2" sx= {{ fontWeight: 'bold', color: 'rgb(200, 200, 200)' }} color= "text.primary">{ ctgy.title }</Typography>
                    <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                        { (ctgy.nav).map((link, index) => (
                                <Typography variant= "body1" component= { Link } to= { link.path } color= "text.secondary" key= { index }
                                    onClick= { () => { setOpen({ left: false }); localStorage.setItem('nav', link.name); setActive(link.name); } }
                                    sx= { isActive === link.name ? linkActive : linkNormal }>{ link.label }</Typography> )) }
                    </Stack>
                </Stack> )) }
        </Stack>
    );
}

export default Navs;