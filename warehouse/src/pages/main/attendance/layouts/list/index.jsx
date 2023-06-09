// Libraries
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { Box, Stack, TextField, Typography } from "@mui/material";
import { useContext, useEffect } from "react";
import { faChevronLeft, faFileArrowDown, faMagnifyingGlass, faPlus } from "@fortawesome/free-solid-svg-icons";
import { Link } from "react-router-dom";

// Core
import { ProfileCntx } from "core/context/Profile"; // Context
import { ListCntxt } from "core/context/List"; // Context
import { FormCntxt } from "core/context/Form"; // Context
import { usePost } from "core/function/global"; //Functions
import { records } from "core/api"; // API

// Constants
import { btnexport, btnicon, search } from "./index.style"; // Styles
import Items from "./Items"; // Layouts

const Index = () => {
    const { data } = useContext(ProfileCntx);
    const { setList } = useContext(ListCntxt);
    const { register, setValue } = useContext(FormCntxt);
    const { mutate: record } = usePost({ fetch: records, options: { refetchOnWindowFocus: false }, onSuccess: data => setList(data) });

    useEffect(() => record({ table: 'tbl_physical_count_personnels', data: data }), [ record, data ]);

    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= {{ width: '100%', overflow: 'hidden' }} spacing= { 1 }>
            <Stack direction= "row" justifyContent= "flex-start" alignItems= "center" spacing= { 2 } sx= {{ padding: '0 5px' }}>
                <Typography component= { Link } to= "/" sx= {{ cursor: 'pointer' }} color= "#444444"><FontAwesomeIcon icon= { faChevronLeft } size= "lg" /></Typography>
                <Typography sx= {{ fontWeight: 'bold' }} variant= "h6">Attendees</Typography>
            </Stack>
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
                    <Typography component= { Link } to= "/attendees/form/new" sx= { btnicon }>
                        <FontAwesomeIcon icon= { faPlus } style= {{ color: '#FFFFFF' }} size= "lg" />
                    </Typography>
                </Stack>
            </Stack>
            <Items />
        </Stack>
    );
}

export default Index;