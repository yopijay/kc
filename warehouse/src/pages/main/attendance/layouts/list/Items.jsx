// Libraries
import { Box, Stack, Typography } from "@mui/material"
import { useContext } from "react";

// Core
import { ListCntxt } from "core/context/List"; // Context
import { Link } from "react-router-dom";

// Constants
const card = { margin: '10px 0', backgroundColor: '#ffffff', padding: '15px', borderRadius: '8px', textDecoration: 'none', color: '#444444' };

const Items = () => {
    const { list } = useContext(ListCntxt);

    return (
        <Box sx= {{ overflowY: 'scroll', '&::-webkit-scrollbar': { display: 'none' } }}>
            { list?.length > 0 ?
                list?.map((data, index) => (
                    <Stack direction= "row" justifyContent= "flex-start" alignItems= "center" key= { index } sx= { card }
                        component= { Link } to= { `/attendees/form/update/${data.user_id}` }>
                        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= {{ flexGrow: 1 }}>
                            <Typography sx= {{ fontWeight: 'bold' }}>{ data.lname }, { data.fname }</Typography>
                            <Typography variant= "body2">{ (data.type).toUpperCase() }</Typography>
                        </Stack>
                        <Box sx= {{ width: '10px', height: '10px', backgroundColor: data.is_logged === 1 ? '#A9AF7E' : '#FAD4D4', borderRadius: '50px' }} />
                    </Stack>
                )) :
                <Stack direction= "row" justifyContent= "flex-start" alignItems= "center" sx= { card }>
                    <Typography variant= "body2" sx= {{ textAlign: 'center', width: '100%' }}>No employee/s found!</Typography>
                </Stack> }
        </Box>
    );
}

export default Items;