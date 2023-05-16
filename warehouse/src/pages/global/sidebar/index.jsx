// Libraries
import { Stack, SwipeableDrawer } from "@mui/material";
import { GlobalCntx } from "core/context/Global";
import { useContext } from "react";

// Layouts
import Account from "./layouts/Account";
import Navs from "./layouts/Navs";

// Constants
import { sidebar, swipe } from "./index.style"; // Design

const Index = () => {
    const { open, drawerToggle, container } = useContext(GlobalCntx);

    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= {{ width: { lg: 280 }, flexShrink: { xs: 0 } }}>
            <SwipeableDrawer anchor= "left" variant= "temporary" sx= { swipe } ModalProps= {{ keepMounted: true }} container= { container } 
                onOpen= { drawerToggle(true) } open= { open.left } onClose= { drawerToggle(false) }>
                <Stack direction= "column" justifyContent= "space-between" alignItems= "stretch" sx= {{ height: '100vh' }} spacing= { 2 }>
                    <Navs />
                    <Account />
                </Stack>
            </SwipeableDrawer>
            <Stack direction= "column" justifyContent= "space-between" alignItems= "stretch" sx= { sidebar } spacing= { 2 }>
                <Navs />
                <Account />
            </Stack>
        </Stack>
    );
}

export default Index;