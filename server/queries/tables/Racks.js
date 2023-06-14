const Builder = require("../../function/builder"); // Query builder
const Global = require('../../function/global'); // Function

const audit = { series_no: '', table_name: 'tbl_racks',  item_id: 0, field: '', previous: null, current: null, action: '', user_id: 0, date: '' }; // Used for audit trail
class Brand {
    specific = async (id) => { return (await new Builder(`tbl_racks`).select().condition(`WHERE id= ${id}`).build()).rows; }
    series = async () => { return (await new Builder(`tbl_racks`).select(`COUNT(*)`).build()).rows; }
    filter = async () => { return [{ id: 'all', name: 'ALL' }].concat((await new Builder(`tbl_racks`).select(`id, name`).condition(`WHERE status= 1 ORDER BY name ASC`).build()).rows); }

    dropdown = async (data) => {
        return [{ id: 0, name: '-- SELECT AN ITEM BELOW --' }]
                        .concat((await new Builder(`tbl_racks`).select(`id, code AS name`).condition(`WHERE branch= '${data.branch}' AND floor= '${data.floor}' AND status= 1 ORDER BY code ASC`).build()).rows); 
    }
 
    dashboard = async () => {
        return {
            total: (await new Builder(`tbl_racks`).select(`COUNT(*)`).build()).rows[0].count,
            active: (await new Builder(`tbl_racks`).select(`COUNT(*)`).condition(`WHERE status= 1`).build()).rows[0].count,
            inactive: (await new Builder(`tbl_racks`).select(`COUNT(*)`).condition(`WHERE status= 0`).build()).rows[0].count
        }
    }

    list = async (data) => {
        return (await new Builder(`tbl_racks AS rck`)
                        .select(`rck.id, rck.series_no, rck.branch, rck.floor, rck.code, rck.status, CONCAT(cb.lname, ', ', cb.fname, ' ', cb.mname) AS created_by, rck.date_created`)
                        .join({ table: `tbl_employee AS cb`, condition: `cb.user_id = rck.created_by`})
                        .condition(`${data.searchtxt !== '' ? 
                                                `WHERE rck.series_no LIKE '%${(data.searchtxt).toUpperCase()}%' OR rck.code LIKE '%${(data.searchtxt).toUpperCase()}%'` : ''}
                                                ORDER BY rck.${data.orderby} ${(data.sort).toUpperCase()}`)
                        .build()).rows;
    }

    rackcountlist = async data => {
        let brd = null;
        let query = '';
        let branch = { quezon_ave: 'qa', sto_domingo: 'sd', manila: 'ma' };
        
        if((JSON.parse(data.brands)).length > 0) { brd = JSON.parse(data.brands); }
        else { brd = (await new Builder(`tbl_brand`).select(`id AS brand_id, name AS brand_name`).condition(`WHERE status = 1`).build()).rows; }

        for(let count = 0; count < brd.length; count++) { query += `${count > 0 ? ' OR ' : ''}itm.brand_id= ${brd[count].brand_id}`; }

        if(data.list === 'racks') {
            return (await new Builder(`tbl_items AS itm`)
                            .select(`DISTINCT rck.id, rck.branch, rck.floor, rck.code`)
                            .join({ table: `tbl_racks AS rck`, condition: `itm.rack_id = rck.id`, type: `LEFT` })
                            .condition(`WHERE (${query}) AND rck.branch= '${branch[data.branch]}'`)
                            .build()).rows;
        }
        else {
            let items = [];
            let itm = (await new Builder(`tbl_items AS itm`)
                                .select(`itm.*`)
                                .join({ table: `tbl_racks AS rck`, condition: `itm.rack_id = rck.id`, type: `LEFT` })
                                .condition(`WHERE (${query}) AND itm.rack_id= ${data.rack_id}`)
                                .build()).rows;

            for(let count = 0; count < itm.length; count++) {
                let item = (await new Builder(`tbl_items AS itm`)
                                    .select(`itm.id, itm.item_code, rcs.count_by AS rcs, rcs.date_counted AS rcs_date, rcs.total AS rcs_total, ras.count_by AS ras, ras.date_counted AS ras_date, 
                                                    ras.total AS ras_total, ras.third_count_id AS des, ras.third_count_date AS des_date`)
                                    .join({ table: `tbl_physical_count_rcs AS rcs`, condition: `rcs.item_id = itm.id`, type: `LEFT` })
                                    .join({ table: `tbl_physical_count_ras AS ras`, condition: `ras.item_id = itm.id`, type: `LEFT` })
                                    .condition(`WHERE itm.id= ${itm[count].id}`)
                                    .build()).rows[0];
                items.push(item);
            }

            return items;
        }
    }

