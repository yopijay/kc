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
                                                .select(`ctgy.series_no AS "Series No.", ctgy.module AS "Module", ctgy.name AS "Name", 
                                                                CASE WHEN ctgy.status =1 THEN 'Active' ELSE 'Inactive' END AS "Status",
                                                                CONCAT(cb.lname, ', ', cb.fname, ' ', cb.mname) AS "Created by", ctgy.date_created AS "Date created", 
                                                                CONCAT(ub.lname, ', ', ub.fname, ' ', ub.mname) AS "Updated by", ctgy.date_updated AS "Date updated",
                                                                CONCAT(db.lname, ', ', db.fname, ' ', db.mname) AS "Deleted by", ctgy.date_deleted AS "Date deleted", 
                                                                CONCAT(ib.lname, ', ', ib.fname, ' ', ib.mname) AS "Imported by", ctgy.date_imported AS "Date imported"`)
                                                .join({ table: `tbl_employee AS cb`, condition: `ctgy.created_by = cb.user_id`, type: `LEFT` })
                                                .join({ table: `tbl_employee AS ub`, condition: `ctgy.updated_by = ub.user_id`, type: `LEFT` })
                                                .join({ table: `tbl_employee AS db`, condition: `ctgy.deleted_by = db.user_id`, type: `LEFT` })
                                                .join({ table: `tbl_employee AS ib`, condition: `ctgy.imported_by = ib.user_id`, type: `LEFT` })
                                                .condition(`WHERE ctgy.series_no LIKE '%${data.searchtxt}%' OR ctgy.name LIKE '%${data.searchtxt}%'
                                                                    ORDER BY ctgy.${data.category} ${(data.orderby).toUpperCase()}`)
                                                .build()).rows;
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
        let ctgy = (await new Builder(`tbl_category`).select().condition(`WHERE id= ${data.id}`).build()).rows[0];
        let date = Global.date(new Date());
        let _audit = [];
        let _errors = [];

        if(Global.compare(ctgy.module, data.module)) {
            if(!((await new Builder(`tbl_category`).select().condition(`WHERE module= '${data.module}' AND name= '${(data.name).toUpperCase()}'`).build()).rowCount > 0)) {
                _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_category',  item_id: ctgy.id, 
                                        field: 'module', previous: ctgy.module, current: data.module, action: 'update', user_id: data.updated_by, date: date });
            }
            else { _errors.push({ name: 'name', message: 'Category exist in this module!' }); }
        }

        if(Global.compare(ctgy.name, data.name)) {
            if(!((await new Builder(`tbl_category`).select().condition(`WHERE module= '${data.module}' AND name= '${(data.name).toUpperCase()}'`).build()).rowCount > 0)) {
                _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_category',  item_id: ctgy.id, 
                                        field: 'name', previous: ctgy.name, current: (data.name).toUpperCase(), action: 'update', user_id: data.updated_by, date: date });
            }
            else { _errors.push({ name: 'name', message: 'Category exist in this module!' }); }
        }

        if(Global.compare(ctgy.status, data.status ? 1 : 0)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_category',  item_id: ctgy.id, 
                                    field: 'status', previous: ctgy.status, current: data.status ? 1 : 0, action: 'update', user_id: data.updated_by, date: date });
        }

        if(!(_errors.length > 0)) {
            await new Builder(`tbl_category`)
                                .update(`module= '${data.module}', name= '${(data.name).toUpperCase()}', status= ${data.status ? 1: 0}, updated_by= ${data.updated_by},
                                                date_updated= '${date}'`)
                                .condition(`WHERE id= ${ctgy.id}`)
                                .build();
            _audit.forEach(data => Global.audit(data));
            return { result: 'success', message: 'Successfully updated!' }
        }
        else { return { result: 'error', error: _errors } }
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