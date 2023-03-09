// Libraries
import { Stack, Typography } from "@mui/material";

// Layouts
import Evaluator from "./layouts/Evaluator";

const Index = ({ fetching }) => {
    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
            <Typography variant= "button" sx= {{ fontSize: '100%', fontWeight: 'bold' }} gutterBottom>Technical</Typography>
            <Evaluator fetching= { fetching } />
        </Stack>
    );
}

export default Index;