// Tables
const Users = require('./tables/Users');
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
const Tracker = require('./tables/Tracker');
const Permissions = require('./tables/Permissions');
const Brand = require('./tables/Brand');
const Racks = require('./tables/Racks');
const Items = require('./tables/Items');
const PhysicalCount = require('./tables/PhysicalCount');
const PhysicalCountPersonnel = require('./tables/PhysicalCountPersonnel');

const login = data => { return new Users().login(data); }
const logout = data => { return new Users().logout(data); }
const profile = id => { return new Users().profile(id); }
const tracker = data => { return new Tracker().track(data); }
const monitor = data => { return new Tracker().monitor(data); }
const submodule = name => { return new SubModule().submodule(name); }
const count = data => { return new Items().count(data); }
const assettag = (table, data) => { return new Promise(async resolve => { switch(table) { case 'tbl_assets': resolve(await new Assets().assettag(data)); break; } }); }

const filter = (table, data) => {
    return new Promise(async resolve => {
        switch(table) {
            case 'tbl_company': resolve(await new Company().filter()); break;
            case 'tbl_sub_category': resolve(await new SubCategory().filter(data)); break;
            case 'tbl_tracker': resolve(await new Tracker().filter(data)); break;
            case 'tbl_brand': resolve(await new Brand().filter(data)); break;
            case 'tbl_racks': resolve(await new Racks().filter(data)); break;
        }
    });
}

const dashboard = (table, data) => {
    return new Promise(async resolve => {
        switch(table) {
            case 'tbl_company': resolve(await new Company().dashboard()); break;
            case 'tbl_department': resolve(await new Department().dashboard()); break;
            case 'tbl_position': resolve(await new Position().dashboard()); break;
            case 'tbl_users': resolve(await new Users().dashboard()); break;
            case 'tbl_category': resolve(await new Category().dashboard()); break;
            case 'tbl_assets': resolve(await new Assets().dashboard()); break;
            case 'tbl_sub_category': resolve(await new SubCategory().dashboard()); break;
            case 'tbl_services': resolve(await new Services().dashboard(data)); break;
            case 'tbl_employee_tracker': resolve(await new Tracker().dashboard(data)); break;
            case 'tbl_brand': resolve(await new Brand().dashboard(data)); break;
            case 'tbl_racks': resolve(await new Racks().dashboard(data)); break;
            case 'tbl_physical_count': resolve(await new PhysicalCount().dashboard(data)); break;
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
            case 'tbl_tracker': resolve(await new Tracker().excel(type, data)); break;
            case 'tbl_brand': resolve(await new Brand().excel(type, data)); break;
            case 'tbl_racks': resolve(await new Racks().excel(type, data)); break;
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
            case 'tbl_tracker': resolve(await new Tracker().list(data)); break;
            case 'tbl_employee_tracker': resolve(await new Tracker().logs(data)); break;
            case 'tbl_brand': resolve(await new Brand().list(data)); break;
            case 'tbl_racks': resolve(await new Racks().list(data)); break;
            case 'tbl_items': resolve(await new Items().list(data)); break;
            case 'tbl_physical_count': resolve(await new PhysicalCount().list(data)); break;
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
            case 'tbl_tracker': resolve(await new Tracker().search(data)); break;
            case 'tbl_brand': resolve(await new Brand().search(data)); break;
            case 'tbl_racks': resolve(await new Racks().search(data)); break;
            case 'tbl_items': resolve(await new Items().search(data)); break;
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
            case 'tbl_users_permissions': resolve(await new Permissions().specific(id)); break;
            case 'tbl_brand': resolve(await new Brand().specific(id)); break;
            case 'tbl_racks': resolve(await new Racks().specific(id)); break;
            case 'tbl_items': resolve(await new Items().specific(id)); break;
            case 'tbl_physical_count': resolve(await new PhysicalCount().specific(id)); break;
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
            case 'tbl_tracker': resolve(await new Tracker().save(data)); break;
            case 'tbl_brand': resolve(await new Brand().save(data)); break;
            case 'tbl_racks': resolve(await new Racks().save(data)); break;
            case 'tbl_items': resolve(await new Items().save(data)); break;
            case 'tbl_physical_count': resolve(await new PhysicalCount().save(data)); break;
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
           case 'tbl_tracker': resolve(await new Tracker().update(data)); break;
           case 'tbl_users_permissions': resolve(await new Permissions().update(data)); break;
           case 'tbl_brand': resolve(await new Brand().update(data)); break;
           case 'tbl_racks': resolve(await new Racks().update(data)); break;
           case 'tbl_items': resolve(await new Items().update(data)); break;
           case 'tbl_physical_count': resolve(await new PhysicalCount().update(data)); break;
           case 'tbl_physical_count_personnels': resolve(await new PhysicalCountPersonnel().update(data)); break;
       }
   });
}

const evaluate = async (table, type, data) => {
    return new Promise(async resolve => {
        switch(type) {
            case 'approve': 
                switch(table) {
                    case 'tbl_services': resolve(await new Services().approve(data)); break;
                }

                break;
            case 'closed': 
                switch(table) {
                    case 'tbl_services': resolve(await new Services().closed(data)); break;
                }

                break;
            case 'dispatch':
                switch(table) {
                    case 'tbl_services': resolve(await new Services().dispatch(data)); break;
                }

                break;
            case 'report':
                switch(table) {
                    case 'tbl_services': resolve(await new Services().report(data)); break;
                }

                break;
            default: 
        }
    });
}

const series = table => {
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
            case 'tbl_tracker': resolve(await new Tracker().series()); break;
            case 'tbl_brand': resolve(await new Brand().series()); break;
            case 'tbl_racks': resolve(await new Racks().series()); break;
            case 'tbl_items': resolve(await new Items().series()); break;
            case 'tbl_physical_count': resolve(await new PhysicalCount().series()); break;
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
            case 'tbl_tracker': resolve(await new Tracker().dropdown(data)); break;
            case 'tbl_brand': resolve(await new Brand().dropdown(data)); break;
            case 'tbl_racks': resolve(await new Racks().dropdown(data)); break;
            case 'tbl_physical_count_personnels': resolve(await new PhysicalCountPersonnel().dropdown(data)); break;
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

const reports = (table, data) => {
    return new Promise(async resolve => {
        switch(table) {
            case 'tbl_physical_count': resolve(new PhysicalCount().reports(data)); break;
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
    evaluate,
    tracker,
    monitor,
    submodule,
    count,
    reports
}