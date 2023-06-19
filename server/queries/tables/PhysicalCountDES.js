const Builder = require("../../function/builder"); // Query builder
const Global = require('../../function/global'); // Function

const audit = { series_no: '', table_name: 'tbl_physical_count_des',  item_id: 0, field: '', previous: null, current: null, action: '', user_id: 0, date: '' }; // Used for audit trail
class PhysicalCountDES {
    list = async data => {
        return (await new Builder(`tbl_physical_count_des AS des`)
                        .select(`itm.id, itm.item_code, des.date_counted, emp.fname, emp.lname, des.count_by`)
                        .join({ table: `tbl_items AS itm`, condition: `des.item_id = itm.id`, type: `LEFT` })
                        .join({ table: `tbl_employee AS emp`, condition: `des.count_by = emp.user_id`, type: `LEFT` })
                        .condition(`WHERE des.physical_count_id= ${data.physical_count_id}`)
                        .build()).rows;
    }

    specific = async data => {
        let itm = (await new Builder(`tbl_items AS itm`)
                            .select(`itm.id, itm.series_no, itm.brand_id, itm.rack_id, itm.item_code, brd.name AS brand, rck.branch, rck.floor`)
                            .join({ table: `tbl_brand AS brd`, condition: `itm.brand_id = brd.id`, type: `LEFT` })
                            .join({ table: `tbl_racks AS rck`, condition: `itm.rack_id = rck.id`, type: `LEFT` })
                            .condition(`WHERE itm.id= ${JSON.parse(data).id}`)
                            .build()).rows;
        let ras = await new Builder(`tbl_physical_count_ras`).select().condition(`WHERE physical_count_id= ${JSON.parse(data).physical_count_id} AND item_id= ${JSON.parse(data).id}`).build();
        let des = await new Builder(`tbl_physical_count_des`).select().condition(`WHERE physical_count_id= ${JSON.parse(data).physical_count_id} AND item_id= ${JSON.parse(data).id}`).build();
        
        itm[0]['qty_mother_box'] = des.rowCount > 0 ? des.rows[0].qty_mother_box : ras.rowCount > 0 ? ras.rows[0].qty_mother_box : 0;
        itm[0]['qty_per_mother_box'] = des.rowCount > 0 ? des.rows[0].qty_per_mother_box : ras.rowCount > 0 ? ras.rows[0].qty_per_mother_box : 0;
        itm[0]['qty_small_box'] = des.rowCount > 0 ? des.rows[0].qty_small_box : ras.rowCount > 0 ? ras.rows[0].qty_small_box : 0;
        itm[0]['qty_per_small_box'] = des.rowCount > 0 ? des.rows[0].qty_per_small_box : ras.rowCount > 0 ? ras.rows[0].qty_per_small_box : 0;
        itm[0]['tingi'] = des.rowCount > 0 ? des.rows[0].tingi : ras.rowCount > 0 ? ras.rows[0].tingi : 0;
        itm[0]['total'] = des.rowCount > 0 ? des.rows[0].total : ras.rowCount > 0 ? ras.rows[0].total : 0;
        itm[0]['remarks'] = des.rowCount > 0 ? des.rows[0].remarks : ras.rowCount > 0 ? ras.rows[0].remarks : null;
        itm[0]['comments'] = des.rowCount > 0 ? des.rows[0].comments : ras.rowCount > 0 ? ras.rows[0].comments : null;
        itm[0]['count_by'] = des.rowCount > 0 ? des.rows[0].count_by : ras.rowCount > 0 ? ras.rows[0].count_by : null;
        itm[0]['date_counted'] = des.rowCount > 0 ? des.rows[0].date_counted : ras.rowCount > 0 ? ras.rows[0].date_counted : null;
        itm[0]['form'] = des.rowCount > 0 ? 'des' : 'ras';

        return itm;
    }

    save = async data => {
        let date = Global.date(new Date());
        let audits = [];
        let errors = [];

        if((await new Builder(`tbl_physical_count_ras`)
                .select()
                .condition(`WHERE item_id= ${data.id} AND physical_count_id= ${data.physical_count_id} AND count_by= ${data.count_by}`)
                .build()).rowCount > 0) {
            errors.push({ name: 'count_by', message: 'This counter can no longer be used. Please choose another counter!' });
        }

        if(!(errors.length > 0)) {
            let des = (await new Builder(`tbl_physical_count_des`).select().condition(`WHERE physical_count_id= ${data.physical_count_id} AND item_id= ${data.id}`).build()).rows[0];

            if(Global.compare(des.count_by, data.count_by)) {
                audits.push({ series_no: Global.randomizer(7), table_name: 'tbl_physical_count_des', item_id: des.id, field: 'count_by', previous: des.count_by,
                                        current: data.count_by, action: 'update', user_id: data.assigned_by, date: date });
            }

            await new Builder(`tbl_physical_count_des`).update(`count_by= ${data.count_by}, assigned_by= ${data.assigned_by}, date_assigned= '${date}'`).condition(`WHERE id= ${des.id}`).build();
            audits.forEach(data => Global.audit(data));
            return { result: 'success', message: 'Successfully assigned!' }
        }
        else { return { result: 'error', error: errors } }
    }

