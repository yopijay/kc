// Libraries
import { Box, Container, Grid, Stack, Typography } from "@mui/material";
import { useContext } from "react";

// Core
import { ProfileCntx } from "core/context/Profile"; // Context
import { useGet } from "core/function/global"; // Function
import { profile } from "core/api"; // API

// Layout
import Navbar from 'pages/global/navbar';
import Sidebar from 'pages/global/sidebar';

const Index = () => {
    const { setData } = useContext(ProfileCntx);
    const { isLoading } = useGet({ key: ['profile'], fetch: profile(atob(localStorage.getItem('token'))), options: { refetchOnWindowFocus: false }, onSuccess: (data) => setData(data[0]) });
    
    return (
        <Box display= "flex">
            <Navbar />
            <Container maxWidth= "lg">
                <Stack direction= "row" justifyContent= "flex-start" alignItems= "flex-start">
                    <Sidebar />
                    <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= {{ width: '100%', height: '100%', padding: '90px 0 0 0' }}>
                        <Container maxWidth= "lg">
                            <Typography variant= "h6" sx= {{ fontFamily: 'Generica Bold', color: '#3C4048' }}>Dashboard</Typography>
                            <Grid container direction= "row" justifyContent= "flex-start" alignItems= "stretch">
                                
                            </Grid>
                        </Container>
                    </Stack>
                </Stack>
            </Container>
        </Box>
    );
}

export default Index;