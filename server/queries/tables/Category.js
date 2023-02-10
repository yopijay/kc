const Builder = require("../../function/builder"); // Query builder
const Global = require('../../function/global'); // Function

const audit = { series_no: '', table_name: 'tbl_category',  item_id: 0, field: '', previous: null, current: null, action: '', user_id: 0, date: '' }; // Used for audit trail
class Category {
    specific = async (id) => { return (await new Builder(`tbl_category`).select().condition(`WHERE id= ${id}`).build()).rows; }
    series = async () => { return (await new Builder(`tbl_category`).select(`COUNT(*)`).build()).rows; }

    dashboard = async () => {
        let summary = [];
        let _count = (await new Builder(`tbl_category`)
                                                .select(`MAX(id) as id, module, MAX(date_created) as date_created`)
                                                .condition(`WHERE status= 1 GROUP BY module ORDER BY date_created ASC LIMIT 3`)
                                                .build()).rows;
        for(let count = 0; count < _count.length; count++) {
            summary.push({ name: _count[count].module,
                                        count: (await new Builder(`tbl_category`).select(`COUNT(*)`).condition(`WHERE module= '${_count[count].module}' AND status = 1`).build()).rows[0].count });
        }

        return {
            total: (await new Builder(`tbl_category`).select(`COUNT(*)`).condition(`WHERE status= 1`).build()).rows[0].count,
            summary
        };
    }

    list = async (data) => {
        return (await new Builder(`tbl_category AS ctgy`)
                                        .select(`ctgy.id, ctgy.series_no, ctgy.module, ctgy.name, ctgy.status, CONCAT(cb.lname, ', ', cb.fname, ' ', cb.mname) AS created_by,
                                                        ctgy.date_created`)
                                        .join({ table: `tbl_employee AS cb`, condition: `cb.user_id = ctgy.created_by`, type: 'LEFT' })
                                        .condition(`${data.searchtxt !== '' ? `WHERE ctgy.series_no LIKE '%${data.searchtxt}%' OR ctgy.name LIKE '%${data.searchtxt}%'` : ''} 
                                                            ORDER BY ctgy.${data.category} ${(data.orderby).toUpperCase()}`)
                                        .build()).rows;
    }
    
    excel = async (type, data) => {
        switch(type) {
            case 'formatted':
                return (await new Builder(`tbl_category AS ctgy`)
                                                .select(`ctgy.series_no "Series No.", ctgy.module AS "Module", ctgy.name AS "Name", `))
            default: return (await new Builder(`tbl_category`).select().condition(`ORDER by ${data.category} ${(data.orderby).toUpperCase()}`).build()).rows;
        }
    }

    search = async (data) => {
        return (await new Builder(`tbl_category AS ctgy`)
                                        .select(`ctgy.id, ctgy.series_no, ctgy.module, ctgy.name, ctgy.status, CONCAT(cb.lname, ', ', cb.fname, ' ', cb.mname) AS created_by,
                                                        ctgy.date_created`)
                                        .join({ table: `tbl_employee AS cb`, condition: `cb.user_id = ctgy.created_by`, type: 'LEFT' })
                                        .condition(`WHERE ctgy.series_no LIKE '%${data.condition}%' OR ctgy.name LIKE '%${data.condition}%' 
                                                            ORDER BY ctgy.${data.category} ${(data.orderby).toUpperCase()}`)
                                        .build()).rows;
    }

    save = async (data) => {
        let date = Global.date(new Date());
        let errors = [];

        if((await new Builder(`tbl_category`).select().condition(`WHERE series_no= '${(data.series_no).toUpperCase()}'`).build()).rowCount > 0) { 
            errors.push({ name: 'series_no', message: 'Series number already used!' });
        }

        if((await new Builder(`tbl_category`).select().condition(`WHERE module= '${data.module}' AND name= '${(data.name).toUpperCase()}'`).build()).rowCount > 0) {
            errors.push({ name: 'name', message: 'Category already exist in this module!' });
        }

        if(!(errors.length > 0)) {
            let ctgy = (await new Builder(`tbl_category`)
                                                .insert({ columns: `series_no, module, name, status, created_by, date_created`, 
                                                                values: `'${(data.series_no).toUpperCase()}', '${data.module}', '${(data.name).toUpperCase()}', ${data.status ? 1 : 0},
                                                                                    ${data.created_by}, '${date}'` })
                                                .condition(`RETURNING id`)
                                                .build()).rows[0];
            
            audit.series_no = Global.randomizer(7);
            audit.field = 'all';
            audit.item_id = ctgy.id;
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
                        .concat((await new Builder(`tbl_category`).select(`id, name`).condition(`WHERE module= '${data.module}' AND status= 1 ORDER BY name ASC`).build()).rows);
    }
}

module.exports = Category;