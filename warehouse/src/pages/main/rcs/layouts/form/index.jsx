// Libraries
import { faChevronLeft } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { Box, Grid, Stack, ThemeProvider, Typography } from "@mui/material"
import { Link, useNavigate, useParams } from "react-router-dom";
import { useContext, useEffect } from "react";

// Core
import { FormCntxt } from "core/context/Form"; // Context
import { useGet } from "core/function/global"; // Function
import { specific } from "core/api"; // API

// Constants
import { validation as Validation } from "./index.validation"; // Validation
import Form from "./layouts/Form"; // Layouts
import { btntxt } from "./index.style"; // Styles
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
    const { id, type } = useParams();
    const navigate = useNavigate();
    const { handleSubmit, setValue, setValidation } = useContext(FormCntxt);
    const { refetch, isFetching } =
        useGet({ key: ['itm_specific'], fetch: specific({ table: 'tbl_physical_count_rcs', id: id ?? null }), options: { enabled: type !== 'new', refetchOnWindowFocus: false },
            onSuccess: data => {
                if(Array.isArray(data))
                    if(data.length > 0)
                        for(let count = 0; count < Object.keys(data[0]).length; count++) {
                            let _name = Object.keys(data[0])[count];
                            setValue(_name, _name === 'status' ? data[0][_name] === 1 : data[0][_name]);
                        }
            } 
        });

    useEffect(() => { setValidation(Validation()); if(id !== undefined && id !== null) { refetch() } }, [ setValidation, id, refetch ]);

    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= {{ width: '100%', height: '100%', overflow: 'hidden' }} spacing= { 1 }>
            <Stack direction= "row" justifyContent= "flex-start" alignItems= "center" spacing= { 2 } sx= {{ padding: '0 5px' }}>
                <Typography component= { Link } to= "/rcs" sx= {{ cursor: 'pointer' }} color= "#444444"><FontAwesomeIcon icon= { faChevronLeft } size= "lg" /></Typography>
                <Typography sx= {{ fontWeight: 'bold' }} variant= "h6">Rack Count Sheet</Typography>
            </Stack>
            <Box sx= { card }><form autoComplete= "off"><ThemeProvider theme= { input }><Form fetching= { isFetching } /></ThemeProvider></form></Box>
            { type !== 'view' ?
                <Grid container direction= "row" justifyContent= "flex-end" alignItems= "center">
                    <Grid item xs= { 12 } sm= { 3 } lg= { 2 }>
                        <Box sx= { btntxt } onClick= { handleSubmit(data => {
                            let errors = [];
                            data[type === 'new' ? 'created_by' : 'updated_by'] = atob(localStorage.getItem('token'));

                            if(data.brand_id === undefined) { errors.push({ name: 'brand_id', message: 'This field is required!' }); }
                            if(data.rack_id === undefined) { errors.push({ name: 'rack_id', message: 'This field is required!' }); }
                        }) }>Save</Box>
                    </Grid>
                </Grid> : '' }
        </Stack>
    );
}

export default Index;