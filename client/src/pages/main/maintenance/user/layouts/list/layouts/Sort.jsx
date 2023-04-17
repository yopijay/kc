// Libraries
import { useContext, useState } from "react";
import { Autocomplete, Box, Skeleton, Stack, TextField, Typography } from "@mui/material";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faArrowDownAZ, faArrowDownZA } from "@fortawesome/free-solid-svg-icons";
import { Controller } from "react-hook-form";

// Core
import { FormCntxt } from "core/context/Form"; // Context
import { useGet } from "core/function/global"; // Function
import { filter } from "core/api"; // API

// Constants
import { asc, ctgy, desc, select } from "../index.style"; // Styles

const Sort = ({ refetch }) => {
    const { getValues, control, setValue } = useContext(FormCntxt);
    const { data: cmp, isFetching } = useGet({ key: ['cmp_dropdown'], fetch: filter({ table: 'tbl_company', data: {} }) });
    const [ orderby, setOrderby ] = useState('lname');
    const [ sort, setSort ] = useState('desc');

    return (
        <Stack direction= "row" justifyContent= "space-between" alignItems= "center" spacing= { 1 }>
            <Stack direction= "row" justifyContent= "flex-start" alignItems= "center" spacing= { 1 }>
                { isFetching ? <Skeleton variant= "rounded" height= "35px" /> : 
                    <Box sx= { select }>
                        <Controller control= { control } name= "company_id" defaultValue= "all"
                                render= { ({ field: { onChange, value } }) => (
                                    <Autocomplete options= { cmp } disableClearable getOptionLabel= { opt => opt.name || opt.id }
                                        noOptionsText= "No results..." isOptionEqualToValue= { (option, value) => option.name === value.name || option.id === value.id }
                                        renderInput= { params => ( <TextField { ...params } variant= "standard" size= "small" fullWidth= { true } /> ) } getOptionDisabled= { option => option.id === 0 }
                                        onChange= { (e, item) => { onChange(item.id); refetch({ table: 'tbl_users', data: getValues() }); } } 
                                        value= { cmp.find(data => { return data.id === (getValues().company_id !== undefined ? getValues().company_id : value) }) } />
                                ) } />
                    </Box> }
            </Stack>
            <Stack direction= "row" justifyContent= "flex-start" alignItems= "center" spacing= { 1 }>
                <Stack direction= "row" justifyContent= "flex-start" alignItems= "center" spacing= { 1 }>
                    <Typography variant= "caption">Order by:</Typography>
                    { orderby === 'employee_no' ? 
                        <Typography sx= { ctgy }
                            onClick= { () => { setValue('orderby', 'lname'); setOrderby('lname'); refetch({ table: 'tbl_users', data: getValues() }); } }>Employee no.</Typography> :
                        orderby === 'lname' ?
                            <Typography sx= { ctgy }
                                onClick= { () => { setValue('orderby', 'employee_no'); setOrderby('employee_no'); refetch({ table: 'tbl_users', data: getValues() }); } }>Last name</Typography> : '' }
                </Stack>
                { sort === 'desc' ? 
                    <Typography sx= { asc }>
                        <FontAwesomeIcon icon= { faArrowDownZA } onClick= { () => { setValue('sort', 'asc'); setSort('asc'); refetch({ table: 'tbl_users', data: getValues() }); } } />
                    </Typography> :
                    <Typography sx= { desc }>
                        <FontAwesomeIcon icon= { faArrowDownAZ } onClick= { () => { setValue('sort', 'desc'); setSort('desc'); refetch({ table: 'tbl_users', data: getValues() }); } } />
                    </Typography> }
            </Stack>
        </Stack>
    );
}

export default Sort;