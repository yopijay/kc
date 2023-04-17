// Libraries
import { Chip, Grid, Stack, Typography } from "@mui/material";
import { useContext } from "react";
import { Link } from "react-router-dom";

// Core
import { ListCntxt } from "core/context/List"; // Context

// Custom styles
const txt = {
    whiteSpace: 'nowrap', 
    overflow: 'hidden', 
    textOverflow: 'ellipsis', 
    width: '100%'
}

const container = {
    width: '100%', 
    padding: '15px 18px',
    backgroundColor: '#FFFFFF',
    boxShadow: 1,
    borderRadius: '8px',
    overflow: 'hidden',
    transition: 'all 0.2s ease-in-out',
    textDecoration: 'none',
    color: '#444444',
    '&:hover': { backgroundColor: '#F1F1F1' }
}

const Item = ({ sub, fetching, profile }) => {
    const { list } = useContext(ListCntxt);

    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 2 } sx= {{ padding: '0 0 40px 0', overflowY: 'scroll', '&::-webkit-scrollbar': { display: 'none' } }}>
            <Grid container direction= "row" justifyContent= "flex-start" alignItems= "flex-start">
                { list.length > 0 ? 
                    list?.map((data, index) => (
                        <Grid item xs= { 12 } sm= { 6 } key= { index } sx= {{ padding: '10px 8px' }}>
                            <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= { container } spacing= { 1 } 
                                component= { Link } 
                                to= { !fetching && (JSON.parse(profile.permissions)?.[`module_${sub?.module_id}`][`submodule_${sub?.id}`].update || profile.user_level === 'superadmin') ? 
                                            `/servicing/request/form/update/${data.id}` : `/servicing/request` }>
                                <Stack direction= "row" justifyContent= "space-between" alignItems= "center">
                                    <Typography variant= "body2" sx= { txt }>Service Request No.: <b>{ data.service_request_no }</b></Typography>
                                </Stack>
                                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                                    <Typography sx= { txt } style= {{ fontWeight: 'bold' }}>{ data.customer }</Typography>
                                    <Typography sx= { txt }>{ data.project }</Typography>
                                    <Typography sx= { txt }>SO No.: <b>{ data.so_no }</b></Typography>
                                </Stack>
                                <Stack direction= "column" justifyContent= "flex-start" alignItems= "flex-end">
                                    <Typography variant= "caption">Date requested: <b>{ data.date_requested }</b></Typography>
                                    <Typography variant= "caption">Date prepared: <b>{ data.date_prepared }</b></Typography>
                                    <Typography variant= "caption">Date needed: <b>{ data.date_needed }</b></Typography>
                                </Stack>
                                <Stack direction= "row" justifyContent= "flex-end" alignItems= "center" spacing= { 1 }>
                                    { data.status === 'approved' ? 
                                        <Chip variant= "default" label= "Approved" sx= {{ backgroundColor: '#00ab55', color: '#FFFFFF', textTransform: 'uppercase', fontWeight: 'bold' }} /> : ''}
                                    { data.status === 'saved' || data.status === 'posted' ? 
                                        <Chip variant= "default" label= "Pending" sx= {{ backgroundColor: '#fda92d', color: '#FFFFFF', textTransform: 'uppercase', fontWeight: 'bold' }} /> : ''}
                                    { data.status === 'saved' ? 
                                        <Chip variant= "default" label= "Saved" sx= {{ backgroundColor: '#2065d1', color: '#FFFFFF', textTransform: 'uppercase', fontWeight: 'bold' }} /> : ''}
                                    { data.status === 'posted' ? 
                                        <Chip variant= "default" label= "Posted" sx= {{ backgroundColor: '#2065d1', color: '#FFFFFF', textTransform: 'uppercase', fontWeight: 'bold' }} /> : ''}
                                    { data.status === 'dispatch' ? 
                                        <Chip variant= "default" label= "Dispatch" sx= {{ backgroundColor: '#00ab55', color: '#FFFFFF', textTransform: 'uppercase', fontWeight: 'bold' }} /> : ''}
                                    { data.status === 'closed' ? 
                                        <Chip variant= "default" label= "Closed" sx= {{ backgroundColor: '#e17055', color: '#FFFFFF', textTransform: 'uppercase', fontWeight: 'bold' }} /> : ''}
                                    { data.status === 'done' ? 
                                        <Chip variant= "default" label= "Done" sx= {{ backgroundColor: '#00ab55', color: '#FFFFFF', textTransform: 'uppercase', fontWeight: 'bold' }} /> : ''}
                                </Stack>
                            </Stack>
                        </Grid>
                    )) :
                    <Grid item xs= { 12 }>
                        <Stack direction= "row" justifyContent= "center" alignItems= "center" sx= {{ backgroundColor: '#FFFFFF', padding: '10px', border: 'solid 1px #F3F3F3', borderRadius: '10px' }}>
                            <Typography>No record/s found!</Typography>
                        </Stack>
                    </Grid> }
            </Grid>
        </Stack>
    );
}

export default Item;