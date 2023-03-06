// Libraries
import { Stack, Typography } from "@mui/material";
import { Link } from "react-router-dom";
import { useContext } from "react";

// Core
import { GlobalCntx } from "core/context/Global"; // Context
import { ProfileCntx } from "core/context/Profile";

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
    const { data } = useContext(ProfileCntx);
    const { isActive, setActive, setOpen } = useContext(GlobalCntx);
    
    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch"  sx= { container } spacing= { 2 }>
            <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 }>
                <Typography variant= "body2" sx= {{ fontWeight: 'bold', color: '#444444' }}>Main</Typography>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography variant= "body1" component= { Link } to= "/" color= "text.secondary"
                        onClick= { () => { setOpen({ left: false}); localStorage.setItem('nav', 'dashboard'); setActive('dashboard'); } }
                        sx= { isActive === 'dashboard' ? linkActive : linkNormal }>Dashboard</Typography>
                </Stack>
            </Stack>
            { data.user_level === 'superadmin' ? 
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 }>
                    <Typography variant= "body2" sx= {{ fontWeight: 'bold', color: '#444444' }}>Setup</Typography>
                    <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                        <Typography variant= "body1" component= { Link } to= "/setup/module" color= "text.secondary"
                            onClick= { () => { setOpen({ left: false}); localStorage.setItem('nav', 'module'); setActive('module'); } }
                            sx= { isActive === 'module' ? linkActive : linkNormal }>Module</Typography>
                        <Typography variant= "body1" component= { Link } to= "/setup/sub-module" color= "text.secondary"
                            onClick= { () => { setOpen({ left: false}); localStorage.setItem('nav', 'sub-module'); setActive('sub-module'); } }
                            sx= { isActive === 'sub-module' ? linkActive : linkNormal }>Sub-module</Typography>
                        <Typography variant= "body1" component= { Link } to= "/setup/user" color= "text.secondary"
                            onClick= { () => { setOpen({ left: false}); localStorage.setItem('nav', 'user'); setActive('user'); } }
                            sx= { isActive === 'user' ? linkActive : linkNormal }>User</Typography>
                        <Typography variant= "body1" component= { Link } to= "/setup/user-access" color= "text.secondary"
                            onClick= { () => { setOpen({ left: false}); localStorage.setItem('nav', 'user-access'); setActive('user-access'); } }
                            sx= { isActive === 'user-access' ? linkActive : linkNormal }>User role-access</Typography>
                    </Stack>
                </Stack> : '' }
            {/* { links().map((ctgy, index) => (
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 } key= { index }>
                    <Typography variant= "body2" sx= {{ fontWeight: 'bold', color: 'rgb(200, 200, 200)' }} color= "text.primary">{ ctgy.title }</Typography>
                    <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                        { (ctgy.nav).map((link, index) => (
                                <Typography variant= "body1" component= { Link } to= { link.path } color= "text.secondary" key= { index }
                                    onClick= { () => { setOpen({ left: false }); localStorage.setItem('nav', link.name); setActive(link.name); } }
                                    sx= { isActive === link.name ? linkActive : linkNormal }>{ link.label }</Typography> )) }
                    </Stack>
                </Stack> )) } */}
        </Stack>
    );
}

export default Navs;