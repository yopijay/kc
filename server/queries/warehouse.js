// Tables
const PhysicalCount = require('./tables/PhysicalCount');
const PhysicalCountPersonnel = require('./tables/PhysicalCountPersonnel');
const Racks = require('./tables/Racks');
const Items = require('./tables/Items');
const Brand = require('./tables/Brand');
const PhysicalCountRCS = require('./tables/PhysicalCountRCS');

const schedule = date => { return new PhysicalCount().schedule(date); }
const login = data => { return new PhysicalCountPersonnel().login(data); }
const logout = (data) => { return new PhysicalCountPersonnel().logout(data); }
const profile = id => { return new PhysicalCount().profile(id); }

const specific = (table, id) => {
    return new Promise(async resolve => {
        switch(table) {
            case 'tbl_physical_count_personnels': resolve(await new PhysicalCountPersonnel().specific(id)); break;
            case 'tbl_racks': resolve(await new Racks().specific(id)); break;
            case 'tbl_items': resolve(await new Items().specific(id)); break;
            case 'tbl_physical_count_rcs': resolve(await new PhysicalCountRCS().specific(id)); break;
        }
    });
}

const list = (table, data) => {
    return new Promise(async resolve => {
        switch(table) {
            case 'tbl_physical_count_personnels': resolve(await new PhysicalCountPersonnel().list(data)); break;
            case 'tbl_racks': resolve(await new Racks().rackcountlist(data)); break;
            case 'tbl_physical_count_rcs': resolve(await new PhysicalCountRCS().list(data)); break;
        }
    });
}

const dropdown = (table, data) => {
    return new Promise(async resolve => {
        switch(table) {
            case 'tbl_physical_count_personnels': resolve(await new PhysicalCountPersonnel().dropdown(data)); break;
            case 'tbl_brands': resolve(await new Brand().dropdown(data)); break;
        }
    });
}

const save = (table, data) => {
   return new Promise(async resolve => {
       switch(table) {
            case 'tbl_physical_count_personnels': resolve(await new PhysicalCountPersonnel().save(data)); break;
            case 'tbl_items': resolve(await new Items().save(data)); break;
            case 'tbl_physical_count_rcs': resolve(await new PhysicalCountRCS().save(data)); break;
       }
   });
}

const update = (table, data) => {
  return new Promise(async resolve => {
      switch(table) {
            case 'tbl_physical_count_personnels': resolve(await new PhysicalCountPersonnel().update(data)); break;
            case 'tbl_physical_count_rcs': resolve(await new PhysicalCountRCS().update(data)); break;
      }
  });
}

const series = table => {
    return new Promise(async resolve => {
        switch(table) {
            case 'tbl_items': resolve(await new Items().series()); break;
        }
    });
}


module.exports = {
    schedule,
    login,
    logout,
    profile,
    list,
    dropdown,
    save,
    update,
    specific,
    series
}