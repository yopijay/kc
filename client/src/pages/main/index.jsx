// Libraries
import { Box, Container, Stack } from "@mui/material";
import { Suspense, useContext } from "react";
import { Route, Routes } from "react-router-dom";

// Core
import { ProfileCntx } from "core/context/Profile"; // Context
import { useGet } from "core/function/global"; // Function
import { profile } from "core/api"; // API
import { Navs as components } from "core/constants/Navs"; // Navs
import { LoaderScreen } from "core/loader/Screen";

// Layout
import Navbar from 'pages/global/navbar';
import Sidebar from 'pages/global/sidebar';

const Index = () => {
    const { setData } = useContext(ProfileCntx);
    useGet({ key: ['profile'], fetch: profile(atob(localStorage.getItem('token'))), options: { refetchOnWindowFocus: false }, onSuccess: (data) => setData(data[0]) });
    
    return (
        <Box display= "flex">
            <Navbar />
            <Container maxWidth= "lg">
                <Stack direction= "row" justifyContent= "flex-start" alignItems= "flex-start">
                    <Sidebar />
                    <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= {{ width: '100%', height: '100vh', padding: { xs: '70px 0 0 0', lg: '90px 10px 0 10px' } }}>
                        <Routes>{ components().map(ctgy => { return (ctgy.nav).map((layout, index) => ( <Route exact path= { `${layout.path}/*` } key= { index } element= { <Suspense fallback= { <LoaderScreen /> }>{ layout.component }</Suspense> } />)) }) }</Routes>
                    </Stack>
                </Stack>
            </Container>
        </Box>
    );
}

export default Index;