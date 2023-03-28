import { Box, Checkbox, Grid, Skeleton, Stack, Typography } from "@mui/material";
import { FormCntxt } from "core/context/Form";
import { useContext, useState } from "react";

const Purpose = ({ fetching }) => {
    const { register, getValues } = useContext(FormCntxt);
    const [ rd, setRd ] = useState(false);
    const [ completion, setCompletion ] = useState(false);
    const [ rectification, setRectification ] = useState(false);
    const [ manning, setManning ] = useState(false);
    const [ rent, setRent ] = useState(false);
    const [ pothers, setPothers ] = useState(false);

    return (
        <Grid container direction= "row" justifyContent= "flex-start" alignItems= "flex-start" spacing= { 1 } sx= {{ marginTop: '20px' }}>
            <Grid item xs= { 12 }><Typography sx= {{ fontWeight: 'bold', textTransform: 'uppercase' }}>Purpose</Typography></Grid>
            <Grid item xs= { 8 } sm= { 4 } md= { 3 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> : 
                        <Box sx= {{ display: 'flex', flexDirection: 'row', justifyContent: 'flex-start', alignItems: 'center' }}>
                            <Checkbox sx= {{ color: '#919eab', '&.Mui-checked': { color: '#2065d1' } }} name= "regular_delivery" 
                                { ...register('regular_delivery', { onChange: () => setRd(!rd) }) } 
                                disabled= { !(getValues()?.status !== undefined && (getValues()?.status === 'posted' || getValues()?.status === 'saved' || getValues()?.status === 'approved')) }
                                checked= { getValues().regular_delivery !== undefined ? getValues().regular_delivery > 0 ? true : false : rd } />
                            <Typography gutterBottom sx= {{ marginTop: '7px' }}>Regular Delivery</Typography>
                        </Box> }
                </Stack>
            </Grid>
            <Grid item xs= { 8 } sm= { 4 } md= { 3 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> : 
                        <Box sx= {{ display: 'flex', flexDirection: 'row', justifyContent: 'flex-start', alignItems: 'center' }}>
                            <Checkbox sx= {{ color: '#919eab', '&.Mui-checked': { color: '#2065d1' } }} name= "for_completion" 
                                { ...register('for_completion', { onChange: () => setCompletion(!completion) }) } 
                                disabled= { !(getValues()?.status !== undefined && (getValues()?.status === 'posted' || getValues()?.status === 'saved' || getValues()?.status === 'approved')) }
                                checked= { getValues().for_completion !== undefined ? getValues().for_completion > 0 ? true : false : completion } />
                            <Typography gutterBottom sx= {{ marginTop: '7px' }}>For Completion</Typography>
                        </Box> }
                </Stack>
            </Grid>
            <Grid item xs= { 8 } sm= { 4 } md= { 3 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> : 
                        <Box sx= {{ display: 'flex', flexDirection: 'row', justifyContent: 'flex-start', alignItems: 'center' }}>
                            <Checkbox sx= {{ color: '#919eab', '&.Mui-checked': { color: '#2065d1' } }} name= "for_rectification" 
                                { ...register('for_rectification', { onChange: () => setRectification(!rectification) }) } 
                                disabled= { !(getValues()?.status !== undefined && (getValues()?.status === 'posted' || getValues()?.status === 'saved' || getValues()?.status === 'approved')) }
                                checked= { getValues().for_rectification !== undefined ? getValues().for_rectification > 0 ? true : false : rectification } />
                            <Typography gutterBottom sx= {{ marginTop: '7px' }}>For Rectification</Typography>
                        </Box> }
                </Stack>
            </Grid>
            <Grid item xs= { 8 } sm= { 4 } md= { 3 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> : 
                        <Box sx= {{ display: 'flex', flexDirection: 'row', justifyContent: 'flex-start', alignItems: 'center' }}>
                            <Checkbox sx= {{ color: '#919eab', '&.Mui-checked': { color: '#2065d1' } }} name= "supplemental_manning" 
                                { ...register('supplemental_manning', { onChange: () => setManning(!manning) }) } 
                                disabled= { !(getValues()?.status !== undefined && (getValues()?.status === 'posted' || getValues()?.status === 'saved' || getValues()?.status === 'approved')) }
                                checked= { getValues().supplemental_manning !== undefined ? getValues().supplemental_manning > 0 ? true : false : manning } />
                            <Typography gutterBottom sx= {{ marginTop: '7px' }}>Supplemental Manning</Typography>
                        </Box> }
                </Stack>
            </Grid>
            <Grid item xs= { 8 } sm= { 4 } md= { 3 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> : 
                        <Box sx= {{ display: 'flex', flexDirection: 'row', justifyContent: 'flex-start', alignItems: 'center' }}>
                            <Checkbox sx= {{ color: '#919eab', '&.Mui-checked': { color: '#2065d1' } }} name= "to_be_rented" 
                                { ...register('to_be_rented', { onChange: () => setRent(!rent) }) } 
                                disabled= { !(getValues()?.status !== undefined && (getValues()?.status === 'posted' || getValues()?.status === 'saved' || getValues()?.status === 'approved')) }
                                checked= { getValues().to_be_rented !== undefined ? getValues().to_be_rented > 0 ? true : false : rent } />
                            <Typography gutterBottom sx= {{ marginTop: '7px' }}>To Be Rented</Typography>
                        </Box> }
                </Stack>
            </Grid>
            <Grid item xs= { 8 } sm= { 4 } md= { 3 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> : 
                        <Box sx= {{ display: 'flex', flexDirection: 'row', justifyContent: 'flex-start', alignItems: 'center' }}>
                            <Checkbox sx= {{ color: '#919eab', '&.Mui-checked': { color: '#2065d1' } }} name= "other_purpose" 
                                { ...register('other_purpose', { onChange: () => setPothers(!pothers) }) } 
                                disabled= { !(getValues()?.status !== undefined && (getValues()?.status === 'posted' || getValues()?.status === 'saved' || getValues()?.status === 'approved')) }
                                checked= { getValues().other_purpose !== undefined ? getValues().other_purpose > 0 ? true : false : pothers } />
                            <Typography gutterBottom sx= {{ marginTop: '7px' }}>Others</Typography>
                        </Box> }
                </Stack>
            </Grid>
        </Grid>
    );
}

export default Purpose;