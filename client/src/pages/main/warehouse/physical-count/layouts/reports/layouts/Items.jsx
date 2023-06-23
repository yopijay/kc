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

const container = {
    padding: '0 0 40px 0', 
    overflowY: 'scroll', 
    '&::-webkit-scrollbar': { display: 'none' }
}

const Items = ({ list }) => {
    
    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 } sx= { container }>
            { list.length > 0 ? 
                list?.map((data, index) => (
                    <Stack direction= "row" justifyContent= "space-between" alignItems= "center" key= { index } sx= { item } spacing= { 2 }>
                        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= {{ flexGrow: 1 }}>
                            <Typography sx= {{ fontWeight: 'bold', flexGrow: 1 }}>{ data?.item_code }</Typography>
                            <Typography variant= "body2">Brand: {(data.brand).toUpperCase()}</Typography>
                            <Typography variant= "body2">Location: { `${(data.branch).toUpperCase()}${(data.floor).toUpperCase()}-${data.code}` }</Typography>
                            <Typography variant= "body2">Count Sheet: {data.rcs !== undefined ? data.rcs_name !== null ? data.rcs_name : '-' : '-'} ({ 
                                data.rcs !== undefined ? 
                                    data.rcs !== null ? 
                                        data.rcs_date !== null ? 
                                            <span style= {{ color: '#6ab04c', fontWeight: 'bold' }}>COUNTED</span> : 
                                            <span style= {{ color: '#f0932b', fontWeight: 'bold' }}>PENDING</span> 
                                        : <span style= {{ color: '#eb4d4b', fontWeight: 'bold' }}>NOT COUNTED</span> : '-' })</Typography>
                            <Typography variant= "body2">Audit Sheet: {data.ras !== undefined ? data.ras_name !== null ? data.ras_name : '-' : '-'} ({ 
                                data.ras !== undefined ? 
                                    data.ras !== null ? 
                                        data.ras_date !== null ? 
                                            <span style= {{ color: '#6ab04c', fontWeight: 'bold' }}>COUNTED</span> : 
                                            <span style= {{ color: '#f0932b', fontWeight: 'bold' }}>PENDING</span> 
                                        : <span style= {{ color: '#eb4d4b', fontWeight: 'bold' }}>NOT COUNTED</span> : '-' })</Typography>
                            <Typography variant= "body2">Third Count: {data.dis !== undefined ? data.dis_name !== null ? data.dis_name : '-' : '-'} ({ 
                                data.dis !== undefined ? 
                                    data.dis !== null ? 
                                        data.dis_date !== null ? 
                                            <span style= {{ color: '#6ab04c', fontWeight: 'bold' }}>COUNTED</span> : 
                                            <span style= {{ color: '#f0932b', fontWeight: 'bold' }}>PENDING</span> 
                                        : <span style= {{ color: '#eb4d4b', fontWeight: 'bold' }}>NOT COUNTED</span> : '-' })</Typography>
                        </Stack>
                    </Stack>
                )) :
                <Stack direction= "row" justifyContent= "center" alignItems= "center" sx= { item }>
                    <Typography>No record/s found!</Typography>
                </Stack> }
        </Stack>
    );
}

export default Items;