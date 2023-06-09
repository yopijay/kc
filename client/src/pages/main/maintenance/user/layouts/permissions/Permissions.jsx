// Libraries
import { Grid, Stack, Typography } from "@mui/material";
import { useContext, useEffect, useState } from "react";

// Core
import { records } from "core/api"; // API
import { usePost } from "core/function/global"; // Function
import { FormCntxt } from "core/context/Form"; // Context

// Layouts
import List from "./layouts/List";
import Create from "./layouts/Create";
import Update from "./layouts/Update";
import Permission from "./layouts/Permission";
import Export from "./layouts/Export";
import Print from "./layouts/Print";

// Custom styles
const modules = { 
    backgroundColor: '#f1f1f1', 
    width: '100%', 
    padding: '20px', 
    borderRadius: '9px' 
}

const Permissions = ({ module }) => {
    const [ submodules, setSubmodules ] = useState([]);
    const { register, setValue } = useContext(FormCntxt);
    const { mutate: submodule } = usePost({ fetch: records, onSuccess: data => setSubmodules(data) });

    useEffect(() => {
        let data = {};
        data['module_id'] = module;
        data['orderby'] = 'date_created';
        data['sort'] = 'asc';
        data['searchtxt'] = '';

        submodule({ table: 'tbl_sub_module', data: data });
    }, [ register, setValue, submodule, module ]);
    
    return (
        <Grid container direction= "row" justifyContent= "flex-start" alignItems= "flex-start">
            { submodules.length > 0 ?
                submodules.map((sub, index) => (
                    <Grid item xs= { 12 } sm= { 6 } md= { 4 } key= { index } sx= {{ padding: '10px' }}>
                        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 3 } sx= { modules }>
                            <Stack direction= "row" justifyContent= "space-between" alignItems= "center">
                                <Typography sx= {{ fontWeight: 'bold' }}>{ (sub.name).charAt(0).toUpperCase() + (sub.name).slice(1).toLowerCase() }</Typography>
                            </Stack>
                            <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 }>
                                <List module= { module } sub= { sub } />
                                <Create module= { module } sub= { sub } />
                                <Update module= { module } sub= { sub } />
                                { (sub.name).toLowerCase() === 'users' ? <Permission module= { module } sub= { sub } /> : '' }
                                <Export module= { module } sub= { sub } />
                                <Print module= { module } sub= { sub } />
                            </Stack>
                        </Stack>
                    </Grid>
                )) : <Typography sx= {{ width: '100%', textAlign: 'center' }}>No submodule/s found!</Typography> }
        </Grid>
    );
}

export default Permissions;