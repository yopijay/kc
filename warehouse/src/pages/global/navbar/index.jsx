// Libraries
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { AppBar, Container, Stack, Typography } from "@mui/material";
import { Link } from "react-router-dom";
import { faBarsStaggered } from "@fortawesome/free-solid-svg-icons";
import { useContext } from "react";

// Core
import { GlobalCntx } from "core/context/Global"; // Context

// Constants
const container = { boxShadow: 'none', padding: '15px 0', overflow: 'hidden', backgroundColor: 'transparent' };
const appbar = { backgroundColor: '#ffffff', padding: '10px 20px', borderRadius: '8px' };

const Index = () => {
    const { drawerToggle, open, setActive } = useContext(GlobalCntx);

    return (
        <AppBar position= "fixed" sx= { container }>
            <Container maxWidth= "md">
                <Stack direction= "row" justifyContent= "space-between" alignItems= "center" sx= { appbar }>
                    <Stack direction= "row" justifyContent= "flex-start" alignItems= "center">
                        <Typography color= "error.dark" variant= "h4" sx= {{ fontFamily: 'Generica Bold', textDecoration: 'none' }} component= { Link } to= "/" 
                            onClick= { () => { localStorage.setItem('nav', 'home'); setActive('home'); } }>KC</Typography>
                    </Stack>
                    <Typography color= "text.primary" sx= {{ transition: 'transform 0.2s', '&:hover': { transform: 'scale(1.1)' } }} onClick= { drawerToggle(!open.left) }>
                        <FontAwesomeIcon icon={ faBarsStaggered } />
                    </Typography>
                </Stack>
            </Container>
        </AppBar>
    );
}

export default Index;