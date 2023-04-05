// Libraries
import { Skeleton, Stack } from "@mui/material";

// Constants
const loader = {
    backgroundColor: '#FFFFFF', 
    padding: '10px 20px', 
    border: 'solid 1px #F3F3F3', 
    borderRadius: '10px'
}

const Loader = () => {
    return (
        <Stack direction= "row" justifyContent= "space-between" alignItems= "center" sx= { loader } spacing= { 2 }>
            <Stack direction= "column" justifyContent= "flex-start" alignItems= "flex-start" spacing= { 1 } sx= {{ flexGrow: 1 }}>
                <Skeleton variant= "rounded" sx= {{ width: '50%', height: '10px' }} />
                <Skeleton variant= "rounded" sx= {{ width: '25%', height: '10px' }} />
                <Skeleton variant= "rounded" sx= {{ width: '27%', height: '10px' }} />
            </Stack>
            <Stack direction= "row" justifyContent= "flex-start" alignItems= "center" spacing= { 2 }>
                <Skeleton variant= "circular" sx= {{ width: '10px', height: '10px' }} />
                <Stack direction= "row" justifyContent= "flex-start" alignItems= "center" spacing= { 1 }>
                    <Skeleton variant= "rounded" sx= {{ padding: '15px' }} />
                    <Skeleton variant= "rounded" sx= {{ padding: '15px' }} />
                </Stack>
            </Stack>
        </Stack>
    );
}

export default Loader;