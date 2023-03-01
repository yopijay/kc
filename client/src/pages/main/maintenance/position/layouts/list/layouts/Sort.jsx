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
    backgroundColor: '#E5E5E5',
    transition: 'all 0.2s ease-in-out',
    cursor: 'pointer',
    '&:hover': { backgroundColor: '#E5E5E5' }
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
    const [ orderby, setOrderby ] = useState('date_created');
    const [ sort, setSort ] = useState('desc');

    return (
        <Stack direction= "row" justifyContent= "flex-end" alignItems= "center" spacing= { 1 }>
            <Stack direction= "row" justifyContent= "flex-start" alignItems= "center" spacing= { 1 }>
                <Typography variant= "caption">Order by:</Typography>
                { orderby === 'date_created' ? 
                    <Typography sx= { ctgy } 
                        onClick= { () => {  setValue('orderby', 'name'); setOrderby('name'); refetch({ table: 'tbl_position', data: getValues() }); } }>Date created</Typography> : 
                    orderby === 'name' ? 
                        <Typography sx= { ctgy } 
                            onClick= { () => {  setValue('orderby', 'series_no'); setOrderby('series_no'); refetch({ table: 'tbl_position', data: getValues() }); } }>Name</Typography> :
                        orderby === 'series_no' ? 
                            <Typography sx= { ctgy } 
                                onClick= { () => {  setValue('orderby', 'date_created'); setOrderby('date_created'); refetch({ table: 'tbl_position', data: getValues() }); } }>Series no</Typography> : '' }
            </Stack>
                { sort === 'desc' ? 
                    <Typography sx= { asc }>
                        <FontAwesomeIcon icon= { faArrowDownZA } onClick= { () => { setValue('sort', 'asc'); setSort('asc'); refetch({ table: 'tbl_position', data: getValues() }); } } />
                    </Typography> :
                    <Typography sx= { desc }>
                        <FontAwesomeIcon icon= { faArrowDownAZ } onClick= { () => { setValue('sort', 'desc'); setSort('desc'); refetch({ table: 'tbl_position', data: getValues() }); } } />
                    </Typography> }
        </Stack>
    );
}

export default Sort;