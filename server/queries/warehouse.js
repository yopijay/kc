// Tables
const PhysicalCount = require('./tables/PhysicalCount');
const PhysicalCountPersonnel = require('./tables/PhysicalCountPersonnel');

const schedule = date => { return new PhysicalCount().schedule(date); }
const login = data => { return new PhysicalCountPersonnel().login(data); }
const logout = (data) => { return new PhysicalCountPersonnel().logout(data); }
const profile = id => { return new PhysicalCount().profile(id); }

const list = (table, data) => {
    return new Promise(async resolve => {
        switch(table) {
            case 'tbl_physical_count_personnels': resolve(await new PhysicalCountPersonnel().list(data)); break;
        }
    });
}

const dropdown = (table, data) => {
    return new Promise(async resolve => {
        switch(table) {
            case 'tbl_physical_count_personnels': resolve(await new PhysicalCountPersonnel().dropdown()); break;
        }
    });
}

const save = (table, data) => {
   return new Promise(async resolve => {
       switch(table) {
            case 'tbl_physical_count_personnels': resolve(await new PhysicalCountPersonnel().save(data)); break;
       }
   });
}

const update = (table, data) => {
  return new Promise(async resolve => {
      switch(table) {
            case 'tbl_physical_count_personnels': resolve(await new PhysicalCountPersonnel().update(data)); break;
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
    update
}