// Libraries
import { useContext, useEffect } from "react";
import { Link, useNavigate, useParams } from "react-router-dom";
import { Box, Divider, Grid, Stack, Typography } from "@mui/material";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faChevronLeft } from "@fortawesome/free-solid-svg-icons";

// Core
import { FormCntxt } from "core/context/Form"; // Context
import { successToast, useGet, usePost } from "core/function/global";
import { save, specific, update } from "core/api";

// Constants
import { validation as Validation } from "./index.validation"; // Validation
import { btnicon, btntxt, card } from "./index.style"; // Styles

// Layouts
import Account from "./layouts/Account";
import Basic from "./layouts/Basic";
import Employee from "./layouts/Employee";

const Index = () => {
    const { type, id } = useParams();
    const navigate = useNavigate();
    const { setValidation, setValue, setError, handleSubmit } = useContext(FormCntxt);
    const { isFetching, refetch } =
        useGet({ key: ['dpt_specific'], fetch: specific({ table: 'tbl_users', id: id ?? null }), options: { enabled: type !== 'new', refetchOnWindowFocus: false }, 
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
                if(data.result === 'error') {
                    (data.error).forEach((err, index) => { setError(err.name, { type: index === 0 ? 'focus' : '', message: err.message }, { shouldFocus: index === 0 }); });
                }
                else { successToast(data.message, 3000, navigate('/maintenance/user', { replace: true })); }
            } 
        });

    const { mutate: updating } =
        usePost({ fetch: update,
            onSuccess: (data) => {
                if(data.result === 'error') {
                    (data.error).forEach((err, index) => { setError(err.name, { type: index === 0 ? 'focus' : '', message: err.message }, { shouldFocus: index === 0 }); });
                }
                else { successToast(data.message, 3000, navigate('/maintenance/user', { replace: true })); }
            }
        });

    useEffect(() => { setValidation(Validation()); if(id !== undefined) { refetch() } }, [ setValidation, id, refetch ]);

    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= {{ width: '100%', height: '100%', paddingBottom: '20px' }} spacing= { 3 }>
            <Stack direction= "row" justifyContent= "space-between" alignItems= "center">
                <Typography variant= "h6" sx= {{ fontFamily: 'Boldstrom', color: '#3C4048' }}>Users</Typography>
                <Typography sx= { btnicon } component= { Link } to= "/maintenance/users" ><FontAwesomeIcon icon= { faChevronLeft }/></Typography>
            </Stack>
            <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" divider= { <Divider orientation= "horizontal" flexItem /> } sx= { card } spacing= { 2 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 2 }>
                    <Typography sx= {{ fontWeight: 'bold', textTransform: 'uppercase' }} variant= "body1" gutterBottom>Account Information</Typography>
                    <Account fetching= { isFetching } />
                </Stack>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 2 }>
                    <Typography sx= {{ fontWeight: 'bold', textTransform: 'uppercase' }} variant= "body1" gutterBottom>Basic Information</Typography>
                    <Basic fetching= { isFetching } />
                </Stack>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography sx= {{ fontWeight: 'bold', textTransform: 'uppercase' }} variant= "body1" gutterBottom>Employee Information</Typography>
                    <Employee fetching= { isFetching } />
                </Stack>
            </Stack>
            { type !== 'view' ?
                <Grid container direction= "row" justifyContent= "flex-end" alignItems= "center">
                    <Grid item xs= { 12 } sm= { 3 } lg= { 2 }>
                        <Box sx= { btntxt } onClick= { handleSubmit(data => {
                            data[type === 'new' ? 'created_by' : 'updated_by'] = atob(localStorage.getItem('token'));
                            console.log(data);
                            // if(data.company_id !== undefined && data.company_id !== 0 && data.company_id !== null) {
                            //     if(data.department_head_id !== undefined && data.department_head_id !== 0 && data.department_head_id !== null) {
                            //         if(type === 'new') { saving({ table: 'tbl_department', data: data }); }
                            //         else { updating({ table: 'tbl_department', data: data }); }
                            //     }
                            //     else { setError('department_head_id', { message: 'This field is required!' }); }
                            // }
                            // else { setError('company_id', { message: 'This field is required!' }); }
                        }) }>Save</Box>
                    </Grid>
                </Grid> : '' }
        </Stack>
    );
}

export default Index;