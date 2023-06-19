// Libraries
import { Box, Stack, TextField, Typography } from "@mui/material"
import { useContext, useState } from "react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faFileArrowDown, faMagnifyingGlass } from "@fortawesome/free-solid-svg-icons";

// Core
import { ProfileCntx } from "core/context/Profile"; // Context
import { FormCntxt } from "core/context/Form"; // Context
import { ListCntxt } from "core/context/List"; // Context
import { useGet, usePost } from "core/function/global"; // Function
import { look, records } from "core/api"; // API

// Constants
import Items from "./Items"; // Layouts
import Loader from "./Loader"; // Layouts
import { btnexport, search } from "./index.style"; // Styles

const Index = () => {
    const { data } = useContext(ProfileCntx);
    const { setList } = useContext(ListCntxt);
    const { register, getValues } = useContext(FormCntxt);
    const [ interval, setInterval ] = useState(true);
    const { mutate: find, isLoading: finding } = usePost({ fetch: look, onSuccess: data => setList(data) });
    useGet({ key: ['rcs_list'], 
                    fetch: records({ table: 'tbl_physical_count_rcs', data: data }), 
                    options: { refetchOnWindowFocus: false, refetchInterval: interval ? 1000 : false }, 
                    onSuccess: data => setList(data) });

    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= {{ width: '100%', overflow: 'hidden' }} spacing= { 1 }>
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
                                find({ table: 'tbl_physical_count_rcs', data: form }); 
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