    rackspecific = async id => {
        console.log(id);
    }

    excel = async (type, data) => {
        return [];
        // switch(type) {
        //     case 'formatted':
        //         return (await new Builder(`tbl_racks AS rck`)
        //                         .select(`rck.series_no AS "Series No.", rck.code AS "Name", CASE WHEN rck.status =1 THEN 'Active' ELSE 'Inactive' END AS "Status",
        //                                         CONCAT(cb.lname, ', ', cb.fname, ' ', cb.mname) AS "Created by", rck.date_created AS "Date created", 
        //                                         CONCAT(ub.lname, ', ', ub.fname, ' ', ub.mname) AS "Updated by", rck.date_updated AS "Date updated",
        //                                         CONCAT(db.lname, ', ', db.fname, ' ', db.mname) AS "Deleted by", rck.date_deleted AS "Date deleted", 
        //                                         CONCAT(ib.lname, ', ', ib.fname, ' ', ib.mname) AS "Imported by", rck.date_imported AS "Date imported"`)
        //                         .join({ table: `tbl_employee AS cb`, condition: `cb.user_id = rck.created_by`, type: `LEFT` })
        //                         .join({ table: `tbl_employee AS ub`, condition: `ub.user_id = rck.updated_by`, type: `LEFT` })
        //                         .join({ table: `tbl_employee AS db`, condition: `db.user_id = rck.deleted_by`, type: `LEFT` })
        //                         .join({ table: `tbl_employee AS ib`, condition: `ib.user_id = rck.imported_by`, type: `LEFT` })
        //                         .condition(`${data.searchtxt !== '' ? `WHERE rck.series_no LIKE '%${(data.searchtxt).toUpperCase()}%' 
        //                                             OR rck.code LIKE '%${(data.searchtxt).toUpperCase()}%'` : '' } ORDER BY rck.${data.orderby} ${(data.sort).toUpperCase()}`)
        //                         .build()).rows;
        //     default: return (await new Builder(`tbl_racks`).select().condition(`ORDER by ${data.orderby} ${(data.sort).toUpperCase()}`).build()).rows;
        // }
    }

    search = async (data) => {
        return (await new Builder(`tbl_racks AS rck`)
                        .select(`rck.id, rck.series_no, rck.branch, rck.floor, rck.code, rck.status, CONCAT(cb.lname, ', ', cb.fname, ' ', cb.mname) AS created_by, rck.date_created`)
                        .join({ table: `tbl_employee AS cb`, condition: `cb.user_id = rck.created_by`})
                        .condition(`${data.searchtxt !== '' ? `WHERE rck.series_no LIKE '%${(data.searchtxt).toUpperCase()}%' 
                                            OR rck.code LIKE '%${data.searchtxt}%'` : '' } ORDER BY rck.${data.orderby} ${(data.sort).toUpperCase()}`)
                        .build()).rows;
    }

    save = async (data) => {
        let date = Global.date(new Date()); // Date
        let errors = [];

        if((await new Builder(`tbl_racks`).select().condition(`WHERE series_no= '${(data.series_no).toUpperCase()}'`).build()).rowCount > 0) {
            errors.push({ name: 'series_no', message: 'Series number already used!' });
        }

        if((await new Builder(`tbl_racks`).select().condition(`WHERE branch= '${data.branch}' AND floor= '${data.floor}' AND code= '${data.code}'`).build()).rowCount > 0) {
            errors.push({ name: 'code', message: 'Rack already exist!' });
        }

        if(!(errors.length > 0)) {
            let rck = (await new Builder(`tbl_racks`)
                                .insert({ columns: `series_no, branch, floor, code, status, created_by, date_created`,
                                            values: `'${(data.series_no).toUpperCase()}', '${data.branch}', '${data.floor}', '${data.code}', ${data.status === true ? 1 : 0}, ${data.created_by}, '${date}'` })
                                .condition(`RETURNING id`)
                                .build()).rows[0];

            audit.series_no = Global.randomizer(7);
            audit.field = 'all',
            audit.item_id = rck.id;
            audit.action = 'create';
            audit.user_id = data.created_by;
            audit.date = date;

            Global.audit(audit);
            return { result: 'success', message: 'Successfully saved!' }
        }
        else { return { result: 'error', error: errors } }
    }

