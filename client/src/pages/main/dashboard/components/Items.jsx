// Libraries
import { Stack, Typography } from "@mui/material";
import { card, title } from "../index.style";

const Items = () => {
    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 }>
            <Typography variant= "h5" sx= {{ fontWeight: 'bold', fontFamily: 'Gilroy Bold', color: '#474747' }}>Products</Typography>
            <Stack direction= "row" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 } sx= {{ width: '100%' }}>
                <Stack sx= { card } flexGrow= { 2 }>
                    <Typography sx= { title }>Total Items</Typography>
                    <Typography>00</Typography>
                    <Stack direction= "row" justifyContent= "flex-start" alignItems= "center" spacing= { 1 }>
                        <Typography variant= "body2">0%</Typography>
                        <Typography variant= "body2">0%</Typography>
                    </Stack>
                    <Typography variant= "caption">Date today</Typography>
                </Stack>
                <Stack sx= { card } flexGrow= { 1 }>
                    <Typography sx= { title }>In</Typography>
                    <Typography>00</Typography>
                    <Stack direction= "row" justifyContent= "flex-start" alignItems= "center" spacing= { 1 }>
                        <Typography variant= "body2">0%</Typography>
                        <Typography variant= "body2">0%</Typography>
                    </Stack>
                    <Typography variant= "caption">Date today</Typography>
                </Stack>
                <Stack sx= { card } flexGrow= { 1 }>
                    <Typography sx= { title }>Out</Typography>
                    <Typography>00</Typography>
                    <Stack direction= "row" justifyContent= "flex-start" alignItems= "center" spacing= { 1 }>
                        <Typography variant= "body2">0%</Typography>
                        <Typography variant= "body2">0%</Typography>
                    </Stack>
                    <Typography variant= "caption">Date today</Typography>
                </Stack>
            </Stack>
        </Stack>
    );
}

export default Items;