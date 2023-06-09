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

const Brands = ({ setOpen, index, type }) => {
    const { getValues, control, setValue, setError } = useContext(FormCntxt);
    const { data: personnel } = useGet({ key: ['personnel'], fetch: dropdown({ table: 'tbl_physical_count_personnels', data: { platform: 'client' } }), options: { refetchOnWindowFocus: false } });

    return (
        <Stack direction= "column" justifyContent= "space-between" alignItems= "stretch" sx= {{ padding: '25px 20px', height: '100%' }} spacing= { 2 }>
            <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 2 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography variant= "body2" gutterBottom>*Assign to</Typography>
                    <Box sx= { select }>
                        <Controller control= { control } name= { `personnel[${index}].branch` } defaultValue= { [{ id: '', name: '-- SELECT AN ITEM BELOW --' }] }
                            render= { ({ field: { onChange } }) => (
                                <Autocomplete options= { ([{ id: '', name: '-- SELECT AN ITEM BELOW --' }].concat(getValues()?.branch)).sort((a, b) => a.id - b.id) } disabled= { type === 'view' } 
                                    disableClearable getOptionLabel= { branch => branch.name || branch.id } noOptionsText= "No results..." getOptionDisabled= { option => option.id === '' }
                                    isOptionEqualToValue= { (option, value) => option.name === value.name || option.id === value.id }
                                    onChange= { (e, item) => { onChange(item.id); } } renderInput= { params => <TextField { ...params } variant= "standard" size= "small" fullWidth /> }
                                    value= { ([{ id: '', name: '-- SELECT AN ITEM BELOW --' }]
                                                        .concat(getValues()?.branch))
                                                        .find(data => { return data.id === (getValues()?.personnel[index]?.branch !== undefined ? getValues()?.personnel[index]?.branch : '') }) } /> ) } />
                    </Box>
                </Stack>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography variant= "body2" gutterBottom>*Employee</Typography>
                    <Box sx= { select }>
                        { personnel?.length > 0 ?
                            <Controller control= { control } name= { `personnel[${index}].employee` }
                                render= { ({ field: { onChange } }) => (
                                    <Autocomplete disabled= { type === 'view' } disableClearable 
                                        options= { (personnel?.filter(emp => !(getValues().personnel).find(pnl => emp.id === pnl.employee?.id)))?.sort((a, b) => a.id - b.id) }
                                        getOptionLabel= { employee => employee.name || employee.id } noOptionsText= "No results.." getOptionDisabled= { option => option.id === 0 }
                                        isOptionEqualToValue= { (option, value) => option.id === value.id || option.name === value.name } 
                                        onChange= { (e, item) => { setError(`personnel[${index}].employee`, { message: '' }); onChange({ id: item.id, name: item.name }); } }
                                        renderInput= { params => ( <TextField { ...params } variant= "standard" size= "small" fullWidth /> ) } 
                                        value= { getValues()?.personnel[index]?.employee !== undefined ? getValues()?.personnel[index]?.employee : { id: 0, name: '-- SELECT AN ITEM BELOW --' } } />
                                ) } />
                                 : <Typography color= "text.disabled">You must create a user first!</Typography> }
                    </Box>
                </Stack>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography variant= "body2" gutterBottom>*Type</Typography>
                    <Box sx= { select }>
                        <Controller control= { control } name= { `personnel[${index}].type` } defaultValue= { [{ id: '', name: '-- SELECT AN ITEM BELOW --' }] }
                            render= { ({ field: { onChange } }) => (
                                <Autocomplete options= { ([{ id: '', name: '-- SELECT AN ITEM BELOW --' }].concat(usertype)).sort((a, b) => a.id - b.id) } disabled= { type === 'view' } 
                                    disableClearable getOptionLabel= { ut => ut.name || ut.id } noOptionsText= "No results..." getOptionDisabled= { option => option.id === '' }
                                    isOptionEqualToValue= { (option, value) => option.name === value.name || option.id === value.id }
                                    onChange= { (e, item) => { onChange(item.id); } } renderInput= { params => <TextField { ...params } variant= "standard" size= "small" fullWidth /> }
                                    value= { ([{ id: '', name: '-- SELECT AN ITEM BELOW --' }]
                                                        .concat(usertype))
                                                        .find(data => { return data.id === (getValues()?.personnel[index]?.type !== undefined ? getValues()?.personnel[index]?.type : '') }) } /> ) } />
                    </Box>
                </Stack>
            </Stack>
            <Stack direction= "row" justifyContent= "flex-end" alignItems= "center" spacing= { 4 }>
                <Typography sx= {{ cursor: 'pointer' }} onClick= { () => {  setValue('personnel', getValues().personnel); setOpen(false); } }>Save</Typography>
                { type === 'create' ? <Typography sx= {{ cursor: 'pointer' }} 
                    onClick= { () => { (getValues().personnel).splice(index, 1); setValue('personnel', getValues().personnel); setOpen(false); } }>Cancel</Typography> : '' }
            </Stack>
        </Stack>
    );
}

export default Brands;