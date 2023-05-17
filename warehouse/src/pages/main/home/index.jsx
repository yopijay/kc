// Libraries
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { Grid, Stack, Typography } from "@mui/material";
import { useContext } from "react";
import { faBoxesStacked, faChartPie, faTriangleExclamation, faUser, faUsers } from "@fortawesome/free-solid-svg-icons";
import { Link } from "react-router-dom";

// Core
import { ProfileCntx } from "core/context/Profile"; // Context

// Layout
import Profile from "pages/global/profile";

// Constants
const container = { width: '100%', flexGrow: 1, overflowY: 'scroll', padding: '90px 0 20px 0', '&::-webkit-scrollbar': { display: 'none' } };

const Index = () => {
    const { data } = useContext(ProfileCntx);
    
    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= { container } spacing= { 2 }>
            <Profile />
            <Grid container direction= "row" justifyContent= "flex-start" alignItems= "flex-start" sx= {{ padding: '12px 10px' }}>
                { data.type === 'admin' ? 
                    <Grid item xs= { 4 } sm= { 3 } component= { Link } to= "/attendance" sx= {{ textDecoration: 'none', color: '#444444' }}>
                        <Stack direction= "column" justifyContent= "center" alignItems= "center" spacing= { 2 } sx= {{ padding: '20px 0' }}>
                            <FontAwesomeIcon icon= { faUsers } size= "xl" color= "#4b4b4b" />
                            <Typography variant= "body2">Attendance</Typography>
                        </Stack>
                    </Grid> : '' }
                { data.type === 'admin' ? 
                    <Grid item xs= { 4 } sm= { 3 }>
                        <Stack direction= "column" justifyContent= "center" alignItems= "center" spacing= { 2 } sx= {{ padding: '20px 0' }}>
                            <FontAwesomeIcon icon= { faBoxesStacked } size= "xl" color= "#4b4b4b" />
                            <Typography variant= "body2">Racks</Typography>
                        </Stack>
                    </Grid> : '' }
                { data.type === 'admin' || data.type === 'rcs' ? 
                    <Grid item xs= { 4 } sm= { 3 }>
                        <Stack direction= "column" justifyContent= "center" alignItems= "center" spacing= { 2 } sx= {{ padding: '20px 0' }}>
                            <FontAwesomeIcon icon= { faUser } size= "xl" color= "#4b4b4b" />
                            <Typography variant= "body2">Rack Count Sheet</Typography>
                        </Stack>
                    </Grid> : '' }
                { data.type === 'admin' || data.type === 'ras' ? 
                    <Grid item xs= { 4 } sm= { 3 }>
                        <Stack direction= "column" justifyContent= "center" alignItems= "center" spacing= { 2 } sx= {{ padding: '20px 0' }}>
                            <FontAwesomeIcon icon= { faUser } size= "xl" color= "#4b4b4b" />
                            <Typography variant= "body2">Rack Audit Sheet</Typography>
                        </Stack>
                    </Grid> : '' }
                { data.type === 'admin' ? 
                    <Grid item xs= { 4 } sm= { 3 }>
                        <Stack direction= "column" justifyContent= "center" alignItems= "center" spacing= { 2 } sx= {{ padding: '20px 0' }}>
                            <FontAwesomeIcon icon= { faTriangleExclamation } size= "xl" color= "#4b4b4b" />
                            <Typography variant= "body2">Descrepancies</Typography>
                        </Stack>
                    </Grid> : '' }
                { data.type === 'admin' ? 
                    <Grid item xs= { 4 } sm= { 3 }>
                        <Stack direction= "column" justifyContent= "center" alignItems= "center" spacing= { 2 } sx= {{ padding: '20px 0' }}>
                            <FontAwesomeIcon icon= { faChartPie } size= "xl" color= "#4b4b4b" />
                            <Typography variant= "body2">Reports</Typography>
                        </Stack>
                    </Grid> : '' }
            </Grid>
        </Stack>
    );
}

export default Index;