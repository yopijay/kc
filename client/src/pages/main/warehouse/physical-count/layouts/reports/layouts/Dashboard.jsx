// Libraries
import { Grid, Stack, Typography } from "@mui/material";
import { useParams } from "react-router-dom";

// Core
import { useGet } from "core/function/global"; // Function
import { dashboard } from "core/api"; // API

// Constants
import { card } from "../index.style"; // Styles

const Dashboard = () => {
    const { id } = useParams();
    const { data: counts } = useGet({ key: ['pc_count'], fetch: dashboard({ table: 'tbl_physical_count', data: { id: id } }), options: { refetchOnWindowFocus: false, refetchInterval: 1000 } });

    return (
        <Grid container direciton= "row" justifyContent= "flex-start" alignItems= "flex-start" spacing= { 1 }>
            <Grid item xs= { 6 } md= { 3 }>
                <Stack direction= "row" justifyContent= "space-between" alignItems= "center" sx= { card } spacing= { 2 }>
                    <Typography variant= "body1" sx= {{ fontWeight: 'bold' }}>All Items</Typography>
                    <Typography variant= "body2">{ counts?.total }</Typography>
                </Stack>
            </Grid>
            <Grid item xs= { 6 } md= { 3 }>
                <Stack direction= "row" justifyContent= "space-between" alignItems= "center" sx= { card } spacing= { 2 }>
                    <Typography variant= "body1" sx= {{ fontWeight: 'bold' }}>RCS</Typography>
                    <Typography variant= "body2">{ counts?.rcs }</Typography>
                </Stack>
            </Grid>
            <Grid item xs= { 6 } md= { 3 }>
                <Stack direction= "row" justifyContent= "space-between" alignItems= "center" sx= { card } spacing= { 2 }>
                    <Typography variant= "body1" sx= {{ fontWeight: 'bold' }}>RAS</Typography>
                    <Typography variant= "body2">{ counts?.ras }</Typography>
                </Stack>
            </Grid>
            <Grid item xs= { 6 } md= { 3 }>
                <Stack direction= "row" justifyContent= "space-between" alignItems= "center" sx= { card } spacing= { 2 }>
                    <Typography variant= "body1" sx= {{ fontWeight: 'bold' }}>Discrepancy</Typography>
                    <Typography variant= "body2">{ counts?.dis }</Typography>
                </Stack>
            </Grid>
        </Grid>
    );
}

export default Dashboard;