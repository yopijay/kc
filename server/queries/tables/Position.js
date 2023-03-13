const Builder = require("../../function/builder");
const Global = require("../../function/global");

const audit = { series_no: '', table_name: 'tbl_position',  item_id: 0, field: '', previous: null, current: null, action: '', user_id: 0, date: '' }; // Used for audit trail
class Position {
    specific = async (id) => { return (await new Builder(`tbl_position`).select().condition(`WHERE id= ${id}`).build()).rows; }
    series = async () => { return (await new Builder(`tbl_position`).select(`COUNT(*)`).build()).rows; }

    dropdown = async (data) => {
        return [{ id: 0, name: '-- SELECT AN ITEM BELOW --' }]
                        .concat((await new Builder(`tbl_position`)
                                            .select(`id, name`).condition(`WHERE company_id= ${data.company_id} AND department_id= ${data.department_id}`).build()).rows);
    }

    dashboard = async () => {
        let summary = [];
        let _cmp = (await new Builder(`tbl_company`).select(`id, name`).condition(`WHERE status= 1 ORDER BY date_created ASC LIMIT 3`).build()).rows;
        
        for(let _count = 0; _count < _cmp.length; _count++) {
            let _dpt = (await new Builder(`tbl_department`).select('id, name').condition(`WHERE company_id= ${_cmp[_count].id}`).build()).rows;
            let _total = 0;

            if(_dpt.length > 0) {
                for(let __count = 0; __count < _dpt.length; __count++) {
                    _total += parseInt((await new Builder(`tbl_position`).select(`COUNT(*)`)
                                                        .condition(`WHERE company_id= ${_cmp[_count].id} AND department_id= ${_dpt[__count].id} AND status= 1`)
                                                        .build()).rows[0].count);
                }
            }

            summary.push({ name: _cmp[_count].name, count: _total });
        }
        
        return {
            total: (await new Builder(`tbl_position`).select(`COUNT(*)`).build()).rows[0].count,
            summary
        }
    }

    list = async (data) => {
        return (await new Builder(`tbl_position AS pst`)
                        .select(`pst.id, pst.series_no, pst.name, cmp.name AS company, dpt.name AS department, pst.status, 
                                    CONCAT(cb.lname, ', ', cb.fname, ' ', cb.mname) AS created_by, pst.date_created`)
                        .join({ table: `tbl_company AS cmp`, condition: `pst.company_id = cmp.id`, type: `LEFT` })
                        .join({ table: `tbl_department AS dpt`, condition: `pst.department_id = dpt.id`, type: `LEFT` })
                        .join({ table: `tbl_employee AS cb`, condition: `dpt.created_by = cb.user_id`, type: `LEFT`})
                        .condition(`${data.searchtxt !== undefined ? 
                                                data.searchtxt !== '' ? `WHERE pst.series_no LIKE '%${(data.searchtxt).toUpperCase()}%' OR pst.name LIKE '%${(data.searchtxt).toUpperCase()}%' 
                                                                                        OR cmp.name LIKE '%${(data.searchtxt).toUpperCase()}%' OR dpt.name LIKE '%${(data.searchtxt).toUpperCase()}%'` : '' : ''} 
                                            ORDER BY pst.${data.orderby !== undefined ? data.orderby !== '' ? data.orderby : 'date_created' : 'date_created'} 
                                            ${data.sort !== undefined ? data.sort !== '' ? (data.sort).toUpperCase() : 'DESC' : 'DESC'}`)
                        .build()).rows;
    }

