// Libraries
import { Stack, Switch, Typography } from "@mui/material";
import { useContext, useEffect, useState } from "react";
import styled from "@emotion/styled";

// Core
import { records } from "core/api"; // API
import { usePost } from "core/function/global"; // Function
import { FormCntxt } from "core/context/Form"; // Context
import { Controller } from "react-hook-form";

// Custom styles
const IOSSwitch = styled((props) => 
( <Switch focusVisibleClassName=".Mui-focusVisible" disableRipple {...props} /> )) (({ theme }) => (
    {
        width: 42,
        height: 26,
        padding: 0,
        '& .MuiSwitch-switchBase': {
            padding: 0,
            margin: 2,
            transitionDuration: '300ms',
            '&.Mui-checked': {
                transform: 'translateX(16px)',
                color: '#fff',
                '& + .MuiSwitch-track': { backgroundColor: theme.palette.mode === 'dark' ? '#2ECA45' : '#65C466', opacity: 1, border: 0, },
                '&.Mui-disabled + .MuiSwitch-track': { opacity: 0.5 },
            },
            '&.Mui-focusVisible .MuiSwitch-thumb': { color: '#33cf4d', border: '6px solid #fff', },
            '&.Mui-disabled .MuiSwitch-thumb': { color: theme.palette.mode === 'light' ? theme.palette.grey[100] : theme.palette.grey[600], },
            '&.Mui-disabled + .MuiSwitch-track': { opacity: theme.palette.mode === 'light' ? 0.7 : 0.3, },
        },
        '& .MuiSwitch-thumb': { boxSizing: 'border-box', width: 22, height: 22, },
        '& .MuiSwitch-track': {
            borderRadius: 26 / 2,
            backgroundColor: theme.palette.mode === 'light' ? '#E9E9EA' : '#39393D',
            opacity: 1,
            transition: theme.transitions.create(['background-color'], { duration: 500, }),
        }, 
    }
));

