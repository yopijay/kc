// Libraries
import { Box, Dialog, Stack, Typography, useMediaQuery } from "@mui/material";
import { useContext, useState } from "react";
import QrReader from "react-qr-reader";
import { useTheme } from "@emotion/react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faXmark } from "@fortawesome/free-solid-svg-icons";

// Core
import { ListCntxt } from "core/context/List"; // Context

// Constants
const card = { margin: '10px 0', backgroundColor: '#ffffff', padding: '15px', borderRadius: '8px', textDecoration: 'none', color: '#444444' };

const Items = () => {
    const { list } = useContext(ListCntxt);
    const theme = useTheme();
    const fullscreen = useMediaQuery(theme.breakpoints.down('sm'));
    const [ scanner, setScanner ] = useState(false);
    const [ code, setCode ] = useState('');

    return (
        <Box sx= {{ overflowY: 'scroll', '&::-webkit-scrollbar': { display: 'none' } }}>
            { list?.map((itm, index) => (
                <Stack direction= "row" justifyContent= "space-between" alignItems= "center" key= { index } sx= { card } style= {{ cursor: 'pointer' }}
                    onClick= { () => { setScanner(true); setCode(itm.item_code); } }>
                    <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                        <Typography sx= {{ fontWeight: 'bold', flexGrow: 1 }}>{ itm.item_code }</Typography>
                        <Typography variant= "body2">Location: { `${(itm.branch).toUpperCase()}${(itm.floor).toUpperCase()}-${itm.code}` }</Typography>
                    </Stack>
                    <Box sx= {{ width: '10px', height: '10px', backgroundColor: `${itm.date_counted !== null ? '#7D8F69' : '#EF9F9F'}`, borderRadius: '20px' }} />
                </Stack>
            )) }
            <Dialog fullScreen= { fullscreen } open= { scanner } maxWidth= "md" fullWidth= { true } disableEscapeKeyDown= { true }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= {{ padding: '30px' }}>
                    <Stack direction= "row" justifyContent= "flex-end" alignItems= "center">
                        <Typography style= {{ cursor: 'pointer' }} onClick= { () => setScanner(false) }><FontAwesomeIcon icon= { faXmark } size= "xl" /></Typography>
                    </Stack>
                    <Stack direction= "column" justifyContent= "flex-start" alignItems= "center" spacing= { 3 }>
                        <Typography variant= "h6" sx= {{ fontWeight: 'bold', textTransform: 'uppercase' }}>Scan here!</Typography>
                        <Stack direction= "column" justifyContent= "flex-start" alignItems= "center" sx= {{ width: '100%' }}>
                            <Stack direction= "row" justifyContent= "space-between" alignItems= "center" sx= {{ width: { xs: '100%', sm: '80%', md: '60%' } }}>
                                <Box sx= {{ borderTop: 'solid 10px #ecf0f1', borderLeft: 'solid 10px #ecf0f1', width: '60px', height: '60px' }} />
                                <Box sx= {{ borderTop: 'solid 10px #ecf0f1', borderRight: 'solid 10px #ecf0f1', width: '60px', height: '60px' }} />
                            </Stack>
                            <Box sx= {{ width: { xs: '80%', sm: '400px'}, height: { xs: 'auto', sm: '400px'}, overflow: 'hidden', borderRadius: '10px' }}>
                                <QrReader delay= { 3000 } onError= { err => console.log(err) } style= {{ width: '100%' }} facingMode= "environment"
                                    onScan= { data => {
                                        console.log(data);
                                    }
                                } />
                            </Box>
                            <Stack direction= "row" justifyContent= "space-between" alignItems= "center" sx= {{ width: { xs: '100%', sm: '80%', md: '60%' } }}>
                                <Box sx= {{ borderBottom: 'solid 10px #ecf0f1', borderLeft: 'solid 10px #ecf0f1', width: '60px', height: '60px' }} />
                                <Box sx= {{ borderBottom: 'solid 10px #ecf0f1', borderRight: 'solid 10px #ecf0f1', width: '60px', height: '60px' }} />
                            </Stack>
                        </Stack>
                        <Stack direction= "column" justifyContent= "space-between" alignItems= "center" sx= {{ width: { xs: '80%', sm: '50%'} }}>
                            <Typography sx= {{ textAlign: 'center' }}>Place qr code inside the frame to scan, please avoid shake to get result quickly.</Typography>
                        </Stack>
                    </Stack>
                </Stack>
            </Dialog>
        </Box>
    );
}

export default Items;