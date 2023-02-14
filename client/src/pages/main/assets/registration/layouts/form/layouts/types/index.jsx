// Libraries
import { Stack } from "@mui/material";
import OfficeDesk from "./office-furniture/OfficeDesk";
import Whiteboards from "./office-furniture/Whiteboards";

const Index = ({ item, fetching }) => {
    
    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
            { item === 'office-desks' ? <OfficeDesk fetching= { fetching } /> :
                item === 'whiteboards' ? <Whiteboards /> : '' }
        </Stack>
    );
}

export default Index;