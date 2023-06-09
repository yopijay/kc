// Libraries
import { Stack, Typography } from "@mui/material";
import { Controller } from "react-hook-form";
import { useContext } from "react";

// Core
import { FormCntxt } from "core/context/Form"; // Context

// Constants
import { IOSSwitch } from "../index.style"; // Styles

const Update = ({ module, sub }) => {
    const { getValues, control, setValue } = useContext(FormCntxt);
    return (
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
    );
}

export default Update;