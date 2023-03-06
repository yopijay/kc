// Libraries
import { Box, Container, Stack, Typography } from "@mui/material";
import { Suspense, useContext } from "react";
import { Route, Routes } from "react-router-dom";

// Core
import { ProfileCntx } from "core/context/Profile"; // Context
import { useGet } from "core/function/global"; // Function
import { profile } from "core/api"; // API
import { LoaderScreen } from "core/loader/Screen"; // Loader

// Layout
import Navbar from 'pages/global/navbar';
import Sidebar from 'pages/global/sidebar';
import Module from 'pages/main/setup/module';
// import Users from 'pages/main/setup/user';

const Index = () => {
    const { setData } = useContext(ProfileCntx);
    const { data: prof, isFetching: fetching } = useGet({ key: ['profile'], fetch: profile(atob(localStorage.getItem('token'))), options: { refetchOnWindowFocus: false }, onSuccess: (data) => setData(data[0]) });
    
    return (
        <Box display= "flex">
            <Navbar />
            <Container maxWidth= "lg">
                { !fetching ? 
                    <Stack direction= "row" justifyContent= "flex-start" alignItems= "flex-start">
                        <Sidebar />
                        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= {{ width: '100%', height: '100vh', padding: { xs: '70px 0 0 0', lg: '90px 10px 0 10px' } }}>
                            <Routes>
                                <Route exact path= "/" element= { <Suspense fallback= { <LoaderScreen /> }><Typography variant= "h6">Dashboard</Typography></Suspense> } />
                                { prof[0].user_level === 'superadmin' ? <Route exact path= "/setup/module/*" element= { <Suspense fallback= { <LoaderScreen /> }><Module /></Suspense> } /> : '' }
                                {/* <Route exact path= "/setup/sub-module/*" element= { <Suspense fallback= { <LoaderScreen /> }><Typography variant= "h6">Sub-module</Typography></Suspense> } />
                                <Route exact path= "/setup/user/*" element= { <Suspense fallback= { <LoaderScreen /> }><Users /></Suspense> } />
                                <Route exact path= "/setup/user-role-access/*" element= { <Suspense fallback= { <LoaderScreen /> }><Typography variant= "h6">User role-access</Typography></Suspense> } /> */}
                                {/* // { components().map(ctgy => { 
                                // return (ctgy.nav).map((layout, index) => ( 
                                //     <Route exact path= { `${layout.path}/*` } key= { index } element= { <Suspense fallback= { <LoaderScreen /> }>{ layout.component }</Suspense> } /> 
                                // )) }) } */}
                            </Routes>
                        </Stack>
                    </Stack> : <LoaderScreen /> }
            </Container>
        </Box>
    );
}

export default Index;