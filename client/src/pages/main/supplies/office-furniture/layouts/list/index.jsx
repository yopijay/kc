// Libraries
import { faEllipsisH, faFileArrowDown, faFileArrowUp, faMagnifyingGlass, faPlus } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { Box, FormLabel, Stack, TextField, Typography } from "@mui/material";
import { useContext } from "react";
import { Link } from "react-router-dom";

// Core
import { ProfileCntx } from "core/context/Profile"; // Context
import { GlobalCntx } from "core/context/Global"; // Context

// Constants
import { btnexport, btnicon, btnimport, btntxt, search } from "./index.style"; // Styles

// Layouts
import Loader from "./layouts/Loader";

const Index = () => {
    const { data } = useContext(ProfileCntx);
    const { message, errors } = useContext(GlobalCntx);

    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= {{ width: '100%', overflow: 'hidden' }} spacing= { 1 }>
            <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 }>
                <Typography variant= "h6" sx= {{ fontFamily: 'Boldstrom', color: '#3C4048' }}>Office Furniture</Typography>
                <Stack direction= "row" justifyContent= "space-between" alignItems= "flex-start" spacing= { 1 }>
                    <form autoComplete= "off">
                        <Box sx= { search }>
                            <FontAwesomeIcon icon= { faMagnifyingGlass } size= "sm" style= {{ margin: '8px' }} />
                            <TextField variant= "standard" size= "small" fullWidth InputProps= {{ disableUnderline: true }} placeholder= "Search..." sx= {{ padding: '5px 0 0 0' }} />
                        </Box>
                    </form>
                    <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 }>
                        <Stack direction= "row" justifyContent= "flex-end" alignItems= "center" sx= {{ flexGrow: 1 }} spacing= { 1 }>
                            { data.user_level === 'superadmin' ? 
                                <input type= "file" name= "upload-ifle" id= "upload-file" style= {{ width: '0.1px', height: '0.1px', opcaity: 0, overflow: 'hidden', position: 'absolute', zIndex: -1 }} /> : '' }
                            { data.user_level === 'superadmin' ? <FormLabel htmlFor= "updload-file" sx= { btnimport }>
                                <FontAwesomeIcon icon= { faFileArrowUp } style= {{ color: '#FFFFFF' }} size= "lg" />
                                {/* <FontAwesomeIcon icon= { !uploading ? faFileArrowUp : faEllipsisH } style= {{ color: '#FFFFFF' }} size= "lg" /> */}
                            </FormLabel> : '' }
                            <Typography sx= { btnexport }><FontAwesomeIcon icon= { faFileArrowDown } style= {{ color: '#FFFFFF' }} size= "lg" /></Typography>
                            <Typography component= { Link } to= "/supplies/office-furniture/form/new" sx= { btnicon }>
                                <FontAwesomeIcon icon= { faPlus } style= {{ color: '#FFFFFF' }} size= "lg" />
                            </Typography>
                            <Typography component= { Link } to= "/supplies/office-furniture/form/new" sx= { btntxt }>New Office Furniture</Typography>
                        </Stack>
                        <Stack direction= "column" justifyContent= "flex-start" alignItems= "flex-end">
                            <Typography variant= "body2" sx= {{ color: '#557153', textAlign: 'right' }}>{ message }</Typography>
                            { errors.map((err, index) => 
                                <Typography variant= "caption" sx= {{ color: '#F47C7C', textAlign: 'right' }} key= { index }>{ `Error on row${err.row}, ${JSON.stringify(err.errors)}` }</Typography>) }
                        </Stack>
                    </Stack>
                </Stack>
            </Stack>
            <Box sx= {{ overflowY: 'scroll', '&::-webkit-scrollbar': { display: 'none' } }}><Loader /></Box>
        </Stack>
    );
}

export default Index;