import { faBoxesStacked, faChartPie, faTriangleExclamation, faUser, faUsers } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { Grid, Stack, Typography } from "@mui/material";
import { Link, Route, Routes } from "react-router-dom";

// Layouts
import Employee from "./employee";

// Constants
const container = {
    overflow: 'scroll',
    '&::-webkit-scrollbar': { display: 'none' },
    width: '100%',
    height: '100%'
}

const module = {
    width: '100%', 
    padding: '35px 0',
    textDecoration: 'none', 
    color: '#444444', 
    backgroundColor: '#ffffff', 
    borderRadius: '8px',
    transition: 'all 0.2s ease-in-out',
    '&:hover': { backgroundColor: '#ededed' }
}

const modules = [
    { icon: faUsers, label: `Employee`, link: `/employee` },
    { icon: faBoxesStacked, label: `Racks`, link: `/racks` },
    { icon: faUser, label: `RCS`, link: `/rcs` },
    { icon: faUser, label: `RAS`, link: `/ras` },
    { icon: faTriangleExclamation, label: `Discrepancies`, link: `/discrepancies` },
    { icon: faChartPie, label: `Racks`, link: `/racks` }
]

const Index = () => {
    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "flex-start" sx= { container }>
            <Routes>
                <Route exact path= "/" element= {
                    <Grid container direction= "row" justifyContent= "flex-start" alignItems= "flex-start">
                        <Grid item xs= { 12 }><Typography variant= "h5" sx= {{ fontWeight: 'bold' }}>Basic</Typography></Grid>
                        { modules.map((mdl, index) => (
                            <Grid item xs= { 12 } sm= { 4 } md= { 3 } key= { index } sx= {{ padding: { xs: '7px' }, width: '100%' }}>
                                <Stack direction= "column" justifyContent= "center" alignItems= "center" spacing= { 1 } sx= { module } component= { Link } to= { mdl.link }>
                                    <FontAwesomeIcon icon= { mdl.icon } size= "2x" />
                                    <Typography>{ mdl.label }</Typography>
                                </Stack>
                            </Grid>
                        )) }
                    </Grid>
                } />
                <Route exact path= "/employee/*" element= { <Employee /> } />
            </Routes>
        </Stack>
    );
}

export default Index;