const Builder = require("../../function/builder"); // Query builder
const Global = require('../../function/global'); // Function

const audit = { series_no: '', table_name: 'tbl_module', item_id: 0, field: '', previous: null, current: null, action: '', user_id: 0, date: '' }; // Used for audit trail
class Mdl {

    specific = async (id) => { return (await new Builder(`tbl_module`).select().condition(`WHERE id= ${id}`).build()).rows; }
    series = async () => { return (await new Builder(`tbl_module`).select(`COUNT(*)`).build()).rows; }

    dropdown = async () => {
        return [{ id: 0, name: '-- SELECT A MODULE BELOW' }]
                        .concat((await new Builder(`tbl_module`).select(`id, name`).condition(`WHERE status= 1 ORDER BY name ASC`).build()).rows);
    }

    list = async (data) => {
        return (await new Builder(`tbl_module AS mdl`)
                                        .select(`mdl.id, mdl.series_no, mdl.name, mdl.status, CONCAT(cb.lname, ', ', cb.fname, ' ', cb.mname) AS created_by, mdl.date_created`)
                                        .join({ table: `tbl_employee AS cb`, condition: `mdl.created_by = cb.user_id`, type: `LEFT` })
                                        .condition(`${data.searchtxt !== '' ? `WHERE mdl.series_no LIKE '%${(data.searchtxt).toUpperCase()}%' OR mdl.name LIKE '%${(data.searchtxt).toUpperCase()}%'` : ''}
                                                                ORDER BY mdl.${data.orderby} ${(data.sort).toUpperCase()}`)
                                        .build()).rows;
    }

    search = async (data) => {
        return (await new Builder(`tbl_module AS mdl`)
                                        .select(`mdl.id, mdl.series_no, mdl.name, mdl.status, CONCAT(cb.lname, ', ', cb.fname, ' ', cb.mname) AS created_by, mdl.date_created`)
                                        .join({ table: `tbl_employee AS cb`, condition: `mdl.created_by = cb.user_id`, type: `LEFT` })
                                        .condition(`WHERE mdl.series_no LIKE '%${(data.searchtxt).toUpperCase()}%' OR mdl.name LIKE '%${(data.searchtxt).toUpperCase()}%'
                                                            ORDER BY mdl.${data.orderby} ${(data.sort).toUpperCase()}`)
                                        .build()).rows;
    }


    save = async (data) => {
        let date = Global.date(new Date());
        let errors = [];

        if((await new Builder(`tbl_module`).select().condition(`WHERE series_no= '${(data.series_no).toUpperCase()}'`).build()).rowCount > 0) {
            errors.push({ name: 'series_no', message: 'Series number already used!' });
        }

        if((await new Builder(`tbl_module`).select().condition(`WHERE name= '${(data.name).toUpperCase()}'`).build()).rowCount > 0) {
            errors.push({ name: 'name', message: 'Name already used!' });
        }

        if(!(errors.length > 0)) {
            let mdl = (await new Builder(`tbl_module`)
                                                .insert({ columns: `series_no, name, status, created_by, date_created`, 
                                                                values: `'${Global.randomizer(7)}', '${(data.name).toUpperCase()}', ${data.status ? 1 : 0}, ${data.created_by}, '${date}'` })
                                                .condition(`RETURNING id`)
                                                .build()).rows[0];

            audit.series_no = Global.randomizer(7);
            audit.field = 'all';
            audit.item_id = mdl.id;
            audit.action = 'create';
            audit.user_id = data.created_by;
            audit.date = date;

            Global.audit(audit);
            return { result: 'success', message: 'Successfully saved!' }
        }
        else { return { result: 'error', error: errors } }
    }

    update = async (data) => {
        let mdl = (await new Builder(`tbl_module`).select().condition(`WHERE id= ${data.id}`).build()).rows[0];
        let date = Global.date(new Date());
        let _audit = [];
        let _errors = [];

        if(Global.compare(mdl.name, data.name)) {
            if(!((await new Builder(`tbl_module`).select().condition(`WHERE name= '${(data.name).toUpperCase()}'`).build()).rowCount > 0)) {
                _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_module', item_id: mdl.id, 
                                        field: 'name', previous: mdl.name, current: (data.name).toUpperCase(), action: 'update', user_id: data.updated_by, date: date });
            }
            else { _errors.push({ name: 'name', message: 'Module already used!' }); }
        }

        if(Global.compare(mdl.statu, data.status ? 1 : 0)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_module', item_id: mdl.id,
                                    field: 'status', previous: mdl.status, current: data.status ? 1 : 0, action: 'update', user_id: data.updated_by, date: date });
        }

        if(!(_errors.length > 0)) {
            await new Builder(`tbl_module`)
                                .update(`name= '${(data.name).toUpperCase()}', status= ${data.status ? 1 : 0}, updated_by= ${data.updated_by}, date_updated= '${date}'`)
                                .condition(`WHERE id= ${mdl.id}`)
                                .build();
            
            _audit.forEach(data => Global.audit(data));
            return { result: 'success', message: 'Successfully updated!' }
        }
        else { return { result: 'error', error: _errors } }
    }

    excel = async (type, data) => {
        switch(type) {
            case 'formatted':
                return (await new Builder(`tbl_module AS mdl`)
                                                .select(`mdl.series_no AS "Series No.", mdl.name AS "Name", CASE WHEN mdl.status =1 THEN 'Active' ELSE 'Inactive' END AS "Status",
                                                                CONCAT(cb.lname, ', ', cb.fname, ' ', cb.mname) AS "Created by", mdl.date_created AS "Date created", 
                                                                CONCAT(ub.lname, ', ', ub.fname, ' ', ub.mname) AS "Updated by", mdl.date_updated AS "Date updated",
                                                                CONCAT(db.lname, ', ', db.fname, ' ', db.mname) AS "Deleted by", mdl.date_deleted AS "Date deleted", 
                                                                CONCAT(ib.lname, ', ', ib.fname, ' ', ib.mname) AS "Imported by", mdl.date_imported AS "Date imported"`)
                                                .join({ table: `tbl_employee AS cb`, condition: `mdl.created_by = cb.user_id`, type: `LEFT` })
                                                .join({ table: `tbl_employee AS ub`, condition: `mdl.updated_by = ub.user_id`, type: `LEFT` })
                                                .join({ table: `tbl_employee AS db`, condition: `mdl.deleted_by = db.user_id`, type: `LEFT` })
                                                .join({ table: `tbl_employee AS ib`, condition: `mdl.imported_by = ib.user_id`, type: `LEFT` })
                                                .condition(`${data.searchtxt !== '' ? `WHERE mdl.series_no LIKE '%${(data.searchtxt).toUpperCase()}%' 
                                                                                                                OR mdl.name LIKE '%${(data.searchtxt).toUpperCase()}%'` : ''}
                                                                        ORDER BY mdl.${data.orderby} ${(data.sort).toUpperCase()}`)
                                                .build()).rows;
            default: 
                return (await new Builder(`tbl_module`)
                                                .select()
                                                .condition(`${data.searchtxt !== '' ? `WHERE series_no LIKE '%${(data.searchtxt).toUpperCase()}%' OR name LIKE '%${(data.searchtxt).toUpperCase()}%'` : ''} 
                                                                    ORDER BY ${data.orderby} ${(data.sort).toUpperCase()}`)
                                                .build()).rows;
        }
    }

    upload = async (data) => {
        return []
    }
}

module.exports = Mdl;
