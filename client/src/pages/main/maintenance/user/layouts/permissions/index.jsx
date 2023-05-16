// Libraries
import { faChevronLeft } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { Box, Grid, Stack, Typography } from "@mui/material";
import { Link, useNavigate, useParams } from "react-router-dom";
import { useContext, useEffect, useState } from "react";

// Core
import { FormCntxt } from "core/context/Form"; // Context
import { successToast, useGet, usePost } from "core/function/global"; // Function
import { records, specific, update } from "core/api"; // API

// Layouts
import Permissions from "./Permissions";

// Constants
import { btnicon, btntxt, card } from "./index.style"; // Styles

const Index = () => {
    const { id } = useParams();
    const navigate = useNavigate();
    const { handleSubmit, setValue } = useContext(FormCntxt);
    const [ modules, setModules ] = useState([]);
    const { mutate: module } = usePost({ fetch: records, onSuccess: data => setModules(data) });
    useGet({ key: ['permissions'], fetch: specific({ table: 'tbl_users_permissions', id: id }), options: { enabled: true, refetchOnWindowFocus: false },
        onSuccess: data => {
            if(Array.isArray(data)) {
                for(let count = 0; count < Object.keys(data[0]).length; count++) {
                    let _name = Object.keys(data[0])[count];
                    setValue(_name, _name === 'permissions' ? JSON.parse(data[0][_name]) : data[0][_name]);
                }
            }
        } 
    });

    const { mutate: updating } = usePost({ fetch: update, onSuccess: data => { successToast(data.message, 3000, navigate('/maintenance/users', { replace: true })); } });

    useEffect(() => {
        let data = {};
        data['orderby'] = 'name';
        data['sort'] = 'asc';
        data['searchtxt'] = '';

        module({ table: 'tbl_module', data: data });
    }, [ module ]);

    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= {{ width: '100%', height: '100%', paddingBottom: '20px' }} spacing= { 3 }>
            <Stack direction= "row" justifyContent= "space-between" alignItems= "center">
                <Typography variant= "h6" sx= {{ fontFamily: 'Boldstrom', color: '#3C4048' }}>User Permissions</Typography>
                <Typography sx= { btnicon } component= { Link } to= "/maintenance/users" ><FontAwesomeIcon icon= { faChevronLeft }/></Typography>
            </Stack>
            <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= { card } spacing= { 2 }>
                <Grid container direction= "row" justifyContent= "flex-start" alignItems= "stretch">
                    { modules.length > 0 ?
                        modules.map((mdl, index) => (
                            <Grid item xs= { 12 } sx= {{ padding: '10px' }} key= { index }>
                                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 2 }>
                                    <Typography sx= {{ fontWeight: 'bold', color: '#444444', fontSize: '115%' }}>{ (mdl.name).charAt(0).toUpperCase() + (mdl.name).slice(1).toLowerCase() }</Typography>
                                    <Permissions module= { mdl.id } />
                                </Stack>
                            </Grid>
                        ))
                        : <Typography sx= {{ width: '100%', textAlign: 'center' }}>No module/s found!</Typography> }
                </Grid>
            </Stack>
            <Grid container direction= "row" justifyContent= "flex-end" alignItems= "center">
                <Grid item xs= { 12 } sm= { 3 } lg= { 2 }>
                    <Box sx= { btntxt } 
                        onClick= { handleSubmit(data => { 
                            data['updated_by'] = atob(localStorage.getItem('token'));
                            updating({ table: 'tbl_users_permissions', data: data }); 
                        }) }>Save</Box>
                </Grid>
            </Grid>
        </Stack>
    );
}

export default Index;