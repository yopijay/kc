const Builder = require("../../function/builder"); // Query builder
const Global = require('../../function/global'); // Function

const audit = { series_no: '', table_name: 'tbl_brand',  item_id: 0, field: '', previous: null, current: null, action: '', user_id: 0, date: '' }; // Used for audit trail
class Brand {
    specific = async (id) => { return (await new Builder(`tbl_brand`).select().condition(`WHERE id= ${id}`).build()).rows; }
    series = async () => { return (await new Builder(`tbl_brand`).select(`COUNT(*)`).build()).rows; }
    filter = async () => { return [{ id: 'all', name: 'ALL' }].concat((await new Builder(`tbl_brand`).select(`id, name`).condition(`WHERE status= 1 ORDER BY name ASC`).build()).rows); }

    dropdown = async data => {
        switch(data.platform) {
            case 'client':
                return [{ id: 0, name: '-- SELECT AN ITEM BELOW --' }]
                                .concat((await new Builder(`tbl_brand`).select(`id, name`).condition(`WHERE status= 1 ORDER BY name ASC`).build()).rows); 
            
            case 'warehouse':
                let brands = JSON.parse(data.brands);
                let qry = '';

                if(brands.length > 0) { for(let count = 0; count < brands.length; count++) { qry += `${count > 0 ? ' OR ' : ''}id= ${brands[count].brand_id}`; } }

                return [{ id: 0, name: '-- SELECT AN ITEM BELOW --' }]
                                .concat((await new Builder(`tbl_brand`).select(`id, name`).condition(`WHERE status= 1 ${qry !== '' ? `AND (${qry}) ` : ''}ORDER BY name ASC`).build()).rows);
                                
            default: return [];
        }
    }

 
    dashboard = async () => {
        return {
            total: (await new Builder(`tbl_brand`).select(`COUNT(*)`).build()).rows[0].count,
            active: (await new Builder(`tbl_brand`).select(`COUNT(*)`).condition(`WHERE status= 1`).build()).rows[0].count,
            inactive: (await new Builder(`tbl_brand`).select(`COUNT(*)`).condition(`WHERE status= 0`).build()).rows[0].count
        }
    }

    list = async (data) => {
        return (await new Builder(`tbl_brand AS brd`)
                        .select(`brd.id, brd.series_no, brd.name, brd.status, CONCAT(cb.lname, ', ', cb.fname, ' ', cb.mname) AS created_by, brd.date_created`)
                        .join({ table: `tbl_employee AS cb`, condition: `cb.user_id = brd.created_by`})
                        .condition(`${data.searchtxt !== '' ? 
                                                `WHERE brd.series_no LIKE '%${(data.searchtxt).toUpperCase()}%' OR brd.name LIKE '%${(data.searchtxt).toUpperCase()}%'` : ''}
                                                ORDER BY brd.${data.orderby} ${(data.sort).toUpperCase()}`)
                        .build()).rows;
    }

    excel = async (type, data) => {
        switch(type) {
            case 'formatted':
                return (await new Builder(`tbl_brand AS brd`)
                                .select(`brd.series_no AS "Series No.", brd.name AS "Name", CASE WHEN brd.status =1 THEN 'Active' ELSE 'Inactive' END AS "Status",
                                                CONCAT(cb.lname, ', ', cb.fname, ' ', cb.mname) AS "Created by", brd.date_created AS "Date created", 
                                                CONCAT(ub.lname, ', ', ub.fname, ' ', ub.mname) AS "Updated by", brd.date_updated AS "Date updated",
                                                CONCAT(db.lname, ', ', db.fname, ' ', db.mname) AS "Deleted by", brd.date_deleted AS "Date deleted", 
                                                CONCAT(ib.lname, ', ', ib.fname, ' ', ib.mname) AS "Imported by", brd.date_imported AS "Date imported"`)
                                .join({ table: `tbl_employee AS cb`, condition: `cb.user_id = brd.created_by`, type: `LEFT` })
                                .join({ table: `tbl_employee AS ub`, condition: `ub.user_id = brd.updated_by`, type: `LEFT` })
                                .join({ table: `tbl_employee AS db`, condition: `db.user_id = brd.deleted_by`, type: `LEFT` })
                                .join({ table: `tbl_employee AS ib`, condition: `ib.user_id = brd.imported_by`, type: `LEFT` })
                                .condition(`${data.searchtxt !== '' ? `WHERE brd.series_no LIKE '%${(data.searchtxt).toUpperCase()}%' 
                                                    OR brd.name LIKE '%${(data.searchtxt).toUpperCase()}%'` : '' } ORDER BY brd.${data.orderby} ${(data.sort).toUpperCase()}`)
                                .build()).rows;
            default: return (await new Builder(`tbl_brand`).select().condition(`ORDER by ${data.orderby} ${(data.sort).toUpperCase()}`).build()).rows;
        }
    }

    search = async (data) => {
        return (await new Builder(`tbl_brand AS brd`)
                        .select(`brd.id, brd.series_no, brd.name, brd.status, CONCAT(cb.lname, ', ', cb.fname, ' ', cb.mname) AS created_by, brd.date_created`)
                        .join({ table: `tbl_employee AS cb`, condition: `cb.user_id = brd.created_by`})
                        .condition(`${data.searchtxt !== '' ? `WHERE brd.series_no LIKE '%${(data.searchtxt).toUpperCase()}%' 
                                            OR brd.name LIKE '%${(data.searchtxt).toUpperCase()}%'` : '' } ORDER BY brd.${data.orderby} ${(data.sort).toUpperCase()}`)
                        .build()).rows;
    }

