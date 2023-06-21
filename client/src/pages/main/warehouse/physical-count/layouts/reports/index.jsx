// Libraries
import { Box, Stack, Typography } from "@mui/material";
import { Link } from "react-router-dom";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faChevronLeft } from "@fortawesome/free-solid-svg-icons";

// Layouts
import Dashboard from "./layouts/Dashboard";
import Filter from "./layouts/Filter";
import Items from "./layouts/Items";

// Constants
import { btnicon } from "./index.style"; // Styles

const Index = () => {
    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= {{ width: '100%', overflow: 'hidden' }} spacing= { 1 }>
            <Stack direction= "row" justifyContent= "space-between" alignItems= "center">
                <Typography variant= "h6" sx= {{ fontFamily: 'Boldstrom', color: '#535b64' }}>Reports</Typography>
                <Typography sx= { btnicon } component= { Link } to= "/warehouse/physical-count"><FontAwesomeIcon icon= { faChevronLeft } /></Typography>
            </Stack>
            <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 }>
                <Box><Dashboard /></Box>
                <Filter />
                <Box sx= {{ overflowY: 'scroll', '&::-webkit-scrollbar': { display: 'none' } }}><Items /></Box>
            </Stack>
        </Stack>
    );
}

export default Index;