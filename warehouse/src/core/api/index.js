// Core
import { api } from "core/function/global";
import Env from '../constants/Env.json';

const env = 'live'; // Environment

export const authentication = async (data) => { return await api({ url: `${Env[env].url}/login`, method: 'post', data: data }).then(res => res.data); }
export const schedule = async (date) => { return await api({ url: `${Env[env].url}/schedule/${date}`, method: 'get' }).then(res => res.data); }