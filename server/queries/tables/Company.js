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

    excel = async (type) => {
        switch(type) {
            case 'formatted':
                return (await new Builder(`tbl_company AS cmp`)
                                                .select(`cmp.series_no AS "Series No.", cmp.name AS "Name", cmp.address AS "Address", cmp.description AS "Description", CONCAT(owner.lname, ', ', owner.fname, ' ', owner.mname) AS "Owner", CASE WHEN cmp.status =1 THEN 'Active' ELSE 'Inactive' END AS "Status",
                                                                CONCAT(cb.lname, ', ', cb.fname, ' ', cb.mname) AS "Created by", cmp.date_created AS "Date created", CONCAT(ub.lname, ', ', ub.fname, ' ', ub.mname) AS "Updated by", cmp.date_updated AS "Date updated",
                                                                CONCAT(db.lname, ', ', db.fname, ' ', db.mname) AS "Deleted by", cmp.date_deleted AS "Date deleted", CONCAT(ib.lname, ', ', ib.fname, ' ', ib.mname) AS "Imported by", cmp.date_imported AS "Date imported"`)
                                                .join({ table: `tbl_employee AS owner`, condition: `owner.user_id = cmp.owner_id`, type: `LEFT` })
                                                .join({ table: `tbl_employee AS cb`, condition: `cb.user_id = cmp.created_by`, type: `LEFT` })
                                                .join({ table: `tbl_employee AS ub`, condition: `ub.user_id = cmp.updated_by`, type: `LEFT` })
                                                .join({ table: `tbl_employee AS db`, condition: `db.user_id = cmp.deleted_by`, type: `LEFT` })
                                                .join({ table: `tbl_employee AS ib`, condition: `ib.user_id = cmp.imported_by`, type: `LEFT` })
                                                .condition(`ORDER BY cmp.date_created ASC`)
                                                .build()).rows;
            default: return (await new Builder(`tbl_company`).select().condition(`ORDER by date_created ASC`).build()).rows;
        }
    }

    search = async (data) => {
        return (await new Builder(`tbl_company AS cmp`)
                                        .select(`cmp.id, cmp.series_no, cmp.name, cmp.status, CONCAT(cb.lname, ', ', cb.fname, ' ', cb.mname) AS created_by, cmp.date_created, CONCAT(owner.lname, ', ', owner.fname, ' ', owner.mname) AS owner_name`)
                                        .join({ table: `tbl_employee AS owner`, condition: `owner.user_id = cmp.owner_id`, type: 'LEFT' })
                                        .join({ table: `tbl_employee AS cb`, condition: `cb.user_id = cmp.created_by`})
                                        .condition(`WHERE cmp.series_no LIKE '%${data.condition}%' OR cmp.name LIKE '%${data.condition}%' ORDER BY cmp.date_created DESC`) 
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
        let cmp = (await new Builder(`tbl_company`).select().condition(`WHERE id= ${data.id}`).build()).rows[0];
        let date = Global.date(new Date());

        audit.item_id = cmp.id;
        audit.action = "update";
        audit.user_id = data.updated_by;
        audit.date = date;

        if(Global.compare(cmp.name, data.name)) {
            if(!(await new Builder(`tbl_company`).select().condition(`WHERE name= '${(data.name).toUpperCase()}'`).build()).rowCount > 0) {
                audit.series_no = Global.randomizer(7);
                audit.field = "name";
                audit.previous = (cmp.name).toUpperCase();
                audit.current = (data.name).toUpperCase();

                await new Builder(`tbl_company`).update(`name= '${(data.name).toUpperCase()}'`).condition(`WHERE id= ${cmp.id}`).build();
                Global.audit(audit);
            }
            else { return { result: 'error', error: [{ name: 'name', message: 'Company name already used!' }] } }
        }

        if(Global.compare(cmp.owner_id, data.owner_id)) {
            audit.series_no = Global.randomizer(7);
            audit.field = "owner_id",
            audit.previous = cmp.owner_id;
            audit.current = data.owner_id;

            await new Builder(`tbl_company`).update(`owner_id= ${data.owner_id}`).condition(`WHERE id= ${cmp.id}`).build();
            Global.audit(audit);
        }

        if(Global.compare(cmp.address, data.address)) {
            let _address = data.address !== '' ? `'${(data.address).toUpperCase()}'` : null;
            
            audit.series_no = Global.randomizer(7);
            audit.field = "address";
            audit.previous = cmp.address !== null ? (cmp.address).toUpperCase() : null;
            audit.current = _address;

            await new Builder(`tbl_company`).update(`address= ${_address}`).condition(`WHERE id= ${cmp.id}`).build();
            Global.audit(audit);
        }

        if(Global.compare(cmp.description, data.description)) {
            let _description = data.description !== '' ? `'${(data.description).toUpperCase()}'` : null;

            audit.series_no = Global.randomizer(7);
            audit.field = "description";
            audit.previous = cmp.description !== null ? (cmp.description).toUpperCase() : null;
            audit.current = _description;

            await new Builder(`tbl_company`).update(`description= ${_description}`).condition(`WHERE id= ${cmp.id}`).build();
            Global.audit(audit);
        }

        if(Global.compare(cmp.status, data.status ? 1 : 0)) {
            let _status = data.status === true || data.status === 'true' ? 1 : 0;
            audit.series_no = Global.randomizer(7);
            audit.field = "status";
            audit.previous = cmp.status;
            audit.current = _status;

            await new Builder(`tbl_company`).update(`status= ${_status}`).condition(`WHERE id= ${cmp.id}`).build();
            Global.audit(audit);
        }

        await new Builder(`tbl_company`).update(`updated_by= ${data.updated_by}, date_updated= '${date}'`).condition(`WHERE id= ${cmp.id}`).build();
        return { result: 'success', message: 'Successfully updated!' }
    }

    dropdown = async (data) => {
        return data;
    }

    upload = async (data) => {
        let file = data.json;
        let date = Global.date(new Date());
        
        for(let count = 0; count < file.length; count++) {
            let _count = (await new Builder(`tbl_company`).select(`COUNT(*)`).build()).rows[0].count;
            let series_no = `CMP-${('0000000' + (parseInt(_count) + 1)).substr(('0000000' + (parseInt(_count) + 1)).length - 7)}`;
            let cmp = await new Builder(`tbl_company`).select().condition(`WHERE id= ${file[count].id ?? parseInt(count) + 1}`).build();
            
            audit.user_id = data.id;
            audit.date = date;

            if(cmp.rowCount > 0) {
                audit.item_id = cmp.rows[0].id;
                audit.action = 'update-import';

                if(Global.compare(cmp.rows[0].series_no, file[count].series_no)) {
                    audit.series_no = Global.randomizer(7);
                    audit.field = "series_no";
                    audit.previous = cmp.rows[0].series_no !== null ? (cmp.rows[0].series_no).toUpperCase() : null;

                    if(file[count].series_no !== undefined) {
                        if(!(await new Builder(`tbl_company`).select().condition(`WHERE series_no= '${(file[count].series_no).toUpperCase()}'`).build()).rowCount > 0) {
                            audit.current = (file[count].series_no).toUpperCase();
                            await new Builder(`tbl_company`).update(`series_no= '${(file[count].series_no).toUpperCase()}'`).condition(`WHERE id= ${cmp.rows[0].id}`).build();
                            Global.audit(audit);
                        }
                    }
                    else {
                        audit.current = null;
                        await new Builder(`tbl_company`).update(`series_no= null`).condition(`WHERE id= ${cmp.rows[0].id}`).build();
                        Global.audit(audit);
                    }
                }

                if(Global.compare(cmp.rows[0].owner_id, file[count].owner_id)) {
                    audit.series_no = Global.randomizer(7);
                    audit.field = "owner_id";
                    audit.previous = cmp.rows[0].series_no !== null ? cmp.rows[0].owner_id : null;

                    if(file[count].owner_id !== undefined) {
                        if(!(await new Builder(`tbl_users`).select().condition(`WHERE id= ${cmp.rows[0].owner_id}`).build()).rowCount > 0) {
                            audit.current = file[count].owner_id;
                            await new Builder(`tbl_company`).update(`owner_id= ${file[count].owner_id}`).condition(`WHERE id= ${cmp.rows[0].id}`).build();
                            Global.audit(audit);
                        }
                    }
                    else {
                        audit.current = null;
                        await new Builder(`tbl_company`).update(`owner_id= null`).condition(`WHERE id= ${cmp.rows[0].id}`).build();
                        Global.audit(audit);
                    }
                }

                if(Global.compare(cmp.rows[0].name, file[count].name)) {
                    audit.series_no = Global.randomizer(7);
                    audit.field = "name";
                    audit.previous = cmp.rows[0].name !== null ? (cmp.rows[0].name).toUpperCase() : null;

                    if(file[count].name !== undefined) {
                        if(!(await new Builder(`tbl_company`).select().condition(`WHERE name= '${(file[count].name).toUpperCase()}'`).build()).rowCount > 0) {
                            audit.current = (file[count].name).toUpperCase();
                            await new Builder(`tbl_company`).update(`name= '${(file[count].name).toUpperCase()}'`).condition(`WHERE id= ${cmp.rows[0].id}`).build();
                            Global.audit(audit);
                        }
                    }
                    else {
                        audit.current = null;
                        await new Builder(`tbl_company`).update(`name= null`).condition(`WHERE id= ${cmp.rows[0].id}`).build();
                        Global.audit(audit);
                    }
                }

                if(Global.compare(cmp.rows[0].description, file[count].description)) {
                    audit.series_no = Global.randomizer(7);
                    audit.field = "description";
                    audit.previous = cmp.rows[0].description !== null ? (cmp.rows[0].description).toUpperCase() : null;

                    if(file[count].description !== undefined) {
                        audit.current = (file[count].description).toUpperCase();
                        await new Builder(`tbl_company`).update(`description= '${(file[count].description).toUpperCase()}'`).condition(`WHERE id= ${cmp.rows[0].id}`).build();
                        Global.audit(audit);
                    }
                    else {
                        audit.current = null;
                        await new Builder(`tbl_company`).update(`description= null`).condition(`WHERE id= ${cmp.rows[0].id}`).build();
                        Global.audit(audit);
                    }
                }

                if(Global.compare(cmp.rows[0].address, file[count].address)) {
                    audit.series_no = Global.randomizer(7);
                    audit.field = "address";
                    audit.previous = cmp.rows[0].address !== null ? (cmp.rows[0].address).toUpperCase() : null;

                    if(file[count].address !== undefined) {
                        audit.current = (file[count].address).toUpperCase();
                        await new Builder(`tbl_company`).update(`address= '${(file[count].address).toUpperCase()}'`).condition(`WHERE id= ${cmp.rows[0].id}`).build();
                        Global.audit(audit);
                    }
                    else {
                        audit.current = null;
                        await new Builder(`tbl_company`).update(`address= null`).condition(`WHERE id= ${cmp.rows[0].id}`).build();
                        Global.audit(audit);
                    }
                }

                if(Global.compare(cmp.rows[0].status, file[count].status !== undefined ? !isNaN(file[count].status) ? file[count].status : 0 : 0)) {
                    audit.series_no = Global.randomizer(7);
                    audit.field = "status";
                    audit.previous = cmp.rows[0].status;

                    if(file[count].status !== undefined && !isNaN(file[count].status)) {
                        audit.current = file[count].status;
                        await new Builder(`tbl_company`).update(`status= ${file[count].status}`).condition(`WHERE id= ${cmp.rows[0].id}`).build();
                        Global.audit(audit);
                    }
                    else {
                        audit.current = 0;
                        await new Builder(`tbl_company`).update(`status= 0`).condition(`WHERE id= ${cmp.rows[0].id}`).build();
                        Global.audit(audit);
                    }
                }

                await new Builder(`tbl_company`).update(`updated_by= ${data.id}, date_updated= '${date}', imported_by= ${data.id}, date_imported= '${date}'`).condition(`WHERE id= ${cmp.rows[0].id}`).build();
            }
            else {
                if(file[count].name !== undefined) {
                    audit.series_no = Global.randomizer(7);
                    audit.field = "all";
                    audit.action = "create-import";

                    if(!(await new Builder(`tbl_company`).select().condition(`WHERE name= '${(file[count].name).toUpperCase()}'`).build()).rowCount > 0) {
                        let series = await new Builder(`tbl_company`).select().condition(`WHERE series_no= ${file[count].series_no !== undefined ? `'${file[count].series_no}'` : `'${(series_no).toUpperCase()}'`}`).build();
                        let imprt = await new Builder(`tbl_company`)
                                                                .insert({ columns: `series_no, owner_id, name, address, description, status`,
                                                                                values: `${!series.rowCount > 0 ? file[count].series_no !== undefined ? `'${file[count].series_no}'` : `'${(series_no).toUpperCase()}'` : null}, ${file[count].owner_id !== undefined ? file[count].owner_id : null},
                                                                                                    '${(file[count].name).toUpperCase()}', ${file[count].address !== undefined ? `'${(file[count].address).toUpperCase()}'` : null}, ${file[count].description !== undefined ? `'${(file[count].description).toUpperCase()}'` : null},
                                                                                                    ${!isNaN(file[count].status) && file[count].status > 1 ? file[count].status : 0}` })
                                                                .condition(`RETURNING id`)
                                                                .build();
                        if(file[count].created_by === undefined) { await new Builder(`tbl_company`).update(`created_by= ${data.id}, date_created= '${date}'`).condition(`WHERE id= ${imprt.rows[0].id}`).build(); }
                        await new Builder(`tbl_company`).update(`imported_by= ${data.id}, date_imported= '${date}'`).condition(`WHERE id= ${imprt.rows[0].id}`).build();

                        audit.item_id = imprt.rows[0].id;
                        Global.audit(audit);
                    }
                }
            }
        }

        return { result: 'success', message: 'Successfully imported!' }
    }

}

module.exports = Company;