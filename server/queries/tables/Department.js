const Builder = require("../../function/builder"); // Query builder
const Global = require('../../function/global'); // Function

const audit = { series_no: '', table_name: 'tbl_department',  item_id: 0, field: '', previous: null, current: null, action: '', user_id: 0, date: '' }; // Used for audit trail
class Department {
    specific = async (id) => { return (await new Builder(`tbl_department`).select().condition(`WHERE id= ${id}`).build()).rows; }
    series = async () => { return (await new Builder(`tbl_department`).select(`COUNT(*)`).build()).rows; }
    dropdown = async (data) => { return (await new Builder(`tbl_department`).select(`id , name`).condition(`WHERE company_id= ${data.id} ORDER BY name ASC`).build()).rows; }

    dashboard = async () => {
        let summary = [];
        let _count = (await new Builder(`tbl_company`).select(`id, name`).condition(`WHERE status= 1 ORDER BY date_created ASC LIMIT 3`).build()).rows;

        for(let count = 0; count < _count.length; count++) { 
            summary.push({ name: _count[count].name, 
                                        count: (await new Builder(`tbl_department`).select(`COUNT(*)`).condition(`WHERE company_id= ${_count[count].id} AND status= 1`).build()).rows[0].count }); 
        }
        
        return {
            total: (await new Builder(`tbl_department`).select(`COUNT(*)`).build()).rows[0].count,
            summary
        }
    }

    list = async (data) => {
        return (await new Builder(`tbl_department AS dpt`)
                                        .select(`dpt.id, dpt.series_no, cmp.name AS company, dpt.name, dpt.status, CONCAT(cb.lname, ', ', cb.fname, ' ', cb.mname) AS created_by, dpt.date_created, 
                                                    CONCAT(head.lname, ', ', head.fname, ' ', head.mname) AS head_name`)
                                        .join({ table: `tbl_employee AS head`, condition: `head.user_id = dpt.department_head_id`, type: 'LEFT' })
                                        .join({ table: `tbl_company AS cmp`, condition: `dpt.company_id = cmp.id`, type: 'LEFT' })
                                        .join({ table: `tbl_employee AS cb`, condition: `cb.user_id = dpt.created_by`, type: 'LEFT' })
                                        .condition(`${data.searchtxt !== '' ? `WHERE dpt.series_no LIKE '%${data.searchtxt}%' OR cmp.name LIKE '%${data.searchtxt}%' 
                                                            OR dpt.name LIKE '%${data.searchtxt}%'` : ''} ORDER BY dpt.${data.category} ${(data.orderby).toUpperCase()}`)
                                        .build()).rows;
    }

    excel = async (type, data) => {
        switch(type) {
            case 'formatted':
                return (await new Builder(`tbl_department AS dpt`)
                                                .select(`dpt.series_no AS "Series No.", cmp.name AS "Company", CONCAT(head.lname, ', ', head.fname, ' ', head.mname) AS "Department head", 
                                                            dpt.name AS "Department", dpt.description AS "Description", CASE WHEN dpt.status =1 THEN 'Active' ELSE 'Inactive' END AS "Status", 
                                                            CONCAT(cb.lname, ', ', cb.fname, ' ', cb.mname) AS "Created by", dpt.date_created AS "Date created", 
                                                            CONCAT(ub.lname, ', ', ub.fname, ' ', ub.mname) AS "Updated by", dpt.date_updated AS "Date updated",
                                                            CONCAT(db.lname, ', ', db.fname, ' ', db.mname) AS "Deleted by", dpt.date_deleted AS "Date deleted", 
                                                            CONCAT(ib.lname, ', ', ib.fname, ' ', ib.mname) AS "Imported by", dpt.date_imported AS "Date imported"`)
                                                .join({ table: `tbl_employee AS head`, condition: `head.user_id = dpt.department_head_id`, type: `LEFT` })
                                                .join({ table: `tbl_company AS cmp`, condition: `dpt.company_id = cmp.id`, type: 'LEFT' })
                                                .join({ table: `tbl_employee AS cb`, condition: `cb.user_id = dpt.created_by`, type: `LEFT` })
                                                .join({ table: `tbl_employee AS ub`, condition: `ub.user_id = dpt.updated_by`, type: `LEFT` })
                                                .join({ table: `tbl_employee AS db`, condition: `db.user_id = dpt.deleted_by`, type: `LEFT` })
                                                .join({ table: `tbl_employee AS ib`, condition: `ib.user_id = dpt.imported_by`, type: `LEFT` })
                                                .condition(`WHERE dpt.series_no LIKE '%${data.searchtxt}%' OR dpt.name LIKE '%${data.searchtxt}%'
                                                                    ORDER BY dpt.${data.category} ${(data.orderby).toUpperCase()}`)
                                                .build()).rows;
            default: return (await new Builder(`tbl_department`).select().condition(`ORDER by ${data.category} ${(data.orderby).toUpperCase()}`).build()).rows;
        }
    }

