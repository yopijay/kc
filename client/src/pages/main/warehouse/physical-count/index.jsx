// Core
import { Stack } from "@mui/material";
import { Route, Routes } from "react-router-dom";

// Core
import { ListPrvdr } from "core/context/List"; // Provider
import { FormPrvdr } from "core/context/Form"; // Provider

// Layouts
import List from './layouts/list';
import Form from './layouts/form';
import Personnel from './layouts/personnel';
import Reports from './layouts/reports';

// Custom styles
const container = {
    overflow: 'scroll',
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
                <Route exact path= "/personnel/:id" element= { <FormPrvdr><Personnel /></FormPrvdr> } />
                <Route exact path= "/report/:id" element= { <ListPrvdr><FormPrvdr><Reports /></FormPrvdr></ListPrvdr> } />
            </Routes>
        </Stack>
    );
}

export default Index;