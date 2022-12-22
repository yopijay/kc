// Libraries
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { AppBar, Container, Stack, Typography } from "@mui/material";
import { Link } from "react-router-dom";
import { faBarsStaggered } from "@fortawesome/free-solid-svg-icons";

// Constants
import { appbar } from "./index.style"; // Styles

const Index = () => {
    return (
        <AppBar position= "fixed" sx= { appbar }>
            <Container maxWidth= "lg">
                <Stack direction= "row" justifyContent= "space-between" alignItems= "center">
                    <Stack direction= "row" justifyContent= "flex-start" alignItems= "center">
                        <Typography color= "error.dark" variant= "h4" sx= {{ fontFamily: 'Generica Bold', textDecoration: 'none' }} component= { Link } to= "/">KC</Typography>
                    </Stack>
                    <Typography color= "text.primary" sx= {{ transition: 'transform 0.2s', '&:hover': { transform: 'scale(1.1)' }, display: { xs: 'block', md: 'none' } }}><FontAwesomeIcon icon={ faBarsStaggered } /></Typography>
                </Stack>
            </Container>
        </AppBar>
    );
}

export default Index;