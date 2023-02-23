// Libraries
import { Grid, Skeleton, Stack, Typography } from "@mui/material";

// Core
import { useGet } from "core/function/global"; // Function
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
    textOverflow: 'ellipsis'
}

const Dashboard = () => {
    const { data: count, isFetching } = useGet({ key: ['brd_dashboard'], fetch: dashboard('tbl_sub_category') });

    return (
        <Grid container direction= "row" justifyContent= "flex-start" alignItems= "stretch" sx= {{ padding: '5px 0' }}>
            <Grid item xs= { 3 } sm= { 6 } sx= {{ padding: { xs: '0 5px 0 0' } }}>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "flex-start" sx= { card }>
                    { !isFetching ? <Typography variant= "h5" sx= {{ fontFamily: 'Boldstrom', color: '#535b64' }}>{ `${count.total < 10 ? '0' : ''}${count.total}` }</Typography> : 
                        <Skeleton variant= "text" sx= {{ width: '50px', fontSize: '1rem' }} /> }
                    <Typography variant= "body1" sx= { label }>TOTAL</Typography>
                </Stack>
            </Grid>
            <Grid item xs= { 4 } sm= { 3 } sx= {{ padding: '0 5px' }}>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "flex-start" sx= { card }>
                    { !isFetching ? <Typography variant= "h5" sx= {{ fontFamily: 'Boldstrom', color: '#535b64' }}>{ `${count.supplies < 10 ? '0' : ''}${count.supplies}` }</Typography> : 
                        <Skeleton variant= "text" sx= {{ width: '50px', fontSize: '1rem' }} /> }
                    <Typography variant= "body1" sx= {{ fontWeight: 'bold', color: '#C8C8C8', width: '100%', whiteSpace: 'nowrap', overflow: 'hidden', textOverflow: 'ellipsis' }}>SUPPLIES</Typography>
                </Stack>
            </Grid>
            <Grid item xs= { 4 } sm= { 3 } sx= {{ padding: '0 5px' }}>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "flex-start" sx= { card }>
                    { !isFetching ? <Typography variant= "h5" sx= {{ fontFamily: 'Boldstrom', color: '#535b64' }}>{ `${count.assets < 10 ? '0' : ''}${count.assets}` }</Typography> : 
                        <Skeleton variant= "text" sx= {{ width: '50px', fontSize: '1rem' }} /> }
                    <Typography variant= "body1" sx= {{ fontWeight: 'bold', color: '#C8C8C8', width: '100%', whiteSpace: 'nowrap', overflow: 'hidden', textOverflow: 'ellipsis' }}>ASSETS</Typography>
                </Stack>
            </Grid>
        </Grid>
    );
}

export default Dashboard;