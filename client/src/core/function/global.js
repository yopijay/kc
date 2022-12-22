import axios from "axios"
import { useMutation, useQuery } from "react-query";

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

export const usePost = ({ fetch, onSuccess, onError }) => { return useMutation(fetch, { onSuccess, onError}); }
export const useGet = ({ key, fetch, options, onSuccess, onError }) => { return useQuery(key, () => fetch, { onSuccess, onError, ...options }); }