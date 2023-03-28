// Libraries
import { Stack, Typography } from "@mui/material";

// Layouts
import WorkDone from "./layouts/WorkDone";
import PersonnelDeployed from "./layouts/PersonnelDeployed";
import SubContractors from "./layouts/SubContractors";
import Recommendation from "./layouts/Recommendation";
import Comments from "./layouts/Comments";

const Index = ({ fetching }) => {

    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
            <Typography variant= "button" sx= {{ fontSize: '100%', fontWeight: 'bold' }} gutterBottom>Request Implementation</Typography>
            <WorkDone fetching= { fetching } />
            <PersonnelDeployed fetching= { fetching } />
            <SubContractors fetching= { fetching } />
            <Recommendation fetching= { fetching } />
            <Comments fetching= { fetching } />
        </Stack>
    );
}

export default Index;