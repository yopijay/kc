// Libraries
import { Stack } from "@mui/material";
import { useContext } from "react";

// Core
import { ProfileCntx } from "core/context/Profile"; // Context

// Layout
import Profile from "pages/global/profile";
import Admin from "./layouts/Admin";
import RCS from "./layouts/RCS";

// Constants
const container = { width: '100%', flexGrow: 1, overflowY: 'scroll', padding: '90px 0 20px 0', '&::-webkit-scrollbar': { display: 'none' } };

const Index = () => {
    const { data } = useContext(ProfileCntx);

    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= { container } spacing= { 2 }>
            <Profile />
            { data.type === 'admin' ? <Admin /> : '' }
            { data.type === 'rcs' ? <RCS /> : '' }
            {/* { data.type === 'ras' ? <RAS /> : '' } */}
        </Stack>
    );
}

export default Index;