// Libraries
import { Stack } from "@mui/material";
import { FormPrvdr } from "core/context/Form";
import { ListPrvdr } from "core/context/List";
import { Route, Routes } from "react-router-dom";

// Layouts
import List from "./list/rcs";

// Constants
const container = { width: '100%', flexGrow: 1, overflowY: 'scroll', '&::-webkit-scrollbar': { display: 'none' } };

const RCS = () => {
    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= { container }>
            <Routes>
                <Route exact path= "/" element= { <ListPrvdr><FormPrvdr><List /></FormPrvdr></ListPrvdr> } />
                <Route exact path= "/form/:id" element= { <FormPrvdr>FORM</FormPrvdr> } />
            </Routes>
        </Stack>
    );
}

export default RCS;