// Libraries
import { Stack, Typography } from "@mui/material";

// Custom styles
const item = {
    backgroundColor: '#FFFFFF',
    padding: '10px 20px',
    border: 'solid 1px #F3F3F3',
    borderRadius: '10px',
    overflow: 'hidden'
}

const Items = ({ list }) => {
    
    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 } sx= {{ padding: '0 0 40px 0', overflowY: 'scroll', '&::-webkit-scrollbar': { display: 'none' } }}>
            { list.length > 0 ? 
                list?.map((data, index) => (
                    <Stack direction= "row" justifyContent= "space-between" alignItems= "center" key= { index } sx= { item } spacing= { 2 }>
                        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= {{ flexGrow: 1 }}>
                            <Typography sx= {{ fontWeight: 'bold', flexGrow: 1 }}>{ data?.item_code }</Typography>
                            <Typography variant= "body2">Brand: {(data.brand).toUpperCase()}</Typography>
                            <Typography variant= "body2">Location: { `${(data.branch).toUpperCase()}${(data.floor).toUpperCase()}-${data.code}` }</Typography>
                            <Typography variant= "body2">Status: </Typography>
                        </Stack>
                    </Stack>
                )) :
                <Stack direction= "row" justifyContent= "center" alignItems= "center" sx= {{ backgroundColor: '#ffffff', padding: '10px', border: 'solid 1px #f3f3f3', borderRadius: '10px' }}>
                    <Typography>No record/s found!</Typography>
                </Stack> }
            
        </Stack>
    );
}

export default Items;