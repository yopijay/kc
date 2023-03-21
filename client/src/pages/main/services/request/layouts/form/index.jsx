// Libraries
import { faChevronLeft } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { Box, Divider, Grid, Stack, ThemeProvider, Typography } from "@mui/material";
import { useContext, useEffect } from "react";
import { Link, useNavigate, useParams } from "react-router-dom";

// Core
import { FormCntxt } from "core/context/Form"; // Context
import { errorToast, successToast, useGet, usePost } from "core/function/global"; // Function
import { save, specific, update } from "core/api"; // API
import { theme } from "core/theme/form.theme"; // Theme

// Constants
import { btnicon, btntxt, card } from "./index.style"; // Styles
import { validation as Validation } from './index.validation'; // Validation

// Layouts
import Header from "./layouts/Header";
import Sales from "./layouts/sales";

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
    const navigate = useNavigate();
    const { setValidation, setValue, setError, handleSubmit, getValues } = useContext(FormCntxt);
    const { isFetching, refetch } =  
        useGet({ key: ['srvc_specific'], fetch: specific({ table: 'tbl_services', id: id ?? null }), options: { enabled: type !== 'new', refetchOnWindowFocus: false}, 
            onSuccess: (data) => {
                if(Array.isArray(data)) 
                    for(let count = 0; count < Object.keys(data[0]).length; count++) { 
                        let _name = Object.keys(data[0])[count]; 
                        setValue(_name, _name === 'requests' || _name === 'items' ? JSON.parse(data[0][_name]) : data[0][_name]); 
                    }
            }
        });

    const { mutate: saving } = 
        usePost({ fetch: save, 
            onSuccess: (data) => {
                if(data.result === 'error') { (data.error).forEach((err, index) => { setError(err.name, { type: index === 0 ? 'focus' : '', message: err.message }, { shouldFocus: index === 0 }); }); }
                else { successToast(data.message, 3000, navigate('/services/request', { replace: true })); } 
            } 
        });

    const { mutate: updating } = 
        usePost({ fetch: update, 
            onSuccess: (data) => {
                if(data.result === 'error') { (data.error).forEach((err, index) => { setError(err.name, { type: index === 0 ? 'focus' : '', message: err.message }, { shouldFocus: index === 0 }); }); } 
                else { successToast(data.message, 3000, navigate('/services/request', { replace: true })); } 
            } 
        });

    useEffect(() => { setValidation(Validation()); if(id !== undefined) { refetch(); } }, [ setValidation, id, refetch ]);

    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= {{ width: '100%', height: '100%', paddingBottom: '20px' }} spacing= { 3 }>
            <Stack direction= "row" justifyContent= "space-between" alignItems= "center">
                <Typography variant= "h6" sx= {{ fontFamily: 'Boldstrom', color: '#3C4048' }}>{ type } Service request</Typography>
                <Typography sx= { btnicon } component= { Link } to= "/services/request" ><FontAwesomeIcon icon= { faChevronLeft }/></Typography>
            </Stack>
            <Box sx= { card }>
                <form autoComplete= "off">
                    <ThemeProvider theme= { theme(input) }>
                        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= {{ width: '100%' }} divider={ <Divider orientation="horizontal" flexItem /> } spacing= { 2 }>
                            <Header fetching= { isFetching } />
                            <Sales fetching= { isFetching } />
                        </Stack>
                    </ThemeProvider>
                </form>
            </Box>
            { type !== 'view' && !(getValues()?.status !== undefined && getValues()?.status === 'approved') ?
                <Grid container direction= "row" justifyContent= "flex-end" alignItems= "center">
                    <Grid item xs= { 12 } sm= { 3 } lg= { 2 }>
                        <Box sx= { btntxt } onClick= { handleSubmit(data => {
                            data[type === 'new' ? 'created_by' : 'updated_by'] = atob(localStorage.getItem('token'));
                            data['form'] = 'request';
                            
                            if((data.requests).length > 0) {
                                if(type === 'new') { saving({ table: 'tbl_services', data: data }); }
                                else { updating({ table: 'tbl_services', data: data }); }
                            }
                            else { errorToast('Request list must not be empty!', 3000); }
                        }) }>Save</Box>
                    </Grid>
                </Grid> : '' }
        </Stack>
    );
}

export default Index;