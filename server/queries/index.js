// Tables
const Users = require('./tables/Users');
const UserAccess = require('./tables/UserAccess');
const Company = require('./tables/Company');
const Department = require('./tables/Department');
const Position = require('./tables/Position');
const Supplies = require('./tables/Supplies');
const Category = require('./tables/Category');
const SubCategory = require('./tables/SubCategory');
const Assets = require('./tables/Assets');
const AssignAssets = require('./tables/AssignAssets');
const Module = require('./tables/Module');
const SubModule = require('./tables/SubModule');
const Services = require('./tables/Services');

const login = (data) => { return new Users().login(data); }
const logout = (data) => { return new Users().logout(data); }
const profile = (id) => { return new Users().profile(id); }
const component = (id) => { return new UserAccess().components(id); }

const assettag = (table, data) => {
    return new Promise(async resolve => {
        switch(table) {
            case 'tbl_assets': resolve(await new Assets().assettag(data)); break;
        }
    });
}

const filter = (table, data) => {
    return new Promise(async resolve => {
        switch(table) {
            case 'tbl_company': resolve(await new Company().filter()); break;
            case 'tbl_sub_category': resolve(await new SubCategory().filter(data)); break;
        }
    });
}

const dashboard = (table) => {
    return new Promise(async resolve => {
        switch(table) {
            case 'tbl_company': resolve(await new Company().dashboard()); break;
            case 'tbl_department': resolve(await new Department().dashboard()); break;
            case 'tbl_position': resolve(await new Position().dashboard()); break;
            case 'tbl_users': resolve(await new Users().dashboard()); break;
            case 'tbl_category': resolve(await new Category().dashboard()); break;
            case 'tbl_assets': resolve(await new Assets().dashboard()); break;
            case 'tbl_sub_category': resolve(await new SubCategory().dashboard()); break;
            case 'tbl_services': resolve(await new Services().dashboard()); break;
        }
    });
}

const excel = (table, type, data) => {
    return new Promise(async resolve => {
        switch(table) {
            case 'tbl_users': resolve(await new Users().excel(type, data)); break;
            case 'tbl_company': resolve(await new Company().excel(type, data)); break;
            case 'tbl_department': resolve(await new Department().excel(type, data)); break;
            case 'tbl_position': resolve(await new Position().excel(type)); break;
            case 'tbl_category': resolve(await new Category().excel(type, data)); break;
            case 'tbl_sub_category': resolve(await new SubCategory().excel(type, data)); break;
            case 'tbl_assets': resolve(await new Assets().excel(type, data)); break;
            case 'tbl_assign_asset': resolve(await new AssignAssets().excel(type, data)); break;
            case 'tbl_module': resolve(await new Module().excel(type, data)); break;
            case 'tbl_sub_module': resolve(await new SubModule().excel(type, data)); break;
            case 'tbl_services': resolve(await new Services().excel(type, data)); break;
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
            case 'tbl_sub_category': resolve(await new SubCategory().list(data)); break;
            case 'tbl_assets': resolve(await new Assets().list(data)); break;
            case 'tbl_assign_asset': resolve(await new AssignAssets().list(data)); break
            case 'tbl_module': resolve(await new Module().list(data)); break
            case 'tbl_sub_module': resolve(await new SubModule().list(data)); break
            case 'tbl_services': resolve(await new Services().list(data)); break;
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
            case 'tbl_sub_category': resolve(await new SubCategory().search(data)); break;
            case 'tbl_assets': resolve(await new Assets().search(data)); break;
            case 'tbl_assign_asset': resolve(await new AssignAssets().search(data)); break;
            case 'tbl_module': resolve(await new Module().search(data)); break;
            case 'tbl_sub_module': resolve(await new SubModule().search(data)); break;
            case 'tbl_services': resolve(await new Services().search(data)); break;
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
            case 'tbl_sub_category': resolve(await new SubCategory().specific(id)); break;
            case 'tbl_assets': resolve(await new Assets().specific(id)); break;
            case 'tbl_assign_asset': resolve(await new AssignAssets().specific(id)); break;
            case 'tbl_module': resolve(await new Module().specific(id)); break;
            case 'tbl_sub_module': resolve(await new SubModule().specific(id)); break;
            case 'tbl_services': resolve(await new Services().specific(id)); break;
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
            case 'tbl_sub_category': resolve(await new SubCategory().save(data)); break;
            case 'tbl_assets': resolve(await new Assets().save(data)); break;
            case 'tbl_assign_asset': resolve(await new AssignAssets().save(data)); break;
            case 'tbl_module': resolve(await new Module().save(data)); break;
            case 'tbl_sub_module': resolve(await new SubModule().save(data)); break;
            case 'tbl_services': resolve(await new Services().save(data)); break;
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
           case 'tbl_sub_category': resolve(await new SubCategory().update(data)); break;
           case 'tbl_assets': resolve(await new Assets().update(data)); break;
           case 'tbl_assign_asset': resolve(await new AssignAssets().update(data)); break;
           case 'tbl_module': resolve(await new Module().update(data)); break;
           case 'tbl_sub_module': resolve(await new SubModule().update(data)); break;
           case 'tbl_services': resolve(await new Services().update(data)); break;
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
            case 'tbl_sub_category': resolve(await new SubCategory().series()); break;
            case 'tbl_assets': resolve(await new Assets().series()); break;
            case 'tbl_assign_asset': resolve(await new AssignAssets().series()); break;
            case 'tbl_module': resolve(await new Module().series()); break;
            case 'tbl_sub_module': resolve(await new SubModule().series()); break;
            case 'tbl_services': resolve(await new Services().series()); break;
        }
    });
}

const dropdown = (table, data) => {
    return new Promise(async resolve => {
        switch(table) {
            case 'tbl_users': resolve(await new Users().dropdown(data)); break;
            case 'tbl_company': resolve(await new Company().dropdown()); break;
            case 'tbl_department': resolve(await new Department().dropdown(data)); break;
            case 'tbl_position': resolve(await new Position().dropdown(data)); break;
            case 'tbl_category': resolve(await new Category().dropdown(data)); break;
            case 'tbl_sub_category': resolve(await new SubCategory().dropdown(data)); break;
            case 'tbl_assets': resolve(await new Assets().dropdown(data)); break;
            case 'tbl_module': resolve(await new Module().dropdown(data)); break;
            case 'tbl_sub_module': resolve(await new SubModule().dropdown(data)); break;
        }
    });
}

const upload = (table, data) => {
    return new Promise(async resolve => {
        switch(table) {
            case 'tbl_company': resolve(new Company().upload(data)); break;
            case 'tbl_department': resolve(new Department().upload(data)); break;
            case 'tbl_position': resolve(new Position().upload(data)); break;
            case 'tbl_category': resolve(new Category().upload(data)); break;
            case 'tbl_sub_category': resolve(new SubCategory().upload(data)); break;
            case 'tbl_assets': resolve(new Assets().upload(data)); break;
            case 'tbl_assign_asset': resolve(await new AssignAssets().upload(data)); break;
            case 'tbl_module': resolve(await new Module().upload(data)); break;
            case 'tbl_sub_module': resolve(await new SubModule().upload(data)); break;
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
    upload,
    assettag,
    filter,
    component
}