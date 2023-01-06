// Libraries
import axios from "axios"
import { useMutation, useQuery } from "react-query";
import { toast } from "react-toastify";
import * as XLSX from 'xlsx';

export const api = ({ url, method, data= null }) => {
    const config = {
        method: method,
        url: url,
        headers: {
            'Content-Type': 'application/json',
            'Access-Control-Allow-Origin': '*',
            'Access-Control-Allow-Credentials': true,
            'Access-Control-Allow-Methods': 'GET, POST'
        },
        data: data
    }

    return axios(config);
}

export const usePost = ({ fetch, onSuccess, onError }) => { return useMutation(fetch, { onSuccess, onError }); }
export const useGet = ({ key, fetch, options, onSuccess, onError }) => { return useQuery(key, () => fetch, { onSuccess, onError, ...options }); }
export const formatter = (num, size) => { return (`000000${num}`).substr((`000000${num}`).length - size); }

export const successToast = (message, duration = 3000, navigate) => {
    return toast.success(message, {
        position: 'bottom-right',
        autoClose: duration,
        hideProgressBar: false,
        closeOnClick: true,
        pauseOnHover: true,
        draggable: false,
        progress: undefined,
        theme: 'colored',
        onClose: () => navigate
    });
}

export const exporttoexcel = (json, sheet_name, file_name) => {
    const wb = XLSX.utils.book_new();
    const ws = XLSX.utils.json_to_sheet(json);

    XLSX.utils.book_append_sheet(wb, ws, sheet_name);
    XLSX.writeFile(wb, `${file_name}.xlsx`);
}

export const importfromexcel = async (e) => {
    const file = e.target.files[0];
    const data = await file.arrayBuffer();
    const wb = XLSX.read(data);
    const ws = wb.Sheets[wb.SheetNames[0]];

    const json = XLSX.utils.sheet_to_json(ws);

    return json;
}