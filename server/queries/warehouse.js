// Tables
const PhysicalCount = require('./tables/PhysicalCount');

const schedule = async (date) => { return await new PhysicalCount().schedule(date); }
const login = async (data) => {return await new PhysicalCount().login(data); }

module.exports = {
    schedule,
    login
}