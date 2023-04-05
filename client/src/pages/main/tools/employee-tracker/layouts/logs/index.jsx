// Libraries
import { faChevronLeft, faFileArrowDown } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { Box, Stack, Typography } from "@mui/material";
import { Link } from "react-router-dom";
import { useContext, useEffect, useState } from "react";
import dayjs from "dayjs";

// Core
import { ListCntxt } from "core/context/List"; // Context
import { ProfileCntx } from "core/context/Profile"; // Context
import { FormCntxt } from "core/context/Form"; // Context
import { dashboard, excel, records } from "core/api"; // API
import { exporttoexcel, usePost } from "core/function/global"; // Function

// Layouts
import Dashboard from "./layouts/Dashboard";
import Sort from "./layouts/Sort";
import Loader from "./layouts/Loader";
import Item from "./layouts/Item";

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

const btnexport = {
    color: '#ffffff',
    transition: 'all 0.2s ease-in-out',
    borderRadius: '7px',
    padding: {
        xs: '5px 12px',
        md: '4px 10px'
    },
    backgroundColor: '#1D6F42',
    '&:hover': { backgroundColor: '#00431a' }
}

const Index = () => {
    let name = `KC-EXPORT-EMPLOYEE-MONITORING-${parseInt((new Date()).getMonth()) + 1}${(new Date()).getDate()}${(new Date()).getFullYear()}`;
    let [ count, setCount ] = useState({});
    const { setList } = useContext(ListCntxt);
    const { data } = useContext(ProfileCntx);
    const { getValues } = useContext(FormCntxt);
    
    const { mutate: record, isLoading: fetching } = usePost({ fetch: records, options: { refetchOnWindowFocus: false }, onSuccess: data => setList(data) });
    const { mutate: dash, isLoading } = usePost({ fetch: dashboard, onSuccess: data => setCount(data) });
    const { mutate: original } = usePost({ fetch: excel, options: { refetchOnWindowsFocus: false }, onSuccess: (data) => exporttoexcel(data, 'Employee Monitoring', `${name} (Admin's copy)`) });
    const { mutate: formatted } = usePost({ fetch: excel, options: { refetchOnWindowsFocus: false }, onSuccess: (data) => exporttoexcel(data, 'Employee Monitoring', `${name}`) });

    useEffect(() => {
        let data = getValues();
        data['branch'] = getValues().branch !== undefined ? getValues().branch : 'all';
        data['tracker_id'] = getValues().tracker_id !== undefined ? getValues().tracker_id : 'all';
        data['date'] = getValues().date !== undefined ? getValues().date : `${dayjs(new Date()).year()}-${dayjs(new Date()).month() + 1}-${dayjs(new Date()).date()}`;

        record({ table: 'tbl_employee_tracker', data: data });
        dash({ table: `tbl_employee_tracker`, data: data });
    }, [ getValues, record, dash ]);

    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= {{ width: '100%', overflow: 'hidden' }} spacing= { 1 }>
            <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                <Stack direction= "row" justifyContent= "space-between" alignItems= "center">
                    <Typography variant= "h6" sx= {{ fontFamily: 'Boldstrom', color: '#3c4048' }}>Logs</Typography>
                    <Stack direction= "row" justifyContent= "flex-end" alignItems= "center" spacing= { 1 }>
                        <Typography sx= { btnicon } component= { Link } to= "/tools/employee-tracker" ><FontAwesomeIcon icon= { faChevronLeft } size= "lg" /></Typography>
                        <Typography sx= { btnexport } 
                            onClick= { () => { if(data.user_level === 'superadmin') { original({ table: 'tbl_employee_tracker', type: 'original', data: getValues() }); } 
                                formatted({ table: 'tbl_employee_tracker', type: 'formatted', data: getValues() }); }}><FontAwesomeIcon icon= { faFileArrowDown } size= "lg" /></Typography>
                    </Stack>
                </Stack>
                <Dashboard data= { count } loading= { isLoading } />
            </Stack>
            <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 } sx= {{ overflow: 'hidden', '&::-webkit-scrollbar': { display: 'none' } }}>
                <Sort record= { record } dash= { dash } />
                <Box sx= {{ overflow: 'hidden', '&::_webkit-scrollbar': { display: 'none' } }}>{ !fetching ? <Item /> : <Loader /> }</Box>
            </Stack>
        </Stack>
    );
}

export default Index;