const Builder = require("../../function/builder"); // Query builder
const Global = require('../../function/global'); // Function

const audit = { series_no: '', table_name: 'tbl_company',  item_id: 0, field: '', previous: null, current: null, action: '', user_id: 0, date: '' }; // Used for audit trail
class Company {
    dashboard = async () => {
        return {
            total: (await new Builder(`tbl_company`).select(`COUNT(*)`).build()).rows[0].count,
            active: (await new Builder(`tbl_company`).select(`COUNT(*)`).condition(`WHERE status= 1`).build()).rows[0].count,
            inactive: (await new Builder(`tbl_company`).select(`COUNT(*)`).condition(`WHERE status= 0`).build()).rows[0].count
        }
    }

    list = async () => {
        return (await new Builder(`tbl_company AS cmp`)
                                        .select(`cmp.id, cmp.series_no, cmp.name, cmp.status, CONCAT(cb.lname, ', ', cb.fname, ' ', cb.mname) AS created_by, cmp.date_created, CONCAT(owner.lname, ', ', owner.fname, ' ', owner.mname) AS owner_name`)
                                        .join({ table: `tbl_employee AS owner`, condition: `owner.user_id = cmp.owner_id`, type: 'LEFT' })
                                        .join({ table: `tbl_employee AS cb`, condition: `cb.user_id = cmp.created_by`})
                                        .condition(`ORDER BY cmp.date_created DESC`)
                                        .build()).rows;
    }

    specific = async (id) => { return (await new Builder(`tbl_company`).select().condition(`WHERE id= ${id}`).build()).rows; }
    series = async () => { return (await new Builder(`tbl_company`).select(`COUNT(*)`).build()).rows; }

    save = async (data) => {
        let date = Global.date(new Date()); // Date
        if(!(await new Builder(`tbl_company`).select().condition(`WHERE series_no= '${(data.series_no).toUpperCase()}'`).build()).rowCount > 0) {
            if(!(await new Builder(`tbl_company`).select().condition(`WHERE name= '${(data.name).toUpperCase()}'`).build()).rowCount > 0) {
                let cmp = (await new Builder(`tbl_company`)
                                                    .insert({ columns: `series_no, owner_id, name, address, description, status, created_by, date_created`,
                                                                values: `'${(data.series_no).toUpperCase()}', ${data.owner_id}, '${(data.name).toUpperCase()}', ${data.address !== '' ? `'${(data.address).toUpperCase()}'` : null}, ${data.description !== '' ? `'${(data.description).toUpperCase()}'` : null},
                                                                                ${data.status === true ? 1 : 0}, ${data.created_by}, '${date}'` })
                                                    .condition(`RETURNING id`)
                                                    .build()).rows[0];

                audit.series_no = Global.randomizer(7);
                audit.field = 'all',
                audit.item_id = cmp.id;
                audit.action = 'create';
                audit.user_id = data.created_by;
                audit.date = date;

                Global.audit(audit);
                return { result: 'success', message: 'Successfully saved!' }
            }
            else { return { result: 'error', error: [{ name: 'name', message: 'Company already exist!' }] } }
        }
        else { return { result: 'error', error: [{ name: 'series_no', message: 'Series no already used!' }] } }
    }

    update = async (data) => {
        return data;
    }

    dropdown = async (data) => {
        return data;
    }

}

module.exports = Company;