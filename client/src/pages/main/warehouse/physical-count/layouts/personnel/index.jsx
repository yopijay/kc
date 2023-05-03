// Libraries
import { faChevronLeft } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { Box, Grid, Stack, ThemeProvider, Typography } from "@mui/material";
import { useContext, useEffect } from "react";
import { Link, useNavigate, useParams } from "react-router-dom";

// Core
import { FormCntxt } from "core/context/Form"; // Context
import { successToast, useGet, usePost } from "core/function/global"; // Function
import { specific, update } from "core/api"; // API
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
    const { setValue, setError, handleSubmit } = useContext(FormCntxt);
    const { refetch } =  
        useGet({ key: ['inv_specific'], fetch: specific({ table: 'tbl_physical_count', id: id ?? null }), options: { enabled: type !== 'new', refetchOnWindowFocus: false}, 
            onSuccess: (data) => { 
                if(Array.isArray(data)) 
                    for(let count = 0; count < Object.keys(data[0]).length; count++) { 
                        let _name = Object.keys(data[0])[count]; 
                        setValue(_name, _name === 'brands' || _name === 'branch' || _name === 'personnel' ? JSON.parse(data[0][_name]) : data[0][_name]);
                    }
            }
        });

    const { mutate: assign } = 
        usePost({ fetch: update, 
            onSuccess: (data) => { 
                if(data.result === 'error') { (data.error).forEach((err, index) => { setError(err.name, { type: index === 0 ? 'focus' : '', message: err.message }, { shouldFocus: index === 0 }); }); } 
                else { successToast(data.message, 3000, navigate('/warehouse/physical-count', { replace: true })); }
            }
        });

    useEffect(() => { if(id !== undefined) { refetch(); } }, [ id, refetch ]);

    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= {{ width: '100%', height: '100%', paddingBottom: '20px' }} spacing= { 3 }>
            <Stack direction= "row" justifyContent= "space-between" alignItems= "center">
                <Typography variant= "h6" sx= {{ fontFamily: 'Boldstrom', color: '#535b64' }}>{ type } Physical count</Typography>
                <Typography sx= { btnicon } component= { Link } to= "/warehouse/physical-count" ><FontAwesomeIcon icon= { faChevronLeft }/></Typography>
            </Stack>
            <Box sx= { card }>
                <form autoComplete= "off">
                    <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 2 }>
                        <ThemeProvider theme= { theme(input) }><Info /></ThemeProvider>
                        <List />
                    </Stack>
                </form>
            </Box>
            { type !== 'view' ?
                <Grid container direction= "row" justifyContent= "flex-end" alignItems= "center">
                    <Grid item xs= { 12 } sm= { 3 } lg= { 2 }>
                        <Box sx= { btntxt } onClick= { handleSubmit(data => {
                            data[type === 'new' ? 'created_by' : 'updated_by'] = atob(localStorage.getItem('token'));
                            assign({ table: 'tbl_physical_count', data: data });
                        }) }>Save</Box>
                    </Grid>
                </Grid> : '' }
        </Stack>
    );
}

export default Index;