// Core
import { Stack, Typography } from "@mui/material";
import { useContext } from "react";

// Core
import { ProfileCntx } from "core/context/Profile"; // Context

// Custom styles
const container = {
    overflow: 'scroll',
    width: '100%',
    height: '100%',
    '&::-webkit-scrollbar': { display: 'none' }
}

const Index = () => {
    const { data } = useContext(ProfileCntx);
    
    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "flex-start" sx= { container } spacing= { 3 }>
            <Typography sx= {{ fontWeight: 'bold', fontFamily: 'American Captain', fontSize: '250%' }}>Welcome { data?.fname },</Typography>
            <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                
            </Stack>
        </Stack>
    );
}

export default Index;