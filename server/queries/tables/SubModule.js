const Builder = require("../../function/builder"); // Query builder
const Global = require('../../function/global'); // Function

const audit = { series_no: '', table_name: 'tbl_sub_module',  item_id: 0, field: '', previous: null, current: null, action: '', user_id: 0, date: '' }; // Used for audit trail
class SubModule {
    series = async () => { return (await new Builder(`tbl_sub_module`).select(`COUNT(*)`).build()).rows; }
    submodule = async (name) => { return (await new Builder(`tbl_sub_module`).select().condition(`WHERE name= '${(name).toUpperCase()}'`).build()).rows[0]; }
    specific = async (id) => { 
        return (await new Builder(`tbl_sub_module AS sm`)
                                        .select(`sm.*, mdl.name AS module`)
                                        .join({ table: `tbl_module AS mdl`, condition: `sm.module_id = mdl.id`, type: `LEFT` })
                                        .condition(`WHERE sm.id= ${id}`)
                                        .build()).rows;
    }

    dropdown = async (data) => {
        return [{ id: 0, name: '-- SELECT A SUB MODULE BELOW --' }]
                        .concat((await new Builder(`tbl_sub_module`)
                                                            .select(`id, name`)
                                                            .condition(`WHERE module_id= ${data.module_id} AND status= 1 AND is_maintenance= 0 ORDER BY name ASC`)
                                                            .build()).rows);
    }

    list = async (data) => {
        return (await new Builder(`tbl_sub_module AS sm`)
                                        .select(`sm.id, sm.series_no, mdl.name AS module, sm.name, sm.path, sm.status, sm.is_maintenance,
                                                        CONCAT(cb.lname, ', ', cb.fname, ' ', cb.mname) AS created_by, sm.date_created`)
                                        .join({ table: `tbl_module AS mdl`, condition: `sm.module_id = mdl.id`, type: `LEFT` })
                                        .join({ table: `tbl_employee AS cb`, condition: `sm.created_by = cb.user_id`, type: `LEFT` })
                                        .condition(`${data.searchtxt !== '' ? `WHERE sm.series_no LIKE '%${(data.searchtxt).toUpperCase()}%' OR mdl.name LIKE '%${(data.searchtxt).toUpperCase()}%'
                                                            OR sm.name LIKE '%${(data.searchtxt).toUpperCase()}%' OR sm.path LIKE '%${data.searchtxt}%'` : '' }
                                                            ${data.module_id !== '' && data.module_id !== undefined ? `WHERE sm.module_id= ${data.module_id}` : ''}
                                                            ORDER BY sm.${data.orderby} ${(data.sort).toUpperCase()}`)
                                        .build()).rows;
    }

    excel = async (type, data) => {
        switch(type) {
            case 'formatted':
                return (await new Builder(`tbl_sub_module AS sm`)
                                                .select(`sm.series_no AS "Series No.", mdl.name AS "Module", sm.name AS "Sub module", CONCAT('/', LOWER(mdl.name), sm.path) AS "Path",
                                                                CASE WHEN sm.is_maintenance = 1 THEN 'Under Maintenance' ELSE 'Good' END AS "Maintenance", 
                                                                CASE WHEN sm.status = 1 THEN 'Active' ELSE 'Inactive' END AS "Status",
                                                                CONCAT(cb.lname, ', ', cb.fname, ' ', cb.mname) AS "Created by", sm.date_created AS "Date created", 
                                                                CONCAT(ub.lname, ', ', ub.fname, ' ', ub.mname) AS "Updated by", sm.date_updated AS "Date updated",
                                                                CONCAT(db.lname, ', ', db.fname, ' ', db.mname) AS "Deleted by", sm.date_deleted AS "Date deleted", 
                                                                CONCAT(ib.lname, ', ', ib.fname, ' ', ib.mname) AS "Imported by", sm.date_imported AS "Date imported"`)
                                                .join({ table: `tbl_module AS mdl`, condition: `sm.module_id = mdl.id`, type: `LEFT` })
                                                .join({ table: `tbl_employee AS cb`, condition: `sm.created_by = cb.user_id`, type: `LEFT` })
                                                .join({ table: `tbl_employee AS ub`, condition: `sm.updated_by = ub.user_id`, type: `LEFT` })
                                                .join({ table: `tbl_employee AS db`, condition: `sm.deleted_by = db.user_id`, type: `LEFT` })
                                                .join({ table: `tbl_employee AS ib`, condition: `sm.imported_by = ib.user_id`, type: `LEFT` })
                                                .condition(`${data.searchtxt !== '' ? `WHERE sm.series_no LIKE '%${(data.searchtxt).toUpperCase()}%' OR mdl.name LIKE '%${(data.searchtxt).toUpperCase()}%'
                                                                    OR sm.name LIKE '%${(data.searchtxt).toUpperCase()}%' OR sm.path LIKE '%${data.searchtxt}%'` : '' }
                                                                    ORDER BY sm.${data.orderby} ${(data.sort).toUpperCase()}`)
                                                .build()).rows;
            default: return (await new Builder(`tbl_sub_module AS sm`)
                                                        .select(`sm.*`)
                                                        .join({ table: `tbl_module AS mdl`, condition: `sm.module_id = mdl.id`, type: 'LEFT' })
                                                        .condition(`${data.searchtxt !== '' ? `WHERE sm.series_no LIKE '%${(data.searchtxt).toUpperCase()}%' 
                                                                                OR mdl.name LIKE '%${(data.searchtxt).toUpperCase()}%' OR sm.name LIKE '%${(data.searchtxt).toUpperCase()}%' 
                                                                                OR sm.path LIKE '%${data.searchtxt}%'` : '' } ORDER BY sm.${data.orderby} ${(data.sort).toUpperCase()}`)
                                                        .build()).rows;
        }
    }