    search = async (data) => {
        return (await new Builder(`tbl_department AS dpt`)
                                        .select(`dpt.id, dpt.series_no, cmp.name AS company, dpt.name, dpt.status, CONCAT(cb.lname, ', ', cb.fname, ' ', cb.mname) AS created_by, dpt.date_created, 
                                                    CONCAT(head.lname, ', ', head.fname, ' ', head.mname) AS head_name`)
                                        .join({ table: `tbl_employee AS head`, condition: `head.user_id = dpt.department_head_id`, type: 'LEFT' })
                                        .join({ table: `tbl_company AS cmp`, condition: `dpt.company_id = cmp.id`, type: 'LEFT' })
                                        .join({ table: `tbl_employee AS cb`, condition: `cb.user_id = dpt.created_by`, type: 'LEFT' })
                                        .condition(`WHERE dpt.series_no LIKE '%${data.condition}%' OR cmp.name LIKE '%${data.condition}%' OR dpt.name LIKE '%${data.condition}%' 
                                                            ORDER BY cmp.${data.category} ${(data.orderby).toUpperCase()}`)
                                        .build()).rows;
    }

    save = async (data) => {
        let date = Global.date(new Date());
        if(!(await new Builder(`tbl_department`).select().condition(`WHERE series_no= '${(data.series_no).toUpperCase()}'`).build()).rowCount > 0) {
            if(!(await new Builder(`tbl_department`).select().condition(`WHERE company_id= ${data.company_id} AND name= '${(data.name).toUpperCase()}'`).build()).rowCount > 0) {
                let dpt = (await new Builder(`tbl_department`)
                                                    .insert({ columns: `series_no, company_id, department_head_id, name, description, status, created_by, date_created`,
                                                                    values: `'${(data.series_no).toUpperCase()}', ${data.company_id}, ${data.department_head_id}, '${(data.name).toUpperCase()}', 
                                                                                    ${data.description !== '' ? `'${(data.address).toUpperCase()}'` : null}, ${data.status ? 1 : 0}, ${data.created_by}, '${date}'` })
                                                    .condition(`RETURNING id`)
                                                    .build()).rows[0];

                audit.series_no = Global.randomizer(7);
                audit.field = 'all';
                audit.item_id = dpt.id;
                audit.action = 'create';
                audit.user_id = data.created_by;
                audit.date = date;

                Global.audit(audit);
                return { result: 'success', message: 'Successfully saved!' }
            }
            else { return { result: 'error', error: [{ name: 'name', message: 'Department already exist in this company!' }] } }
        }
        else { return { result: 'error', error: [{ name: 'series_no', message: 'Series no already used!' }] } }
    }

    update = async (data) => {
        let dpt = (await new Builder(`tbl_department`).select().condition(`WHERE id= ${data.id}`).build()).rows[0];
        let date = Global.date(new Date());

        audit.item_id = dpt.id;
        audit.action = "update";
        audit.user_id = data.updated_by;
        audit.date = date;

        if(Global.compare(dpt.name, data.name)) {
            if(!(await new Builder(`tbl_department`).select().condition(`WHERE company_id= ${data.company_id} AND name= '${(data.name).toUpperCase()}'`).build()).rowCount > 0) {
                audit.series_no = Global.randomizer(7);
                audit.field = "name";
                audit.previous = (dpt.name).toUpperCase();
                audit.current = (data.name).toUpperCase();

                await new Builder(`tbl_department`).update(`name= '${(data.name).toUpperCase()}'`).condition(`WHERE id= ${dpt.id}`).build();
                Global.audit(audit);
            }
            else { return { result: 'error', error: [{ name: 'name', message: 'Department already exist in this company!' }] } }
        }

        if(Global.compare(dpt.company_id, data.company_id)) {
            audit.series_no = Global.randomizer(7);
            audit.field = "company_id";
            audit.previous = dpt.company_id;
            audit.current = data.company_id;

            await new Builder(`tbl_department`).update(`company_id= ${data.company_id}`).condition(`WHERE id= ${dpt.id}`).build();
            Global.audit(audit);
        }

        if(Global.compare(dpt.department_head_id, data.department_head_id)) {
            audit.series_no = Global.randomizer(7);
            audit.field = "department_head_id";
            audit.previous = dpt.department_head_id;
            audit.current = data.department_head_id;

            await new Builder(`tbl_department`).update(`department_head_id= ${data.department_head_id}`).condition(`WHERE id= ${dpt.id}`).build();
            Global.audit(audit);
        }

        if(Global.compare(dpt.description, data.description)) {
            audit.series_no = Global.randomizer(7);
            audit.field = "description";
            audit.previous = dpt.description !== null ? (dpt.description).toUpperCase() : null;
            audit.current = data.description !== '' ? (data.description).toUpperCase() : null;

            await new Builder(`tbl_department`).update(`description= ${data.description !== '' ? `'${(data.description).toUpperCase()}'` : null}`).condition(`WHERE id= ${dpt.id}`).build();
            Global.audit(audit);
        }

        if(Global.compare(dpt.status, data.status ? 1 : 0)) {
            let _status = data.status === true || data.status === 'true' ? 1 : 0;
            audit.series_no = Global.randomizer(7);
            audit.field = "status";
            audit.previous = dpt.status;
            audit.current = _status;

            await new Builder(`tbl_department`).update(`status= ${_status}`).condition(`WHERE id= ${dpt.id}`).build();
            Global.audit(audit);
        }

        await new Builder(`tbl_department`).update(`updated_by= ${data.updated_by}, date_updated= '${date}'`).condition(`WHERE id= ${dpt.id}`).build();
        return { result: 'success', message: 'Successfully updated!' }
    }

