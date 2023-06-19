// Libraries
import { Skeleton, Stack } from "@mui/material";

// Constants
import { loader } from "./index.style"; // Styles

const Loader = () => {
    return (
        <Stack direction= "row" justifyContent= "space-between" alignItems= "center" spacing= { 2 } sx= { loader }>
            <Stack direction= "column" justifyContent= "flex-start" alignItems= "flex-start" spacing= { 1 } sx= {{ flexGrow: 1 }}>
                <Skeleton variant= "rounded" sx= {{ width: '50%', height: '10px' }} />
                <Skeleton variant= "rounded" sx= {{ width: '25%', height: '10px' }} />
            </Stack>
            <Skeleton variant= "circular" sx= {{ width: '10px', height: '10px' }} />
        </Stack>
    );
}

export default Loader;