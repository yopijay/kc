const Builder = require("../../function/builder"); // Query builder
const Global = require('../../function/global'); // Function

const audit = { series_no: '', table_name: 'tbl_company',  item_id: 0, field: '', previous: null, current: null, action: '', user_id: 0, date: '' }; // Used for audit trail
class Company {
    specific = async (id) => { return (await new Builder(`tbl_company`).select().condition(`WHERE id= ${id}`).build()).rows; }
    series = async () => { return (await new Builder(`tbl_company`).select(`COUNT(*)`).build()).rows; }
    filter = async () => { return [{ id: 'all', name: 'ALL' }].concat((await new Builder(`tbl_company`).select(`id, name`).condition(`WHERE status= 1 ORDER BY name ASC`).build()).rows); }

    dropdown = async () => { 
        return [{ id: 0, name: '-- SELECT AN ITEM BELOW --' }]
                        .concat((await new Builder(`tbl_company`).select(`id, name`).condition(`WHERE status= 1 ORDER BY name ASC`).build()).rows); 
    }

 
    dashboard = async () => {
        return {
            total: (await new Builder(`tbl_company`).select(`COUNT(*)`).build()).rows[0].count,
            active: (await new Builder(`tbl_company`).select(`COUNT(*)`).condition(`WHERE status= 1`).build()).rows[0].count,
            inactive: (await new Builder(`tbl_company`).select(`COUNT(*)`).condition(`WHERE status= 0`).build()).rows[0].count
        }
    }

    list = async (data) => {
        return (await new Builder(`tbl_company AS cmp`)
                                        .select(`cmp.id, cmp.series_no, cmp.name, cmp.status, CONCAT(cb.lname, ', ', cb.fname, ' ', cb.mname) AS created_by, cmp.date_created, CONCAT(owner.lname, ', ', 
                                                    owner.fname, ' ', owner.mname) AS owner_name`)
                                        .join({ table: `tbl_employee AS owner`, condition: `owner.user_id = cmp.owner_id`, type: 'LEFT' })
                                        .join({ table: `tbl_employee AS cb`, condition: `cb.user_id = cmp.created_by`})
                                        .condition(`${data.searchtxt !== undefined ? 
                                                                data.searchtxt !== '' ? `WHERE cmp.series_no LIKE '%${(data.searchtxt).toUpperCase()}%' 
                                                                                                        OR cmp.name LIKE '%${(data.searchtxt).toUpperCase()}%'` : '' : ''}
                                                                ORDER BY cmp.${data.orderby !== undefined ? data.orderby !== '' ? data.orderby : 'date_created' : 'date_created'}
                                                                ${data.sort !== undefined ? data.sort !== '' ? (data.sort).toUpperCase() : 'DESC' : 'DESC'}`)
                                        .build()).rows;
    }

    excel = async (type, data) => {
        switch(type) {
            case 'formatted':
                return (await new Builder(`tbl_company AS cmp`)
                                                .select(`cmp.series_no AS "Series No.", cmp.name AS "Name", cmp.address AS "Address", cmp.description AS "Description", CONCAT(owner.lname, ', ', 
                                                                owner.fname, ' ', owner.mname) AS "Owner", CASE WHEN cmp.status =1 THEN 'Active' ELSE 'Inactive' END AS "Status",
                                                                CONCAT(cb.lname, ', ', cb.fname, ' ', cb.mname) AS "Created by", cmp.date_created AS "Date created", 
                                                                CONCAT(ub.lname, ', ', ub.fname, ' ', ub.mname) AS "Updated by", cmp.date_updated AS "Date updated",
                                                                CONCAT(db.lname, ', ', db.fname, ' ', db.mname) AS "Deleted by", cmp.date_deleted AS "Date deleted", 
                                                                CONCAT(ib.lname, ', ', ib.fname, ' ', ib.mname) AS "Imported by", cmp.date_imported AS "Date imported"`)
                                                .join({ table: `tbl_employee AS owner`, condition: `owner.user_id = cmp.owner_id`, type: `LEFT` })
                                                .join({ table: `tbl_employee AS cb`, condition: `cb.user_id = cmp.created_by`, type: `LEFT` })
                                                .join({ table: `tbl_employee AS ub`, condition: `ub.user_id = cmp.updated_by`, type: `LEFT` })
                                                .join({ table: `tbl_employee AS db`, condition: `db.user_id = cmp.deleted_by`, type: `LEFT` })
                                                .join({ table: `tbl_employee AS ib`, condition: `ib.user_id = cmp.imported_by`, type: `LEFT` })
                                                .condition(`${data.searchtxt !== '' ? `WHERE cmp.series_no LIKE '%${(data.searchtxt).toUpperCase()}%' 
                                                                    OR cmp.name LIKE '%${(data.searchtxt).toUpperCase()}%'` : '' } ORDER BY cmp.${data.orderby} ${(data.sort).toUpperCase()}`)
                                                .build()).rows;
            default: return (await new Builder(`tbl_company`).select().condition(`ORDER by ${data.orderby} ${(data.sort).toUpperCase()}`).build()).rows;
        }
    }

