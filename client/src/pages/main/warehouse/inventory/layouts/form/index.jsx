// Libraries
import { faChevronLeft } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { Box, Grid, Stack, ThemeProvider, Typography } from "@mui/material";
import { useContext, useEffect, useState } from "react";
import { Link, useNavigate, useParams } from "react-router-dom";

// Core
import { FormCntxt } from "core/context/Form"; // Context
import { successToast, useGet, usePost } from "core/function/global"; // Function
import { count, save, specific, update } from "core/api"; // API
import { theme } from "core/theme/form.theme"; // Theme

// Layouts
import Info from "./layouts/Info";

// Constants
import { btnicon, btntxt, card } from "./index.style"; // Styles
import List from "./layouts/List";

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
    const [ counttype, setCounttype ] = useState('annual');
    const { setValue, setError, handleSubmit, getValues } = useContext(FormCntxt);
    const { isFetching, refetch } =  
        useGet({ key: ['inv_specific'], fetch: specific({ table: 'tbl_inventory', id: id ?? null }), options: { enabled: type !== 'new', refetchOnWindowFocus: false}, 
            onSuccess: (data) => { 
                if(Array.isArray(data)) 
                    for(let count = 0; count < Object.keys(data[0]).length; count++) { 
                        let _name = Object.keys(data[0])[count]; 
                        setValue(_name, _name === 'brands' || _name === 'branch' ? JSON.parse(data[0][_name]) : data[0][_name]); 
                    }
            }
        });

    const { mutate: saving } = 
        usePost({ fetch: save, 
            onSuccess: (data) => {
                if(data.result === 'error') { (data.error).forEach((err, index) => { setError(err.name, { type: index === 0 ? 'focus' : '', message: err.message }, { shouldFocus: index === 0 }); }); } 
                // else { successToast(data.message, 3000, navigate('/warehouse/inventory', { replace: true })); } 
            } 
        });

    const { mutate: updating } = 
        usePost({ fetch: update, 
            onSuccess: (data) => { 
                if(data.result === 'error') { (data.error).forEach((err, index) => { setError(err.name, { type: index === 0 ? 'focus' : '', message: err.message }, { shouldFocus: index === 0 }); }); } 
                // else { successToast(data.message, 3000, navigate('/warehouse/inventory', { replace: true })); }
            }
        });
    
        
    const { mutate: counts } = usePost({ fetch: count, 
        onSuccess: data => {
            setValue('total_items', counttype === 'annual' ? 
                                data : (getValues().brands).length > 0 ? 
                                    (getValues().brands).reduce((a, b) => a +b.items, 0) : 0); 
        }
    });

    useEffect(() => { if(id !== undefined) { refetch(); } counts({}); }, [ id, refetch, counts, counttype ]);

    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= {{ width: '100%', height: '100%', paddingBottom: '20px' }} spacing= { 3 }>
            <Stack direction= "row" justifyContent= "space-between" alignItems= "center">
                <Typography variant= "h6" sx= {{ fontFamily: 'Boldstrom', color: '#535b64' }}>{ type } Inventory count</Typography>
                <Typography sx= { btnicon } component= { Link } to= "/warehouse/inventory" ><FontAwesomeIcon icon= { faChevronLeft }/></Typography>
            </Stack>
            <Box sx= { card }>
                <form autoComplete= "off">
                    <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 2 }>
                        <ThemeProvider theme= { theme(input) }><Info fetching= { isFetching } counttype= { counttype } setCounttype= { setCounttype } /></ThemeProvider>
                        { counttype === 'random' ? <List fetching= { isFetching } counts= { counts } /> : '' }
                    </Stack>
                </form>
            </Box>
            { type !== 'view' ?
                <Grid container direction= "row" justifyContent= "flex-end" alignItems= "center">
                    <Grid item xs= { 12 } sm= { 3 } lg= { 2 }>
                        <Box sx= { btntxt } onClick= { handleSubmit(data => {
                            let errors = [];
                            data[type === 'new' ? 'created_by' : 'updated_by'] = atob(localStorage.getItem('token'));

                            if(data.type === 'specific' && (data.brands).length <= 0) { errors.push({ name: 'brands', message: 'Please select at least one brand' }); }
                            if(data.total_items <= 0) { errors.push({ name: 'total_items', message: 'Total items must be greater than 0!' }); }
                            if(data.branch <= 0) { errors.push({ name: 'branch', message: 'Please select at least one branch' }); }

                            if(!(errors.length > 0)) {
                                if(type === 'new') { saving({ table: 'tbl_inventory', data: data }); }
                                else { updating({ table: 'tbl_inventory', data: data }); }
                            }
                            else { errors.forEach(err => setError(err.name, { message: err.message })); }
                        }) }>Save</Box>
                    </Grid>
                </Grid> : '' }
        </Stack>
    );
}

export default Index;