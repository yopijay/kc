// Libraries
import { Stack, Typography } from "@mui/material";
import { Link } from "react-router-dom";
import { useContext } from "react";

// Core
import { GlobalCntx } from "core/context/Global"; // Context
import { Navs as links } from "core/constants/Navs"; // Navs

// Custom styles
const linkNormal = {
    textDecoration: 'none', 
    padding: '11px 15px', 
    borderRadius: '7px', 
    '&:hover': { backgroundColor: '#F5F5F5' }, 
    transition: 'all 0.2s ease-in-out'
}

const linkActive = {
    textDecoration: 'none', 
    padding: '11px 15px', 
    borderRadius: '7px', 
    backgroundColor: '#FFFFFF'
}

const Navs = () => {
    const { isActive, setActive, setOpen } = useContext(GlobalCntx);
    
    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch"  sx= {{ padding: { xs: '20px', lg: '90px 0 20px 0' }, overflowY: 'scroll', '&::-webkit-scrollbar': { display: 'none' } }} spacing= { 2 }>
            {
                links().map((ctgy, index) => (
                    <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 } key= { index }>
                        <Typography variant= "body2" sx= {{ fontWeight: 'bold', color: 'rgb(200, 200, 200)' }} color= "text.primary">{ ctgy.title }</Typography>
                        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                            {
                                (ctgy.nav).map((link, index) => (
                                    <Typography variant= "body1" component= { Link } to= { link.path } color= "text.secondary" key= { index }
                                        onClick= { () => { setOpen({ left: false }); localStorage.setItem('nav', link.name); setActive(link.name); } }
                                        sx= { isActive === link.name ? linkActive : linkNormal }>{ link.label }</Typography>
                                ))
                            }
                        </Stack>
                    </Stack>
                ))
            }
        </Stack>
    );
}

export default Navs;