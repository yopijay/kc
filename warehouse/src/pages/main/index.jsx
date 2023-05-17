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
import Sidebar from "pages/global/sidebar";
import Admin from "./admin";
import RCS from "./rcs";
import RAS from "./ras";

const Index = () => {
    const { data, setData } = useContext(ProfileCntx);
    const { isFetching } = useGet({ key: ['profile'], fetch: profile(atob(localStorage.getItem('token'))), options: { refetchOnWindowFocus: false }, onSuccess: data => setData(data[0]) });

    return (
        <Box display= "flex">
            <Navbar />
            {/* <Container maxWidth= "lg">
                { !isFetching ? 
                    <Stack direction= "row" justifyContent= "flex-start" alignItems= "flex-start">
                        <Sidebar />
                        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= {{ width: '100%', height: '100vh', padding: { xs: '70px 0 0 0', lg: '90px 10px 0 10px' } }}>
                            <Routes>
                                <Route exact path= "/*" element= {
                                    <Suspense fallback= { <LoaderScreen /> }>
                                        { data.type === 'admin' ? <Admin /> : '' }
                                        { data.type === 'rcs' ? <RCS /> : '' }
                                        { data.type === 'ras' ? <RAS /> : '' }
                                    </Suspense>
                                } />
                            </Routes>
                        </Stack>
                    </Stack> : <LoaderScreen /> }
            </Container> */}
        </Box>
    );
}

export default Index;