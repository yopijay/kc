// Libraries
import { Stack, Typography } from "@mui/material";
import { useContext } from "react";

// Core
import { ListCntxt } from "core/context/List"; // Context

// Custom styles
const item = {
    backgroundColor: '#FFFFFF', 
    padding: '10px 20px', 
    border: 'solid 1px #F3F3F3', 
    borderRadius: '10px',
    overflow: 'hidden'
}

const txt = { whiteSpace: 'nowrap', overflow: 'hidden', textOverflow: 'ellipsis', width: '100%' }

const Item = () => {
    const { list } = useContext(ListCntxt);

    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 } sx= {{ padding: '0 0 40px 0', overflowY: 'scroll', '&::-webkit-scrollbar': { display: 'none' } }}>
            { list.length > 0 ? 
                list?.map((data, index) => (
                    <Stack direction= "row" justifyContent= "space-between" alignItems= "center" key= { index } spacing= { 2 } sx= { item }>
                        <Stack direction= "column" justifyContent= "flex-start" alignItems= "flex-start">
                            <Typography>{ data.lname }, { data.fname }</Typography>
                            <Typography><span style= {{ fontWeight: 'bold' }}>IN:</span> { data.date_in } / { data.time_in }</Typography>
                            <Typography><span style= {{ fontWeight: 'bold' }}>OUT:</span> { data.date_out ?? '-' } / { data.time_out ?? '-' }</Typography>
                        </Stack>
                        <Typography>{ data.time_out !== null ? 'OUT' : 'IN' }</Typography>
                    </Stack>
                )) :
                <Stack direction= "row" justifyContent= "center" alignItems= "center" sx= {{ backgroundColor: '#FFFFFF', padding: '10px', border: 'solid 1px #F3F3F3', borderRadius: '10px' }}>
                    <Typography>No record/s found!</Typography>
                </Stack> }
        </Stack>
    );
}

export default Item;