    save = async (data) => {
        let date = Global.date(new Date()); // Date
        let errors = [];

        if((await new Builder(`tbl_brand`).select().condition(`WHERE series_no= '${(data.series_no).toUpperCase()}'`).build()).rowCount > 0) {
            errors.push({ name: 'series_no', message: 'Series number already used!' });
        }

        if((await new Builder(`tbl_brand`).select().condition(`WHERE name= '${(data.name).toUpperCase()}'`).build()).rowCount > 0) {
            errors.push({ name: 'name', message: 'Brand already exist!' });
        }

        if(!(errors.length > 0)) {
            let brd = (await new Builder(`tbl_brand`)
                                .insert({ columns: `series_no, name, status, created_by, date_created`,
                                            values: `'${(data.series_no).toUpperCase()}', '${(data.name).toUpperCase()}', ${data.status === true ? 1 : 0}, ${data.created_by}, '${date}'` })
                                .condition(`RETURNING id`)
                                .build()).rows[0];

            audit.series_no = Global.randomizer(7);
            audit.field = 'all',
            audit.item_id = brd.id;
            audit.action = 'create';
            audit.user_id = data.created_by;
            audit.date = date;

            Global.audit(audit);
            return { result: 'success', message: 'Successfully saved!' }
        }
        else { return { result: 'error', error: errors } }
    }

    update = async (data) => {
        let brd = (await new Builder(`tbl_brand`).select().condition(`WHERE id= ${data.id}`).build()).rows[0];
        let date = Global.date(new Date());
        let _audit = [];
        let _errors = [];

        if(Global.compare(brd.name, data.name)) {
            if(!((await new Builder(`tbl_brand`).select().condition(`WHERE name= '${(data.name).toUpperCase()}'`).build()).rowCount > 0)) {
                _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_brand', item_id: brd.id, field: 'name', previous: brd.name, 
                                        current: (data.name).toUpperCase(), action: 'update', user_id: data.updated_by, date: date });
            }
            else { _errors.push({ name: 'name', message: 'Name already used!' }); }
        }

        if(Global.compare(brd.status, data.status ? 1 : 0)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_brand', item_id: brd.id, field: 'status', previous: brd.status, 
                                    current: data.status ? 1 : 0, action: 'update', user_id: data.updated_by, date: date });
        }

        if(!(_errors.length > 0)) {
            await new Builder(`tbl_brand`)
                .update(`name= '${(data.name).toUpperCase()}', status= ${data.status ? 1 : 0}, updated_by= ${data.updated_by}, date_updated= '${date}'`)
                .condition(`WHERE id= ${brd.id}`)
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
        //     let _count = (await new Builder(`tbl_brand`).select(`COUNT(*)`).build()).rows[0].count;
        //     let series_no = `brd-${('0000000' + (parseInt(_count) + 1)).substr(('0000000' + (parseInt(_count) + 1)).length - 7)}`;
        //     let _itemerror = [];

        //     if(file[count].name !== undefined) {
        //         if((await new Builder(`tbl_brand`).select().condition(`WHERE name= '${(file[count].name).toUpperCase()}'`).build()).rowCount > 0) { _itemerror.push('Brand already exist!'); }
        //     }
        //     else { _itemerror.push('name must not be empty!'); }
            
        //     if(_itemerror.length > 0) {
        //         _errorcount++;
        //         _errors.push({ row: count + 1, errors: _itemerror });
        //     }
        //     else {
        //         _successcount++;
        //         let brd = (await new Builder(`tbl_brand`)
        //                             .insert({ columns: `series_no, owner_id, name, address, description, status, created_by, imported_by, date_created, date_imported`, 
        //                                             values: `'${series_no.toUpperCase()}', 1, '${(file[count].name).toUpperCase()}',
        //                                                             ${file[count].address !== undefined ? `'${(file[count].address).toUpperCase()}'` : null},
        //                                                             ${file[count].description !== undefined ? `'${(file[count].description).toUpperCase()}'` : null}, 1, ${data.id}, ${data.id},
        //                                                             CURRENT_TIMESTAMP, '${date}'` })
        //                             .condition(`RETURNING id`)
        //                             .build()).rows[0];

        //         Global.audit({ series_no: Global.randomizer(7), table_name: 'tbl_brand',  item_id: brd.id, field: 'all', previous: null, current: null, action: 'create-import', user_id: data.id, date: date });
        //     }
        // }

        // let list = (await new Builder(`tbl_brand AS brd`)
        //                     .select(`brd.id, brd.series_no, brd.name, brd.status, CONCAT(cb.lname, ', ', cb.fname, ' ', cb.mname) AS created_by, brd.date_created, 
        //                                 CONCAT(owner.lname, ', ', owner.fname, ' ', owner.mname) AS owner_name`)
        //                     .join({ table: `tbl_employee AS owner`, condition: `owner.user_id = brd.owner_id`, type: 'LEFT' })
        //                     .join({ table: `tbl_employee AS cb`, condition: `cb.user_id = brd.created_by`})
        //                     .condition(`ORDER BY brd.date_created DESC`)
        //                     .build()).rows;

        // return {
        //     total: _totalcount,
        //     success: _successcount,
        //     fail: _errorcount,
        //     errors: _errors,
        //     list: list
        // }
    }

}

module.exports = Brand;