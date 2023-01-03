// Libraries
import { Popover, Stack, SwipeableDrawer, Typography, Box } from "@mui/material";
import { GlobalCntx } from "core/context/Global";
import { useContext, useState } from "react";
import { Link } from "react-router-dom";

// Constants
import { link, swipe } from "./index.style"; // Design

// Layouts
import Navs from "./layouts/Navs";
import Account from "./layouts/Account";

const Index = () => {
    const { open, drawerToggle, container, setIsActive } = useContext(GlobalCntx);
    const [ elem, setElem ] = useState(null);

    const pop = Boolean(elem);
    const id = pop ? 'simple-popover' : undefined;
    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= {{ width: { lg: 280 }, flexShrink: { xs: 0 } }}>
            <SwipeableDrawer anchor= "left" variant= "temporary" sx= { swipe } ModalProps= {{ keepMounted: true }} container= { container } onOpen= { drawerToggle(true) } open= { open.left } onClose= { drawerToggle(false) }>
                <Stack direction= "column" justifyContent= "space-between" alignItems= "stretch" sx= {{ height: '100vh' }} spacing= { 2 }>
                    <Navs />
                    <Account setElem= { setElem } />
                </Stack>
            </SwipeableDrawer>
            <Stack direction= "column" justifyContent= "space-between" alignItems= "stretch" sx= {{ height: '100vh', padding: '0 10px 20px 0', display: { xs: 'none', lg: 'flex' } }} spacing= { 2 }>
                <Navs />
                <Account setElem= { setElem } />
            </Stack>
            <Popover id= { id } open= { pop } anchorEl= { elem } onClose= { () => setElem(null) } anchorOrigin= {{ vertical: 'bottom', horizontal: 'right' }} transformOrigin= {{ vertical: 'bottom', horizontal: 'left' }} style= {{ marginTop: '7px', boxShadow: 'none', marginLeft: '15px' }}>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= {{ width: '200px', transition: 'all 0.2s ease-in-out' }}>
                    <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= {{ padding: '10px 20px' }}>
                        <Typography gutterBottom variant= "body1" component= { Link } to= "" sx= { link } onClick= { () => { setElem(null); localStorage.setItem('nav', 'profile'); setIsActive('profile'); } }>Profile</Typography>
                        <Typography gutterBottom variant= "body1" component= { Link } to= "" sx= { link } onClick= { () => { setElem(null); localStorage.setItem('nav', 'settings'); setIsActive('settings'); } }>Settings</Typography>
                    </Stack>
                    <Box sx= {{ padding: '10px 20px' }}><Typography variant= "body1" /*onClick= { () => signout({ id: localStorage.getItem('token') }) }*/ sx= { link }>Logout</Typography></Box>
                </Stack>
            </Popover>
            {/* <Stack direction= "column" justifyContent= "space-between" alignItems= "stretch" sx= {{ height: '100vh', padding: '0 10px 20px 0' }} spacing= { 2 }>
            </Stack> */}
        </Stack>
    );
}

export default Index;