// Libraries
import { useContext, useEffect } from "react";
import { Link, useNavigate, useParams } from "react-router-dom";
import { Box, Grid, Stack, ThemeProvider, Typography } from "@mui/material";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faChevronLeft } from "@fortawesome/free-solid-svg-icons";

// Core
import { save, specific, update } from "core/api"; // API
import { FormCntxt } from "core/context/Form"; // Context
import { infoToast, successToast, useGet, usePost } from "core/function/global"; // Function
import { theme } from "core/theme/form.theme"; // Themes

// Constants
import { validation as Validation } from './index.validation'; // Validation
import { btnicon, btntxt, card } from "./index.style"; // Styles
import Form from "./layouts/Form"; // Layouts

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
        useGet({ key: ['issuance_specific'], fetch: specific({ table: `tbl_assign_asset`, id: id ?? null }), options: { enabled: type !== 'new', refetchOnWindowFocus: false },
            onSuccess: data => {
                if(Array.isArray(data))
                    for(let count = 0; count < Object.keys(data[0]).length; count++) { 
                        let _name = Object.keys(data[0])[count]; 
                        setValue(_name, 
                            data[0][_name] !== null ? 
                                _name === 'input_connectivity' ? JSON.parse(data[0][_name]) : 
                                    _name === 'item' ? ((data[0][_name]).replace(' ', '-')).toLowerCase()
                                : data[0][_name] : '');
                    }
            }
        });

    const { mutate: saving } = 
        usePost({ fetch: save, 
            onSuccess: (data) => {
                switch(data.result) {
                    case 'error': (data.error).forEach((err, index) => { setError(err.name, { type: index === 0 ? 'focus' : '', message: err.message }, { shouldFocus: index === 0 }); }); break;
                    case 'maintenance': infoToast(data.message, 3000, navigate('/assets/asset-issuance', { replace: true })); break;
                    default: successToast(data.message, 3000, navigate('/assets/asset-issuance', { replace: true }))
                }
            } 
        });
    
    const { mutate: updating } = 
        usePost({ fetch: update, 
            onSuccess: (data) => {
                if(data.result === 'error') { (data.error).forEach((err, index) => { setError(err.name, { type: index === 0 ? 'focus' : '', message: err.message }, { shouldFocus: index === 0 }); }); }
                else { successToast(data.message, 3000, navigate('/assets/asset-issuance', { replace: true })); }
            } 
        });
    
    useEffect(() => { setValidation(Validation()); if(id !== undefined) { refetch(); } }, [ setValidation, id, refetch ]);

    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= {{ width: '100%', height: '100%', paddingBottom: '20px' }} spacing= { 1.5 }>
            <Stack direction= "row" justifyContent= "space-between" alignItems= "center">
                <Typography variant= "h6" sx= {{ fontFamily: 'Boldstrom', color: '#3C4048' }}>{ type } Assets Issuance</Typography>
                <Typography sx= { btnicon } component= { Link } to= "/assets/asset-issuance" ><FontAwesomeIcon icon= { faChevronLeft }/></Typography>
            </Stack>
            <Box sx= { card }><form autoComplete= "off"><ThemeProvider theme= { theme(input) }><Form fetching= { isFetching } /></ThemeProvider></form></Box>
            { type !== 'view' ?
                <Grid container direction= "row" justifyContent= "flex-end" alignItems= "center">
                    <Grid item xs= { 12 } sm= { 3 } lg= { 2 }>
                        <Box sx= { btntxt } onClick= { handleSubmit(data => {
                            let errors = [];
                            data[type === 'new' ? 'created_by' : 'updated_by'] = localStorage.getItem('token');
                            
                            if(data.company_id === undefined || data.company_id === 0) { errors.push({ name: 'company_id', message: 'This field is required!' }); }
                            if(data.department_id === undefined || data.department_id === 0) { errors.push({ name: 'department_id', message: 'This field is required!' }); }
                            if(data.branch === undefined || data.branch === 0) { errors.push({ name: 'branch', message: 'This field is required!' }); }
                            if(data.issued_to === undefined || data.issued_to === 0) { errors.push({ name: 'issued_to', message: 'This field is required!' }); }
                            if(data.category_id === undefined || data.category_id === 0) { errors.push({ name: 'category_id', message: 'This field is required!' }); }
                            if(data.sub_category_id === undefined || data.sub_category_id === 0) { errors.push({ name: 'sub_category_id', message: 'This field is required!' }); }
                            if(data.asset_id === undefined || data.asset_id === 0) { errors.push({ name: 'asset_id', message: 'This field is required!' }); }
                            
                            if(!(errors.length > 0)) {
                                if(type === 'new') { saving({ table: 'tbl_assign_asset', data: data }); }
                                else { updating({ table: 'tbl_assign_asset', data: data }); }
                            }
                            else { errors.forEach(err => setError(err.name, { message: err.message })); }
                        }) }>Save</Box>
                    </Grid>
                </Grid> : '' }
        </Stack>
    );
}

export default Index;