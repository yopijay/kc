// Libraries
import { Grid } from "@mui/material";
import { useState } from "react";

// Layouts
import Classification from "./assets/Classification";
import Types  from './assets/types';

const Assets = ({ fetching }) => {
    const [ item, setItem ] = useState('');
    const [ eqptype,  setEqptype ] = useState('');

    return (
        <Grid container direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 }>
            <Grid item><Classification fetching= { fetching } setItem= { setItem } setEqptype= { setEqptype } /></Grid>
            <Grid item><Types item= { item } fetching= { fetching } eqptype= { eqptype } /></Grid>
        </Grid>
    );
}

export default Assets;