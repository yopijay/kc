// Libraries
import { Grid, Skeleton, Stack, Typography } from "@mui/material";

// Custom styles
const card = {
    backgroundColor: '#FFFFFF', 
    padding: '20px', 
    borderRadius: '10px', 
    border: 'solid 1px #F3F3F3'
}

const label = {
    fontWeight: 'bold', 
    color: '#C8C8C8', 
    width: '100%', 
    whiteSpace: 'nowrap', 
    overflow: 'hidden', 
    textOverflow: 'ellipsis',
    textTransform: 'uppercase'
}

const Dashboard = ({ data, loading }) => {

    return ( 
        <Grid container direction= "row" justifyContent= "flex-start" alignItems= "stretch" sx= {{ padding: '5px 0' }}>
            <Grid item xs= { 4 } sm= { 6 } sx= {{ padding: { xs: '0 5px 0 0' } }}>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "flex-start" sx= { card }>
                    { !loading ? <Typography variant= "h5" sx= {{ fontFamily: 'Boldstrom', color: '#535b64' }}>{ `${data.total < 10 ? '0' : ''}${data.total}` }</Typography> : 
                        <Skeleton variant= "text" sx= {{ width: '50px', fontSize: '1rem' }} /> }
                    <Typography variant= "body1" sx= { label }>Total</Typography>
                </Stack>
            </Grid>
            <Grid item xs= { 4 } sm= { 6 } sx= {{ padding: { xs: '0 0 0 5px' } }}>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "flex-start" sx= { card }>
                    { !loading ? 
                        <Typography variant= "h5" sx= {{ fontFamily: 'Boldstrom', color: '#535b64' }}>
                            { `${(parseInt(data.total) - parseInt(data.unknown)) < 10 ? '0' : ''}${(parseInt(data.total) - parseInt(data.unknown))}` }</Typography> : 
                        <Skeleton variant= "text" sx= {{ width: '50px', fontSize: '1rem' }} /> }
                    <Typography variant= "body1" sx= { label }>Unknown</Typography>
                </Stack>
            </Grid>
        </Grid>
    );
}

export default Dashboard;