const Builder = require("../../function/builder"); // Query builder
const Global = require('../../function/global'); // Function

const audit = { series_no: '', table_name: 'tbl_physical_count_ras',  item_id: 0, field: '', previous: null, current: null, action: '', user_id: 0, date: '' }; // Used for audit trail
class PhysicalCountRAS {
    specific = async data => {
        let itm = (await new Builder(`tbl_items AS itm`)
                            .select(`itm.id, itm.series_no, itm.brand_id, itm.rack_id, itm.item_code, brd.name AS brand, rck.branch, rck.floor`)
                            .join({ table: `tbl_brand AS brd`, condition: `itm.brand_id = brd.id`, type: `LEFT` })
                            .join({ table: `tbl_racks AS rck`, condition: `itm.rack_id = rck.id`, type: `LEFT` })
                            .condition(`WHERE itm.id= ${JSON.parse(data).id}`)
                            .build()).rows;
        let ras = await new Builder(`tbl_physical_count_ras`).select().condition(`WHERE physical_count_id= ${JSON.parse(data).physical_count_id} AND item_id= ${JSON.parse(data).id}`).build();

        itm[0]['qty_mother_box'] = ras.rowCount > 0 ? ras.rows[0].qty_mother_box : 0;
        itm[0]['qty_per_mother_box'] = ras.rowCount > 0 ? ras.rows[0].qty_per_mother_box : 0;
        itm[0]['qty_small_box'] = ras.rowCount > 0 ? ras.rows[0].qty_small_box : 0;
        itm[0]['qty_per_small_box'] = ras.rowCount > 0 ? ras.rows[0].qty_per_small_box : 0;
        itm[0]['tingi'] = ras.rowCount > 0 ? ras.rows[0].tingi : 0;
        itm[0]['total'] = ras.rowCount > 0 ? ras.rows[0].total : 0;
        itm[0]['remarks'] = ras.rowCount > 0 ? ras.rows[0].remarks : null;
        itm[0]['comments'] = ras.rowCount > 0 ? ras.rows[0].comments : 0;
        itm[0]['count_by'] = ras.rowCount > 0 ? ras.rows[0].count_by : null;
        itm[0]['date_counted'] = ras.rowCount > 0 ? ras.rows[0].date_counted : null;

        return itm;
    }

    list = async data => {
        let branch = { quezon_ave: 'qa', sto_domingo: 'sd', manila: 'ma' };
        let items = [];
        let brands = null;
        let query = '';

        if((JSON.parse(data.brands)).length > 0) { brands = JSON.parse(data.brands); }
        else { brands = (await new Builder(`tbl_brand`).select(`id AS brand_id, name AS brand_name`).condition(`WHERE status = 1`).build()).rows; }

        for(let count = 0; count < brands.length; count++) { query += `${count > 0 ? ' OR ' : ''}itm.brand_id= ${brands[count].brand_id}`; }
        
        let itm = (await new Builder(`tbl_items AS itm`)
                            .select(`itm.*`)
                            .join({ table: `tbl_racks AS rck`, condition: `itm.rack_id = rck.id`, type: `LEFT` })
                            .condition(`WHERE (${query}) AND rck.branch= '${branch[data.branch]}' ORDER BY itm.item_code DESC`)
                            .build()).rows;

        switch(data.type) {
            case 'admin':
                for(let count = 0; count < itm.length; count++) {
                    let item = (await new Builder(`tbl_physical_count_ras AS ras`)
                                        .select(`itm.id, itm.item_code, ras.date_counted, emp.fname, emp.lname, ras.count_by`)
                                        .join({ table: `tbl_items AS itm`, condition: `ras.item_id = itm.id`, type: `LEFT` })
                                        .join({ table: `tbl_employee AS emp`, condition: `ras.count_by = emp.user_id`, type: `LEFT` })
                                        .condition(`WHERE ras.physical_count_id= ${data.physical_count_id} AND ras.item_id= ${itm[count].id}`)
                                        .build()).rows[0];

                    if(item !== undefined) { items.push(item); }
                }

                return items;
            default:
                for(let count = 0; count < itm.length; count++) {
                    let item1 = (await new Builder(`tbl_items AS itm`)
                                        .select(`itm.id, itm.item_code, ras.count_by, ras.date_counted, ras.total, emp.fname, emp.lname, rck.branch, rck.floor, rck.code`)
                                        .join({ table: `tbl_physical_count_ras AS ras`, condition: `ras.item_id = itm.id`, type: `LEFT` })
                                        .join({ table: `tbl_employee AS emp`, condition: `emp.user_id = ras.count_by`, type: `LEFT` })
                                        .join({ table: `tbl_racks AS rck`, condition: `itm.rack_id = rck.id`, type: `LEFT` })
                                        .condition(`WHERE itm.id= ${itm[count].id} AND ras.count_by= ${data.user_id}`)
                                        .build()).rows[0];

                    let item2 = (await new Builder(`tbl_items AS itm`)
                                        .select(`itm.id, itm.item_code, des.count_by, des.date_counted, des.total, emp.fname, emp.lname, rck.branch, rck.floor, rck.code`)
                                        .join({ table: `tbl_physical_count_dis AS des`, condition: `des.item_id = itm.id`, type: `LEFT` })
                                        .join({ table: `tbl_employee AS emp`, condition: `emp.user_id = des.count_by`, type: `LEFT` })
                                        .join({ table: `tbl_racks AS rck`, condition: `itm.rack_id = rck.id`, type: `LEFT` })
                                        .condition(`WHERE itm.id= ${itm[count].id} AND des.count_by= ${data.user_id}`)
                                        .build()).rows[0];
                    
                    if(item1 !== undefined) { items.push(item1); }
                    if(item2 !== undefined) { items.push(item2); }
                }

                return items;
        }
    }

