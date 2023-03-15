// Libraries
import { useContext, useState } from "react";
import { Stack, Typography } from "@mui/material";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faArrowDownAZ, faArrowDownZA } from "@fortawesome/free-solid-svg-icons";

// Core
import { FormCntxt } from "core/context/Form"; // Context

// Constants
const asc = {
    padding: '3px 10px',
    borderRadius: '5px',
    fontSize: '100%',
    color: '#959595',
    transition: 'all 0.2s ease-in-out',
    cursor: 'pointer',
    backgroundColor: '#E5E5E5',
}

const desc = {
    padding: '3px 10px',
    borderRadius: '5px',
    fontSize: '100%',
    color: '#959595',
    backgroundColor: '#E5E5E5',
    cursor: 'pointer'
}

const ctgy = {
    padding: '3px 10px',
    borderRadius: '5px',
    fontSize: '95%',
    color: '#959595',
    backgroundColor: '#E5E5E5',
    cursor: 'pointer'
}

const Sort = ({ refetch }) => {
    const { getValues, setValue } = useContext(FormCntxt);
    const [ orderby, setOrderby ] = useState('service_request_no');
    const [ sort, setSort ] = useState('desc');

    return (
        <Stack direction= "row" justifyContent= "flex-end" alignItems= "center" spacing= { 1 }>
            <Stack direction= "row" justifyContent= "flex-start" alignItems= "center" spacing= { 1 }>
                <Typography variant= "caption">Order by:</Typography>
                { orderby === 'date_created' ? 
                    <Typography sx= { ctgy } 
                        onClick= { () => { 
                            setValue('orderby', 'srvc.date_prepared'); setOrderby('date_prepared');
                            refetch({ table: 'tbl_services', data: getValues() }); } }>Date created</Typography> : 
                    orderby === 'date_requested' ? 
                        <Typography sx= { ctgy } 
                            onClick= { () => { 
                                setValue('orderby', 'srvc.date_prepared'); setOrderby('date_prepared');
                                refetch({ table: 'tbl_services', data: getValues() }); } }>Date requested</Typography> : 
                        orderby === 'date_prepared' ? 
                            <Typography sx= { ctgy } 
                                onClick= { () => { 
                                    setValue('orderby', 'sales.date_needed'); setOrderby('date_needed');
                                    refetch({ table: 'tbl_services', data: getValues() }); } }>Date prepared</Typography> : 
                            orderby === 'date_needed' ? 
                                <Typography sx= { ctgy } 
                                    onClick= { () => { 
                                        setValue('orderby', 'sales.customer'); setOrderby('customer');
                                        refetch({ table: 'tbl_services', data: getValues() }); } }>Date needed</Typography> : 
                                orderby === 'customer' ? 
                                    <Typography sx= { ctgy } 
                                        onClick= { () => { 
                                            setValue('orderby', 'srvc.service_request_no'); setOrderby('service_request_no');
                                            refetch({ table: 'tbl_services', data: getValues() }); } }>Customer</Typography> :
                                    orderby === 'service_request_no' ? 
                                        <Typography sx= { ctgy } 
                                            onClick= { () => { 
                                                setValue('orderby', 'srvc.date_created'); setOrderby('date_created');
                                                refetch({ table: 'tbl_services', data: getValues() }); } }>Service request no.</Typography> : '' }
            </Stack>
                { sort === 'desc' ? 
                    <Typography sx= { asc }>
                        <FontAwesomeIcon icon= { faArrowDownZA } 
                            onClick= { () => { setValue('sort', 'asc'); setSort('asc'); refetch({ table: 'tbl_services', data: getValues() }); } } />
                    </Typography> :
                    <Typography sx= { desc }>
                        <FontAwesomeIcon icon= { faArrowDownAZ } 
                            onClick= { () => { setValue('sort', 'desc'); setSort('desc'); refetch({ table: 'tbl_services', data: getValues() }); } } />
                    </Typography> }
        </Stack>
    );
}

export default Sort;