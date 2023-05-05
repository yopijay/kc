// Tables
const Users = require('./tables/Users');
const PhysicalCount = require('./tables/PhysicalCount');

const schedule = async (date) => { return await new PhysicalCount().schedule(date); }

module.exports = {
    schedule
}