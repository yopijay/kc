const Builder = require("../../function/builder"); // Query builder
const Global = require('../../function/global'); // Function

const audit = { series_no: '', table_name: 'tbl_inventory',  item_id: 0, field: '', previous: null, current: null, action: '', user_id: 0, date: '' }; // Used for audit trail
class Inventory {
    series = async () => { return (await new Builder(`tbl_inventory`).select(`COUNT(*)`).build()).rows; }
    specific = async (id) => {return (await new Builder(`tbl_inventory`).select().condition(`WHERE id= ${id}`).build()).rows; }

    list = async (data) => {
        return (await new Builder(`tbl_inventory AS inv`)
                        .select(`inv.id, inv.series_no, inv.branch, inv.date_from, inv.date_to, inv.type, inv.brands, inv.total_items, inv.status,
                                        CONCAT(cb.lname, ', ', cb.fname, ' ', cb.mname) AS created_by`)
                        .join({ table: `tbl_employee AS cb`, condition: `inv.created_by = cb.user_id`, type: `LEFT` })
                        .condition(`${data.searchtxt !== '' ? `WHERE inv.series_no LIKE '%${(data.searchtxt).toUpperCase()}%' OR inv.status LIKE '%${data.searchtxt}%' OR
                                                inv.date_from LIKE '%${data.searchtxt}%' OR inv.date_to LIKE '%${data.searchtxt}%' OR inv.type LIKE '%${data.searchtxt}%' OR
                                                inv.brands LIKE '%${(data.searchtxt).toUpperCase()}%' OR inv.branch LIKE '%${(data.branch).toUpperCase()}%'` : ''} 
                                                ORDER BY inv.${data.orderby} ${(data.sort).toUpperCase()}`)
                        .build()).rows;
    }

    search = async (data) => {
        return [];
    }

    save = async (data) => {
        let date = Global.date(new Date());
        let errors = [];

        if((await new Builder(`tbl_inventory`).select().condition(`WHERE series_no= '${(data.series_no).toUpperCase()}'`).build()).rowCount > 0) {
            errors.push({ name: 'series_no', message: 'Series number already used!' });
        }

        if((await new Builder(`tbl_inventory`).select().condition(`WHERE date_from= '${data.date_from}' AND date_to= '${data.date_to}'`).build()).rowCount > 0) {
            errors.push({ name: 'date_from', message: 'Date already occupied!' });
        }

        if(!(errors.length > 0)) {
            let inv = (await new Builder(`tbl_inventory`)
                            .insert({ columns: `series_no, branch, date_from, date_to, type, brands, total_items, status, created_by, date_created`, 
                                            values: `'${(data.series_no).toUpperCase()}', '${JSON.stringify(data.branch)}', '${data.date_from}', '${data.date_to}', '${data.type}',
                                                            '${JSON.stringify((data.brands).length > 0 ? data.brands : [])}', ${data.total_items}, 'ongoing', ${data.created_by}, '${date}'` })
                            .condition(`RETURNING id`)
                            .build()).rows[0];

            audit.series_no = Global.randomizer(7);
            audit.field = 'all',
            audit.item_id = inv.id;
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
}

module.exports = Inventory;