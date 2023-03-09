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
        position: 'bottom-left',
        autoClose: duration,
        hideProgressBar: false,
        closeOnClick: true,
        pauseOnHover: true,
        draggable: false,
        progress: undefined,
        onClose: () => navigate
    });
}

export const infoToast = (message, duration = 3000, navigate) => {
    return toast.info(message, {
        position: 'bottom-left',
        autoClose: duration,
        hideProgressBar: false,
        closeOnClick: true,
        pauseOnHover: true,
        draggable: false,
        progress: undefined,
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

export const groupBy = (collection, property) => {
    let modules = collection.filter((obj, index) => collection.findIndex(item => item.module === obj.module) === index);
    let result = [];
    // let val = '';
    // let index = 0;
    // let values = [];
    for (let count = 0; count < modules.length; count++) {
        result.push({ title: modules[count].module })
    }
    
    console.log(result);
    // for(let i = 0; i < collection.length; i++) {
    //     console.log
        // let obj = {}
        // obj['title'] = collection[i]['property'];

        // result.push(obj);
        // result['title'] = collection[i][property];
        // val = collection[i][property];
        // index = values.indexOf(val);

        // if(index > -1) { result[index].push(collection[i]); }
        // else { values.push(val); result.push([collection[i]]); }
    // }

    // return result;
}