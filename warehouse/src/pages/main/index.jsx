// Libraries
import { Box, Container, Stack } from "@mui/material";
import { Suspense, useContext } from "react";
import { Route, Routes } from "react-router-dom";

// Core
import { ProfileCntx } from "core/context/Profile"; // Context
import { profile } from "core/api"; // API
import { useGet } from "core/function/global"; // Function
import { LoaderScreen } from "core/loader/Screen"; // Loader

// Layout
import Navbar from "pages/global/navbar";
import Home from "pages/main/home";

const Index = () => {
    const { setData } = useContext(ProfileCntx);
    const { isFetching } = useGet({ key: ['profile'], fetch: profile(atob(localStorage.getItem('token'))), options: { refetchOnWindowFocus: false }, onSuccess: data => setData(data[0]) });

    return (
        <Box display= "flex">
            <Navbar />
            <Container maxWidth= "md">
                { !isFetching ? 
                    <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= {{ width: '100%', height: '100vh' }}>
                        <Routes>
                            <Route exact path= "/" element= { <Suspense fallback= { <LoaderScreen /> }><Home /></Suspense> } />
                            <Route exact path= "/attendance/*" element= { <Suspense fallback= { <LoaderScreen /> }>Attendance</Suspense> } />
                        </Routes>
                    </Stack> : <LoaderScreen /> }
            </Container>
        </Box>
    );
}

export default Index;