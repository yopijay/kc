// Libraries
import { Stack } from "@mui/material";
import { Route, Routes } from "react-router-dom";

// Core
import { FormPrvdr } from "core/context/Form" // Provider
import { ListPrvdr } from "core/context/List" // Provider

// Layouts
import List from './layouts/list';
import Form from './layouts/form';

// Custom styles
const container = {
    overflow: 'hidden',
    width: '100%',
    height: '100%',
    '&::-webkit-scrollbar': { display: 'none' }
}

const Index = () => { 
    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "flex-start" sx= { container }>
            <Routes>
                <Route exact path= "/" element= { <ListPrvdr><FormPrvdr><List /></FormPrvdr></ListPrvdr> } />
                <Route exact path= "/form/:type" element= { <FormPrvdr><Form /></FormPrvdr> } />
                <Route exact path= "/form/:type/:id" element= { <FormPrvdr><Form /></FormPrvdr> } />
            </Routes>
        </Stack>
    )
}

export default Index;