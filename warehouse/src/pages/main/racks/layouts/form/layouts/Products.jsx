// Libraries
import { Stack, Typography } from "@mui/material";

const Products = ({ id }) => {
    return (
        <Stack direction= "column" justifyContent= "space-between" alignItems= "stretch" sx= {{ padding: '25px 20px' }} spacing= { 2 }>
            <form autoComplete= "off">
            </form>
            <Stack direction= "row" justifyContent= "flex-end" alignItems= "center" spacing= { 2 }>
                <Typography>Cancel</Typography>
                <Typography>Save</Typography>
            </Stack>
        </Stack>
    );
}

export default Products;