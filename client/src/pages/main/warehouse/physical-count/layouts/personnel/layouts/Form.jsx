// Libraries
import { Autocomplete, Box, Grid, Skeleton, Stack, TextField, Typography } from "@mui/material";
import { useContext, useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import { Controller } from "react-hook-form";
import { DatePicker, LocalizationProvider } from "@mui/x-date-pickers";
import dayjs from "dayjs";
import { AdapterDayjs } from "@mui/x-date-pickers/AdapterDayjs";

// Core
import { FormCntxt } from "core/context/Form"; // Context
import { formatter, useGet, usePost } from "core/function/global"; // Function
import { count, dropdown, series } from "core/api"; // API

// Layouts
// import Schedule from "./Schedule";

// Constants
import { date, input, select } from "../index.style"; // Styles
const branch = [{ id: 'quezon_ave', name: 'QUEZON AVE' }, { id: 'sto_domingo', name: 'STO. DOMINGO' }, { id: 'manila', name: 'MANILA' }, { id: 'cavite', name: 'CAVITE' }]; // Branch

const Form = ({ fetching }) => {
    const { type } = useParams();
    const { register, errors, setValue, control, getValues } = useContext(FormCntxt);
    const { data: brands, isFetching: brandfetching } = useGet({ key: ['dd_brand'], fetch: dropdown({ table: 'tbl_brand', data: {} }) });
    const { mutate: items } = usePost({ fetch: count, onSuccess: data => setValue('total_items', data) });

    useEffect(() => { setValue('brands', []); items([]); }, [ setValue, items ]);

    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 2 }>
            {/* <Schedule fetching= { fetching } /> */}
        </Stack>
        // <Grid container direction= "row" justifyContent= "flex-start" alignItems= "flex-start" spacing= { 2 }>
        //     <Grid item xs= { 12 } sm= { 9 }>
        //     </Grid>
        //     { counttype === 'specific' || getValues()?.type === 'specific' ?
        //         <Grid item xs= { 12 }>
        //             <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
        //                 <Typography gutterBottom variant= "body2">*Brands</Typography>
                        
        //                 <Typography variant= "body2" color= "error.dark" mt= "5px">{ errors.brands?.message }</Typography>
        //             </Stack>
        //         </Grid> : '' }
        // </Grid>
    );
}

export default Form;