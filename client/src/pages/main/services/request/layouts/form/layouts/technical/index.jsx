// Libraries
import { Stack, Typography } from "@mui/material";
import { useContext, useEffect } from "react";

// Core
import { FormCntxt } from "core/context/Form"; // Context

// Layouts
import Evaluator from "./layouts/Evaluator";
import Authorization from "./layouts/Authorization";
import Purpose from "./layouts/Purpose";
import Items from "./layouts/Items";
import Signature from "./layouts/SIgnature";

const Index = ({ fetching }) => {
    const { register } = useContext(FormCntxt);
    useEffect(() => {
        register('evaluated_by_signature', { value: '' });
        register('eval_noted_by_sup_signature', { value: '' });
        register('prepared_by_signature', { value: '' });
        register('noted_by_signature', { value: '' });
        register('released_by_signature', { value: '' });
        register('authorized_by_signature', { value: '' });
        register('approved_by_signature', { value: '' });
        register('received_by_signature', { value: '' });
    }, [ register ]);

    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
            <Typography variant= "button" sx= {{ fontSize: '100%', fontWeight: 'bold' }} gutterBottom>Technical</Typography>
            <Evaluator fetching= { fetching } />
            <Authorization fetching= { fetching } />
            <Purpose fetching= { fetching } />
            <Items fetching= { fetching } />
            <Signature fetching= { fetching } />
        </Stack>
    );
}

export default Index;