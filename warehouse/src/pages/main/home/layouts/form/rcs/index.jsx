// Libraries
import { Box, Grid, Stack, Typography } from "@mui/material";
import { Link, useNavigate, useParams } from "react-router-dom";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faChevronLeft } from "@fortawesome/free-solid-svg-icons";
import { useContext } from "react";
import { ThemeProvider } from "@emotion/react";

// Core
import { FormCntxt } from "core/context/Form"; // Context
import { theme } from "core/theme/form.theme"; // Theme
import { successToast, useGet, usePost } from "core/function/global"; // Function
import { specific, update } from "core/api"; // API
import { ProfileCntx } from "core/context/Profile"; // Context

// Constants
import Form from "./Form"; // Layouts
import { btntxt, card } from "./index.style"; // Styles
// Theme
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
    const { id } = useParams();
    const { data } = useContext(ProfileCntx);
    const navigate = useNavigate();
    const { handleSubmit, setValue, getValues } = useContext(FormCntxt);
    const { mutate: updating } = usePost({ fetch: update, onSuccess: data => successToast(data.message, 3000, navigate('/')) });
    const { isFetching } =
        useGet({ key: ['itm_specific'], 
            fetch: specific({ table: 'tbl_physical_count_rcs', data: JSON.stringify({ id: id, physical_count_id: data.physical_count_id }) }), 
            options: { enabled: true, refetchOnWindowFocus: false },
            onSuccess: data => {
                if(Array.isArray(data))
                    for(let count = 0; count < Object.keys(data[0]).length; count++) {
                        let _name = Object.keys(data[0])[count];
                        setValue(_name, data[0][_name]);
                    }
            } 
        });

    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= {{ width: '100%', height: '100%', overflow: 'hidden' }} spacing= { 2 }>
            <Stack direction= "row" justifyContent= "flex-start" alignItems= "center" spacing= { 2 } sx= {{ padding: '0 5px' }}>
                <Typography component= { Link } to= "/" sx= {{ cursor: 'pointer' }} color= "#444444"><FontAwesomeIcon icon= { faChevronLeft } size= "lg" /></Typography>
                <Typography sx= {{ fontWeight: 'bold' }} variant= "h6">Rack Count Sheet</Typography>
            </Stack>
            <Box sx= { card }><ThemeProvider theme= { theme(input) }><Form fetching= { isFetching } /></ThemeProvider></Box>
            { getValues()?.date_counted === null ? <Grid container direction= "row" justifyContent= "flex-end" alignItems= "center">
                <Grid item xs= { 6 } sm= { 3 } lg= { 2 }>
                    <Box sx= { btntxt } onClick= { 
                        handleSubmit(form => { 
                            form['physical_count_id'] = data.physical_count_id;
                            form['count_by'] = data.user_id;

                            updating({ table: 'tbl_physical_count_rcs', data: form }); 
                        })
                    }>Save</Box>
                </Grid>
            </Grid> : '' }
        </Stack>
    );
}

export default Index;