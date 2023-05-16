// Tables
const PhysicalCount = require('./tables/PhysicalCount');

const schedule = date => { return new PhysicalCount().schedule(date); }
const login = data => { return new PhysicalCount().login(data); }
const logout = (data) => { return new PhysicalCount().logout(data); }
const profile = id => { return new PhysicalCount().profile(id); }

module.exports = {
    schedule,
    login,
    logout,
    profile
}