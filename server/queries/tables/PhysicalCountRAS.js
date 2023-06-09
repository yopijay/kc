const Builder = require("../../function/builder"); // Query builder
const Global = require('../../function/global'); // Function

const audit = { series_no: '', table_name: 'tbl_physical_count_ras',  item_id: 0, field: '', previous: null, current: null, action: '', user_id: 0, date: '' }; // Used for audit trail
class PhysicalCountRAS {
    specific = async id => {
        return (await new Builder(`tbl_physical_count_ras AS ras`)
                        .select(`ras.*, itm.item_code, itm.item_description, brd.name AS brand`)
                        .join({ table: `tbl_items AS itm`, condition: `ras.item_id = itm.id`, type: `LEFT` })
                        .join({ table: `tbl_brand AS brd`, condition: `itm.brand_id= brd.id`, type: `LEFT` })
                        .condition(`WHERE ras.id= ${id}`)
                        .build()).rows;
    }

    list = async data => {
        let branch = { quezon_ave: 'qa', sto_domingo: 'sd', manila: 'ma' };
        
        switch(data.type) {
            case 'admin':
                return (await new Builder(`tbl_physical_count_ras AS ras`)
                                .select(`ras.id, itm.item_code, emp.fname, emp.lname, ras.date_counted`)
                                .join({ table: `tbl_items AS itm`, condition: `ras.item_id = itm.id`, type: `LEFT` })
                                .join({ table: `tbl_racks AS rck`, condition: `itm.rack_id = rck.id`, type: `LEFT` })
                                .join({ table: `tbl_employee AS emp`, condition: `ras.count_by = emp.user_id`, type: `LEFT` })
                                .condition(`WHERE ras.physical_count_id= ${data.physical_count_id} AND rck.branch= '${branch[data.branch]}'`)
                                .build()).rows;
            case 'ras': 
                return (await new Builder(`tbl_physical_count_ras AS ras`)
                                .select(`ras.*, itm.item_code, rck.branch, rck.floor, rck.code`)
                                .join({ table: `tbl_items AS itm`, condition: `ras.item_id = itm.id`, type: `LEFT` })
                                .join({ table: `tbl_racks AS rck`, condition: `itm.rack_id = rck.id`, type: `LEFT` })
                                .condition(`WHERE ras.physical_count_id= ${data.physical_count_id} AND ras.count_by= ${data.user_id} ORDER BY rck.code ASC`)
                                .build()).rows;
            default: return []
        }
    }

    save = async data => {
        let date = Global.date(new Date());
        let itm = (await new Builder(`tbl_items`).select().condition(`WHERE id= ${data.item_id}`).build()).rows[0];

        let ras = await new Builder(`tbl_physical_count_ras`).select().condition(`WHERE physical_count_id= ${data.physical_count_id} AND item_id= ${itm.id}`).build();
        
        if(ras.rowCount > 0) {
            await new Builder(`tbl_physical_count_ras`).update(`count_by= ${data.ras}`).condition(`WHERE id= ${ras.rows[0].id}`).build();
            Global.audit({ series_no: Global.randomizer(7), table_name: 'tbl_physical_count_ras', item_id: ras.rows[0].id, field: 'count_by', previous: ras.rows[0].count_by, current: data.ras,
                                    action: 'update', user_id: data.ras_created_by, date: date });
        }
        else {
            let _ras = (await new Builder(`tbl_physical_count_ras`)
                                .insert({ columns: `physical_count_id, item_id, qty_mother_box, qty_per_mother_box, qty_small_box, qty_per_small_box, tingi, total, count_by, assigned_by, date_assigned`, 
                                                values: `${data.physical_count_id}, ${itm.id}, 0, 0, 0, 0, 0, 0, ${data.ras}, ${data.ras_created_by}, '${date}'` })
                                .condition(`RETURNING id`)
                                .build()).rows[0];

            Global.audit({ series_no: Global.randomizer(7), table_name: 'tbl_physical_count_ras', item_id: _ras.id, field: 'all', previous: null, current: null, 
                                    action: 'create', user_id: data.ras_created_by, date: date });
        }

        return { result: 'success', message: 'Successfully saved!' }
    }

