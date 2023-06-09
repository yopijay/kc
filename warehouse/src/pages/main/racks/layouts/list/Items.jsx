// Libraries
import { Box, Stack, Typography } from "@mui/material";
import { useContext } from "react";
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
                list?.map((rck, index) => (
                    <Stack direction= "row" justifyContent= "flex-start" alignItems= "center" key= { index } sx= { card }
                        component= { Link } to= { `/racks/form/view/${rck.id}` }>
                        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= {{ flexGrow: 1 }}>
                            <Typography sx= {{ fontWeight: 'bold' }}>{ (rck.branch).toUpperCase() }{ (rck.floor).toUpperCase() } - { rck.code }</Typography>
                        </Stack>
                    </Stack>
                )) :
                <Stack direction= "row" justifyContent= "flex-start" alignItems= "center" sx= { card }>
                    <Typography variant= "body2" sx= {{ textAlign: 'center', width: '100%' }}>No rack/s found!</Typography>
                </Stack> }
        </Box>
    );
}

export default Items;