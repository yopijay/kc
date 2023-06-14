// Libraries
import { faChevronLeft } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { Box, Grid, Stack, ThemeProvider, Typography } from "@mui/material"
import { Link, useNavigate, useParams } from "react-router-dom";
import { useContext, useEffect } from "react";

// Core
import { FormCntxt } from "core/context/Form"; // Context
import { ProfileCntx } from "core/context/Profile"; // Context
import { successToast, useGet, usePost } from "core/function/global"; // Function
import { save, specific } from "core/api"; // API

// Layouts
import Form from "./Form";

// Constants
import { btntxt, card } from "./index.style"; // Styles
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
    const { data } = useContext(ProfileCntx);
    const navigate = useNavigate();
    const { handleSubmit, setError, setValue } = useContext(FormCntxt);
    const { isFetching, refetch } =
        useGet({ key: ['pnl_specific'], fetch: specific({ table: 'tbl_physical_count_personnels', data: JSON.stringify({ id: id ?? null }) }), options: { enabled: type !== 'new', refetchOnWindowFocus: false },
            onSuccess: data => {
                if(Array.isArray(data))
                    for(let count = 0; count < Object.keys(data[0]).length; count++) {
                        let _name = Object.keys(data[0])[count];
                        setValue(_name, data[0][_name]);
                        setValue('employee', { id: data[0]['user_id'], name: data[0]['name'] });
                    }
            } 
        });

    const { mutate: saving } = usePost({ fetch: save, onSuccess: data => { successToast(data.message, 3000, navigate('/attendees', { replace: true })); } });
    useEffect(() => { if(id !== undefined) { refetch(); } }, [ id, refetch ]);
    
    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= {{ width: '100%', height: '100%', overflow: 'hidden' }} spacing= { 1 }>
            <Stack direction= "row" justifyContent= "flex-start" alignItems= "center" spacing= { 2 } sx= {{ padding: '0 5px' }}>
                <Typography component= { Link } to= "/attendees" sx= {{ cursor: 'pointer' }} color= "#444444"><FontAwesomeIcon icon= { faChevronLeft } size= "lg" /></Typography>
                <Typography sx= {{ fontWeight: 'bold' }} variant= "h6">Attendee ({ type.toUpperCase() })</Typography>
            </Stack>
            <Box sx= { card }><form autoComplete= "off"><ThemeProvider theme= { input }><Form fetching= { isFetching } /></ThemeProvider></form></Box>
            <Grid container direction= "row" justifyContent= "flex-end" alignItems= "center">
                <Grid item xs= { 6 } sm= { 3 } lg= { 2 }>
                    <Box sx= { btntxt } onClick= { handleSubmit(form => {
                        let errors = [];
                        form[type === 'new' ? 'created_by' : 'updated_by'] = atob(localStorage.getItem('token'));
                        form['form'] = type === 'new' ? 'create' : 'update';
                        form['physical_count_id'] = data.physical_count_id;

                        if(form.branch === undefined) { errors.push({ name: 'branch', message: 'This field is required!' }); }
                        if(form.employee === undefined) { errors.push({ name: 'employee', message: 'This field is required!' }); }
                        if(form.type === undefined) { errors.push({ name: 'type', message: 'This field is required!' }); }

                        if(!(errors.length > 0)) { saving({ table: `tbl_physical_count_personnels`, data: form }); }
                        else { errors.forEach(err => setError(err.name, { message: err.message })); }
                    }) }>Save</Box>
                </Grid>
            </Grid>
        </Stack>
    );
}

export default Index;