    search = async (data) => {
        return (await new Builder(`tbl_company AS cmp`)
                                        .select(`cmp.id, cmp.series_no, cmp.name, cmp.status, CONCAT(cb.lname, ', ', cb.fname, ' ', cb.mname) AS created_by, cmp.date_created, 
                                                        CONCAT(owner.lname, ', ', owner.fname, ' ', owner.mname) AS owner_name`)
                                        .join({ table: `tbl_employee AS owner`, condition: `owner.user_id = cmp.owner_id`, type: 'LEFT' })
                                        .join({ table: `tbl_employee AS cb`, condition: `cb.user_id = cmp.created_by`})
                                        .condition(`${data.searchtxt !== '' ? `WHERE cmp.series_no LIKE '%${(data.searchtxt).toUpperCase()}%' 
                                                            OR cmp.name LIKE '%${(data.searchtxt).toUpperCase()}%'` : '' } ORDER BY cmp.${data.orderby} ${(data.sort).toUpperCase()}`)
                                        .build()).rows;
    }

    save = async (data) => {
        let date = Global.date(new Date()); // Date
        if(!(await new Builder(`tbl_company`).select().condition(`WHERE series_no= '${(data.series_no).toUpperCase()}'`).build()).rowCount > 0) {
            if(!(await new Builder(`tbl_company`).select().condition(`WHERE name= '${(data.name).toUpperCase()}'`).build()).rowCount > 0) {
                let cmp = (await new Builder(`tbl_company`)
                                                    .insert({ columns: `series_no, owner_id, name, address, description, status, created_by, date_created`,
                                                                values: `'${(data.series_no).toUpperCase()}', ${data.owner_id}, '${(data.name).toUpperCase()}', 
                                                                                ${data.address !== '' ? `'${(data.address).toUpperCase()}'` : null}, ${data.description !== '' ? `'${(data.description).toUpperCase()}'` : null},
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
        let cmp = (await new Builder(`tbl_company`).select().condition(`WHERE id= ${data.id}`).build()).rows[0];
        let date = Global.date(new Date());
        let _audit = [];
        let _errors = [];

        if(Global.compare(cmp.name, data.name)) {
            if(!((await new Builder(`tbl_company`).select().condition(`WHERE name= '${(data.name).toUpperCase()}'`).build()).rowCount > 0)) {
                _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_company', item_id: cmp.id, field: 'name', previous: cmp.name, 
                                        current: (data.name).toUpperCase(), action: 'update', user_id: data.updated_by, date: date });
            }
            else { _errors.push({ name: 'name', message: 'Name already used!' }); }
        }

        if(Global.compare(cmp.owner_id, data.owner_id)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_company', item_id: cmp.id, field: 'owner_id', previous: cmp.owner_id, 
                                    current: data.owner_id, action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(cmp.description, data.description)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_company', item_id: cmp.id, field: 'description', previous: cmp.description, 
                                    current: data.description !== '' && data.description !== null ? (data.description).toUpperCase() : null, action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(cmp.address, data.address)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_company', item_id: cmp.id, field: 'address', previous: cmp.address, 
                                    current: data.address !== '' && data.address !== null ? (data.address).toUpperCase() : null, action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(cmp.status, data.status ? 1 : 0)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_company', item_id: cmp.id, field: 'status', previous: cmp.status, 
                                    current: data.status ? 1 : 0, action: 'update', user_id: data.updated_by, date: date });
        }

        if(!(_errors.length > 0)) {
            await new Builder(`tbl_company`)
                .update(`owner_id= ${data.owner_id}, name= '${(data.name).toUpperCase()}', 
                                    description= ${data.description !== '' && data.description !== null ? `'${(data.description).toUpperCase()}'` : null},
                                    address= ${data.address !== '' && data.address !== null ? `'${(data.address).toUpperCase()}'` : null}, 
                                    status= ${data.status ? 1 : 0}, updated_by= ${data.updated_by}, date_updated= '${date}'`)
                .condition(`WHERE id= ${cmp.id}`)
                .build();

            _audit.forEach(data => Global.audit(data));
            return { result: 'success', message: 'Successfully updated!' }
        }
        else { return { result: 'error', error: _errors } }
    }

    upload = async (data) => {
        let file = data.json;
        let date = Global.date(new Date());
        let _errors = [];
        let _totalcount = 0;
        let _successcount = 0;
        let _errorcount = 0;
        
        for(let count = 0; count < file.length; count++) {
            let _count = (await new Builder(`tbl_company`).select(`COUNT(*)`).build()).rows[0].count;
            let series_no = `CMP-${('0000000' + (parseInt(_count) + 1)).substr(('0000000' + (parseInt(_count) + 1)).length - 7)}`;
            let _itemerror = [];

            if(file[count].name !== undefined) {
                if((await new Builder(`tbl_company`).select().condition(`WHERE name= '${(file[count].name).toUpperCase()}'`).build()).rowCount > 0) { _itemerror.push('company already exist!'); }
            }
            else { _itemerror.push('name must not be empty!'); }
            
            if(_itemerror.length > 0) {
                _errorcount++;
                _errors.push({ row: count + 1, errors: _itemerror });
            }
            else {
                _successcount++;
                let cmp = (await new Builder(`tbl_company`)
                                                    .insert({ columns: `series_no, owner_id, name, address, description, status, created_by, imported_by, date_created, date_imported`, 
                                                                    values: `'${series_no.toUpperCase()}', 1, '${(file[count].name).toUpperCase()}',
                                                                                    ${file[count].address !== undefined ? `'${(file[count].address).toUpperCase()}'` : null},
                                                                                    ${file[count].description !== undefined ? `'${(file[count].description).toUpperCase()}'` : null}, 1, ${data.id}, ${data.id},
                                                                                    CURRENT_TIMESTAMP, '${date}'` })
                                                    .condition(`RETURNING id`)
                                                    .build()).rows[0];

                Global.audit({ series_no: Global.randomizer(7), table_name: 'tbl_company',  item_id: cmp.id, field: 'all', previous: null, current: null, action: 'create-import', user_id: data.id, date: date });
            }
        }

        let list = (await new Builder(`tbl_company AS cmp`)
                                            .select(`cmp.id, cmp.series_no, cmp.name, cmp.status, CONCAT(cb.lname, ', ', cb.fname, ' ', cb.mname) AS created_by, cmp.date_created, 
                                                        CONCAT(owner.lname, ', ', owner.fname, ' ', owner.mname) AS owner_name`)
                                            .join({ table: `tbl_employee AS owner`, condition: `owner.user_id = cmp.owner_id`, type: 'LEFT' })
                                            .join({ table: `tbl_employee AS cb`, condition: `cb.user_id = cmp.created_by`})
                                            .condition(`ORDER BY cmp.date_created DESC`)
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

module.exports = Company;