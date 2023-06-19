// Libraries
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { Box, Stack, TextField, Typography } from "@mui/material";
import { useContext, useState } from "react";
import { faChevronLeft, faFileArrowDown, faMagnifyingGlass } from "@fortawesome/free-solid-svg-icons";
import { Link } from "react-router-dom";

// Core
import { FormCntxt } from "core/context/Form"; // Context
import { ProfileCntx } from "core/context/Profile"; // Context
import { ListCntxt } from "core/context/List"; // Context
import { look, records } from "core/api"; // API
import { useGet, usePost } from "core/function/global"; // Function

// Constants
import { btnexport, search } from "./index.style"; // Styles
import Items from "./Items"; // Layouts
import Loader from "./Loader"; // Loader

const Index = () => {
    const { data } = useContext(ProfileCntx);
    const { setList } = useContext(ListCntxt);
    const { register, getValues } = useContext(FormCntxt);
    const [ interval, setInterval ] = useState(true);
    const { mutate: find, isLoading: finding } = usePost({ fetch: look, onSuccess: data => setList(data) });
    useGet({ key: ['des_list'], 
                    fetch: records({ table: 'tbl_physical_count_dis', data: data }), 
                    options: { refetchOnWindowFocus: false, refetchInterval: interval ? 1000 : false }, 
                    onSuccess: data => setList(data) });

    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= {{ width: '100%', overflow: 'hidden' }} spacing= { 1 }>
            <Stack direction= "row" justifyContent= "flex-start" alignItems= "center" spacing= { 2 } sx= {{ padding: '0 5px' }}>
                <Typography component= { Link } to= "/" sx= {{ cursor: 'pointer' }} color= "#444444"><FontAwesomeIcon icon= { faChevronLeft } size= "lg" /></Typography>
                <Typography sx= {{ fontWeight: 'bold' }} variant= "h6">Discrepancies</Typography>
            </Stack>
            <Stack direction= "row" justifyContent= "space-between" alignItems= "center">
                <form autoComplete= "off">
                    <Box sx= { search }>
                        <FontAwesomeIcon icon= { faMagnifyingGlass } size= "sm" style= {{ margin: '8px' }} />
                        <TextField { ...register('searchtxt') } variant= "standard" size= "small" fullWidth InputProps= {{ disableUnderline: true }} placeholder= "Search..." sx= {{ padding: '5px 0 0 0' }}
                            onChange= { e => {
                                let form = getValues();
                                form['searchtxt'] = e.target.value;
                                form['branch'] = data.branch;
                                form['user_id'] = data.user_id;
                                form['type'] = data.type;
                                form['physical_count_id'] = data.physical_count_id;

                                setInterval(false);
                                find({ table: 'tbl_physical_count_ras', data: form }); 
                            } } />
                    </Box>
                </form>
                <Stack direction= "row" justifyContent= "flex-end" alignItems= "center" spacing= { 1 }>
                    <Typography sx= { btnexport }><FontAwesomeIcon icon= { faFileArrowDown } color= "#ffffff" size= "lg" /></Typography>
                </Stack>
            </Stack>
            { !finding ? <Items /> : <Loader /> }
        </Stack>
    );
}

export default Index;