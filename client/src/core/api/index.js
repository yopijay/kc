// Core
import { api } from "core/function/global";
import Env from '../constants/Env.json';

const env = 'live'; // Environment

export const authentication = async (data) => { return await api({ url: `${Env[env].url}/login`, method: 'post', data: data }).then(res => res.data); }
export const logout = async (data) => { return await api({ url: `${Env[env].url}/logout`, method: 'post', data: data }).then(res => res.data); }
export const profile = async (id) => { return await api({ url: `${Env[env].url}/profile/${id}`, method: 'get'}).then(res => res.data); }
export const dashboard = async ({ table, data }) => { return await api({ url: `${Env[env].url}/dashboard/${table}`, method: 'post', data: data }).then(res => res.data); }
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
export const evaluate = async ({ table, type, data }) => { return await api({ url: `${Env[env].url}/evaluate/${table}/${type}`, method: 'post', data: data }).then(res => res.data); }
export const tracker = async (data) => { return await api({ url: `${Env[env].url}/track`, method: 'post', data: data }).then(res => res.data); }
export const monitor = async (data) => { return await api({ url: `${Env[env].url}/monitor`, method: 'post', data: data }).then(res => res.data); }
export const count = async (data) => { return await api({ url: `${Env[env].url}/count`, method: 'post', data: data }).then(res => res.data); }
export const submodule = async (name) => { return await api({ url: `${Env[env].url}/submodule/${name}`, method: 'get'}).then(res => res.data); }