    save = async data => {
        let date = Global.date(new Date());
        let audits = [];

        let ras = (await new Builder(`tbl_physical_count_ras`).select().condition(`WHERE physical_count_id= ${data.physical_count_id} AND item_id= ${data.id}`).build()).rows[0];

        if(Global.compare(ras.count_by, data.count_by)) {
            audits.push({ series_no: Global.randomizer(7), table_name: 'tbl_physical_count_ras', item_id: ras.id, field: 'count_by', previous: ras.count_by,
                                    current: data.count_by, action: 'update', user_id: data.assigned_by, date: date });
        }
        
        await new Builder(`tbl_physical_count_ras`).update(`count_by= ${data.count_by}, assigned_by= ${data.assigned_by}, date_assigned= '${date}'`).condition(`WHERE id= ${ras.id}`).build();
        audits.forEach(data => Global.audit(data));
        return { result: 'success', message: 'Successfully assigned!' }
    }

    update = async data => {
        let date = Global.date(new Date());
        let audits = [];
        let ras = (await new Builder(`tbl_physical_count_ras`).select().condition(`WHERE physical_count_id= ${data.physical_count_id} AND item_id= ${data.id}`).build()).rows[0];
        let rcs = (await new Builder(`tbl_physical_count_rcs`).select().condition(`WHERE physical_count_id= ${data.physical_count_id} AND item_id= ${data.id}`).build()).rows[0];

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
                                    current: data.remarks !== '' ? (data.remarks).toUpperCase() : '', action: 'update', user_id: data.count_by, date: date });
        }

        if(Global.compare(ras.comments, data.comments)) {
            audits.push({ series_no: Global.randomizer(7), table_name: 'tbl_physical_count_ras', item_id: data.id, field: 'comments', previous: ras.comments,
                                    current: data.comments !== '' ? (data.comments).toUpperCase() : '', action: 'update', user_id: data.count_by, date: date });
        }
        
        await new Builder(`tbl_physical_count_ras`)
            .update(`qty_mother_box= ${data.qty_mother_box !== '' ? data.qty_mother_box : 0}, qty_per_mother_box= ${data.qty_per_mother_box !== '' ? data.qty_per_mother_box : 0},
                            qty_small_box= ${data.qty_small_box !== '' ? data.qty_small_box : 0}, qty_per_small_box= ${data.qty_per_small_box !== '' ? data.qty_per_small_box : 0},
                            tingi= ${data.tingi !== '' ? data.tingi : 0}, total= ${data.total !== '' ? data.total : 0}, 
                            remarks= ${data.remarks !== '' && data.remarks !== null ? `'${(data.remarks).toUpperCase()}'` : null},
                            comments= ${data.comments !== '' && data.comments !== null ? `'${(data.comments).toUpperCase()}'` : null},
                            date_counted= '${date}'`)
            .condition(`WHERE id= ${ras.id}`)
            .build();

        if(data.total === rcs.total) {
            await new Builder(`tbl_items`)
                .update(`mother_box= ${data.qty_mother_box !== '' ? data.qty_mother_box : 0}, qty_per_mother_box= ${data.qty_per_mother_box !== '' ? data.qty_per_mother_box : 0}, 
                                small_box= ${data.qty_small_box !== '' ? data.qty_small_box : 0}, qty_per_small_box= ${data.qty_per_small_box !== '' ? data.qty_per_small_box : 0}, 
                                tingi= ${data.tingi !== '' ? data.tingi : 0}, total= ${data.total !== '' ? data.total : 0}, updated_by= ${data.count_by}, date_updated= '${date}'`)
                .condition(`WHERE id= ${data.id}`)
                .build();
        }
        else {
            await new Builder(`tbl_physical_count_dis`)
                .insert({ columns: `physical_count_id, item_id, qty_mother_box, qty_per_mother_box, qty_small_box, qty_per_small_box, tingi, total`, 
                                values: `${data.physical_count_id}, ${data.id}, 0, 0, 0, 0, 0, 0` })
                .build();
        }

        audits.forEach(data => Global.audit(data));
        return { result: 'success', message: 'Successfully saved!' }
    }

    search = async data => {
        switch(data.type) {
            case 'admin':
                let pc = (await new Builder(`tbl_physical_count`).select().condition(`WHERE id= ${data.physical_count_id}`).build()).rows[0];
                let branch = { quezon_ave: 'qa', sto_domingo: 'sd', manila: 'ma' };
                let items = [];
                let brands = null;
                let query = '';
        
                if((JSON.parse(pc.brands)).length > 0) { brands = JSON.parse(pc.brands); }
                else { brands = (await new Builder(`tbl_brand`).select(`id AS brand_id, name AS brand_name`).condition(`WHERE status = 1`).build()).rows; }
        
                for(let count = 0; count < brands.length; count++) { query += `${count > 0 ? ' OR ': ''}itm.brand_id= ${brands[count].brand_id}`; }
        
                let itm = (await new Builder(`tbl_items AS itm`)
                                    .select(`itm.*`)
                                    .join({ table: `tbl_racks AS rck`, condition: `itm.rack_id = rck.id`, type: `LEFT` })
                                    .condition(`WHERE (${query}) AND rck.branch= '${branch[data.branch]}' ORDER BY itm.item_code DESC`)
                                    .build()).rows;

                for(let count = 0; count < itm.length; count++) {
                    let item = (await new Builder(`tbl_items AS itm`)
                                        .select(`itm.id, itm.item_code, ras.count_by, ras.date_counted, ras.total, emp.fname, emp.lname`)
                                        .join({ table: `tbl_physical_count_ras AS ras`, condition: `ras.item_id = itm.id`, type: `LEFT` })
                                        .join({ table: `tbl_employee AS emp`, condition: `emp.user_id = ras.count_by`, type: `LEFT` })
                                        .condition(`WHERE itm.id= ${itm[count].id} ${data.searchtxt !== '' ? `AND (itm.item_code LIKE '%${(data.searchtxt).toUpperCase()}%' 
                                                            OR emp.fname LIKE '%${(data.searchtxt).toUpperCase()}%' OR emp.lname LIKE '%${(data.searchtxt).toUpperCase()}%')` : ''}`)
                                        .build()).rows[0];

                    if(item !== undefined) { items.push(item); }
                }

                return items;
            default:
                return (await new Builder(`tbl_physical_count_ras AS ras`)
                                .select(`itm.id, itm.item_code, rck.branch, rck.floor, rck.code, ras.count_by, ras.date_counted, ras.total, emp.fname, emp.lname`)
                                .join({ table: `tbl_items AS itm`, condition: `ras.item_id = itm.id`, type: `LEFT` })
                                .join({ table: `tbl_racks AS rck`, condition: `itm.rack_id = rck.id`, type: `LEFT` })
                                .join({ table: `tbl_employee AS emp`, condition: `ras.count_by = emp.user_id`, type: `LEFT` })
                                .condition(`WHERE ras.physical_count_id= ${data.physical_count_id} AND ras.count_by= ${data.user_id}
                                                    ${data.searchtxt !== '' ? `AND (itm.item_code LIKE '%${(data.searchtxt).toUpperCase()}%'
                                                        OR emp.fname LIKE '%${(data.searchtxt).toUpperCase()}%' OR emp.lname LIKE '%${(data.searchtxt).toUpperCase()}%'
                                                        OR CONCAT(UPPER(rck.branch), UPPER(rck.floor), '-', rck.code) LIKE '%${data.searchtxt}%')` : ''}`)
                                .build()).rows;
        }
    }
}

module.exports = PhysicalCountRAS;