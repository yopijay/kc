// Libraries
import { Stack, Typography } from "@mui/material";
import { Controller } from "react-hook-form";
import { useContext } from "react";

// Core
import { FormCntxt } from "core/context/Form"; // Context

// Constants
import { IOSSwitch } from "../index.style"; // Styles

const Create = ({ module, sub }) => {
    const { getValues, control, setValue } = useContext(FormCntxt);

    return (
        <Stack direction= "row" justifyContent= "space-between" alignItems= "center">
            <Typography>Create</Typography>
            <Controller control= { control } name= { `permissions[module_${module}][submodule_${sub.id}].create` }
                render= { ({ field: { onChange } }) => (
                    <IOSSwitch 
                        checked= { getValues().permissions[`module_${module}`][`submodule_${sub.id}`].create !== null &&
                                            getValues().permissions[`module_${module}`][`submodule_${sub.id}`].create !== undefined ?
                                                getValues().permissions[`module_${module}`][`submodule_${sub.id}`].create : false }
                        onChange= { (e) => { 
                            setValue(`permissions['module_${module}']['submodule_${sub.id}'].create`, !(getValues().permissions[`module_${module}`][`submodule_${sub.id}`].create) ?? false); 
                            onChange(e.target.checked);
                    } } />
                ) } />
        </Stack>
    );
}

export default Create;