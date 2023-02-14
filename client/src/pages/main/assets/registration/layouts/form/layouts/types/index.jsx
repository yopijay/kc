// Libraries
import { Stack } from "@mui/material";

// Layouts
import OfficeChairs from "./office-furniture/OfficeChairs";
import OfficeDesk from "./office-furniture/OfficeDesk";
import Whiteboards from "./office-furniture/Whiteboards";
import FilingCabinet from "./office-furniture/FilingCabinet";

const Index = ({ item, fetching, tag }) => {
    
    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
            { item === 'office-desks' ? <OfficeDesk fetching= { fetching } tag= { tag } /> :
                item === 'office-chairs' ? <OfficeChairs fetching= { fetching } tag= { tag } /> :
                    item === 'whiteboards' ? <Whiteboards tag= { tag } fetching= { fetching } /> :
                        item === 'filing-cabinets' ? <FilingCabinet tag= { tag } fetching= { fetching } /> : '' }
        </Stack>
    );
}

export default Index;