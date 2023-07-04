// Libraries
import { Box, Stack, Typography } from "@mui/material";

// Core
import { useGet } from "core/function/global"; // Function
import { specific } from "core/api"; // API

// Constants
import { select } from "../../index.style"; // Styles

const Filter = ({ setOpen }) => {

    return (
        <Stack direction= "column" justifyContent= "space-between" alignItems= "stretch" sx= {{ padding: '25px 20px', height: '100%' }} spacing= { 2 }>
            <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 2 } sx= {{ flexGrow: 1 }}>
                <Typography variant= "h6" sx= {{ fontWeight: 'bold' }}>Filter</Typography>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 }>
                    <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                        <Typography variant= "body2" gutterBottom>Branch</Typography>
                        <Box sx= { select }></Box>
                    </Stack>
                    <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                        <Typography variant= "body2" gutterBottom>Brand</Typography>
                        <Box sx= { select }></Box>
                    </Stack>
                    <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                        <Typography variant= "body2" gutterBottom>Status</Typography>
                        <Box sx= { select }></Box>
                    </Stack>
                    <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                        <Typography variant= "body2" gutterBottom>Counter</Typography>
                        <Box sx= { select }></Box>
                    </Stack>
                </Stack>
            </Stack>
            <Stack direction= "row" justifyContent= "flex-end" alignItems= "center" spacing= { 4 }>
                <Typography sx= {{ cursor: 'pointer' }} onClick= { () => setOpen(false) }>Close</Typography>
                <Typography sx= {{ cursor: 'pointer' }} onClick= { () => setOpen(false) }>Set</Typography>
            </Stack>
        </Stack>
    );
}

export default Filter;