// Libraries
import { useContext, useEffect } from "react";
import { Box, FormLabel, Stack, TextField, Typography } from "@mui/material";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faEllipsisH, faFileArrowDown, faFileArrowUp, faMagnifyingGlass, faPlus } from "@fortawesome/free-solid-svg-icons";
import { Link } from "react-router-dom";

// Core
import { GlobalCntx } from "core/context/Global"; // Context
import { ListCntxt } from "core/context/List"; // Context
import { ProfileCntx } from "core/context/Profile"; // Context
import { FormCntxt } from "core/context/Form"; // Context
import { exporttoexcel, importfromexcel, usePost } from "core/function/global"; // Functions
import { excel, look, records, upload } from "core/api"; // API

// Constants
import { btnexport, btnicon, btnimport, btntxt, search } from "./index.style"; // Styles

// Layouts
import Dashboard from "./layouts/Dashboard";
import Item from "./layouts/Item";
import Loader from "./layouts/Loader";
import Sort from "./layouts/Sort";

const Index = () => {
    let name = `KC-EXPORT-DEPARTMENT-${parseInt((new Date()).getMonth()) + 1}${(new Date()).getDate()}${(new Date()).getFullYear()}`;
    const { setList } = useContext(ListCntxt);
    const { register, getValues, setValue } = useContext(FormCntxt);
    const { message, setMessage, errors, setErrors } = useContext(GlobalCntx);
    const { data } = useContext(ProfileCntx);
    const { mutate: find, isLoading: finding } = usePost({ fetch: look, onSuccess: (data) => setList(data) });
    const { mutate: record, isLoading: fetching } = usePost({ fetch: records, options: { refetchOnWindowsFocus: false }, onSuccess: (data) => setList(data) });

    const { mutate: original } = usePost({ fetch: excel, options: { refetchOnWindowsFocus: false }, onSuccess: (data) =>  exporttoexcel(data, 'Department', `${name} (Admin's copy)`) });
    const { mutate: formatted } = usePost({ fetch: excel, options: { refetchOnWindowsFocus: false }, onSuccess: (data) => exporttoexcel(data, 'Department', `${name}`) });

    const { mutate: uploadfile, isLoading: uploading } =
        usePost({ fetch: upload,
            onSuccess: (data) => {
                setMessage('');
                setErrors([]);

                setErrors(data.errors);
                setMessage(`${data.success} out of ${data.total} row/s successfully imported! ${data.fail} row/s failed!`);
                setList(data.list);
                setTimeout(() => { setMessage(''); setErrors([]); }, 5000);
            }    
        });

    useEffect(() => { register('orderby', { value: 'date_created' }); register('sort', { value: 'desc' }); record({ table: 'tbl_department', data: getValues() }); }, [ register, record, getValues ]);

    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= {{ width: '100%', overflow: 'hidden' }} spacing= { 1 }>
            <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 }>
                <Typography variant= "h6" sx= {{ fontFamily: 'Boldstrom', color: '#3C4048' }}>Department</Typography>
                <Dashboard />
                <Stack direction= "row" justifyContent= "space-between" alignItems= "center">
                    <form autoComplete= "off">
                        <Box sx= { search }>
                            <FontAwesomeIcon icon= { faMagnifyingGlass } size= "sm" style= {{ margin: '8px' }} />
                            <TextField { ...register('searchtxt') } variant= "standard" size= "small" fullWidth InputProps= {{ disableUnderline: true }} placeholder= "Search..." sx= {{ padding: '5px 0 0 0' }}
                                onChange= { e => { setValue('searchtxt', e.target.value); find({ table: 'tbl_department', data: getValues() }); } } />
                        </Box>
                    </form>
                    <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 }>
                        <Stack direction= "row" justifyContent= "flex-end" alignItems= "center" sx= {{ flexGrow: 1 }} spacing= { 1 }>
                            { data.user_level === 'superadmin' ?
                                <input type= "file" name= "upload-file" id= "upload-file" style= {{ width: '0.1px', height: '0.1px', opacity: 0, overflow: 'hidden', position: 'absolute', zIndex: -1 }}
                                    onChange= { async e => { uploadfile({ table: 'tbl_department', data: { json: await importfromexcel(e), id: localStorage.getItem('token') } }); e.target.value = '' } } /> : ''}
                            { data.user_level === 'superadmin' ? <FormLabel htmlFor= "upload-file" sx= { btnimport }>
                                <FontAwesomeIcon icon= { !uploading ? faFileArrowUp : faEllipsisH } style= {{ color: '#FFFFFF'}} size= "lg" />
                            </FormLabel> : '' }
                            <Typography 
                                onClick= { () => { 
                                    if(data.user_level === 'superadmin') { original({ table: 'tbl_department', type: 'original', data: getValues() }); } 
                                    formatted({ table: 'tbl_department', type: 'formatted', data: getValues() }); }} sx= { btnexport }>
                                <FontAwesomeIcon icon= { faFileArrowDown } style= {{ color: '#FFFFFF' }} size= "lg" />
                            </Typography>
                            <Typography component= { Link } to= "/maintenance/department/form/new" sx= { btnicon }>
                                <FontAwesomeIcon icon= { faPlus } style= {{ color: '#FFFFFF' }} size= "lg" />
                            </Typography>
                            <Typography component= { Link } to= "/maintenance/department/form/new" sx= { btntxt }>New Department</Typography>
                        </Stack>
                        <Stack direction= "column" justifyContent= "flex-start" alignItems= "flex-end">
                            <Typography variant= "body2" sx= {{ color: '#557153', textAlign: 'right' }}>{ message }</Typography>
                            { errors.map((err, index) => 
                                <Typography variant= "caption" sx= {{ color: '#F47C7C', textAlign: 'right' }} key= { index }>{ `Error on row${err.row}, ${JSON.stringify(err.errors)}` }</Typography> ) }
                        </Stack>
                    </Stack>
                </Stack>
            </Stack>
            <Sort refetch= { record } />
            <Box sx= {{ overflowY: 'scroll', '&::-webkit-scrollbar': { display: 'none' } }}>{ !fetching && !finding ? <Item /> : <Loader /> }</Box>
        </Stack>
    );
}

export default Index;