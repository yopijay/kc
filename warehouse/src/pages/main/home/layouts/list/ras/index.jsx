// Libraries
import { useContext } from "react";
import { Box, Stack, TextField, Typography } from "@mui/material";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faFileArrowDown, faMagnifyingGlass } from "@fortawesome/free-solid-svg-icons";

// Core
import { ProfileCntx } from "core/context/Profile"; // Context
import { FormCntxt } from "core/context/Form"; // Context
import { ListCntxt } from "core/context/List"; // Context
import { useGet } from "core/function/global"; // Function
import { records } from "core/api"; // API

// Layouts
import Items from "./Items";

// Constants
import { btnexport, search } from "./index.style"; // Styles

const Index = () => {
    const { data } = useContext(ProfileCntx);
    const { register, setValue } = useContext(FormCntxt);
    const { setList } = useContext(ListCntxt);
    useGet({ key: ['ras'], fetch: records({ table: 'tbl_physical_count_ras', data: data }), options: { refetchInterval: 1000 }, onSuccess: data => setList(data) });

    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= {{ width: '100%', overflow: 'hidden' }} spacing= { 1 }>
            <Stack direction= "row" justifyContent= "space-between" alignItems= "center">
                <form autoComplete= "off">
                    <Box sx= { search }>
                        <FontAwesomeIcon icon= { faMagnifyingGlass } size= "sm" style= {{ margin: '8px' }} />
                        <TextField { ...register('searchtxt') } variant= "standard" size= "small" fullWidth InputProps= {{ disableUnderline: true }} placeholder= "Search..." sx= {{ padding: '5px 0 0 0' }}
                            onChange= { e => { setValue('searchtxt', e.target.value); } } />
                    </Box>
                </form>
                <Stack direction= "row" justifyContent= "flex-end" alignItems= "center" spacing= { 1 }>
                    <Typography sx= { btnexport }><FontAwesomeIcon icon= { faFileArrowDown } color= "#ffffff" size= "lg" /></Typography>
                </Stack>
            </Stack>
            <Items />
        </Stack>
    );
}

export default Index;