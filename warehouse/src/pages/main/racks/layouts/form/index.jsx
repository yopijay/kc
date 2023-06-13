// Libraries
import { faChevronLeft } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { Box, Stack, ThemeProvider, Typography } from "@mui/material"
import { Link, useParams } from "react-router-dom";
import { useContext, useEffect } from "react";

// Core
import { FormCntxt } from "core/context/Form"; // Context
import { useGet } from "core/function/global"; // Function
import { specific } from "core/api"; // API

// Layouts
import Form from "./layouts/Form";
import Items from "./layouts/Items";

// Constants
const card = { flexGrow: 1, backgroundColor: '#ffffff', padding: '20px', borderRadius: '8px',  overflowY: 'scroll', '&::-webkit-scrollbar': { display: 'none' } }
const input = {
    MuiInput: {
        styleOverrides: {
            root: {
                '&:before': { borderBottom: 'none' },
                '&:after': { borderBottom: 'none' },
                '&.Mui-disabled:before': { borderBottom: 'none' },
                '&:hover:not(.Mui-disabled):before': { borderBottom: 'none' }
            },
            input: { textTransform: 'uppercase' }
        }
    }
}

const Index = () => {
    const { type, id } = useParams();
    const { setValue } = useContext(FormCntxt);
    const { isFetching, refetch } =  
        useGet({ key: ['cmp_specific'], fetch: specific({ table: 'tbl_racks', id: id ?? null }), options: { enabled: type !== 'new', refetchOnWindowFocus: false}, 
            onSuccess: (data) => {
                if(Array.isArray(data)) 
                    for(let count = 0; count < Object.keys(data[0]).length; count++) { 
                        let _name = Object.keys(data[0])[count]; 
                        setValue(_name, data[0][_name]); 
                    }
            }
        });
    
    useEffect(() => { if(id !== undefined) { refetch(); } }, [ id, refetch ]);

    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= {{ width: '100%', height: '100%', overflow: 'hidden' }} spacing= { 1 }>
            <Stack direction= "row" justifyContent= "flex-start" alignItems= "center" spacing= { 2 } sx= {{ padding: '0 5px' }}>
                <Typography component= { Link } to= "/racks" sx= {{ cursor: 'pointer' }} color= "#444444"><FontAwesomeIcon icon= { faChevronLeft } size= "lg" /></Typography>
                <Typography sx= {{ fontWeight: 'bold' }} variant= "h6">Rack ({ type.toUpperCase() })</Typography>
            </Stack>
            <Box sx= { card }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 3 }>
                    <ThemeProvider theme= { input }><Form fetching= { isFetching } /></ThemeProvider>
                    <Items />
                </Stack>
            </Box>
        </Stack>
    );
}

export default Index;