import { Box, Checkbox, Grid, Skeleton, Stack, Typography } from "@mui/material";
import { FormCntxt } from "core/context/Form";
import { useContext, useState } from "react";

const Authorization = ({ fetching }) => {
    const { register, getValues } = useContext(FormCntxt);
    const [ deliveries, setDeliveries ] = useState(false);
    const [ toolsequipment, setToolsEquipment ] = useState(false);
    const [ manpower, setManpower ] = useState(false);
    const [ consumables, setConsumables ] = useState(false);
    const [ others, setOthers ] = useState(false);

    return (
        <Grid container direction= "row" justifyContent= "flex-start" alignItems= "flex-start" spacing= { 1 } sx= {{ marginTop: '20px' }}>
            <Grid item xs= { 12 }><Typography sx= {{ fontWeight: 'bold', textTransform: 'uppercase' }}>{ `Authorizatoin Form (Servicing)` }</Typography></Grid>
            <Grid item xs= { 6 } sm= { 4 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> : 
                        <Box sx= {{ display: 'flex', flexDirection: 'row', justifyContent: 'flex-start', alignItems: 'center' }}>
                            <Checkbox sx= {{ color: '#919eab', '&.Mui-checked': { color: '#2065d1' } }} name= "deliveries_to_customer" 
                                { ...register('deliveries_to_customer', { onChange: () => setDeliveries(!deliveries) }) } 
                                checked= { getValues().deliveries_to_customer !== undefined ? getValues().deliveries_to_customer > 0 ? true : false : deliveries } />
                            <Typography gutterBottom sx= {{ marginTop: '7px' }}>Deliveries to Customer*</Typography>
                        </Box> }
                </Stack>
            </Grid>
            <Grid item xs= { 6 } sm= { 4 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> : 
                        <Box sx= {{ display: 'flex', flexDirection: 'row', justifyContent: 'flex-start', alignItems: 'center' }}>
                            <Checkbox sx= {{ color: '#919eab', '&.Mui-checked': { color: '#2065d1' } }} name= "tools_equipment" 
                                { ...register('tools_equipment', { onChange: () => setToolsEquipment(!toolsequipment) }) } 
                                checked= { getValues().tools_equipment !== undefined ? getValues().tools_equipment > 0 ? true : false : toolsequipment } />
                            <Typography gutterBottom sx= {{ marginTop: '7px' }}>Tools/Equipment**</Typography>
                        </Box> }
                </Stack>
            </Grid>
            <Grid item xs= { 6 } sm= { 4 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> : 
                        <Box sx= {{ display: 'flex', flexDirection: 'row', justifyContent: 'flex-start', alignItems: 'center' }}>
                            <Checkbox sx= {{ color: '#919eab', '&.Mui-checked': { color: '#2065d1' } }} name= "manpower" 
                                { ...register('manpower', { onChange: () => setManpower(!manpower) }) } 
                                checked= { getValues().manpower !== undefined ? getValues().manpower > 0 ? true : false : manpower } />
                            <Typography gutterBottom sx= {{ marginTop: '7px' }}>Manpower**</Typography>
                        </Box> }
                </Stack>
            </Grid>
            <Grid item xs= { 6 } sm= { 4 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> : 
                        <Box sx= {{ display: 'flex', flexDirection: 'row', justifyContent: 'flex-start', alignItems: 'center' }}>
                            <Checkbox sx= {{ color: '#919eab', '&.Mui-checked': { color: '#2065d1' } }} name= "consumables" 
                                { ...register('consumables', { onChange: () => setConsumables(!consumables) }) } 
                                checked= { getValues().consumables !== undefined ? getValues().consumables > 0 ? true : false : consumables } />
                            <Typography gutterBottom sx= {{ marginTop: '7px' }}>Consumables**</Typography>
                        </Box> }
                </Stack>
            </Grid>
            <Grid item xs= { 6 } sm= { 4 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> : 
                        <Box sx= {{ display: 'flex', flexDirection: 'row', justifyContent: 'flex-start', alignItems: 'center' }}>
                            <Checkbox sx= {{ color: '#919eab', '&.Mui-checked': { color: '#2065d1' } }} name= "others" 
                                { ...register('others', { onChange: () => setOthers(!others) }) } 
                                checked= { getValues().others !== undefined ? getValues().others > 0 ? true : false : others } />
                            <Typography gutterBottom sx= {{ marginTop: '7px' }}>Others</Typography>
                        </Box> }
                </Stack>
            </Grid>
        </Grid>
    );
}

export default Authorization;