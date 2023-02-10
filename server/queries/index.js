// Tables
const Users = require('./tables/Users');
const Company = require('./tables/Company');
const Department = require('./tables/Department');
const Position = require('./tables/Position');
const Supplies = require('./tables/Supplies');
const Category = require('./tables/Category');

const login = (data) => { return new Users().login(data); }
const logout = (data) => { return new Users().logout(data); }
const profile = (id) => { return new Users().profile(id); }

const dashboard = (table) => {
    return new Promise(async resolve => {
        switch(table) {
            case 'tbl_company': resolve(await new Company().dashboard()); break;
            case 'tbl_department': resolve(await new Department().dashboard()); break;
            case 'tbl_position': resolve(await new Position().dashboard()); break;
            case 'tbl_users': resolve(await new Users().dashboard()); break;
            case 'tbl_category': resolve(await new Category().dashboard()); break;
        }
    });
}

const excel = (table, type, data) => {
    return new Promise(async resolve => {
        switch(table) {
            case 'tbl_company': resolve(await new Company().excel(type, data)); break;
            case 'tbl_department': resolve(await new Department().excel(type, data)); break;
            case 'tbl_position': resolve(await new Position().excel(type)); break;
            case 'tbl_category': resolve(await new Category().excel(type, data)); break;
        }
    });
}

const list = (table, data) => {
    return new Promise(async resolve => {
        switch(table) {
            case 'tbl_company': resolve(await new Company().list(data)); break;
            case 'tbl_department': resolve(await new Department().list(data)); break;
            case 'tbl_position': resolve(await new Position().list(data)); break;
            case 'tbl_users': resolve(await new Users().list(data)); break;
            case 'tbl_supplies': resolve(await new Supplies().list(data)); break;
            case 'tbl_category': resolve(await new Category().list(data)); break;
        }
    });
}

const search = (table, data) => {
    return new Promise(async resolve => {
        switch(table) {
            case 'tbl_company': resolve(await new Company().search(data)); break;
            case 'tbl_department': resolve(await new Department().search(data)); break;
            case 'tbl_position': resolve(await new Position().search(data)); break;
            case 'tbl_users': resolve(await new Users().search(data)); break;
            case 'tbl_category': resolve(await new Category().search(data)); break;
        }
    });
}

const specific = (table, id) => {
    return new Promise(async resolve => {
        switch(table) {
            case 'tbl_company': resolve(await new Company().specific(id)); break;
            case 'tbl_department': resolve(await new Department().specific(id)); break;
            case 'tbl_position': resolve(await new Position().specific(id)); break;
            case 'tbl_users': resolve(await new Users().specific(id)); break;
            case 'tbl_category': resolve(await new Category().specific(id)); break;
        }
    });
}

 const save = (table, data) => {
    return new Promise(async resolve => {
        switch(table) {
            case 'tbl_company': resolve(await new Company().save(data)); break;
            case 'tbl_department': resolve(await new Department().save(data)); break;
            case 'tbl_position': resolve(await new Position().save(data)); break;
            case 'tbl_users': resolve(await new Users().save(data)); break;
            case 'tbl_category': resolve(await new Category().save(data)); break;
        }
    });
}

const update = (table, data) => {
   return new Promise(async resolve => {
       switch(table) {
           case 'tbl_company': resolve(await new Company().update(data)); break;
           case 'tbl_department': resolve(await new Department().update(data)); break;
           case 'tbl_position': resolve(await new Position().update(data)); break;
           case 'tbl_users': resolve(await new Users().update(data)); break;
           case 'tbl_category': resolve(await new Category().update(data)); break;
       }
   });
}

const series = (table) => {
    return new Promise(async resolve => {
        switch(table) {
            case 'tbl_company': resolve(await new Company().series()); break;
            case 'tbl_department': resolve(await new Department().series()); break;
            case 'tbl_position': resolve(await new Position().series()); break;
            case 'tbl_category': resolve(await new Category().series()); break;
        }
    });
}

const dropdown = (table, data) => {
    return new Promise(async resolve => {
        switch(table) {
            case 'tbl_users': resolve(await new Users().dropdown(data)); break;
            case 'tbl_company': resolve(await new Company().dropdown(data)); break;
            case 'tbl_department': resolve(await new Department().dropdown(data)); break;
            case 'tbl_position': resolve(await new Position().dropdown(data)); break;
            case 'tbl_category': resolve(await new Category().dropdown(data)); break;
        }
    });
}

const upload = (table, data) => {
    return new Promise(async resolve => {
        switch(table) {
            case 'tbl_company': resolve(new Company().upload(data)); break;
            case 'tbl_department': resolve(new Department().upload(data)); break;
            case 'tbl_position': resolve(new Position().upload(data)); break;
            case 'tbl_category': resolve(new Category().update(data)); break;
        }
    });
}

module.exports = {
    login,
    logout,
    profile,
    dashboard,
    list,
    specific,
    save,
    update,
    dropdown,
    series,
    search,
    excel,
    upload
}