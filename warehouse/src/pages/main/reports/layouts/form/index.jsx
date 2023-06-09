// Libraries
import { faChevronLeft } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { Box, Grid, Stack, ThemeProvider, Typography } from "@mui/material"
import { Link, useParams } from "react-router-dom";

// Constants
const card = { flexGrow: 1, backgroundColor: '#ffffff', padding: '20px', borderRadius: '8px',  overflowY: 'scroll', '&::-webkit-scrollbar': { display: 'none' } }
const input = {
    MuiInput: {
        styleOverrides: {
            root: {
                '&:before': { borderBottom: 'none' },
                '&:after': { borderBottom: 'none' },
                '&.Mui-disabled:before': { borderBottom: 'none' },
                '&:hover:not(.Mui-disabled):before': { borderBottom: 'none' }
            },
            input: { textTransform: 'uppercase' }
        }
    }
}

const Index = () => {
    const { type } = useParams();
    
    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= {{ width: '100%', height: '100%', overflow: 'hidden' }} spacing= { 1 }>
            <Stack direction= "row" justifyContent= "flex-start" alignItems= "center" spacing= { 2 } sx= {{ padding: '0 5px' }}>
                <Typography component= { Link } to= "/reports" sx= {{ cursor: 'pointer' }} color= "#444444"><FontAwesomeIcon icon= { faChevronLeft } size= "lg" /></Typography>
                <Typography sx= {{ fontWeight: 'bold' }} variant= "h6">Report ({ type.toUpperCase() })</Typography>
            </Stack>
            <Box sx= { card }>
                <form autoComplete= "off">
                    <ThemeProvider theme= { input }>

                    </ThemeProvider>
                </form>
            </Box>
            <Grid container direction= "row" justifyContent= "flex-end" alignItems= "center">
                <Grid item xs= { 6 } sm= { 4 } md= { 3 }>Save</Grid>
            </Grid>
        </Stack>
    );
}

export default Index;