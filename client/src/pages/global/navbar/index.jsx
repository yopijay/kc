// Libraries
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { AppBar, Container, Stack, Typography } from "@mui/material";
import { Link } from "react-router-dom";
import { faBarsStaggered } from "@fortawesome/free-solid-svg-icons";
import { useContext } from "react";

// Core
import { GlobalCntx } from "core/context/Global"; // Context

// Constants
const appbar = {
    boxShadow: 'none',
    padding: '7px 0',
    maxHeight: '120px',
    overflow: 'hidden',
    backgroundColor: '#ffffff'
}

const Index = () => {
    const { drawerToggle, open, setIsActive } = useContext(GlobalCntx);

    return (
        <AppBar position= "fixed" sx= { appbar }>
            <Container maxWidth= "lg">
                <Stack direction= "row" justifyContent= "space-between" alignItems= "center">
                    <Stack direction= "row" justifyContent= "flex-start" alignItems= "center">
                        <Typography color= "error.dark" variant= "h4" sx= {{ fontFamily: 'Generica Bold', textDecoration: 'none' }} component= { Link } to= "/" 
                            onClick= { () => { localStorage.setItem('nav', 'home'); setIsActive('home'); } }>KC</Typography>
                    </Stack>
                    <Typography color= "text.secondary" sx= {{ transition: 'transform 0.2s', '&:hover': { transform: 'scale(1.1)' }, display: { xs: 'block', lg: 'none' } }} 
                        onClick= { drawerToggle(!open.left) }><FontAwesomeIcon icon={ faBarsStaggered } /></Typography>
                </Stack>
            </Container>
        </AppBar>
    );
}

export default Index;