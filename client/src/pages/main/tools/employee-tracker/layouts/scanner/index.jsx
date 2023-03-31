// Libraries
import { faClockRotateLeft } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { Box, Stack, Typography } from "@mui/material";
import QrReader from "react-qr-reader";
import { Link } from "react-router-dom";

// Constants
const card = {
    padding: '30px 15px',
    flexGrow: 1,
    backgroundColor: '#ffffff',
    borderRadius: '8px',
    border: 'solid 1px #919eab40',
    overflowY: 'scroll',
    '&::-webkit-scrollbar': { display: 'none' }
}

const btnicon = {
    color: '#ffffff',
    backgroundColor: '#d1d1d1',
    borderRadius: '7px',
    padding: {
        xs: '5px 12px',
        md: '4px 10px'
    },
    transition: 'all 0.2s ease-in-out',
    '&:hover': { backgroundColor: '#adadad' }
}

const Index = () => {

    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 3 } sx= {{ width: '100%', height: '100%', paddingBottom: '20px' }}>
            <Stack direction= "row" justifyContent= "space-between" alignItems= "center">
                <Typography variant= "h6" sx= {{ fontFamily: 'Boldstrom', color: '#3C4048' }}>Employee Tracker</Typography>
                <Typography sx= { btnicon } component= { Link } to= "/tools/employee-tracker/logs" ><FontAwesomeIcon icon= { faClockRotateLeft }/></Typography>
            </Stack>
            <Box xs= { card }>
                <Stack direction= "row" justifyContent= "center" alignItems= "center" sx= {{ width: '100%', height: '100vh' }}>
                    <QrReader delay={ 3000 } onScan={ data => { if(data !== null) { console.log(data); } } } onError= { err => console.log(err) } style= {{ width: '100%', height: '100%' }} 
                        facingMode= "user" />
                </Stack>
            </Box>
        </Stack>
    );
}

export default Index;