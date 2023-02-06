// Libraries
import { Grid, Stack, ThemeProvider, Typography } from "@mui/material";
import { Link, Route, Routes } from "react-router-dom";

// Core
import { ListPrvdr } from "core/context/List"; // Context
import { input } from "core/theme/form.theme"; // Theme
import { FormPrvdr } from "core/context/Form"; // Context

// Layouts
import List from "./layouts/list";
import Form from "./layouts/form";

// Custom styles
const container = {
    overflow: 'scroll',
    width: '100%',
    height: '100%',
    '&::-webkit-scrollbar': { display: 'none' }
}

const tablink = {
    backgroundColor: '#FFFFFF',
    borderRadius: '20px',
    border: 'solid 1px #e5e5e5de',
    padding: '7px 0',
    cursor: 'pointer',
    transition: 'all 0.2s ease-in-out',
    textDecoration: 'none',
    '&:hover': { 
        backgroundColor: '#F47C7C2E',
        border: 'solid 1px #F47C7C2E'
    },
}

const activetablink = {
    backgroundColor: '#F47C7C',
    textDecoration: 'none',
    borderRadius: '20px',
    border: 'solid 1px #F47C7C2E',
    padding: '7px 0',
    cursor: 'pointer',
    transition: 'all 0.2s ease-in-out',
}

const Index = () => {
    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "flex-start" sx= { container }>
            <Grid container direction= "row" justifyContent= "flex-start" alignItems= "center" spacing= { 2 }>
                <Grid item xs= { 4 } sm= { 4 } md= { 3 }>
                    <Stack direction= "row" justifyContent= "center" alignItems= "center" sx= { activetablink } component= { Link } to= "/supplies/office-furniture">
                        <Typography variant= "body1" sx= {{ textTransform: 'uppercase', color: '#FFFFFF' }}>Items</Typography>
                    </Stack>
                </Grid>
                <Grid item xs= { 4 } sm= { 4 } md= { 3 }>
                    <Stack direction= "row" justifyContent= "center" alignItems= "center" sx= { tablink } component= { Link } to= "/supplies/office-furniture/category">
                        <Typography variant= "body1" sx= {{ textTransform: 'uppercase', color: '#222222' }}>Category</Typography>
                    </Stack>
                </Grid>
            </Grid>
            <Routes>
                <Route exact path= "/" element= { console.log((window.location.pathname).split('/')[4]) } />
                <Route exact path= "/category" element= { console.log((window.location.pathname).split('/')[4]) } />
            </Routes>
        </Stack>
    );
}

export default Index;