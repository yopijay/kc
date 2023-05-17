// Tables
const PhysicalCount = require('./tables/PhysicalCount');
const PhysicalCountPersonnel = require('./tables/PhysicalCountPersonnel');

const schedule = date => { return new PhysicalCount().schedule(date); }
const login = data => { return new PhysicalCountPersonnel().login(data); }
const logout = (data) => { return new PhysicalCountPersonnel().logout(data); }
const profile = id => { return new PhysicalCount().profile(id); }

module.exports = {
    schedule,
    login,
    logout,
    profile
}