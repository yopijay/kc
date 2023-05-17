// Libraries
import { Stack } from "@mui/material";

// Layout
import Profile from "pages/global/profile";
import Modules from "./layouts/Modules";

// Constants
const container = { width: '100%', flexGrow: 1, overflowY: 'scroll', padding: '90px 0 20px 0', '&::-webkit-scrollbar': { display: 'none' } };

const Index = () => {

    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= { container } spacing= { 2 }>
            <Profile />
            <Modules />
        </Stack>
    );
}

export default Index;