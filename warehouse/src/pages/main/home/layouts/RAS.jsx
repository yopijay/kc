// Libraries
import { Stack } from "@mui/material";
import { FormPrvdr } from "core/context/Form";
import { ListPrvdr } from "core/context/List";
import { Route, Routes } from "react-router-dom";

// Layouts
import List from "./list/ras";
import Form from "./form/ras";

// Constants
const container = { width: '100%', flexGrow: 1, overflowY: 'scroll', '&::-webkit-scrollbar': { display: 'none' } };

const RAS = () => {
    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= { container }>
            <Routes>
                <Route exact path= "/" element= { <ListPrvdr><FormPrvdr><List /></FormPrvdr></ListPrvdr> } />
                <Route exact path= "/form/:id" element= { <FormPrvdr><Form /></FormPrvdr> } />
            </Routes>
        </Stack>
    );
}

export default RAS;