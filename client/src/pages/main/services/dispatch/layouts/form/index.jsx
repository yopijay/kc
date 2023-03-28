// Libraries
import { faChevronLeft } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { Box, Divider, Grid, Stack, ThemeProvider, Typography } from "@mui/material";
import { useContext, useEffect } from "react";
import { Link, useNavigate, useParams } from "react-router-dom";

// Core
import { FormCntxt } from "core/context/Form"; // Context
import { successToast, useGet, usePost } from "core/function/global"; // Function
import { evaluate, specific } from "core/api"; // API
import { theme } from "core/theme/form.theme"; // Theme

// Constants
import { btnerror, btnicon, btntxt, card } from "./index.style"; // Styles
import { validation as Validation } from './index.validation'; // Validation

// Layouts
import Header from "./layouts/Header";
import Sales from "./layouts/sales";
import Technical from "./layouts/technical";

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

    const { mutate: dispatching } = 
        usePost({ fetch: evaluate, 
            onSuccess: (data) => {
                if(data.result === 'error') { (data.error).forEach((err, index) => { setError(err.name, { type: index === 0 ? 'focus' : '', message: err.message }, { shouldFocus: index === 0 }); }); } 
                else { successToast(data.message, 3000, navigate('/services/dispatch', { replace: true })); } 
            } 
        });

    const { mutate: closed } = 
        usePost({ fetch: evaluate,
            onSuccess: data => {
                if(data.result === 'error') { (data.error).forEach((err, index) => { setError(err.name, { type: index === 0 ? 'focus' : '', message: err.message }, { shouldFocus: index === 0 }); }); } 
                else { successToast(data.message, 3000, navigate('/services/dispatch', { replace: true })); } 
            } 
        });

    useEffect(() => { setValidation(Validation()); if(id !== undefined) { refetch(); } }, [ setValidation, id, refetch ]);

    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= {{ width: '100%', height: '100%', paddingBottom: '20px' }} spacing= { 3 }>
            <Stack direction= "row" justifyContent= "space-between" alignItems= "center">
                <Typography variant= "h6" sx= {{ fontFamily: 'Boldstrom', color: '#3C4048' }}>{ type } Dispatching</Typography>
                <Typography sx= { btnicon } component= { Link } to= "/services/dispatch" ><FontAwesomeIcon icon= { faChevronLeft }/></Typography>
            </Stack>
            <Box sx= { card }>
                <form autoComplete= "off">
                    <ThemeProvider theme= { theme(input) }>
                        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= {{ width: '100%' }} divider={ <Divider orientation="horizontal" flexItem /> } spacing= { 2 }>
                            <Header fetching= { isFetching } />
                            <Sales fetching= { isFetching } />
                            <Technical fetching= { isFetching } />
                        </Stack>
                    </ThemeProvider>
                </form>
            </Box>
            { type !== 'view' && (getValues()?.status !== undefined && (getValues()?.status === 'posted' || getValues()?.status === 'saved' || getValues()?.status === 'approved')) ?
                <Grid container direction= "row" justifyContent= "flex-end" alignItems= "center">
                    <Grid item xs= { 4 } sm= { 3 } lg= { 2 } sx= {{ padding: '0 5px 0 0'}}>
                        <Box sx= { btnerror } onClick= { handleSubmit(data => {
                            data[type === 'new' ? 'created_by' : 'updated_by'] = atob(localStorage.getItem('token'));
                            data['form'] = 'dispatch';
                            data['status'] = 'closed';

                            closed({ table: 'tbl_services', type: 'closed', data: data });
                        }) }>Close</Box>
                    </Grid>
                    <Grid item xs= { 4 } sm= { 3 } lg= { 2 } sx= {{ padding: '0 5px' }}>
                        <Box sx= { btntxt } onClick= { handleSubmit(data => {
                            let errors = [];
                            data[type === 'new' ? 'created_by' : 'updated_by'] = atob(localStorage.getItem('token'));
                            data['form'] = 'dispatch';
                            
                            if(data.evaluated_by === null || data.evaluated_by === '') { errors.push({ name: 'evaluated_by', message: 'This field is required!' }); }
                            if(data.noted_by === null || data.noted_by === '') { errors.push({ name: 'noted_by', message: 'This field is required!' }); }
                            if(data.received_by === null || data.received_by === '') { errors.push({ name: 'received_by', message: 'This field is required!' }); }
                            if((data.evaluated_by !== null && data.evaluated_by !== '') && data.evaluated_by_signature === null) { errors.push({ name: 'evaluated_by', message: 'Please put your signature!' }); }
                            if((data.eval_noted_by_sup !== null && data.eval_noted_by_sup !== '') && data.eval_noted_by_sup_signature === null) { errors.push({ name: 'eval_noted_by_sup', message: 'Please put your signature!' }); }
                            if((data.prepared_by !== null && data.prepared_by !== '') && data.prepared_by_signature === null) { errors.push({ name: 'prepared_by', message: 'Please put your signature!' }); }
                            if((data.noted_by !== null && data.noted_by !== '') && data.noted_by_signature === null) { errors.push({ name: 'noted_by', message: 'Please put your signature!' }); }
                            if((data.released_by !== null && data.released_by !== '') && data.released_by_signature === null) { errors.push({ name: 'released_by', message: 'Please put your signature!' }); }
                            if((data.authorized_by !== null && data.authorized_by !== '') && data.authorized_by_signature === null) { errors.push({ name: 'authorized_by', message: 'Please put your signature!' }); }
                            if((data.approved_by !== null && data.approved_by !== '') && data.approved_by_signature === null) { errors.push({ name: 'approved_by', message: 'Please put your signature!' }); }
                            if((data.received_by !== null && data.received_by !== '') && data.received_by_signature === null) { errors.push({ name: 'received_by', message: 'Please put your signature!' }); }

                            if(!(errors.length > 0)) { data['status'] = 'dispatch'; dispatching({ table: 'tbl_services', type: 'dispatch', data: data }); }
                            else { errors.forEach(err => setError(err.name, { message: err.message })); }
                        }) }>Dispatch</Box>
                    </Grid>
                    <Grid item xs= { 4 } sm= { 3 } lg= { 2 } sx= {{ padding: '0 0 0 5px' }}>
                        <Box sx= { btntxt } onClick= { handleSubmit(data => {
                            let errors = [];
                            data[type === 'new' ? 'created_by' : 'updated_by'] = atob(localStorage.getItem('token'));
                            data['form'] = 'dispatch';
                            data['status'] = 'approved';
                            
                            if((data.evaluated_by !== null && data.evaluated_by !== '') && data.evaluated_by_signature === null) { errors.push({ name: 'evaluated_by', message: 'Please put your signature!' }); }
                            if((data.eval_noted_by_sup !== null && data.eval_noted_by_sup !== '') && data.eval_noted_by_sup_signature === null) { errors.push({ name: 'eval_noted_by_sup', message: 'Please put your signature!' }); }
                            if((data.prepared_by !== null && data.prepared_by !== '') && data.prepared_by_signature === null) { errors.push({ name: 'prepared_by', message: 'Please put your signature!' }); }
                            if((data.noted_by !== null && data.noted_by !== '') && data.noted_by_signature === null) { errors.push({ name: 'noted_by', message: 'Please put your signature!' }); }
                            if((data.released_by !== null && data.released_by !== '') && data.released_by_signature === null) { errors.push({ name: 'released_by', message: 'Please put your signature!' }); }
                            if((data.authorized_by !== null && data.authorized_by !== '') && data.authorized_by_signature === null) { errors.push({ name: 'authorized_by', message: 'Please put your signature!' }); }
                            if((data.approved_by !== null && data.approved_by !== '') && data.approved_by_signature === null) { errors.push({ name: 'approved_by', message: 'Please put your signature!' }); }
                            if((data.received_by !== null && data.received_by !== '') && data.received_by_signature === null) { errors.push({ name: 'received_by', message: 'Please put your signature!' }); }

                            if(!(errors.length > 0)) { dispatching({ table: 'tbl_services', type: 'dispatch', data: data }); }
                            else { errors.forEach(err => setError(err.name, { message: err.message })); }
                        }) }>Save</Box>
                    </Grid>
                </Grid> : '' }
        </Stack>
    );
}

export default Index;