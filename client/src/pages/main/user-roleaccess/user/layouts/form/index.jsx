// Libraries
import { useContext, useEffect } from "react";
import { Link, useNavigate, useParams } from "react-router-dom";
import { Box, Divider, Grid, Stack, Typography } from "@mui/material";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faChevronLeft } from "@fortawesome/free-solid-svg-icons";
import { ThemeProvider } from "@emotion/react";

// Core
import { FormCntxt } from "core/context/Form"; // Context
import { successToast, useGet, usePost } from "core/function/global"; // Function
import { save, specific, update } from "core/api"; // API
import { theme } from "core/theme/form.theme"; // Theme

// Constants
import { validation as Validation } from "./index.validation"; // Validation
import { btnicon, btntxt, card } from "./index.style"; // Styles

// Layouts
import Account from "./layouts/Account";
import Basic from "./layouts/Basic";
import Employee from "./layouts/Employee";
import Benefits from "./layouts/Benefits";

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
        useGet({ key: ['usr_specific'], fetch: 
            specific({ table: 'tbl_users', id: id ?? null }), options: { enabled: type !== 'new', refetchOnWindowFocus: false }, 
            onSuccess: (data) => { 
                if(Array.isArray(data)) 
                    for(let count = 0; count < Object.keys(data[0]).length; count++) {
                        let _name = Object.keys(data[0])[count];
                        setValue(_name, data[0][_name]); 
                    } 
            } 
        });

    const { mutate: saving } =
        usePost({ fetch: save,
            onSuccess: (data) => {
                if(data.result === 'error') { (data.error).forEach((err, index) => { setError(err.name, { type: index === 0 ? 'focus' : '', message: err.message }, { shouldFocus: index === 0 }); }); }
                else { successToast(data.message, 3000, navigate('/user-roleaccess/user', { replace: true })); }
            } 
        });

    const { mutate: updating } =
        usePost({ fetch: update,
            onSuccess: (data) => {
                if(data.result === 'error') { (data.error).forEach((err, index) => { setError(err.name, { type: index === 0 ? 'focus' : '', message: err.message }, { shouldFocus: index === 0 }); }); }
                else { successToast(data.message, 3000, navigate('/user-roleaccess/user', { replace: true })); }
            }
        });

    useEffect(() => { setValidation(Validation()); if(id !== undefined) { refetch() } }, [ setValidation, id, refetch ]);

    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= {{ width: '100%', height: '100%', paddingBottom: '20px' }} spacing= { 3 }>
            <Stack direction= "row" justifyContent= "space-between" alignItems= "center">
                <Typography variant= "h6" sx= {{ fontFamily: 'Boldstrom', color: '#3C4048' }}>Users</Typography>
                <Typography sx= { btnicon } component= { Link } to= "/user-roleaccess/user" ><FontAwesomeIcon icon= { faChevronLeft }/></Typography>
            </Stack>
            <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" divider= { <Divider orientation= "horizontal" flexItem /> } sx= { card } spacing= { 2 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 2 }>
                    <Typography sx= {{ fontWeight: 'bold', textTransform: 'uppercase' }} variant= "body1" gutterBottom>Account Information</Typography>
                    <Account fetching= { isFetching } />
                </Stack>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 2 }>
                    <Typography sx= {{ fontWeight: 'bold', textTransform: 'uppercase' }} variant= "body1" gutterBottom>Basic Information</Typography>
                    <ThemeProvider theme= { theme(input) }><Basic fetching= { isFetching } /></ThemeProvider>
                </Stack>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 2 }>
                    <Typography sx= {{ fontWeight: 'bold', textTransform: 'uppercase' }} variant= "body1" gutterBottom>Employee Information</Typography>
                    <ThemeProvider theme= { theme(input) }><Employee fetching= { isFetching } /></ThemeProvider>
                </Stack>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 2 }>
                    <Typography sx= {{ fontWeight: 'bold', textTransform: 'uppercase' }} variant= "body1" gutterBottom>Benefits</Typography>
                    <Benefits fetching= { isFetching } />
                </Stack>
            </Stack>
            { type !== 'view' ?
                <Grid container direction= "row" justifyContent= "flex-end" alignItems= "center">
                    <Grid item xs= { 12 } sm= { 3 } lg= { 2 }>
                        <Box sx= { btntxt } onClick= { handleSubmit(data => {
                            let _errors = [];
                            data[type === 'new' ? 'created_by' : 'updated_by'] = localStorage.getItem('token');
                            
                            if(data.company_id === undefined) { _errors.push({ name: 'company_id', message: 'This field is required!' }); }
                            if(data.department_id === undefined) { _errors.push({ name: 'department_id', message: 'This field is required!' }); }
                            if(data.position_id === undefined) { _errors.push({ name: 'position_id', message: 'This field is required!' }); }
                            
                            if(_errors.length > 0) { _errors.forEach(err => setError(err.name, { message: err.message })); }
                            else { if(type === 'new') { saving({ table: 'tbl_users', data: data }); } else { updating({ table: 'tbl_users', data: data }); } }
                        }) }>Save</Box>
                    </Grid>
                </Grid> : '' }
        </Stack>
    );
}

export default Index;