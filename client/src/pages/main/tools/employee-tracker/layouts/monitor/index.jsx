// Libraries
import { faChevronLeft } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { Box, Grid, Stack, Typography } from "@mui/material";
import { records } from "core/api";
import { FormCntxt } from "core/context/Form";
import { usePost } from "core/function/global";
import { useContext, useEffect, useState } from "react";
import { Link } from "react-router-dom";
import Item from "./Items";
import dayjs from "dayjs";

// Constants
const btnicon = {
    color: '#ffffff',
    backgroundColor: '#d1d1d1',
    borderRadius: '7px',
    padding: {
        xs: '5px 12px',
        md: '4px 10px'
    },
    transition: 'all 0.2s ease-in-out',
    '&:hover': { backgroundColor: '#adadad' }
}

const Index = () => {
    const [ tracker, setTracker ] = useState([]);
    const { setValue, getValues } = useContext(FormCntxt);
    const { mutate: trckr, isLoading: trckrloading } = usePost({ fetch: records, options: { refetchOnWindowFocus: true }, onSuccess: data => setTracker(data) });

    useEffect(() => {
        setValue('branch', getValues().branch !== undefined ? getValues().branch : 'all');
        let data = getValues();
        data['orderby'] = 'date_created';
        data['sort'] = 'desc';
        data['searchtxt'] = '';

        trckr({ table: 'tbl_tracker', data: data });
    }, [ setValue, getValues, trckr ]);

    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= {{ width: '100%', overflow: 'hidden' }} spacing= { 1 }>
            <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                <Stack direction= "row" justifyContent= "space-between" alignItems= "center">
                    <Typography variant= "h6" sx= {{ fontFamily: 'Boldstrom', color: '#3c4048' }}>Monitor</Typography>
                        <Typography sx= { btnicon } component= { Link } to= "/tools/employee-tracker" ><FontAwesomeIcon icon= { faChevronLeft } size= "lg" /></Typography>
                </Stack>
            </Stack>
            <Box sx= {{ overflowY: 'scroll', '&::-webkit-scrollbar': { display: 'none' } }}>
                <Grid container direction= "row" justifyContent= "flex-start" alignItems= "stretch">
                    <Grid item xs= { 12 } sm= { 7 } lg= { 5 } sx= {{ height: '100%', padding: '10px' }}>
                        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch"
                            sx= {{ backgroundColor: '#ffffff', borderRadius: '10px', padding: '20px 30px', border: 'solid 1px #efefef' }}>
                            <Typography variant= "h6" sx= {{ fontWeight: 'bold' }} gutterBottom>UNKNOWN</Typography>
                            <Item data= {{ tracker_id: '', date: `${dayjs(new Date()).year()}-${dayjs(new Date()).month() + 1}-${dayjs(new Date()).date()}` }} />
                        </Stack>
                    </Grid>
                { tracker.length > 0 ?
                    tracker.map((data, index) => (
                        <Grid item xs= { 12 } sm= { 6 } lg= { 4 } sx= {{ height: '100%', padding: '10px' }} key= { index }>
                            <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" 
                                sx= {{ backgroundColor: '#ffffff', borderRadius: '10px', padding: '20px 30px', border: 'solid 1px #efefef' }}>
                                <Typography variant= "h6" sx= {{ fontWeight: 'bold' }} gutterBottom>{ data.name }</Typography>
                                <Item data= {{ tracker_id: data.id, date: `${dayjs(new Date()).year()}-${dayjs(new Date()).month() + 1}-${dayjs(new Date()).date()}` }} />
                            </Stack>
                        </Grid>
                    ))
                : '' }
                </Grid>
            </Box>
        </Stack>
    );
}

export default Index;