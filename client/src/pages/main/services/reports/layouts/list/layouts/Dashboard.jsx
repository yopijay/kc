// Libraries
import { Grid, Skeleton, Stack, Typography } from "@mui/material";
import { useEffect, useState } from "react";

// Core
import { usePost } from "core/function/global"; // Function
import { dashboard } from "core/api"; // Core

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
    textOverflow: 'ellipsis',
    textTransform: 'uppercase'
}

const Dashboard = () => {
    let [ count, setCount ] = useState({});
    const { mutate: dash, isLoading } = usePost({ fetch: dashboard, onSuccess: data => setCount(data) });

    useEffect(() => { dash({ table: 'tbl_services', data: { type: 'report' } }); }, [ dash ]);

    return (
        <Grid container direction= "row" justifyContent= "flex-start" alignItems= "stretch" sx= {{ padding: '5px 0' }}>
            <Grid item xs= { 6 } sx= {{ padding: { xs: '0 5px 0 0' } }}>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "flex-start" sx= { card }>
                    { !isLoading ? <Typography variant= "h5" sx= {{ fontFamily: 'Boldstrom', color: '#535b64' }}>{ `${count.ongoing < 10 ? '0' : ''}${count.ongoing}` }</Typography> : 
                        <Skeleton variant= "text" sx= {{ width: '50px', fontSize: '1rem' }} /> }
                    <Typography variant= "body1" sx= { label }>On Going</Typography>
                </Stack>
            </Grid>
        </Grid>
    );
}

export default Dashboard;