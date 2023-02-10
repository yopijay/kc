// Libraries
import { useContext, useEffect } from "react";
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

const Sort = ({ refetch, setCategory, category }) => {
    const { orderby, setOrderby, searchtxt } = useContext(GlobalCntx);

    useEffect(() => setCategory('5'), [ setCategory ]);
    return (
        <Stack direction= "row" justifyContent= "space-between" alignItems= "center" spacing= { 1 }>
            <Stack direction= "row" justifyContent= "flex-start" alignItems= "center" spacing= { 1 }>
            </Stack>
            <Stack direction= "row" justifyContent= "flex-start" alignItems= "center" spacing= { 1 }>
                <Stack direction= "row" justifyContent= "flex-start" alignItems= "center" spacing= { 1 }>
                    <Typography variant= "caption">Order by:</Typography>
                    { category === '5' ? 
                        <Typography sx= { ctgy } 
                            onClick= { () => { 
                                setCategory('12'); 
                                refetch({ table: 'tbl_users', data: { category: 12, orderby: orderby, searchtxt: searchtxt, id: atob(localStorage.getItem('token')) } }); 
                            } }>Date created</Typography> : 
                        category === '12' ? 
                            <Typography sx= { ctgy } 
                                onClick= { () => { 
                                    setCategory('6'); 
                                    refetch({ table: 'tbl_users', data: { category: 6, orderby: orderby, searchtxt: searchtxt, id: atob(localStorage.getItem('token')) } }); 
                                } }>Last name</Typography> :
                            category === '6' ? 
                                <Typography sx= { ctgy } 
                                    onClick= { () => { 
                                        setCategory('5'); 
                                        refetch({ table: 'tbl_users', data: { category: 5, orderby: orderby, searchtxt: searchtxt, id: atob(localStorage.getItem('token')) } }); 
                                        } }>Employee no</Typography> : '' }
                </Stack>
                { orderby === 'asc' ? 
                    <Typography sx= { asc }>
                        <FontAwesomeIcon icon= { faArrowDownAZ } 
                            onClick= { () => { 
                                setOrderby('desc'); 
                                refetch({ table: 'tbl_users', data: { category: category, orderby: 'desc', searchtxt: searchtxt, id: atob(localStorage.getItem('token')) } }); 
                            } } />
                    </Typography> :
                    <Typography sx= { desc }>
                        <FontAwesomeIcon icon= { faArrowDownZA } 
                            onClick= { () => { 
                                setOrderby('asc'); 
                                refetch({ table: 'tbl_users', data: { category: category, orderby: 'asc', searchtxt: searchtxt, id: atob(localStorage.getItem('token')) } }); 
                            } } />
                    </Typography> }
            </Stack>
        </Stack>
    );
}

export default Sort;