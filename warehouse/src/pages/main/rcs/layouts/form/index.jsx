// Libraries
import { faChevronLeft } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { Box, Grid, Stack, ThemeProvider, Typography } from "@mui/material"
import { Link, useNavigate, useParams } from "react-router-dom";
import { useContext, useEffect } from "react";

// Core
import { FormCntxt } from "core/context/Form"; // Context
import { successToast, useGet, usePost } from "core/function/global"; // Function
import { save, specific } from "core/api"; // API

// Constants
import { validation as Validation } from "./index.validation"; // Validation
import Form from "./layouts/Form"; // Layouts
import { btntxt } from "./index.style"; // Styles
import { ProfileCntx } from "core/context/Profile";
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
    const { data } = useContext(ProfileCntx);
    const navigate = useNavigate();
    const { handleSubmit, setValue, setValidation, setError, getValues } = useContext(FormCntxt);
    const { refetch, isFetching } =
        useGet({ key: ['itm_specific'], 
            fetch: specific({ table: 'tbl_physical_count_rcs', data: JSON.stringify({ id: id ?? null, physical_count_id: data.physical_count_id }) }), 
            options: { enabled: type !== 'new', refetchOnWindowFocus: false },
            onSuccess: data => {
                if(Array.isArray(data))
                    if(data.length > 0)
                        for(let count = 0; count < Object.keys(data[0]).length; count++) {
                            let _name = Object.keys(data[0])[count];
                            setValue(_name, data[0][_name]);
                        }
            } 
        });

    const { mutate: assign } =
        usePost({ fetch: save,
            onSuccess: res => {
                if(res.result === 'error') { (res.error).forEach((err, index) => { setError(err.name, { type: index === 0 ? 'focus' : '', message: err.message }, { shouldFocus: index === 0 }); }); } 
                else { successToast(res.message, 3000, navigate('/rcs', { replace: true })); } 
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
            { getValues()?.rcs_date === null ?
                <Grid container direction= "row" justifyContent= "flex-end" alignItems= "center">
                    <Grid item xs= { 6 } sm= { 3 } lg= { 2 }>
                        <Box sx= { btntxt } onClick= { handleSubmit(form => {
                            let errors = [];
                            form['assigned_by'] = atob(localStorage.getItem('token'));
                            form['physical_count_id'] = data.physical_count_id;
                            
                            if(form.rcs === null) { errors.push({ name: 'rcs', message: 'This field is required!' }); }

                            if(!(errors.length > 0)) { assign({ table: 'tbl_physical_count_rcs', data: form }); }
                            else { errors.forEach(err => setError(err.name, { message: err.message })); }
                        }) }>Assign</Box>
                    </Grid>
                </Grid> : '' }
        </Stack>
    );
}

export default Index;