// Libraries
import { Stack, Typography } from "@mui/material";

// Layouts
import Customer from "./layouts/Customer";
import Requests from "./layouts/Requests";
import Other from "./layouts/Other";
import Signature from "./layouts/SIgnature";

const Index = ({ fetching }) => {
    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
            <Typography variant= "button" sx= {{ fontSize: '100%', fontWeight: 'bold' }} gutterBottom>Sales</Typography>
            <Customer fetching= { fetching } />
            <Requests fetching= { fetching } />
            <Other fetching= { fetching } />
            <Signature fetching= { fetching } />
        </Stack>
    );
}

export default Index;