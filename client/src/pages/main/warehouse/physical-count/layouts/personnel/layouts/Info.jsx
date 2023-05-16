// Libraries
import { Stack, Typography } from "@mui/material";
import { useContext } from "react";
import { useParams } from "react-router-dom";

// Core
import { FormCntxt } from "core/context/Form"; // Context
import { formatter, useGet } from "core/function/global"; // Function
import { series } from "core/api"; // API

const Info = () => {
    const { type } = useParams();
    const { setValue, getValues } = useContext(FormCntxt);
    useGet({ key: ['inv_series'], fetch: series('tbl_physical_count'), options: {}, onSuccess: (data) => { if(type === 'new') setValue('series_no', `PC-${formatter(parseInt(data) + 1, 7)}`); } });

    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= {{ border: 'dashed 1px #919eab40', padding: '20px 15px', borderRadius: '8px' }}>
            <Stack direction= "row" justifyContent= "space-between" alignItems= "center" spacing= { 1 }>
                <Typography sx= {{ fontWeight: 'bold' }}>{ (getValues().type)?.toUpperCase() }</Typography>
                <Typography><b>Date: </b>{ getValues().date_from }{ getValues().date_from !== getValues().date_to ? ` - ${getValues().date_to}` : ''}</Typography>
            </Stack>
            <Stack direction= "row" justifyContent= "flex-start" alignItems= "center" spacing= { 2 }>
                <Typography variant= "body2">Branch: </Typography>
                <Stack direction= "row" justifyContent= "flex-start" alignItems= "center">
                    { (getValues().branch)?.map((data, index) => ( <Typography variant= "body2" key= { index }>{ index !== 0 ? ', ' : '' } { data.name }</Typography> )) }
                </Stack>
            </Stack>
            <Stack direction= "row" justifyContent= "flex-start" alignItems= "center" spacing= { 2 }>
                <Typography variant= "body2">Brands: </Typography>
                <Stack direction= "row" justifyContent= "flex-start" alignItems= "center">
                    { (getValues().brands)?.length > 0 ?
                        (getValues().brands)?.map((data, index) => ( <Typography variant= "body2" key= { index }>{ index !== 0 ? ', ' : '' } { data.brand_name }</Typography> )) :
                        <Typography variant= "body2">ALL</Typography> }
                </Stack>
            </Stack>
        </Stack>
    );
}

export default Info;