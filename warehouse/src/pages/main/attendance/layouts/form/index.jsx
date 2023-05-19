// Libraries
import { faChevronLeft } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { Box, Grid, Stack, ThemeProvider, Typography } from "@mui/material"
import { Link, useNavigate, useParams } from "react-router-dom";
import { useContext } from "react";

// Core
import { FormCntxt } from "core/context/Form"; // Context
import { ProfileCntx } from "core/context/Profile"; // Context
import { successToast, usePost } from "core/function/global"; // Function
import { save } from "core/api"; // API

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
    const { type } = useParams();
    const { data } = useContext(ProfileCntx);
    const navigate = useNavigate();
    const { handleSubmit, setError } = useContext(FormCntxt);
    const { mutate: saving } = usePost({ fetch: save, onSuccess: data => { successToast(data.message, 3000, navigate('/attendees', { replace: true })); } });
    
    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= {{ width: '100%', height: '100%', overflow: 'hidden' }} spacing= { 1 }>
            <Stack direction= "row" justifyContent= "flex-start" alignItems= "center" spacing= { 2 } sx= {{ padding: '0 5px' }}>
                <Typography component= { Link } to= "/attendees" sx= {{ cursor: 'pointer' }} color= "#444444"><FontAwesomeIcon icon= { faChevronLeft } size= "lg" /></Typography>
                <Typography sx= {{ fontWeight: 'bold' }} variant= "h6">Attendee ({ type.toUpperCase() })</Typography>
            </Stack>
            <Box sx= { card }><form autoComplete= "off"><ThemeProvider theme= { input }><Form /></ThemeProvider></form></Box>
            <Grid container direction= "row" justifyContent= "flex-end" alignItems= "center">
                <Grid item xs= { 6 } sm= { 3 } lg= { 2 }>
                    <Box sx= { btntxt } onClick= { handleSubmit(form => {
                        let errors = [];
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