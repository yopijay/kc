// Libraries
import { useContext } from "react";
import { Stack, Typography } from "@mui/material";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faArrowDownAZ, faArrowDownZA } from "@fortawesome/free-solid-svg-icons";

// Core
import { GlobalCntx } from "core/context/Global"; // Context

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
    const { orderby, setOrderby, category, setCategory, searchtxt } = useContext(GlobalCntx);

    return (
        <Stack direction= "row" justifyContent= "flex-end" alignItems= "center" spacing= { 1 }>
            <Stack direction= "row" justifyContent= "flex-start" alignItems= "center" spacing= { 1 }>
                <Typography variant= "caption">Order by:</Typography>
                { category === 'date_created' ? 
                    <Typography sx= { ctgy } 
                        onClick= { () => { 
                            setCategory('name'); 
                            refetch({ table: 'tbl_department', data: { category: 'name', orderby: orderby, searchtxt: searchtxt } }); } }>Date created</Typography> : 
                    category === 'name' ? 
                        <Typography sx= { ctgy } 
                            onClick= { () => { 
                                setCategory('series_no'); 
                                refetch({ table: 'tbl_department', data: { category: 'series_no', orderby: orderby, searchtxt: searchtxt } }); } }>Name</Typography> :
                        category === 'series_no' ? 
                            <Typography sx= { ctgy } 
                                onClick= { () => { 
                                    setCategory('date_created'); 
                                    refetch({ table: 'tbl_department', data: { category: 'date_created', orderby: orderby, searchtxt: searchtxt } }); } }>Series no</Typography> : '' }
            </Stack>
            { orderby === 'asc' ? 
                <Typography sx= { asc }>
                    <FontAwesomeIcon icon= { faArrowDownAZ } 
                        onClick= { () => { 
                            setOrderby('desc'); 
                            refetch({ table: 'tbl_department', data: { category: category, orderby: 'desc', searchtxt: searchtxt } }); } } />
                </Typography> :
                <Typography sx= { desc }>
                    <FontAwesomeIcon icon= { faArrowDownZA } 
                        onClick= { () => { 
                            setOrderby('asc'); 
                            refetch({ table: 'tbl_department', data: { category: category, orderby: 'asc', searchtxt: searchtxt } }); } } />
                </Typography> }
        </Stack>
    );
}

export default Sort;