// Libraries
import { Stack } from "@mui/material";
import { useContext, useEffect } from "react";

// Core
import { FormCntxt } from "core/context/Form"; // Context

// Layouts
import OfficeChairs from "./office-furniture/OfficeChairs";
import OfficeDesk from "./office-furniture/OfficeDesk";
import Whiteboards from "./office-furniture/Whiteboards";
import FilingCabinet from "./office-furniture/FilingCabinet";

const Index = ({ item, fetching, tag }) => {
    const { setValue } = useContext(FormCntxt);

    useEffect(() => { 
        setValue('item', item); 
        setValue('appearance', 'good'); 
        setValue('with_sidetable', 'no'); 
        setValue('with_armrest', 'yes');
        setValue('assembly_required', 'yes');
    }, [ setValue, item ]);

    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
            { item === 'office-desks' ? <OfficeDesk fetching= { fetching } tag= { tag } /> :
                item === 'office-chairs' ? <OfficeChairs fetching= { fetching } tag= { tag } /> :
                    item === 'whiteboards' ? <Whiteboards tag= { tag } fetching= { fetching } /> :
                        item === 'filing-cabinets' ? <FilingCabinet tag= { tag } fetching= { fetching } /> : '' }
        </Stack>
    );
}

export default Index;