    update = async data => {
        let ras = (await new Builder(`tbl_physical_count_ras`).select().condition(`WHERE id= ${data.id}`).build()).rows[0];
        let rcs = (await new Builder(`tbl_physical_count_rcs`).select().condition(`WHERE physical_count_id= ${data.physical_count_id} AND item_id= ${data.item_id}`).build()).rows[0];
        let date = Global.date(new Date());
        let audits = [];

        if(Global.compare(ras.qty_mother_box, data.qty_mother_box)) {
            audits.push({ series_no: Global.randomizer(7), table_name: 'tbl_physical_count_ras', item_id: data.id, field: 'qty_mother_box', previous: ras.qty_mother_box,
                                    current: data.qty_mother_box, action: 'update', user_id: data.count_by, date: date });
        }

        if(Global.compare(ras.qty_per_mother_box, data.qty_per_mother_box)) {
            audits.push({ series_no: Global.randomizer(7), table_name: 'tbl_physical_count_ras', item_id: data.id, field: 'qty_per_mother_box', previous: ras.qty_per_mother_box,
                                    current: data.qty_per_mother_box, action: 'update', user_id: data.count_by, date: date });
        }

        if(Global.compare(ras.qty_small_box, data.qty_small_box)) {
            audits.push({ series_no: Global.randomizer(7), table_name: 'tbl_physical_count_ras', item_id: data.id, field: 'qty_small_box', previous: ras.qty_small_box,
                                    current: data.qty_small_box, action: 'update', user_id: data.count_by, date: date });
        }

        if(Global.compare(ras.qty_per_small_box, data.qty_per_small_box)) {
            audits.push({ series_no: Global.randomizer(7), table_name: 'tbl_physical_count_ras', item_id: data.id, field: 'qty_per_small_box', previous: ras.qty_per_small_box,
                                    current: data.qty_per_small_box, action: 'update', user_id: data.count_by, date: date });
        }

        if(Global.compare(ras.tingi, data.tingi)) {
            audits.push({ series_no: Global.randomizer(7), table_name: 'tbl_physical_count_ras', item_id: data.id, field: 'tingi', previous: ras.tingi,
                                    current: data.tingi, action: 'update', user_id: data.count_by, date: date });
        }

        if(Global.compare(ras.total, data.total)) {
            audits.push({ series_no: Global.randomizer(7), table_name: 'tbl_physical_count_ras', item_id: data.id, field: 'total', previous: ras.total,
                                    current: data.total, action: 'update', user_id: data.count_by, date: date });
        }

        if(Global.compare(ras.remarks, data.remarks)) {
            audits.push({ series_no: Global.randomizer(7), table_name: 'tbl_physical_count_ras', item_id: data.id, field: 'remarks', previous: ras.remarks,
                                    current: data.remarks !== '' ? (data.remarks).toUpperCase : '', action: 'update', user_id: data.count_by, date: date });
        }

        if(Global.compare(ras.comments, data.comments)) {
            audits.push({ series_no: Global.randomizer(7), table_name: 'tbl_physical_count_ras', item_id: data.id, field: 'comments', previous: ras.comments,
                                    current: data.comments !== '' ? (data.comments).toUpperCase : '', action: 'update', user_id: data.count_by, date: date });
        }
        
        await new Builder(`tbl_physical_count_ras`)
            .update(`qty_mother_box= ${data.qty_mother_box !== '' ? data.qty_mother_box : 0}, qty_per_mother_box= ${data.qty_per_mother_box !== '' ? data.qty_per_mother_box : 0},
                            qty_small_box= ${data.qty_small_box !== '' ? data.qty_small_box : 0}, qty_per_small_box= ${data.qty_per_small_box !== '' ? data.qty_per_small_box : 0},
                            tingi= ${data.tingi !== '' ? data.tingi : 0}, total= ${data.total !== '' ? data.total : 0}, 
                            remarks= ${data.remarks !== '' && data.remarks !== null ? `'${(data.remarks).toUpperCase()}'` : null},
                            comments= ${data.comments !== '' && data.comments !== null ? `'${(data.comments).toUpperCase()}'` : null},
                            date_counted= '${date}'`)
            .condition(`WHERE id= ${data.id}`)
            .build();
        audits.forEach(data => Global.audit(data));

        if(data.total === rcs.total) {
            await new Builder(`tbl_items`)
                .update(`mother_box= ${data.qty_mother_box !== '' ? data.qty_mother_box : 0}, qty_per_mother_box= ${data.qty_per_mother_box !== '' ? data.qty_per_mother_box : 0}, 
                                small_box= ${data.qty_small_box !== '' ? data.qty_small_box : 0}, qty_per_small_box= ${data.qty_per_small_box !== '' ? data.qty_per_small_box : 0}, 
                                tingi= ${data.tingi !== '' ? data.tingi : 0}, total= ${data.total !== '' ? data.total : 0}, updated_by= ${data.count_by}, date_updated= '${date}'`)
                .condition(`WHERE id= ${data.item_id}`)
                .build();
        }

        return { result: 'success', message: 'Successfully saved!' }
    }
}

module.exports = PhysicalCountRAS;