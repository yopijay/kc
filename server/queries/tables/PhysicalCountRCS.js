const Builder = require("../../function/builder"); // Query builder
const Global = require('../../function/global'); // Function

const audit = { series_no: '', table_name: 'tbl_physical_count_rcs',  item_id: 0, field: '', previous: null, current: null, action: '', user_id: 0, date: '' }; // Used for audit trail
class PhysicalCountRCS {
    specific = async id => { 
        return (await new Builder(`tbl_items AS itm`)
                        .select(`itm.*, rcs.count_by`)
                        .join({ table: `tbl_physical_count_rcs AS rcs`, condition: `rcs.item_id = itm.id`, type: `LEFT` })
                        .condition(`WHERE itm.id= ${id}`)
                        .build()).rows;
    }

    save = async data => {
        let date = Global.date(new Date()); // Date
        let errors = [];
        let itm = null;

        if(data.item_id !== null) { itm = (await new Builder(`tbl_items`).select().condition(`WHERE id= ${data.item_id}`).build()).rows[0]; }
        else {
            if((await new Builder(`tbl_items`).select().condition(`WHERE item_code= '${(data.item_code).toUpperCase()}'`).build()).rowCount > 0) {
                errors.push({ name: 'item_code', message: 'Item code already exist!' });
            }

            if(!(errors.length > 0)) {
                itm = (await new Builder(`tbl_items`)
                            .insert({ columns: `series_no, brand_id, rack_id, item_code, mother_box, qty_per_mother_box, small_box, qty_per_small_box, tingi, total, status, created_by, date_created`, 
                                            values: `'${(data.itm_series_no).toUpperCase()}', ${data.brand_id}, ${data.id}, '${(data.item_code).toUpperCase()}', 0, 0, 0, 0, 0, 0, 1, ${data.rcs_created_by}, '${date}'` })
                            .condition(`RETURNING *`)
                            .build()).rows[0];

                Global.audit({ series_no: Global.randomizer(7), table_name: 'tbl_items', item_id: itm.id, field: 'all', previous: null, current: null, action: 'create', user_id: data.rcs_created_by, date: date });
            }
            else { return { result: 'error', error: errors } }
        }

        let rcs = await new Builder(`tbl_physical_count_rcs`).select().condition(`WHERE physical_count_id= ${data.physical_count_id} AND item_id= ${itm.id}`).build();
        
        if(rcs.rowCount > 0) {
            await new Builder(`tbl_physical_count_rcs`).update(`count_by= ${data.rcs}`).condition(`WHERE id= ${rcs.rows[0].id}`).build();
            Global.audit({ series_no: Global.randomizer(7), table_name: 'tbl_physical_count_rcs', item_id: rcs.rows[0].id, field: 'count_by', previous: rcs.rows[0].count_by, current: data.rcs, 
                                    action: 'update', user_id: data.rcs_created_by, date: date });
        }
        else {
            let _rcs = (await new Builder(`tbl_physical_count_rcs`)
                                .insert({ columns: `physical_count_id, item_id, qty_mother_box, qty_per_mother_box, qty_small_box, qty_per_small_box, tingi, total, count_by, assigned_by, date_assigned`, 
                                                values: `${data.physical_count_id}, ${itm.id}, 0, 0, 0, 0, 0, 0, ${data.rcs}, ${data.rcs_created_by}, '${date}'` })
                                .condition(`RETURNING id`)
                                .build()).rows[0];

            Global.audit({ series_no: Global.randomizer(7), table_name: 'tbl_physical_count_rcs', item_id: _rcs.id, field: 'all', previous: null, current: null, 
                                    action: 'create', user_id: data.rcs_created_by, date: date });
        }

        return { result: 'success', message: 'Successfully saved!' }
    }

    list = async data => {
        let branch = { quezon_ave: 'qa', sto_domingo: 'sd', manila: 'ma' };
        let items = [];
        let brands = null;
        let query = '';

        if((JSON.parse(data.brands)).length > 0) { brands = JSON.parse(data.brands); }
        else { brands = (await new Builder(`tbl_brand`).select(`id AS brand_id, name AS brand_name`).condition(`WHERE status = 1`).build()).rows; }

        for(let count = 0; count < brands.length; count++) { query += `${count > 0 ? ' OR' : ''}itm.brand_id= ${brands[count].brand_id}`; }

        switch(data.type) {
            case 'admin':
                let itm = (await new Builder(`tbl_items AS itm`)
                                    .select(`itm.*`)
                                    .join({ table: `tbl_racks AS rck`, condition: `itm.rack_id = rck.id`, type: `LEFT` })
                                    .condition(`WHERE (${query}) AND rck.branch= '${branch[data.branch]}' ORDER BY itm.item_code DESC`)
                                    .build()).rows;
        
                for(let count = 0; count < itm.length; count++) {
                    let item = (await new Builder(`tbl_items AS itm`)
                                        .select(`itm.id, itm.item_code, rcs.count_by, rcs.date_counted, rcs.total, emp.fname, emp.lname`)
                                        .join({ table: `tbl_physical_count_rcs AS rcs`, condition: `rcs.item_id = itm.id`, type: `LEFT` })
                                        .join({ table: `tbl_employee AS emp`, condition: `emp.user_id = rcs.count_by`, type: `LEFT` })
                                        .condition(`WHERE itm.id= ${itm[count].id}`)
                                        .build()).rows[0];
                    
                    items.push(item);
                }

                return items;
            default: return [];
        }
    }

