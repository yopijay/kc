// Libraries
import { Box, Stack, TextField, Typography } from "@mui/material";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faFileArrowDown, faFilter, faMagnifyingGlass } from "@fortawesome/free-solid-svg-icons";
import { useContext } from "react";

// Core
import { FormCntxt } from "core/context/Form"; // Context

// Constants
import { btnexport, btnfilter, search } from "../index.style"; // Styles

const Filter = () => {
    const { register } = useContext(FormCntxt);
    return (
        <Stack direction= "row" justifyContent= "space-between" alignItems= "center" spacing= { 1 }>
            <form autoComplete= "off">
                <Box sx= { search }>
                    <FontAwesomeIcon icon= { faMagnifyingGlass } size= "sm" style= {{ margin: '8px' }} />
                    <TextField { ...register('searchtxt') } variant= "standard" size= "small" fullWidth InputProps= {{ disableUnderline: true }} placeholder= "Search..." sx= {{ padding: '5px 0 0 0' }} />
                </Box>
            </form>
            <Stack direction= "row" justifyContent= "flex-end" alignItems= "center" spacing= { 1 } sx= {{ flexGrow: 1 }}>
                <Typography sx= { btnfilter }>
                    <FontAwesomeIcon icon= { faFilter } style= {{ color: '#ffffff' }} size= "lg" />
                </Typography>
                <Typography sx= { btnexport }>
                    <FontAwesomeIcon icon= { faFileArrowDown } style= {{ color: '#ffffff' }} size= "lg" />
                </Typography>
            </Stack>
        </Stack>
    );
}

export default Filter;