// Libraries
import { Stack, Typography } from "@mui/material";
import { useEffect, useState } from "react";

// Core
import { monitor } from "core/api"; // API
import { usePost } from "core/function/global"; // Function

const Item = ({ data }) => {
    const [ list, setList ] = useState([]);
    const { mutate: mntr, isLoading: loading } = usePost({ fetch: monitor, options: { refetchOnWindowFocus: true }, onSuccess: data => setList(data) });

    useEffect(() => { mntr(data); }, [ mntr, data ]);

    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 }>
            { list.length > 0 ? list.map((data, index) => ( <Typography key= { index }>{ data.lname }, { data.fname }</Typography> )) : '' }
        </Stack>
    );
}

export default Item;