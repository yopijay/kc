// Libraries
import { Grid } from "@mui/material";

// Layouts
import Fullname from "./basic/Fullname";
import Other from "./basic/Other";

const Basic = ({ fetching }) => {

    return (
        <form autoComplete= "off">
            <Grid container direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 }>
                <Grid item><Fullname fetching= { fetching } /></Grid>
                <Grid item><Other fetching= { fetching } /></Grid>
            </Grid>
        </form>
    );
}

export default Basic;