    excel = async (type) => {
        switch(type) {
            case 'formatted':
                return (await new Builder(`tbl_position AS pst`)
                                .select(`pst.series_no AS "Series No.", cmp.name AS "Company", dpt.name AS "Department", pst.name AS "Position", 
                                            pst.description AS "Description", pst.status AS "Status", CONCAT(cb.lname, ', ', cb.fname, ' ', cb.mname) AS "Created by", 
                                            pst.date_created AS "Date created", CONCAT(ub.lname, ', ', ub.fname, ' ', ub.mname) AS "Updated by", pst.date_updated AS "Date updated",
                                            CONCAT(db.lname, ', ', db.fname, ' ', db.mname) AS "Deleted by", pst.date_deleted AS "Date deleted", 
                                            CONCAT(ib.lname, ', ', ib.fname, ' ', ib.mname) AS "Imported by", pst.date_imported AS "Date imported"`)
                                .join({ table: `tbl_company AS cmp`, condition: `pst.company_id = cmp.id`, type: 'LEFT' })
                                .join({ table: `tbl_department AS dpt`, condition: `pst.department_id = dpt.id`, type: 'LEFT' })
                                .join({ table: `tbl_employee AS cb`, condition: `pst.created_by = cb.user_id`, type: `LEFT` })
                                .join({ table: `tbl_employee AS ub`, condition: `pst.updated_by = ub.user_id`, type: `LEFT` })
                                .join({ table: `tbl_employee AS db`, condition: `pst.deleted_by = db.user_id`, type: `LEFT` })
                                .join({ table: `tbl_employee AS ib`, condition: `pst.imported_by = ib.user_id`, type: `LEFT` })
                                .condition(`${data.searchtxt !== '' ? `WHERE pst.series_no LIKE '%${(data.searchtxt).toUpperCase()}%' OR pst.name LIKE '%${(data.searchtxt).toUpperCase()}%' 
                                                    OR cmp.name LIKE '%${(data.searchtxt).toUpperCase()}%' OR dpt.name LIKE '%${(data.searchtxt).toUpperCase()}%'` : ''} 
                                                    ORDER BY pst.${data.orderby} ${(data.sort).toUpperCase()}`)
                                .build()).rows;
            default: return (await new Builder(`tbl_position`).select().condition(`ORDER by ${data.orderby} ${(data.sort).toUpperCase()}`).build()).rows;
        }
    }

    search = async (data) => {
        return (await new Builder(`tbl_position AS pst`)
                        .select(`pst.id, pst.series_no, pst.name, cmp.name AS company, dpt.name AS department, pst.status, 
                                    CONCAT(cb.lname, ', ', cb.fname, ' ', cb.mname) AS created_by, pst.date_created`)
                        .join({ table: `tbl_company AS cmp`, condition: `pst.company_id = cmp.id`, type: `LEFT` })
                        .join({ table: `tbl_department AS dpt`, condition: `pst.department_id = dpt.id`, type: `LEFT` })
                        .join({ table: `tbl_employee AS cb`, condition: `dpt.created_by = cb.user_id`, type: `LEFT`})
                        .condition(`WHERE pst.series_no LIKE '%${(data.searchtxt).toUpperCase()}%' OR pst.name LIKE '%${(data.searchtxt).toUpperCase()}%' 
                                            OR cmp.name LIKE '%${(data.searchtxt).toUpperCase()}%' OR dpt.name LIKE '%${(data.searchtxt).toUpperCase()}%' 
                                            ORDER BY pst.${data.orderby} ${(data.sort).toUpperCase()}`)
                        .build()).rows;
    }

    save = async (data) => {
        let date = Global.date(new Date());
        let errors = [];

        if((await new Builder(`tbl_position`).select().condition(`WHERE series_no= '${(data.series_no).toUpperCase()}'`).build()).rowCount > 0) {
            errors.push({ name: 'series_no', message: 'Series number already used!' });
        }

        if((await new Builder(`tbl_position`)
                .select()
                .condition(`WHERE company_id= ${data.company_id} AND department_id= ${data.department_id} AND name= '${(data.name).toUpperCase()}'`)
                .build()).rowCount > 0) {
            errors.push({ name: 'name', message: 'Position already exist in this company and department!' });
        }

        if(!(errors.length > 0)) {
            let pst = (await new Builder(`tbl_position`)
                                .insert({ columns: `series_no, company_id, department_id, name, description, status, created_by, date_created`,
                                                values: `'${(data.series_no).toUpperCase()}', ${data.company_id}, ${data.department_id}, '${(data.name).toUpperCase()}', 
                                                                ${data.description !== '' ? `'${(data.description).toUpperCase()}'` : null}, ${data.status ? 1 : 0}, ${data.created_by}, '${date}'` })
                                .condition(`RETURNING id`)
                                .build()).rows[0];

            audit.series_no = Global.randomizer(7);
            audit.field = "all";
            audit.item_id = pst.id,
            audit.action = "create";
            audit.user_id = data.created_by;
            audit.date = date;

            Global.audit(audit);
            return { result: 'success', message: 'Successfully saved!' }
        }
        else { return { result: 'error', error: errors } }
    }

