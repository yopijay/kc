// Libraries
import { useContext, useEffect } from "react";

// Core
import { ListCntxt } from "core/context/List"; // Context
import { FormCntxt } from "core/context/Form"; // Context
import { GlobalCntx } from "core/context/Global"; // Context
import { ProfileCntx } from "core/context/Profile"; // Context
import { exporttoexcel, usePost } from "core/function/global"; // Function
import { excel, look, records, upload } from "core/api"; // API
import { Stack, Typography } from "@mui/material";

const Index = () => {
    let name = `KC-EXPORT-ASSETS-ISSUANCE-${parseInt((new Date()).getMonth()) + 1}${(new Date()).getDate()}${(new Date()).getFullYear()}`;
    const { setList } = useContext(ListCntxt);
    const { register, getValues, setValue } = useContext(FormCntxt);
    const { message, setMessage, errors, setErrors } = useContext(GlobalCntx);
    const { data} = useContext(ProfileCntx);
    const { mutate: find, isLoading: finding } = usePost({ fetch: look, onSuccess: data => setList(data) });
    const { mutate: record, isLoading: fetching } = usePost({ fetch: records, options: { refetchOnWindowsFocus: false }, onSuccess: data => setList(data) });

    const { mutate: original } =
        usePost({ fetch: excel, options: { refetchOnWindowsFocus: false }, onSuccess: data => exporttoexcel(data, 'Assets Issuance', `${name} (Admin's copy)`) });
    const { mutate: formatted } = usePost({ fetch: excel, options: { refetchOnWindowsFocus: false }, onSuccess: data => exporttoexcel(data, 'Assets Issuance', `${name}`) });

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

    useEffect(() => {
        register('orderby', { value: 'date_created' }); register('sort', { value: 'desc' }); register('sub_category_id', { value: 'all' }); register('sub_category_name', { value: 'all' });
        if(Object.keys(getValues()).length > 0) { record({ table: 'tbl_assign_asset', data: getValues() }); } }, [ register, record, getValues ]);

    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= {{ width: '100%', overflow: 'hidden' }} spacing= { 1 }>
            <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                <Typography variant= "h6" sx= {{ fontFamily: 'Boldstrom', color:  '#3C4048' }}>Assets Issuance</Typography>
            </Stack>
        </Stack>
    );
}

export default Index;