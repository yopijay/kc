// Libraries
import { Stack, Typography } from "@mui/material";

const Items = () => {
    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 } sx= {{ padding: '0 0 40px 0', overflowY: 'scroll', '&::-webkit-scrollbar': { display: 'none' } }}>
            <Stack direction= "row" justifyContent= "center" alignItems= "center" sx= {{ backgroundColor: '#ffffff', padding: '10px', border: 'solid 1px #f3f3f3', borderRadius: '10px' }}>
                <Typography>No record/s found!</Typography>
            </Stack>
        </Stack>
    );
}

export default Items;