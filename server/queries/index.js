// Connection
const db = require('../connection');

// Tables
const Users = require('./tables/Users');

const login = (data) => { return new Users().login(data); }
const profile = (id) => { return new Users().profile(id); }
const logout = () => {}

module.exports = {
    login,
    logout,
    profile
}