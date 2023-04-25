const Builder = require("../../function/builder"); // Query builder
const Global = require('../../function/global'); // Function

const audit = { series_no: '', table_name: 'tbl_inventory',  item_id: 0, field: '', previous: null, current: null, action: '', user_id: 0, date: '' }; // Used for audit trail
class Inventory {
    series = async () => { return (await new Builder(`tbl_inventory`).select(`COUNT(*)`).build()).rows; }
    
    specific = async (id) => {
        return [];
    }

    list = async (data) => {
        return [];
    }

    search = async (data) => {
        return [];
    }

    save = async (data) => {
        return [];
    }

    update = async (data) => {
        return [];
    }
}

module.exports = Inventory;