    search = async (data) => {
        return (await new Builder(`tbl_sub_module AS sm`)
                                        .select(`sm.id, sm.series_no, mdl.name AS module, sm.name, sm.path, sm.status, sm.is_maintenance,
                                                        CONCAT(cb.lname, ', ', cb.fname, ' ', cb.mname) AS created_by, sm.date_created`)
                                        .join({ table: `tbl_module AS mdl`, condition: `sm.module_id = mdl.id`, type: `LEFT` })
                                        .join({ table: `tbl_employee AS cb`, condition: `sm.created_by = cb.user_id`, type: `LEFT` })
                                        .condition(`WHERE sm.series_no LIKE '%${(data.searchtxt).toUpperCase()}%' OR mdl.name LIKE '%${(data.searchtxt).toUpperCase()}%'
                                                            OR sm.name LIKE '%${(data.searchtxt).toUpperCase()}%' OR sm.path LIKE '%${data.searchtxt}%' 
                                                            ORDER BY sm.${data.orderby} ${(data.sort).toUpperCase()}`)
                                        .build()).rows;
    }

    save = async (data) => {
        let date = Global.date(new Date());
        let errors = [];

        if((await new Builder(`tbl_sub_module`).select().condition(`WHERE series_no= '${(data.series_no).toUpperCase()}'`).build()).rowCount > 0) {
            errors.push({ name: 'series_no', message: 'Series number already exist!' });
        }

        if((await new Builder(`tbl_sub_module`).select().condition(`WHERE module_id= ${data.module_id} AND name= '${(data.name).toUpperCase()}'`).build()).rowCount > 0) {
            errors.push({ name: 'name', message: 'Sub module already exist! Change your module or name to proceed!' });
        }

        if(!(errors.length > 0)) {
            let sm = (await new Builder(`tbl_sub_module`)
                                                .insert({ columns: `series_no, module_id, name, path, is_maintenance, status, created_by, date_created`, 
                                                                values: `'${(data.series_no).toUpperCase()}', ${data.module_id}, '${(data.name).toUpperCase()}', '${data.path}',
                                                                                ${data.is_maintenance ? 1 : 0}, ${data.status ? 1 : 0}, ${data.created_by}, '${date}'` })
                                                .condition(`RETURNING id`)
                                                .build()).rows[0];
            
            audit.series_no = Global.randomizer(7);
            audit.field = 'all';
            audit.item_id = sm.id;
            audit.action = 'create';
            audit.user_id = data.created_by;
            audit.date = date;

            Global.audit(audit);
            return { result: 'success', message: 'Successfully saved!' }
        }
        else { return { result: 'error', error: errors } }
    }

    update = async (data) => {
        let sm = (await new Builder(`tbl_sub_module`).select().condition(`WHERE id= ${data.id}`).build()).rows[0];
        let date = Global.date(new Date());
        let _audit = [];
        let _errors = [];

        if(Global.compare(sm.module_id, data.module_id)) {
            if(!((await new Builder(`tbl_sub_module`).select().condition(`WHERE module_id= ${data.module_id} AND name= '${(data.name).toUpperCase()}'`).build()).rowCount > 0)) {
                _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_sub_module', item_id: sm.id,
                                        field: 'module_id', previous: sm.module_id, current: data.module_id, action: 'update', user_id: data.updated_by, date: date });
            }
            else { _errors.push({ name: 'name', message: 'Name already exist in this module!' }); }
        }

        if(Global.compare(sm.name, data.name)) {
            if(!((await new Builder(`tbl_sub_module`).select().condition(`WHERE module_id= ${data.module_id} AND name= '${(data.name).toUpperCase()}'`).build()).rowCount > 0)) {
                _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_sub_module', item_id: sm.id,
                                        field: 'name', previous: sm.name, current: (data.name).toUpperCase(), action: 'update', user_id: data.updated_by, date: date });
            }
            else { _errors.push({ name: 'name', message: 'Name already exist in this module!' }); }
        }

        if(Global.compare(sm.path, data.path)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_sub_module', item_id: sm.id,
                                    field: 'path', previous: sm.path, current: data.path, action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(sm.is_maintenance, data.is_maintenance ? 1 : 0)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_sub_module', item_id: sm.id,
                                    field: 'is_maintenance', previous: sm.is_maintenance, current: data.is_maintenance ? 1 : 0, action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(sm.status, data.status ? 1 : 0)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_sub_module', item_id: sm.id,
                                    field: 'status', previous: sm.status, current: data.status ? 1 : 0, action: 'update', user_id: data.updated_by, date: date });
        }

        if(!(_errors.length > 0)) {
            await new Builder(`tbl_sub_module`)
                                .update(`module_id= ${data.module_id}, name= '${(data.name).toUpperCase()}', path= '${data.path}', is_maintenance= ${data.is_maintenance ? 1 : 0},
                                                status= ${data.status ? 1 : 0}, updated_by= ${data.updated_by}, date_updated= '${date}'`)
                                .condition(`WHERE id= ${data.id}`)
                                .build();
            
            _audit.forEach(data => Global.audit(data));
            return { result: 'success', message: 'Successfully updated!' }
        }
        else { return { result: 'error', error: _errors } }
    }
}

module.exports = SubModule;