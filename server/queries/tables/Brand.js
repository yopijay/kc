const Builder = require("../../function/builder"); // Query builder
const Global = require('../../function/global'); // Function

const audit = { series_no: '', table_name: 'tbl_brand',  item_id: 0, field: '', previous: null, current: null, action: '', user_id: 0, date: '' }; // Used for audit trail
class Brand {
    specific = async (id) => { return (await new Builder(`tbl_brand`).select().condition(`WHERE id= ${id}`).build()).rows; }
    series = async () => { return (await new Builder(`tbl_brand`).select(`COUNT(*)`).build()).rows; }

    dashboard = async () => {
        return [];
    }

    list = async (data) => {
        return [];
    }

    excel = async (type, data) => {
        return [];
    }

    search = async (data) => {
        return [];
    }

    save = async (data) => {
        let date = Global.date(new Date());
        let errors = [];

        if((await new Builder(`tbl_brand`).select().condition(`WHERE series_no= '${(data.series_no).toUpperCase()}'`).build()).rowCount > 0) {
            errors.push({ name: 'name', message: 'Series number already exist!' });
        }

        if((await new Builder(`tbl_brand`).select().condition(`WHERE category_id= ${data.category_id} AND name= '${(data.name).toUpperCase()}'`).build()).rowCount > 0) {
            errors.push({ name: 'name', message: 'Brand already exist in this category!' });
        }

        if(!(errors.length > 0)) {
            let brd = (await new Builder(`tbl_brand`)
                                                .insert({ columns: `series_no, category_id, name, status, created_by, date_created`, 
                                                                values: `'${Global.randomizer(7)}', ${data.category_id}, '${(data.name).toUpperCase()}', ${data.status ? 1 : 0}, ${data.created_by}, '${date}'` })
                                                .condition(`RETURNING id`)
                                                .build()).rows[0];
            
            audit.series_no = Global.randomizer(7);
            audit.field = 'all';
            audit.item_id = brd.id;
            audit.action = 'create';
            audit.user_id = data.created_by;
            audit.date = date;

            Global.audit(audit);
            return { result: 'success', message: 'Successfully saved!' }
        }
        else { return { result: 'error', error: errors } }

    }

    update = async (data) => {
        return [];
    }

    upload = async (data) => {
        return [];
    }

    dropdown = async (data) => {
        return [];
    }
}

module.exports = Brand;