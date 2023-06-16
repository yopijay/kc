// Libraries
import { useContext } from "react";
import { Box, Stack, Typography } from "@mui/material";
import { Link } from "react-router-dom";

// Core
import { ListCntxt } from "core/context/List"; // Context

// Constants
const card = { margin: '10px 0', backgroundColor: '#ffffff', padding: '15px', borderRadius: '8px', textDecoration: 'none', color: '#444444' };

const Items = () => {
    const { list } = useContext(ListCntxt);

    return (
        <Box sx= {{ overflowY: 'scroll', '&::-webkit-scrollbar': { display: 'none' } }}>
            { list?.length > 0 ?
                list?.map((des, index) => (
                    <Stack direction= "row" justifyContent= "flex-start" alignItems= "center" key= { index } sx= { card } style= {{ cursor: 'pointer' }}
                        component= { Link } to= { `/descrepancies/form/update/${des.id}` }>
                        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= {{ width: '100%' }}>
                            <Typography sx= {{ fontWeight: 'bold', flexGrow: 1 }}>{ des.item_code }</Typography>
                            <Typography variant= "body2" sx= {{ flexGrow: 1 }}>Counter: { des.count_by !== null ? `${des.lname}, ${des.fname}` : '-' }</Typography>
                            <Typography variant= "body2" sx= {{ flexGrow: 1 }}>Time: { des.date_counted !== null ? des.date_counted : '-- : -- --' }</Typography>
                        </Stack>
                        { des.date_counted !== null ? <Box sx= {{ width: '10px', height: '10px', backgroundColor: '#7D8F69', borderRadius: '20px' }} /> : 
                                <Box sx= {{ width: '10px', height: '10px', backgroundColor: '#EF9F9F', borderRadius: '20px' }} /> }
                    </Stack>
                )) :
                <Stack direction= "row" justifyContent= "flex-start" alignItems= "center" sx= { card }>
                    <Typography variant= "body2" sx= {{ textAlign: 'center', width: '100%' }}>No item/s to be count!</Typography>
                </Stack> }
        </Box>
    );
}

export default Items;