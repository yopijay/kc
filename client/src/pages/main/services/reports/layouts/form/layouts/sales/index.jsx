// Libraries
import { Stack, Typography } from "@mui/material";
import { useContext, useEffect } from "react";

// Core
import { FormCntxt } from "core/context/Form"; // Context

// Layouts
import Customer from "./layouts/Customer";
import Requests from "./layouts/Requests";
import Other from "./layouts/Other";

const Index = ({ fetching }) => {
    const { register } = useContext(FormCntxt);
    useEffect(() => { register('requested_by_signature', { value: '' }); register('noted_by_sup_signature', { value: '' }); }, [ register ]);

    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
            <Typography variant= "button" sx= {{ fontSize: '100%', fontWeight: 'bold' }} gutterBottom>Sales</Typography>
            <Customer fetching= { fetching } />
            <Requests fetching= { fetching } />
            <Other fetching= { fetching } />
        </Stack>
    );
}

export default Index;