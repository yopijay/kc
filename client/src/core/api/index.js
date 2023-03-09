// Core
import { api } from "core/function/global";
import Env from '../constants/Env.json';

const env = 'lan'; // Environment

export const authentication = async (data) => { return await api({ url: `${Env[env].url}/login`, method: 'post', data: data }).then(res => res.data); }
export const logout = async (data) => { return await api({ url: `${Env[env].url}/logout`, method: 'post', data: data }).then(res => res.data); }
export const profile = async (id) => { return await api({ url: `${Env[env].url}/profile/${id}`, method: 'get'}).then(res => res.data); }
export const dashboard = async (table) => { return await api({ url: `${Env[env].url}/dashboard/${table}`, method: 'get' }).then(res => res.data); }
export const records = async ({ table, data }) => { return await api({ url: `${Env[env].url}/list/${table}`, method: 'post', data: data }).then(res => res.data); }
export const specific = async ({ table, id }) => { return await api({ url: `${Env[env].url}/specific/${table}/${id}`, method: 'get' }).then(res => res.data); }
export const save = async ({ table, data }) => { return await api({ url: `${Env[env].url}/save/${table}`, method: 'post', data: data }).then(res => res.data); }
export const update = async ({ table, data }) => { return await api({ url: `${Env[env].url}/update/${table}`, method: 'post', data: data }).then(res => res.data); }
export const dropdown = async ({ table, data }) => { return await api({ url: `${Env[env].url}/dropdown/${table}`, method: 'post', data: data }).then(res => res.data); }
export const series = async (table) => { return await api({ url: `${Env[env].url}/series/${table}`, method: 'get' }).then(res => res.data[0].count); }
export const look = async ({ table, data }) => { return await api({ url: `${Env[env].url}/search/${table}`, method: 'post', data: data }).then(res => res.data); }
export const excel = async ({ table, type, data }) => { return await api({ url: `${Env[env].url}/excel/${table}/${type}`, method: 'post', data: data }).then(res => res.data); }
export const upload = async ({ table, data }) => { return await api({ url: `${Env[env].url}/upload/${table}`, method: 'post', data: data }).then(res => res.data); }
export const assettag = async ({ table, data }) => { return await api({ url: `${Env[env].url}/assettag/${table}`, method: 'post', data: data }).then(res => res.data); }
export const filter = async ({ table, data }) => { return await api({ url: `${Env[env].url}/filter/${table}`, method: 'post', data: data }).then(res => res.data); }
export const component = async (id) => { return await api({ url: `${Env[env].url}/component/${id}`, method: 'get'}).then(res => res.data); }