    upload = async (data) => {
        let file = data.json;
        let date = Global.date(new Date());
        let _errors = [];
        let _totalcount = 0;
        let _successcount = 0;
        let _errorcount = 0;

        for(let count = 0; count < file.length; count++) {
            let _count = (await new Builder(`tbl_department`).select(`COUNT(*)`).build()).rows[0].count;
            let series_no = `DPT-${('0000000' + (parseInt(_count) + 1)).substr(('0000000' + (parseInt(_count) + 1)).length - 7)}`;
            let _itemerror = [];
            
            if(file[count].name !== undefined) {
                if(file[count].company !== undefined) {
                    if(!((await new Builder(`tbl_company`).select().condition(`WHERE name= '${(file[count].company).toUpperCase()}'`).build()).rowCount > 0)) {
                        _itemerror.push('company doesn`t exist!');
                    }
                }
            }
            else { _itemerror.push('name must not be empty!'); }

            if(_itemerror.length > 0) {
                _errorcount++;
                _errors.push({ row: count + 1, errors: _errors });
            }
            else {
                _successcount++;
                let cmp = file[count].company !== undefined ?
                                    (await new Builder(`tbl_company`).select().condition(`WHERE name= '${(file[count].company).toUpperCase()}'`).build()).rows[0].id : null;

                let dpt = (await new Builder(`tbl_department`)
                                                    .insert({ columns: `series_no, company_id, department_head_id, name, description, status, 
                                                                                    created_by, imported_by, date_created, date_imported`, 
                                                                    values: `'${series_no.toUpperCase()}', ${cmp}, 1, '${(file[count].name).toUpperCase()}', null, 1, ${data.id}, ${data.id},
                                                                                    CURRENT_TIMESTAMP, '${date}'` })
                                                    .condition(`RETURNING id`)
                                                    .build()).rows[0];

                Global.audit({ series_no: Global.randomizer(7), table_name: 'tbl_department', item_id: dpt.id, field: 'all', previous: null, current: null, action: 'create-import', user_id: data.id, date: date });
            }
        }

        let list = (await new Builder(`tbl_department AS dpt`)
                                            .select(`dpt.id, dpt.series_no, cmp.name AS company, dpt.name, dpt.status, CONCAT(cb.lname, ', ', cb.fname, ' ', cb.mname) AS created_by, dpt.date_created, 
                                                        CONCAT(head.lname, ', ', head.fname, ' ', head.mname) AS head_name`)
                                            .join({ table: `tbl_employee AS head`, condition: `head.user_id = dpt.department_head_id`, type: 'LEFT' })
                                            .join({ table: `tbl_company AS cmp`, condition: `dpt.company_id = cmp.id`, type: 'LEFT' })
                                            .join({ table: `tbl_employee AS cb`, condition: `cb.user_id = dpt.created_by`, type: 'LEFT' })
                                            .condition(`ORDER BY dpt.date_created DESC`)
                                            .build()).rows;

        return {
            total: _totalcount,
            success: _successcount,
            fail: _errorcount,
            errors: _errors,
            list: list
        }
    }
}

module.exports = Department;