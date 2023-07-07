// Libraries
import { Grid, Skeleton, Stack, Typography } from "@mui/material";

// Core
import { dashboard } from "core/api"; // API
import { usePost } from "core/function/global"; // Function
import { useEffect, useState } from "react";

// Custom styles
const card = {
    backgroundColor: '#FFFFFF', 
    padding: '20px', 
    borderRadius: '10px', 
    border: 'solid 1px #F3F3F3'
}

const label = {
    fontWeight: 'bold', 
    color: '#C8C8C8', 
    width: '100%', 
    whiteSpace: 'nowrap', 
    overflow: 'hidden', 
    textOverflow: 'ellipsis'
}

const Dashboard = () => {
    let [ count, setCount ] = useState({});
    const { mutate: dash, isLoading } = usePost({ fetch: dashboard, onSuccess: data => setCount(data) });

    useEffect(() => { dash({ table: 'tbl_users', data: {} }); }, [ dash ]);

    return (
        <Grid container direction= "row" justifyContent= "flex-start" alignItems= "stretch" sx= {{ padding: '5px 0' }} spacing= { 1 }>
            <Grid item xs= { 6 } sm= { 3 } sx= {{ padding: { xs: '0 5px 0 0' } }}>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "flex-start" sx= { card }>
                    { !isLoading ? <Typography variant= "h5" sx= {{ fontFamily: 'Boldstrom', color: '#535b64' }}>{ `${count.total < 10 ? '0' : ''}${count.total}` }</Typography> : 
                        <Skeleton variant= "text" sx= {{ width: '50px', fontSize: '1rem' }} /> }
                    <Typography variant= "body1" sx= { label }>TOTAL</Typography>
                </Stack>
            </Grid>
            { !isLoading ? 
                (count.summary)?.length > 0 ? 
                    (count.summary)?.map((summ, index) => (
                        <Grid item xs= { 6 } sm= { 3 } sx= {{ padding: '0 5px' }} key= { index}>
                            <Stack direction= "column" justifyContent= "flex-start" alignItems= "flex-start" sx= { card }>
                                <Typography variant= "h5" sx= {{ fontFamily: 'Boldstrom', color: '#535b64' }}>{ `${summ.count < 10 ? '0' : ''}${summ.count}` }</Typography>
                                <Typography variant= "body1" sx= { label }>{ summ.name }</Typography>
                            </Stack>
                        </Grid>
                    ))
                    : '' : 
                <Grid item xs= { 6 } sm= { 3 } sx= {{ padding: '0 5px' }}>
                    <Stack direction= "column" justifyContent= "flex-start" alignItems= "flex-start" sx= { card }>
                        <Skeleton variant= "text" sx= {{ width: '50px', fontSize: '1rem' }} />
                        <Skeleton variant= "text" sx= { label } />
                    </Stack>
                </Grid> }
        </Grid>
    );
}

export default Dashboard;