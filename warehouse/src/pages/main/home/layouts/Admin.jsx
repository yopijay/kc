// Libraries
import { Grid, Stack, Typography } from "@mui/material";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faChartPie, faTriangleExclamation, faUser, faUsers } from "@fortawesome/free-solid-svg-icons";
import { Link } from "react-router-dom";

const Admin = () => {

    return (
        <Grid container direction= "row" justifyContent= "flex-start" alignItems= "flex-start" sx= {{ padding: '12px 10px' }}>
            <Grid item xs= { 6 } sm= { 3 } component= { Link } to= "/attendees" sx= {{ textDecoration: 'none', color: '#444444' }}>
                <Stack direction= "column" justifyContent= "center" alignItems= "center" spacing= { 2 } sx= {{ padding: '20px 0' }}>
                    <FontAwesomeIcon icon= { faUsers } size= "xl" color= "#4b4b4b" />
                    <Typography variant= "body2">Attendees</Typography>
                </Stack>
            </Grid>
            <Grid item xs= { 6 } sm= { 3 } component= { Link } to= "/rcs" sx= {{ textDecoration: 'none', color: '#444444' }}>
                <Stack direction= "column" justifyContent= "center" alignItems= "center" spacing= { 2 } sx= {{ padding: '20px 0' }}>
                    <FontAwesomeIcon icon= { faUser } size= "xl" color= "#4b4b4b" />
                    <Typography variant= "body2">Rack Count Sheet</Typography>
                </Stack>
            </Grid>
            <Grid item xs= { 6 } sm= { 3 } component= { Link } to= "/ras" sx= {{ textDecoration: 'none', color: '#444444' }}>
                <Stack direction= "column" justifyContent= "center" alignItems= "center" spacing= { 2 } sx= {{ padding: '20px 0' }}>
                    <FontAwesomeIcon icon= { faUser } size= "xl" color= "#4b4b4b" />
                    <Typography variant= "body2">Rack Audit Sheet</Typography>
                </Stack>
            </Grid>
            <Grid item xs= { 6 } sm= { 3 } component= { Link } to= "/descrepancies" sx= {{ textDecoration: 'none', color: '#444444' }}>
                <Stack direction= "column" justifyContent= "center" alignItems= "center" spacing= { 2 } sx= {{ padding: '20px 0' }}>
                    <FontAwesomeIcon icon= { faTriangleExclamation } size= "xl" color= "#4b4b4b" />
                    <Typography variant= "body2">Descrepancies</Typography>
                </Stack>
            </Grid>
            <Grid item xs= { 6 } sm= { 3 } component= { Link } to= "/reports" sx= {{ textDecoration: 'none', color: '#444444' }}>
                <Stack direction= "column" justifyContent= "center" alignItems= "center" spacing= { 2 } sx= {{ padding: '20px 0' }}>
                    <FontAwesomeIcon icon= { faChartPie } size= "xl" color= "#4b4b4b" />
                    <Typography variant= "body2">Reports</Typography>
                </Stack>
            </Grid>
        </Grid>
    );
}

export default Admin;