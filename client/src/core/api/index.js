// Core
import { api } from "core/function/global";
import Env from '../constants/Env.json';

const env = 'local'; // Environment
// const _dropdown = [{ id: 0, name: '-- SELECT AN ITEM BELOW --' }];

export const authentication = async(data) => { return await api({ url: `${Env[env].url}/login`, method: 'post', data: data }).then(res => res.data); }