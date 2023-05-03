// Libraries
import { Autocomplete, Box, Stack, TextField, Typography } from "@mui/material";
import { useContext } from "react";
import { Controller } from "react-hook-form";

// Core
import { FormCntxt } from "core/context/Form"; // Context
import { useGet } from "core/function/global"; // Function
import { dropdown } from "core/api"; // API

// Constants
import { select } from "../../index.style"; // Styles
const usertype = [{ id: 'admin', name: 'ADMIN' }, { id: 'ras', name: 'RAS' }, { id: 'rcs', name: 'RCS' }]; // User type

const Brands = ({ setOpen, remove, index, type }) => {
    const { getValues, control, setValue, setError } = useContext(FormCntxt);
    const { data: employee } = useGet({ key: ['dd_employee'], fetch: dropdown({ table: 'tbl_users', data: {} }) });

    return (
        <Stack direction= "column" justifyContent= "space-between" alignItems= "stretch" sx= {{ padding: '25px 20px', height: '100%' }} spacing= { 2 }>
            <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 2 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography variant= "body2" gutterBottom>*Assign to</Typography>
                    <Box sx= { select }>
                        <Controller control= { control } name= { `personnel[${index}].branch` } defaultValue= { [{ id: '', name: '-- SELECT AN ITEM BELOW --' }] }
                            render= { ({ field: { onChange, value } }) => (
                                <Autocomplete options= { ([{ id: '', name: '-- SELECT AN ITEM BELOW --' }].concat(getValues()?.branch)).sort((a, b) => a.id - b.id) } disabled= { type === 'view' } 
                                    disableClearable getOptionLabel= { branch => branch.name || branch.id } noOptionsText= "No results..." getOptionDisabled= { option => option.id === '' }
                                    isOptionEqualToValue= { (option, value) => option.name === value.name || option.id === value.id }
                                    onChange= { (e, item) => { onChange(item.id); } } renderInput= { params => <TextField { ...params } variant= "standard" size= "small" fullWidth /> }
                                    value= { ([{ id: '', name: '-- SELECT AN ITEM BELOW --' }]
                                                        .concat(getValues()?.branch))
                                                        .find(data => { return data.id === (getValues()?.personnel[`${index}`].branch !== undefined ? getValues()?.personnel[`${index}`].branch : '') }) } /> ) } />
                    </Box>
                </Stack>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography variant= "body2" gutterBottom>*Employee</Typography>
                    <Box sx= { select }>
                        { employee?.length > 0 ? 
                            <Controller control= { control } name= { `personnel[${index}].employee` } defaultValue= { 0 }
                                render= { ({ field: { onChange, value } }) => (
                                    <Autocomplete disabled= { type === 'view' } disableClearable 
                                        options= { (employee?.filter(emp => !(getValues().personnel).find(pnl => emp.id === pnl.employee)))?.sort((a, b) => a.id - b.id) }
                                        getOptionLabel= { employee => employee.name || employee.id } noOptionsText= "No results.." getOptionDisabled= { option => option.id === 0 }
                                        isOptionEqualToValue= { (option, value) => option.name === value.name || option.id === value.id } 
                                        onChange= { (e, item) => { setError(`personnel[${index}].employee`, { message: '' }); onChange(item.id); setValue(`personnel[${index}].name`, item.name); } }
                                        renderInput= { params => ( <TextField { ...params } variant= "standard" size= "small" fullWidth /> ) } 
                                        value= { employee?.find(data => { return data.id === (getValues()?.personnel[`${index}`].employee !== undefined ? 
                                                        getValues()?.personnel[`${index}`].employee : value) }) !== undefined ?
                                                        employee?.find(data => { return data.id === (getValues()?.personnel[`${index}`].employee !== undefined ? 
                                                            getValues()?.personnel[`${index}`].employee : value) }) : employee.length === 0 ? { id: 0, name: '-- SELECT AN ITEM BELOW --' } : employee[0] } />
                                ) } /> : 
                        <Typography color= "text.disabled">You must create a user first!</Typography> }
                    </Box>
                </Stack>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography variant= "body2" gutterBottom>*Type</Typography>
                    <Box sx= { select }>
                        <Controller control= { control } name= { `personnel[${index}].type` } defaultValue= { [{ id: '', name: '-- SELECT AN ITEM BELOW --' }] }
                            render= { ({ field: { onChange, value } }) => (
                                <Autocomplete options= { ([{ id: '', name: '-- SELECT AN ITEM BELOW --' }].concat(usertype)).sort((a, b) => a.id - b.id) } disabled= { type === 'view' } 
                                    disableClearable getOptionLabel= { ut => ut.name || ut.id } noOptionsText= "No results..." getOptionDisabled= { option => option.id === '' }
                                    isOptionEqualToValue= { (option, value) => option.name === value.name || option.id === value.id }
                                    onChange= { (e, item) => { onChange(item.id); } } renderInput= { params => <TextField { ...params } variant= "standard" size= "small" fullWidth /> }
                                    value= { ([{ id: '', name: '-- SELECT AN ITEM BELOW --' }]
                                                        .concat(usertype))
                                                        .find(data => { return data.id === (getValues()?.personnel[`${index}`].type !== undefined ? getValues()?.personnel[`${index}`].type : '') }) } /> ) } />
                    </Box>
                </Stack>
            </Stack>
            <Stack direction= "row" justifyContent= "flex-end" alignItems= "center" spacing= { 4 }>
                <Typography sx= {{ cursor: 'pointer' }} 
                    onClick= { () => {  setValue('personnel', getValues().personnel); setOpen(false); } }>Save</Typography>
                { type === 'create' ? <Typography sx= {{ cursor: 'pointer' }} 
                    onClick= { () => {  setValue('personnel', getValues().personnel); remove(index); setOpen(false); } }>Cancel</Typography> : '' }
            </Stack>
        </Stack>
    );
}

export default Brands;