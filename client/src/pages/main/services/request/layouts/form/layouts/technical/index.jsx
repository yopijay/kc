// Libraries
import { Stack, Typography } from "@mui/material";

// Layouts
import Evaluator from "./layouts/Evaluator";
import Authorization from "./layouts/Authorization";
import Purpose from "./layouts/Purpose";
import Items from "./layouts/Items";
import Signature from "./layouts/SIgnature";

const Index = ({ fetching }) => {
    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
            <Typography variant= "button" sx= {{ fontSize: '100%', fontWeight: 'bold' }} gutterBottom>Technical</Typography>
            <Evaluator fetching= { fetching } />
            <Authorization fetching= { fetching } />
            <Purpose fetching= { fetching } />
            <Items fetching= { fetching } />
            <Signature fetching= { fetching } />
        </Stack>
    );
}

export default Index;