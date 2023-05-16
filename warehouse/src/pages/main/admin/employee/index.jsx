// Libraries
import { faChevronLeft } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { Stack, Typography } from "@mui/material";
import { Link } from "react-router-dom";

// Constants
import { btnicon } from "../index.style"; // Styles

const Index = () => {
    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= {{ width: '100%', height: '100%' }} spacing= { 3 }>
            <Stack direction= "row" justifyContent= "flex-start" alignItems= "center" spacing= { 2 }>
                <Typography sx= { btnicon } component= { Link } to= "/"><FontAwesomeIcon icon= { faChevronLeft } /></Typography>
                <Typography variant= "h5" sx= {{ fontWeight: 'bold' }}>Employee</Typography>
            </Stack>
        </Stack>
    );
}

export default Index;