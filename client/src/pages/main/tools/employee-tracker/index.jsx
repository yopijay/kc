// Libraries
import { Stack } from "@mui/material";
import { Route, Routes } from "react-router-dom";

// Core
import { ListPrvdr } from "core/context/List"; // Provider
import { FormPrvdr } from "core/context/Form"; // Provider

// Layouts
import Scanner from './layouts/scanner';
import Logs from './layouts/logs';
import Monitor from './layouts/monitor';

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
                <Route exact path= "/" element= { <ListPrvdr><FormPrvdr><Scanner /></FormPrvdr></ListPrvdr> } />
                <Route exact path= "/logs" element= { <ListPrvdr><FormPrvdr><Logs /></FormPrvdr></ListPrvdr> } />
                <Route exact path= "/monitor" element= { <ListPrvdr><FormPrvdr><Monitor /></FormPrvdr></ListPrvdr> } />
            </Routes>
        </Stack>
    );
}

export default Index;