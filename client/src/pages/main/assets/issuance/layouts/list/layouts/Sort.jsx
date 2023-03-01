// Libraries
import { useContext, useState } from "react";
import { Autocomplete, Box, Skeleton, Stack, TextField, Typography } from "@mui/material";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faArrowDownAZ, faArrowDownZA } from "@fortawesome/free-solid-svg-icons";
import { Controller } from "react-hook-form";

// Core
import { useGet } from "core/function/global"; // Function
import { filter } from "core/api"; // API
import { FormCntxt } from "core/context/Form"; // Context

// Constants
import { asc, ctgy, desc, select } from "../index.style"; // Styles

const Sort = ({ refetch }) => {
    const { getValues, control, setValue } = useContext(FormCntxt);
    const { data: subctgy, isFetching } = useGet({ key: ['subctgy_dropdown'], fetch: filter({ table: 'tbl_sub_category', data: { module: 'assets' } }) });
    const [ orderby, setOrderby ] = useState('date_created');
    const [ sort, setSort ] = useState('desc');

    return (
        <Stack direction= "row" justifyContent= "space-between" alignItems= "center" spacing= { 1 }>
            <Stack direction= "row" justifyContent= "flex-start" alignItems= "center" spacing= { 1 }>
                { isFetching ? <Skeleton variant= "rounded" height= "35px" /> : 
                    <Box sx= { select }>
                        <Controller control= { control } name= "sub_category_id" defaultValue= "all"
                                render= { ({ field: { onChange, value } }) => (
                                    <Autocomplete options= { subctgy } disableClearable 
                                        getOptionLabel= { opt => opt.name || opt.id }
                                        noOptionsText= "No results..." 
                                        isOptionEqualToValue= { (option, value) => option.name === value.name || option.id === value.id }
                                        renderInput= { params => ( <TextField { ...params } variant= "standard" size= "small" fullWidth= { true } /> ) } 
                                        getOptionDisabled= { option => option.id === 0 }
                                        onChange= { (e, item) => { 
                                            onChange(item.id);
                                            setValue('sub_category_name', ((item.name).replace(' ', '-')).toLowerCase());
                                            refetch({ table: 'tbl_assign_asset', data: getValues() }); 
                                        } } value= { subctgy.find(data => { return data.id === (getValues().sub_category_id !== undefined ? getValues().sub_category_id : value) }) } />
                                ) } />
                    </Box> }
            </Stack>
            <Stack direction= "row" justifyContent= "flex-start" alignItems= "center" spacing= { 1 }>
                <Stack direction= "row" justifyContent= "flex-start" alignItems= "center" spacing= { 1 }>
                    <Typography variant= "caption">Order by:</Typography>
                    { orderby === 'date_created' ? 
                        <Typography sx= { ctgy } 
                            onClick= { () => {  
                                setValue('orderby', 'series_no'); 
                                setOrderby('series_no'); 
                                refetch({ table: 'tbl_assign_asset', data: getValues() }); 
                            } }>Date created</Typography> : 
                            orderby === 'series_no' ? 
                                <Typography sx= { ctgy } 
                                    onClick= { () => {  
                                        setValue('orderby', 'date_created'); 
                                        setOrderby('date_created'); 
                                        refetch({ table: 'tbl_assign_asset', data: getValues() }); 
                                    } }>Series no</Typography> : '' }
                </Stack>
                { sort === 'desc' ? 
                    <Typography sx= { asc }>
                        <FontAwesomeIcon icon= { faArrowDownZA } 
                            onClick= { () => { setValue('sort', 'asc'); setSort('asc'); refetch({ table: 'tbl_assign_asset', data: getValues() }); } } />
                    </Typography> :
                    <Typography sx= { desc }>
                        <FontAwesomeIcon icon= { faArrowDownAZ } 
                            onClick= { () => { setValue('sort', 'desc'); setSort('desc'); refetch({ table: 'tbl_assign_asset', data: getValues() }); } } />
                    </Typography> }
            </Stack>
        </Stack>
    );
}

export default Sort;