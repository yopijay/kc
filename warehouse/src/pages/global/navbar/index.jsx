// Libraries
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { AppBar, Container, Stack, Typography } from "@mui/material";
import { Link } from "react-router-dom";
import { faPowerOff } from "@fortawesome/free-solid-svg-icons";
import { useContext } from "react";

// Core
import { GlobalCntx } from "core/context/Global"; // Context
import { usePost } from "core/function/global"; // Function
import { logout } from "core/api"; // API

// Constants
const container = { boxShadow: 'none', padding: '15px 0', overflow: 'hidden', backgroundColor: 'transparent' };
const appbar = { backgroundColor: '#ffffff', padding: '10px 20px', borderRadius: '8px' };

const Index = () => {
    const { setActive } = useContext(GlobalCntx);
    const { mutate: signout } = usePost({ fetch: logout, onSuccess: data => { if(data.result === 'success') { localStorage.removeItem('token'); window.location.href = "/" } } });

    return (
        <AppBar position= "fixed" sx= { container }>
            <Container maxWidth= "md">
                <Stack direction= "row" justifyContent= "space-between" alignItems= "center" sx= { appbar }>
                    <Stack direction= "row" justifyContent= "flex-start" alignItems= "center">
                        <Typography color= "error.dark" variant= "h4" sx= {{ fontFamily: 'Generica Bold', textDecoration: 'none' }} component= { Link } to= "/" 
                            onClick= { () => { localStorage.setItem('nav', 'home'); setActive('home'); } }>KC</Typography>
                    </Stack>
                    <Typography color= "text.primary" sx= {{ transition: 'transform 0.2s', '&:hover': { transform: 'scale(1.1)' } }} onClick= { () => signout({ id: atob(localStorage.getItem('token')) }) }>
                        <FontAwesomeIcon icon={ faPowerOff } size= "lg" />
                    </Typography>
                </Stack>
            </Container>
        </AppBar>
    );
}

export default Index;