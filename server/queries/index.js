// Connection
const db = require('../connection');

// Tables
const Users = require('./tables/Users');
const Company = require('./tables/Company');

const login = (data) => { return new Users().login(data); }
const logout = () => { return new Users().logout(data); }
const profile = (id) => { return new Users().profile(id); }

const dashboard = (table) => {
    return new Promise(async resolve => {
        switch(table) {
            case 'tbl_company': resolve(await new Company().dashboard()); break;
        }
    });
}

const list = (table, data) => {
    return new Promise(async resolve => {
        switch(table) {
            case 'tbl_company': resolve(await new Company().list()); break;
        }
    });
}

module.exports = {
    login,
    logout,
    profile,
    dashboard,
    list
}