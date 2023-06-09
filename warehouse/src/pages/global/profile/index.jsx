// Libraries
import { Stack, Typography } from "@mui/material";
import { useContext } from "react";

// Core
import { ProfileCntx } from "core/context/Profile"; // Context

// Constants
const container = {
    backgroundColor: '#f47c7c',
    height: '120px',
    padding: '20px',
    borderRadius: '8px'
}

const Index = () => {
    const { data } = useContext(ProfileCntx);

    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= { container }>
            <Typography sx= {{ fontWeight: 'bold' }} color= "#ffffff">{ data.lname }, { data.fname } { data.mname }</Typography>
            <Typography color= "#ffffff">{ (data.type)?.toUpperCase() }</Typography>
        </Stack>
    );
}

export default Index;