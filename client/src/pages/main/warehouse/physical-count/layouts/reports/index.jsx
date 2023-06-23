// Libraries
import { Box, Dialog, Stack, TextField, Typography, useMediaQuery } from "@mui/material";
import { Link, useParams } from "react-router-dom";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faChevronLeft, faFileArrowDown, faFilter, faMagnifyingGlass } from "@fortawesome/free-solid-svg-icons";
import { useContext, useState } from "react";
import { useTheme } from "@emotion/react";

// Core
import { FormCntxt } from "core/context/Form"; // Context
import { useGet } from "core/function/global"; // Function
import { reports, specific } from "core/api"; // API

// Components
import Dashboard from "./layouts/Dashboard";
import Items from "./layouts/Items";
import Filter from "./layouts/modal/Filter";
import Loader from "./layouts/Loader";

// Constants
import { btnexport, btnfilter, btnicon, search } from "./index.style"; // Styles

const Index = () => {
    const { id } = useParams();
    const { register, getValues, setValue } = useContext(FormCntxt);
    const theme = useTheme();
    const [ open, setOpen ] = useState(false);
    const fullscreen = useMediaQuery(theme.breakpoints.down('sm'));
    
    useGet({ key: ['pc_specific'], 
        fetch: specific({ table: 'tbl_physical_count', id: id }), 
        options: { refetchOnWindowFocus: false }, 
        onSuccess: data => {
            if(Array.isArray(data)) 
                for(let count = 0; count < Object.keys(data[0]).length; count++) { 
                    let _name = Object.keys(data[0])[count]; 
                    setValue(_name, _name === 'brands' || _name === 'branch' ? JSON.parse(data[0][_name]) : data[0][_name]);
                    setValue('status', null);
                    setValue('counter', null);
                }
        }
    });
    
    const { data: list, isFetching } = 
        useGet({ key: ['pc_report'], 
            fetch: reports({ table: 'tbl_physical_count', data: getValues() ?? {} }), 
            options: { refetchOnWindowFocus: false, refetchInterval: 1000 } });

    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= {{ width: '100%', overflow: 'hidden' }} spacing= { 1 }>
            <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 }>
                <Stack direction= "row" justifyContent= "space-between" alignItems= "center">
                    <Typography variant= "h6" sx= {{ fontFamily: 'Boldstrom', color: '#535b64' }}>Reports</Typography>
                    <Typography sx= { btnicon } component= { Link } to= "/warehouse/physical-count">
                        <FontAwesomeIcon icon= { faChevronLeft } />
                    </Typography>
                </Stack>
                <Box><Dashboard /></Box>
                <Stack direction= "row" justifyContent= "space-between" alignItems= "flex-start" spacing= { 1 }>
                    <form autoComplete= "off">
                        <Box sx= { search }>
                            <FontAwesomeIcon icon= { faMagnifyingGlass } size= "sm" style= {{ margin: '8px' }} />
                            <TextField { ...register('searchtxt') } variant= "standard" size= "small" fullWidth 
                                InputProps= {{ disableUnderline: true }} placeholder= "Search..." sx= {{ padding: '5px 0 0 0' }} />
                        </Box>
                    </form>
                    <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 }>
                        <Stack direction= "row" justifyContent= "flex-end" alignItems= "center" spacing= { 1 } sx= {{ flexGrow: 1 }}>
                            <Typography sx= { btnfilter } onClick= { () => setOpen(true) }>
                                <FontAwesomeIcon icon= { faFilter } style= {{ color: '#ffffff' }} size= "lg" />
                            </Typography>
                            <Typography sx= { btnexport }>
                                <FontAwesomeIcon icon= { faFileArrowDown } style= {{ color: '#ffffff' }} size= "lg" />
                            </Typography>
                        </Stack>
                    </Stack>
                </Stack>
            </Stack>
            <Box sx= {{ overflowY: 'scroll', '&::-webkit-scrollbar': { display: 'none' } }}>
                { !isFetching ? <Items list= { list } /> : <Loader />}
            </Box>
            <Dialog fullScreen= { fullscreen } open= { open } maxWidth= "xs" fullWidth= { true } disableEscapeKeyDown= { true }>
                <Filter setOpen= { setOpen } />
            </Dialog>
        </Stack>
    );
}

export default Index;