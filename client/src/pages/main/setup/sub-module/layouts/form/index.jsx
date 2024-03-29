// Libraries
import { faChevronLeft } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { Box, Grid, Stack, Typography } from "@mui/material";
import { useContext, useEffect } from "react";
import { Link, useNavigate, useParams } from "react-router-dom";

// Core
import { FormCntxt } from "core/context/Form"; // Context
import { successToast, useGet, usePost } from "core/function/global"; // Function
import { save, specific, update } from "core/api"; // API

// Constants
import { btnicon, btntxt, card } from "./index.style"; // Styles
import Form from "./layouts/Form"; // Layout
import { validation as Validation } from './index.validation'; // Validation

const Index = () => {
    const { type, id } = useParams();
    const navigate = useNavigate();
    const { setValidation, setValue, setError, handleSubmit } = useContext(FormCntxt);
    const { isFetching, refetch } =  
        useGet({ key: ['smdl_specific'], fetch: specific({ table: 'tbl_sub_module', id: id ?? null }), options: { enabled: type !== 'new', refetchOnWindowFocus: false }, 
            onSuccess: (data) => {
                if(Array.isArray(data)) 
                    for(let count = 0; count < Object.keys(data[0]).length; count++) {
                        let _name = Object.keys(data[0])[count]; 
                        setValue(_name, _name === 'module' ? `/${(data[0][_name]).toLowerCase()}` : _name === 'status' || _name === 'is_maintenance' ? data[0][_name] === 1 : data[0][_name]);
                    }
            } 
        });

    const { mutate: saving } = 
        usePost({ fetch: save, 
            onSuccess: (data) => {
                if(data.result === 'error') { (data.error).forEach((err, index) => { setError(err.name, { type: index === 0 ? 'focus' : '', message: err.message }, { shouldFocus: index === 0 }); }); }
                else { successToast(data.message, 3000, navigate('/setup/submodule', { replace: true })); } 
            } 
        });

    const { mutate: updating } = 
        usePost({ fetch: update, 
            onSuccess: (data) => {
                if(data.result === 'error') { (data.error).forEach((err, index) => { setError(err.name, { type: index === 0 ? 'focus' : '', message: err.message }, { shouldFocus: index === 0 }); }); }
                else { successToast(data.message, 3000, navigate('/setup/submodule', { replace: true })); } 
            } 
        });

    useEffect(() => { setValidation(Validation()); if(id !== undefined) { refetch(); } }, [ setValidation, id, refetch ]);

    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= {{ width: '100%', height: '100%', paddingBottom: '20px' }} spacing= { 3 }>
            <Stack direction= "row" justifyContent= "space-between" alignItems= "center">
                <Typography variant= "h6" sx= {{ fontFamily: 'Boldstrom', color: '#535b64' }}>{ type } Sub module</Typography>
                <Typography sx= { btnicon } component= { Link } to= "/setup/submodule" ><FontAwesomeIcon icon= { faChevronLeft }/></Typography>
            </Stack>
            <Box sx= { card }><form autoComplete= "off"><Form fetching= { isFetching } /></form></Box>
            { type !== 'view' ?
                <Grid container direction= "row" justifyContent= "flex-end" alignItems= "center">
                    <Grid item xs= { 12 } sm= { 3 } lg= { 2 }>
                        <Box sx= { btntxt } onClick= { handleSubmit(data => {
                            let errors = [];
                            data[type === 'new' ? 'created_by' : 'updated_by'] = atob(localStorage.getItem('token'));

                            if(data.module_id === undefined) { errors.push({ name: 'module_id', message: 'This field is required!' }); }

                            if(!(errors.length > 0)) {
                                if(type === 'new') { saving({ table: 'tbl_sub_module', data: data }); }
                                else { updating({ table: 'tbl_sub_module', data: data }); }
                            }
                            else { errors.forEach(err => setError(err.name, { message: err.message })); }
                        }) }>Save</Box>
                    </Grid>
                </Grid> : '' }
        </Stack>
    );
}

export default Index;