    update = async (data) => {
        let rck = (await new Builder(`tbl_racks`).select().condition(`WHERE id= ${data.id}`).build()).rows[0];
        let date = Global.date(new Date());
        let _audit = [];
        let _errors = [];

        if(Global.compare(rck.code, data.code)) {
            if(!((await new Builder(`tbl_racks`).select().condition(`WHERE branch= '${data.branch}' AND floor= '${data.floor}' AND code= '${data.code}'`).build()).rowCount > 0)) {
                _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_racks', item_id: rck.id, field: 'code', previous: rck.code, 
                                        current: data.code, action: 'update', user_id: data.updated_by, date: date });
            }
            else { _errors.push({ name: 'name', message: 'Name already used!' }); }
        }

        if(Global.compare(rck.status, data.status ? 1 : 0)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_racks', item_id: rck.id, field: 'status', previous: rck.status, 
                                    current: data.status ? 1 : 0, action: 'update', user_id: data.updated_by, date: date });
        }

        if(!(_errors.length > 0)) {
            await new Builder(`tbl_racks`)
                .update(`code= '${data.code}', status= ${data.status ? 1 : 0}, updated_by= ${data.updated_by}, date_updated= '${date}'`)
                .condition(`WHERE id= ${rck.id}`)
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
        //     let _count = (await new Builder(`tbl_racks`).select(`COUNT(*)`).build()).rows[0].count;
        //     let series_no = `rck-${('0000000' + (parseInt(_count) + 1)).substr(('0000000' + (parseInt(_count) + 1)).length - 7)}`;
        //     let _itemerror = [];

        //     if(file[count].name !== undefined) {
        //         if((await new Builder(`tbl_racks`).select().condition(`WHERE name= '${(file[count].name).toUpperCase()}'`).build()).rowCount > 0) { _itemerror.push('Rack already exist!'); }
        //     }
        //     else { _itemerror.push('name must not be empty!'); }
            
        //     if(_itemerror.length > 0) {
        //         _errorcount++;
        //         _errors.push({ row: count + 1, errors: _itemerror });
        //     }
        //     else {
        //         _successcount++;
        //         let rck = (await new Builder(`tbl_racks`)
        //                             .insert({ columns: `series_no, owner_id, name, address, description, status, created_by, imported_by, date_created, date_imported`, 
        //                                             values: `'${series_no.toUpperCase()}', 1, '${(file[count].name).toUpperCase()}',
        //                                                             ${file[count].address !== undefined ? `'${(file[count].address).toUpperCase()}'` : null},
        //                                                             ${file[count].description !== undefined ? `'${(file[count].description).toUpperCase()}'` : null}, 1, ${data.id}, ${data.id},
        //                                                             CURRENT_TIMESTAMP, '${date}'` })
        //                             .condition(`RETURNING id`)
        //                             .build()).rows[0];

        //         Global.audit({ series_no: Global.randomizer(7), table_name: 'tbl_racks',  item_id: rck.id, field: 'all', previous: null, current: null, action: 'create-import', user_id: data.id, date: date });
        //     }
        // }

        // let list = (await new Builder(`tbl_racks AS rck`)
        //                     .select(`rck.id, rck.series_no, rck.code, rck.status, CONCAT(cb.lname, ', ', cb.fname, ' ', cb.mname) AS created_by, rck.date_created, 
        //                                 CONCAT(owner.lname, ', ', owner.fname, ' ', owner.mname) AS owner_name`)
        //                     .join({ table: `tbl_employee AS owner`, condition: `owner.user_id = rck.owner_id`, type: 'LEFT' })
        //                     .join({ table: `tbl_employee AS cb`, condition: `cb.user_id = rck.created_by`})
        //                     .condition(`ORDER BY rck.date_created DESC`)
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