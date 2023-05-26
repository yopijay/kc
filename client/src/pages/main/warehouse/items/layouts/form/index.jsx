// Libraries
import { faChevronLeft } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { Box, Grid, Stack, ThemeProvider, Typography } from "@mui/material";
import { useContext, useEffect } from "react";
import { Link, useNavigate, useParams } from "react-router-dom";

// Core
import { FormCntxt } from "core/context/Form"; // Context
import { successToast, useGet, usePost } from "core/function/global"; // Function
import { save, specific, update } from "core/api"; // API
import { theme } from "core/theme/form.theme"; // Theme

// Layouts
import Info from "./layouts/Info";
import Photo from "./layouts/Photo";

// Constants
import { btnicon, btntxt, card } from "./index.style"; // Styles
import { validation as Validation } from './index.validation'; // Validation

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
    const { setValidation, setValue, setError, handleSubmit } = useContext(FormCntxt);
    const { isFetching, refetch } =  
        useGet({ key: ['cmp_specific'], fetch: specific({ table: 'tbl_items', id: id ?? null }), options: { enabled: type !== 'new', refetchOnWindowFocus: false}, 
            onSuccess: (data) => { 
                if(Array.isArray(data)) 
                    for(let count = 0; count < Object.keys(data[0]).length; count++) {
                        let _name = Object.keys(data[0])[count];
                        setValue(_name, _name === 'status' ? data[0][_name] === 1 : data[0][_name]);
                    }
            }
        });

    const { mutate: saving } = 
        usePost({ fetch: save, 
            onSuccess: (data) => {
                if(data.result === 'error') { (data.error).forEach((err, index) => { setError(err.name, { type: index === 0 ? 'focus' : '', message: err.message }, { shouldFocus: index === 0 }); }); } 
                else { successToast(data.message, 3000, navigate('/warehouse/item', { replace: true })); } 
            } 
        });

    const { mutate: updating } = 
        usePost({ fetch: update, 
            onSuccess: (data) => { 
                if(data.result === 'error') { (data.error).forEach((err, index) => { setError(err.name, { type: index === 0 ? 'focus' : '', message: err.message }, { shouldFocus: index === 0 }); }); } 
                else { successToast(data.message, 3000, navigate('/warehouse/item', { replace: true })); }
            } 
        });

    useEffect(() => { setValidation(Validation()); if(id !== undefined) { refetch(); } }, [ setValidation, id, refetch ]);

    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= {{ width: '100%', height: '100%', paddingBottom: '20px' }} spacing= { 3 }>
            <Stack direction= "row" justifyContent= "space-between" alignItems= "center">
                <Typography variant= "h6" sx= {{ fontFamily: 'Boldstrom', color: '#535b64' }}>{ type } Item</Typography>
                <Typography sx= { btnicon } component= { Link } to= "/warehouse/item" ><FontAwesomeIcon icon= { faChevronLeft }/></Typography>
            </Stack>
            <Box sx= { card }>
                <form autoComplete= "off">
                    <Photo fetching= { isFetching } />
                    <ThemeProvider theme= { theme(input) }><Info fetching= { isFetching } /></ThemeProvider>
                </form>
            </Box>
            { type !== 'view' ?
                <Grid container direction= "row" justifyContent= "flex-end" alignItems= "center">
                    <Grid item xs= { 12 } sm= { 3 } lg= { 2 }>
                        <Box sx= { btntxt } onClick= { handleSubmit(data => {
                            let errors = [];
                            data[type === 'new' ? 'created_by' : 'updated_by'] = atob(localStorage.getItem('token'));

                            if(data.brand_id === undefined) { errors.push({ name: 'brand_id', message: 'This field is required!' }); }
                            if(data.rack_id === undefined) { errors.push({ name: 'rack_id', message: 'This field is required!' }); }
                            // if(data.total <= 0) { errors.push({ name: 'total', message: 'Total must be greater than 0!' }); }
                            
                            if(!(errors.length > 0)) {
                                if(type === 'new') { saving({ table: 'tbl_items', data: data }); }
                                else { updating({ table: 'tbl_items', data: data }); }
                            }
                            else { errors.forEach(err => setError(err.name, { message: err.message })); }
                        }) }>Save</Box>
                    </Grid>
                </Grid> : '' }
        </Stack>
    );
}

export default Index;