    update = async (data) => {
        let pst = (await new Builder(`tbl_position`).select().condition(`WHERE id= ${data.id}`).build()).rows[0];
        let date = Global.date(new Date());
        let _errors = [];
        let _audit = [];

        if(Global.compare(pst.name, data.name)) {
            if(!((await new Builder(`tbl_position`)
                    .select()
                    .condition(`WHERE company_id= ${data.company_id} AND department_id= ${data.department_id} AND name= '${(data.name).toUpperCase()}'`)
                    .build()).rowCount > 0)) {
                _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_position', item_id: pst.id, field: 'name', previous: pst.name, 
                                        current: (data.name).toUpperCase(), action: 'update', user_id: data.updated_by, date: date });
            }
            else { _errors.push({ name: 'name', message: 'Position already exist in this company and department!' }); }
        }

        if(Global.compare(pst.company_id, data.company_id)) {
            if(!((await new Builder(`tbl_position`)
                    .select()
                    .condition(`WHERE company_id= ${data.company_id} AND department_id= ${data.department_id} AND name= '${(data.name).toUpperCase()}'`)
                    .build()).rowCount > 0)) {
                _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_position', item_id: pst.id, field: 'company_id', previous: pst.company_id, 
                                        current: data.company_id, action: 'update', user_id: data.updated_by, date: date });
            }
            else { _errors.push({ name: 'name', message: 'Position already exist in this company and department!' }); }
        }

        if(Global.compare(pst.department_id, data.department_id)) {
            if(!((await new Builder(`tbl_position`)
                    .select()
                    .condition(`WHERE company_id= ${data.company_id} AND department_id= ${data.department_id} AND name= '${(data.name).toUpperCase()}'`)
                    .build()).rowCount > 0)) {
                _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_position', item_id: pst.id, field: 'department_id', previous: pst.department_id, 
                                        current: data.department_id, action: 'update', user_id: data.updated_by, date: date });
            }
            else { _errors.push({ name: 'name', message: 'Position already exist in this company and department!' }); }
        }

        if(Global.compare(pst.description, data.description)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_position', item_id: pst.id, field: 'description', previous: pst.description, 
                                    current: data.description !== '' && data.description !== null ? (data.description).toUpperCase() : null, action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(pst.status, data.status ? 1 : 0)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_position', item_id: pst.id, field: 'status', previous: pst.status, 
                                    current: data.status ? 1 : 0, action: 'update', user_id: data.updated_by, date: date });
        }

        if(!(_errors.length > 0)) {
            await new Builder(`tbl_position`)
                .update(`company_id= ${data.company_id}, department_id= ${data.department_id}, name= '${(data.name).toUpperCase()}',
                                description= ${data.description !== '' && data.description !== null ? `'${(data.description).toUpperCase()}'` : null},
                                status= ${data.status ? 1 : 0}, updated_by= ${data.updated_by}, date_updated= '${date}'`)
                .condition(`WHERE id= ${pst.id}`)
                .build();

            _audit.forEach(data => Global.audit(data));
            return { result: 'success', message: 'Successfully updated!' }
        }
        else { return { result: 'error', error: _errors } }
    }

    upload = async (data) => {
        return data;
        // let file = data.json;
        // let date = Global.date(new Date());
        // let _errors = [];
        // let _totalcount = 0;
        // let _successcount = 0;
        // let _errorcount = 0;

        // for(let count = 0; count < file.length; count++) {
        //     let _count = (await new Builder(`tbl_position`).select(`COUNT(*)`).build()).rows[0].count;
        //     let series_no = `PST-${('0000000' + (parseInt(_count) + 1)).substr(('0000000' + (parseInt(_count) + 1)).length - 7)}`;
        //     let pst = await new Builder(`tbl_position`).select().condition(`WHERE id= ${file[count].id ?? parseInt(count) + 1}`).build();
        //     let _itemerror = [];
        //     let _itemchange = [];
        //     let _audit = [];
        //     let type = '';

        //     if(pst.rowCount > 0) {
        //         type = 'update';
        //         if(file[count].name !== undefined) {
        //             if(Global.compare(pst.rows[0].name, file[count].name)) {
        //                 _itemchange.push(true);
                        
        //             }
        //         }
        //         else {
        //             _itemchange.push(true);
        //             _itemerror.push('name must not be empty!');
        //         }
        //     }
        //     else {
        //         type = 'create';
        //         _itemchange.push(true);
        //     }
        // }
    }
}

module.exports = Position;