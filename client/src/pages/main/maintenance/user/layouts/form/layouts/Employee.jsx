// Libraries
import { Grid } from "@mui/material";

// Layouts
import Company from "./employee/Company";
import ID from "./employee/ID";
import Other from "./employee/Other";

const Employee = ({ fetching }) => {

    return (
        <form autoComplete= "off">
            <Grid container direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                <Grid item><Company fetching= { fetching } /></Grid>
                <Grid item><ID fetching= { fetching } /></Grid>
                <Grid item><Other fetching= { fetching } /></Grid>
            </Grid>
        </form>
    );
}

export default Employee;