const Permissions = ({ module }) => {
    const [ submodules, setSubmodules ] = useState([]);
    const { register, setValue, getValues, control } = useContext(FormCntxt);
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
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= {{ width: '100%' }} spacing= { 3 }>
            { submodules.length > 0 ?
                submodules.map((sub, count) => (
                    <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 2 } key= { count }>
                        <Stack direction= "row" justifyContent= "space-between" alignItems= "center">
                            <Typography sx= {{ fontWeight: 'bold' }}>{ (sub.name).charAt(0).toUpperCase() + (sub.name).slice(1).toLowerCase() }</Typography>
                            <Controller control= { control } name= { `permissions[module_${module}][submodule_${sub.id}].status` }
                                render= { ({ field: { onChange } }) => (
                                    <IOSSwitch 
                                        checked= { getValues().permissions[`module_${module}`][`submodule_${sub.id}`].status !== null &&
                                                            getValues().permissions[`module_${module}`][`submodule_${sub.id}`].status !== undefined ?
                                                                getValues().permissions[`module_${module}`][`submodule_${sub.id}`].status : false }
                                        onChange= { (e) => { 
                                            setValue(`permissions['module_${module}']['submodule_${sub.id}'].status`, 
                                                                !(getValues().permissions[`module_${module}`][`submodule_${sub.id}`].status) ?? false); 
                                            onChange(e.target.checked);
                                    } } />
                                ) } />
                        </Stack>
                        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 } sx= {{ paddingLeft: '10px' }}>
                            <Stack direction= "row" justifyContent= "space-between" alignItems= "center">
                                <Typography>List</Typography>
                                <Controller control= { control } name= { `permissions[module_${module}][submodule_${sub.id}].list` }
                                    render= { ({ field: { onChange } }) => (
                                        <IOSSwitch 
                                            checked= { getValues().permissions[`module_${module}`][`submodule_${sub.id}`].list !== null &&
                                                                getValues().permissions[`module_${module}`][`submodule_${sub.id}`].list !== undefined ?
                                                                    getValues().permissions[`module_${module}`][`submodule_${sub.id}`].list : false }
                                            onChange= { (e) => { 
                                                setValue(`permissions['module_${module}']['submodule_${sub.id}'].list`, 
                                                                    !(getValues().permissions[`module_${module}`][`submodule_${sub.id}`].list) ?? false); 
                                                onChange(e.target.checked);
                                        } } />
                                    ) } />
                            </Stack>
                            <Stack direction= "row" justifyContent= "space-between" alignItems= "center">
                                <Typography>Create</Typography>
                                <Controller control= { control } name= { `permissions[module_${module}][submodule_${sub.id}].create` }
                                    render= { ({ field: { onChange } }) => (
                                        <IOSSwitch 
                                            checked= { getValues().permissions[`module_${module}`][`submodule_${sub.id}`].create !== null &&
                                                                getValues().permissions[`module_${module}`][`submodule_${sub.id}`].create !== undefined ?
                                                                    getValues().permissions[`module_${module}`][`submodule_${sub.id}`].create : false }
                                            onChange= { (e) => { 
                                                setValue(`permissions['module_${module}']['submodule_${sub.id}'].create`, 
                                                                    !(getValues().permissions[`module_${module}`][`submodule_${sub.id}`].create) ?? false); 
                                                onChange(e.target.checked);
                                        } } />
                                    ) } />
                            </Stack>
                            <Stack direction= "row" justifyContent= "space-between" alignItems= "center">
                                <Typography>Update</Typography>
                                <Controller control= { control } name= { `permissions[module_${module}][submodule_${sub.id}].update` }
                                    render= { ({ field: { onChange } }) => (
                                        <IOSSwitch 
                                            checked= { getValues().permissions[`module_${module}`][`submodule_${sub.id}`].update !== null &&
                                                                getValues().permissions[`module_${module}`][`submodule_${sub.id}`].update !== undefined ?
                                                                    getValues().permissions[`module_${module}`][`submodule_${sub.id}`].update : false }
                                            onChange= { (e) => { 
                                                setValue(`permissions['module_${module}']['submodule_${sub.id}'].update`, 
                                                                    !(getValues().permissions[`module_${module}`][`submodule_${sub.id}`].update) ?? false); 
                                                onChange(e.target.checked);
                                        } } />
                                    ) } />
                            </Stack>
                            <Stack direction= "row" justifyContent= "space-between" alignItems= "center">
                                <Typography>Export</Typography>
                                <Controller control= { control } name= { `permissions[module_${module}][submodule_${sub.id}].export` }
                                    render= { ({ field: { onChange } }) => (
                                        <IOSSwitch 
                                            checked= { getValues().permissions[`module_${module}`][`submodule_${sub.id}`].export !== null &&
                                                                getValues().permissions[`module_${module}`][`submodule_${sub.id}`].export !== undefined ?
                                                                    getValues().permissions[`module_${module}`][`submodule_${sub.id}`].export : false }
                                            onChange= { (e) => { 
                                                setValue(`permissions['module_${module}']['submodule_${sub.id}'].export`, 
                                                                    !(getValues().permissions[`module_${module}`][`submodule_${sub.id}`].export) ?? false); 
                                                onChange(e.target.checked);
                                        } } />
                                    ) } />
                            </Stack>
                            <Stack direction= "row" justifyContent= "space-between" alignItems= "center">
                                <Typography>Print</Typography>
                                <Controller control= { control } name= { `permissions[module_${module}][submodule_${sub.id}].print` }
                                    render= { ({ field: { onChange } }) => (
                                        <IOSSwitch 
                                            checked= { getValues().permissions[`module_${module}`][`submodule_${sub.id}`].print !== null &&
                                                                getValues().permissions[`module_${module}`][`submodule_${sub.id}`].print !== undefined ?
                                                                    getValues().permissions[`module_${module}`][`submodule_${sub.id}`].print : false }
                                            onChange= { (e) => { 
                                                setValue(`permissions['module_${module}']['submodule_${sub.id}'].print`, 
                                                                    !(getValues().permissions[`module_${module}`][`submodule_${sub.id}`].print) ?? false); 
                                                onChange(e.target.checked);
                                        } } />
                                    ) } />
                            </Stack>
                        </Stack>
                    </Stack>
                )) : <Typography sx= {{ width: '100%', textAlign: 'center' }}>No submodule/s found!</Typography> }
        </Stack>
    );
}

export default Permissions;