    update = async data => {
        let rcs = (await new Builder(`tbl_physical_count_rcs`).select().condition(`WHERE id= ${data.id}`).build()).rows[0];
        let date = Global.date(new Date());
        let audits = [];

        if(Global.compare(rcs.qty_mother_box, data.qty_mother_box)) {
            audits.push({ series_no: Global.randomizer(7), table_name: 'tbl_physical_count_rcs', item_id: data.id, field: 'qty_mother_box', previous: rcs.qty_mother_box,
                                    current: data.qty_mother_box, action: 'update', user_id: data.count_by, date: date });
        }

        if(Global.compare(rcs.qty_per_mother_box, data.qty_per_mother_box)) {
            audits.push({ series_no: Global.randomizer(7), table_name: 'tbl_physical_count_rcs', item_id: data.id, field: 'qty_per_mother_box', previous: rcs.qty_per_mother_box,
                                    current: data.qty_per_mother_box, action: 'update', user_id: data.count_by, date: date });
        }

        if(Global.compare(rcs.qty_small_box, data.qty_small_box)) {
            audits.push({ series_no: Global.randomizer(7), table_name: 'tbl_physical_count_rcs', item_id: data.id, field: 'qty_small_box', previous: rcs.qty_small_box,
                                    current: data.qty_small_box, action: 'update', user_id: data.count_by, date: date });
        }

        if(Global.compare(rcs.qty_per_small_box, data.qty_per_small_box)) {
            audits.push({ series_no: Global.randomizer(7), table_name: 'tbl_physical_count_rcs', item_id: data.id, field: 'qty_per_small_box', previous: rcs.qty_per_small_box,
                                    current: data.qty_per_small_box, action: 'update', user_id: data.count_by, date: date });
        }

        if(Global.compare(rcs.tingi, data.tingi)) {
            audits.push({ series_no: Global.randomizer(7), table_name: 'tbl_physical_count_rcs', item_id: data.id, field: 'tingi', previous: rcs.tingi,
                                    current: data.tingi, action: 'update', user_id: data.count_by, date: date });
        }

        if(Global.compare(rcs.total, data.total)) {
            audits.push({ series_no: Global.randomizer(7), table_name: 'tbl_physical_count_rcs', item_id: data.id, field: 'total', previous: rcs.total,
                                    current: data.total, action: 'update', user_id: data.count_by, date: date });
        }

        if(Global.compare(rcs.remarks, data.remarks)) {
            audits.push({ series_no: Global.randomizer(7), table_name: 'tbl_physical_count_rcs', item_id: data.id, field: 'remarks', previous: rcs.remarks,
                                    current: data.remarks !== '' ? (data.remarks).toUpperCase : '', action: 'update', user_id: data.count_by, date: date });
        }

        if(Global.compare(rcs.comments, data.comments)) {
            audits.push({ series_no: Global.randomizer(7), table_name: 'tbl_physical_count_rcs', item_id: data.id, field: 'comments', previous: rcs.comments,
                                    current: data.comments !== '' ? (data.comments).toUpperCase : '', action: 'update', user_id: data.count_by, date: date });
        }
        
        await new Builder(`tbl_physical_count_rcs`)
            .update(`qty_mother_box= ${data.qty_mother_box !== '' ? data.qty_mother_box : 0}, qty_per_mother_box= ${data.qty_per_mother_box !== '' ? data.qty_per_mother_box : 0},
                            qty_small_box= ${data.qty_small_box !== '' ? data.qty_small_box : 0}, qty_per_small_box= ${data.qty_per_small_box !== '' ? data.qty_per_small_box : 0},
                            tingi= ${data.tingi !== '' ? data.tingi : 0}, total= ${data.total !== '' ? data.total : 0}, 
                            remarks= ${data.remarks !== '' && data.remarks !== null ? `'${(data.remarks).toUpperCase()}'` : null},
                            comments= ${data.comments !== '' && data.comments !== null ? `'${(data.comments).toUpperCase()}'` : null},
                            date_counted= '${date}'`)
            .condition(`WHERE id= ${data.id}`)
            .build();

        audits.forEach(data => Global.audit(data));
        return { result: 'success', message: 'Successfully saved!' }
    }

    search = async data => {
        console.log(data);
        return [];
    }
}

module.exports = PhysicalCountRCS;