    update = async data => {
        let des = (await new Builder(`tbl_physical_count_des`).select().condition(`WHERE physical_count_id= ${data.physical_count_id} AND item_id= ${data.id}`).build()).rows[0];
        let date = Global.date(new Date());
        let audits = [];

        if(Global.compare(des.qty_mother_box, data.qty_mother_box)) {
            audits.push({ series_no: Global.randomizer(7), table_name: 'tbl_physical_count_des', item_id: data.id, field: 'qty_mother_box', previous: des.qty_mother_box,
                                    current: data.qty_mother_box, action: 'update', user_id: data.count_by, date: date });
        }

        if(Global.compare(des.qty_per_mother_box, data.qty_per_mother_box)) {
            audits.push({ series_no: Global.randomizer(7), table_name: 'tbl_physical_count_des', item_id: data.id, field: 'qty_per_mother_box', previous: des.qty_per_mother_box,
                                    current: data.qty_per_mother_box, action: 'update', user_id: data.count_by, date: date });
        }

        if(Global.compare(des.qty_small_box, data.qty_small_box)) {
            audits.push({ series_no: Global.randomizer(7), table_name: 'tbl_physical_count_des', item_id: data.id, field: 'qty_small_box', previous: des.qty_small_box,
                                    current: data.qty_small_box, action: 'update', user_id: data.count_by, date: date });
        }

        if(Global.compare(des.qty_per_small_box, data.qty_per_small_box)) {
            audits.push({ series_no: Global.randomizer(7), table_name: 'tbl_physical_count_des', item_id: data.id, field: 'qty_per_small_box', previous: des.qty_per_small_box,
                                    current: data.qty_per_small_box, action: 'update', user_id: data.count_by, date: date });
        }

        if(Global.compare(des.tingi, data.tingi)) {
            audits.push({ series_no: Global.randomizer(7), table_name: 'tbl_physical_count_des', item_id: data.id, field: 'tingi', previous: des.tingi,
                                    current: data.tingi, action: 'update', user_id: data.count_by, date: date });
        }

        if(Global.compare(des.total, data.total)) {
            audits.push({ series_no: Global.randomizer(7), table_name: 'tbl_physical_count_des', item_id: data.id, field: 'total', previous: des.total,
                                    current: data.total, action: 'update', user_id: data.count_by, date: date });
        }

        if(Global.compare(des.remarks, data.remarks)) {
            audits.push({ series_no: Global.randomizer(7), table_name: 'tbl_physical_count_des', item_id: data.id, field: 'remarks', previous: des.remarks,
                                    current: data.remarks !== '' ? (data.remarks).toUpperCase() : '', action: 'update', user_id: data.count_by, date: date });
        }

        if(Global.compare(des.comments, data.comments)) {
            audits.push({ series_no: Global.randomizer(7), table_name: 'tbl_physical_count_des', item_id: data.id, field: 'comments', previous: des.comments,
                                    current: data.comments !== '' ? (data.comments).toUpperCase() : '', action: 'update', user_id: data.count_by, date: date });
        }
        
        await new Builder(`tbl_physical_count_des`)
            .update(`qty_mother_box= ${data.qty_mother_box !== '' ? data.qty_mother_box : 0}, qty_per_mother_box= ${data.qty_per_mother_box !== '' ? data.qty_per_mother_box : 0},
                            qty_small_box= ${data.qty_small_box !== '' ? data.qty_small_box : 0}, qty_per_small_box= ${data.qty_per_small_box !== '' ? data.qty_per_small_box : 0},
                            tingi= ${data.tingi !== '' ? data.tingi : 0}, total= ${data.total !== '' ? data.total : 0}, 
                            remarks= ${data.remarks !== '' && data.remarks !== null ? `'${(data.remarks).toUpperCase()}'` : null},
                            comments= ${data.comments !== '' && data.comments !== null ? `'${(data.comments).toUpperCase()}'` : null},
                            date_counted= '${date}'`)
            .condition(`WHERE id= ${des.id}`)
            .build();

        await new Builder(`tbl_items`)
            .update(`mother_box= ${data.qty_mother_box !== '' ? data.qty_mother_box : 0}, qty_per_mother_box= ${data.qty_per_mother_box !== '' ? data.qty_per_mother_box : 0}, 
                            small_box= ${data.qty_small_box !== '' ? data.qty_small_box : 0}, qty_per_small_box= ${data.qty_per_small_box !== '' ? data.qty_per_small_box : 0}, 
                            tingi= ${data.tingi !== '' ? data.tingi : 0}, total= ${data.total !== '' ? data.total : 0}, updated_by= ${data.count_by}, date_updated= '${date}'`)
            .condition(`WHERE id= ${data.id}`)
            .build();

        audits.forEach(data => Global.audit(data));
        return { result: 'success', message: 'Successfully saved!' }
    }
}

module.exports = PhysicalCountDES;