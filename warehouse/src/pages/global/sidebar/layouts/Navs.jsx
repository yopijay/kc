// Libraries
import { Stack, Typography } from "@mui/material";
import { Link } from "react-router-dom";
import { useContext } from "react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faChartSimple } from "@fortawesome/free-solid-svg-icons";

// Core
import { GlobalCntx } from "core/context/Global"; // Context

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
    const { isActive, setActive, setOpen } = useContext(GlobalCntx);
    
    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch"  sx= { container } spacing= { 2 }>
            <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 }>
                <Typography variant= "body2" sx= {{ fontWeight: 'bold', color: '#444444' }}>Main</Typography>
                <Stack direction= "row" justifyContent= "flex-start" alignItems= "center" spacing= { 2 } 
                    component= { Link } to= "/" sx= { isActive === 'home' ? linkActive : linkNormal }
                    onClick= { () => { setOpen({ left: false}); localStorage.setItem('nav', 'home'); setActive('home'); } }>
                    <FontAwesomeIcon icon= { faChartSimple } />
                    <Typography>Home</Typography>
                </Stack>
            </Stack>
        </Stack>
    );
}

export default Navs;