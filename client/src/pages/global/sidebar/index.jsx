// Libraries
import { Stack } from "@mui/material";
import Account from "./layouts/Account";

// Layouts
import Navs from "./layouts/Navs";

const Index = () => {
    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= {{ width: { md: 280 }, flexShrink: { xs: 0 } }}>
            <Stack direction= "column" justifyContent= "space-between" alignItems= "stretch" sx= {{ height: '100vh', padding: '0 10px 20px 0' }} spacing= { 2 }>
                <Navs />
                <Account />
            </Stack>
        </Stack>
    );
}

export default Index;