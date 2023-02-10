const Builder = require("../../function/builder"); // Query builder
const Global = require('../../function/global'); // Function

const audit = { series_no: '', table_name: 'tbl_brand',  item_id: 0, field: '', previous: null, current: null, action: '', user_id: 0, date: '' }; // Used for audit trail
class Brand {
    series = async () => { return (await new Builder(`tbl_brand`).select(`COUNT(*)`).build()).rows; }

    specific = async (id) => { 
        return (await new Builder(`tbl_brand AS brd`)
                                        .select(`brd.*, ctg.module`)
                                        .join({ table: `tbl_category AS ctg`, condition: `brd.category_id = ctg.id`, type: `LEFT` })
                                        .condition(`WHERE brd.id= ${id}`).build()).rows;
    }

    dashboard = async () => {
        return [];
    }

    list = async (data) => {
        return (await new Builder(`tbl_brand AS brd`)
                                        .select(`brd.id, brd.series_no, ctg.module, ctg.name AS category, brd.name, brd.status, 
                                                        CONCAT(cb.lname, ', ', cb.fname, ' ', cb.mname) AS created_by, brd.date_created`)
                                        .join({ table: `tbl_category AS ctg`, condition: `brd.category_id = ctg.id`, type: `LEFT` })
                                        .join({ table: `tbl_employee AS cb`, condition: `brd.created_by = cb.user_id`, type: `LEFT` })
                                        .condition(`${data.searchtxt !== '' ? `WHERE brd.series_no LIKE '%${data.searchtxt}%' OR brd.name LIKE '%${data.searchtxt}%' OR
                                                                ctg.module LIKE '%${data.searchtxt}%' OR ctg.name LIKE '%${data.searchtxt}%'` : ''} 
                                                            ORDER BY brd.${data.category} ${(data.orderby).toUpperCase()}`)
                                        .build()).rows;
    }

    excel = async (type, data) => {
        return [];
    }

    search = async (data) => {
        return (await new Builder(`tbl_brand AS brd`)
                                        .select(`brd.id, brd.series_no, ctg.module, ctg.name AS category, brd.name, brd.status, 
                                                        CONCAT(cb.lname, ', ', cb.fname, ' ', cb.mname) AS created_by, brd.date_created`)
                                        .join({ table: `tbl_category AS ctg`, condition: `brd.category_id = ctg.id`, type: `LEFT` })
                                        .join({ table: `tbl_employee AS cb`, condition: `brd.created_by = cb.user_id`, type: `LEFT` })
                                        .condition(`WHERE brd.series_no LIKE '%${data.condition}%' OR brd.name LIKE '%${data.condition}%' OR
                                                                ctg.module LIKE '%${data.condition}%' OR ctg.name LIKE '%${data.condition}%' ORDER BY brd.${data.category} ${(data.orderby).toUpperCase()}`)
                                        .build()).rows;
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
                                                                values: `'${(data.series_no).toUpperCase()}', ${data.category_id}, '${(data.name).toUpperCase()}', ${data.status ? 1 : 0}, ${data.created_by}, '${date}'` })
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
        return [{ id: 0, name: '-- SELECT AN ITEM BELOW --' }]
                        .concat((await new Builder(`tbl_brand`).select(`id, name`).condition(`WHERE category_id= ${data.category_id} AND status= 1 ORDER BY name ASC`).build()).rows);
    }
}

module.exports = Brand;