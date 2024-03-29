// Core
import { api } from "core/function/global";
import Env from '../constants/Env.json';

const env = 'live'; // Environment

export const authentication = async data => { return await api({ url: `${Env[env].url}/login`, method: 'post', data: data }).then(res => res.data); }
export const logout = async (data) => { return await api({ url: `${Env[env].url}/logout`, method: 'post', data: data }).then(res => res.data); }
export const schedule = async date => { return await api({ url: `${Env[env].url}/schedule/${date}`, method: 'get' }).then(res => res.data); }
export const profile = async id => { return await api({ url: `${Env[env].url}/profile/${id}`, method: 'get'}).then(res => res.data); }
export const records = async ({ table, data }) => { return await api({ url: `${Env[env].url}/list/${table}`, method: 'post', data: data }).then(res => res.data); }
export const dropdown = async ({ table, data }) => { return await api({ url: `${Env[env].url}/dropdown/${table}`, method: 'post', data: data }).then(res => res.data); }
export const save = async ({ table, data }) => { return await api({ url: `${Env[env].url}/save/${table}`, method: 'post', data: data }).then(res => res.data); }
export const update = async ({ table, data }) => { return await api({ url: `${Env[env].url}/update/${table}`, method: 'post', data: data }).then(res => res.data); }
export const specific = async ({ table, data }) => { return await api({ url: `${Env[env].url}/specific/${table}/${data}`, method: 'get' }).then(res => res.data); }
export const series = async table => { return await api({ url: `${Env[env].url}/series/${table}`, method: 'get' }).then(res => res.data[0].count); }
export const counts = async ({ data }) => { return await api({ url: `${Env[env].url}/counts/${data}`, method: 'get' }).then(res => res.data); }
export const look = async ({ table, data }) => { return await api({ url: `${Env[env].url}/search/${table}`, method: 'post', data: data }).then(res => res.data); }