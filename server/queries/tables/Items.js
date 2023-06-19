const Builder = require("../../function/builder"); // Query builder
const Global = require('../../function/global'); // Function

const audit = { series_no: '', table_name: 'tbl_items',  item_id: 0, field: '', previous: null, current: null, action: '', user_id: 0, date: '' }; // Used for audit trail
class Items {
    series = async () => { return (await new Builder(`tbl_items`).select(`COUNT(*)`).build()).rows; }
    count = async (data) => {
        return (await new Builder(`tbl_items`).select(`COUNT(*)`).condition(`${data.brand_id !== undefined ? `WHERE brand_id= ${data.brand_id}` : ''}`).build()).rows[0].count; 
    }

    specific = async (id) => {
        return (await new Builder(`tbl_items AS itm`)
                        .select(`itm.*, rck.branch, rck.floor, rck.id AS rack_id, rcs.count_by AS rcs, ras.count_by AS ras, rcs.date_counted AS rcs_date,
                                        ras.date_counted AS ras_date, rcs.total AS rcs_total, ras.total AS ras_total`)
                        .join({ table: `tbl_racks AS rck`, condition: `itm.rack_id = rck.id`, type: `LEFT` })
                        .join({ table: `tbl_physical_count_rcs AS rcs`, condition: `rcs.item_id = itm.id`, type: `LEFT` })
                        .join({ table: `tbl_physical_count_ras AS ras`, condition: `ras.item_id = itm.id`, type: `LEFT` })
                        .condition(`WHERE itm.id= ${id}`)
                        .build()).rows
    }

    list = async (data) => {
        return (await new Builder(`tbl_items AS itm`)
                        .select(`itm.id, itm.series_no, brd.name AS brand, CONCAT(UPPER(rck.branch), UPPER(rck.floor), '-', rck.code) AS rack, itm.item_code, itm.uom, itm.total, itm.photo, itm.status`)
                        .join({ table: `tbl_brand AS brd`, condition: `itm.brand_id = brd.id`, type: `LEFT` })
                        .join({ table: `tbl_racks AS rck`, condition: `itm.rack_id = rck.id`, type: `LEFT` })
                        .condition(`${data.searchtxt !== '' ? `WHERE itm.series_no LIKE '%${(data.searchtxt).toUpperCase()}%'
                                            OR itm.item_code LIKE '%${(data.searchtxt).toUpperCase()}%'` : ''} ORDER BY itm.${data.orderby} ${(data.sort).toUpperCase()}`)
                        .build()).rows;
    }

    search = async (data) => {
        return (await new Builder(`tbl_items AS itm`)
                        .select(`itm.id, itm.series_no, brd.name AS brand, CONCAT(UPPER(rck.branch), UPPER(rck.floor), '-', rck.code) AS rack, itm.item_code, itm.uom, itm.total, itm.photo, itm.status`)
                        .join({ table: `tbl_brand AS brd`, condition: `itm.brand_id = brd.id`, type: `LEFT` })
                        .join({ table: `tbl_racks AS rck`, condition: `itm.rack_id = rck.id`, type: `LEFT` })
                        .condition(`${data.searchtxt !== '' ? `WHERE itm.item_code LIKE '%${(data.searchtxt).toUpperCase()}%' OR brd.name LIKE '%${(data.searchtxt).toUpperCase()}%'
                                                OR CONCAT(UPPER(rck.branch), UPPER(rck.floor), '-', rck.code) LIKE '%${data.searchtxt}%'` : '' } ORDER BY itm.${data.orderby} ${(data.sort).toUpperCase()}`)
                        .build()).rows;
    }

    save = async (data) => {
        let date = Global.date(new Date()); // Date
        let errors = [];

        if((await new Builder(`tbl_items`).select().condition(`WHERE series_no= '${(data.series_no).toUpperCase()}'`).build()).rowCount > 0) {
            errors.push({ name: 'series_no', message: 'Series number already used!' });
        }

        if((await new Builder(`tbl_items`).select().condition(`WHERE item_code= '${(data.item_code).toUpperCase()}' AND brand_id= ${data.brand_id}`).build()).rowCount > 0) {
            errors.push({ name: 'item_code', message: 'Item code already used!' });
        }

        if(!(errors.length > 0)) {
            let itm = (await new Builder(`tbl_items`)
                                .insert({ columns: `series_no, brand_id, rack_id, item_code, item_description, uom, mother_box, qty_per_mother_box,
                                                                small_box, qty_per_small_box, tingi, total, remarks, photo, status, created_by, date_created`, 
                                            values: `'${(data.series_no).toUpperCase()}', ${data.brand_id}, ${data.rack_id}, '${(data.item_code).toUpperCase()}', 
                                                            ${data.item_description !== '' ? `'${(data.item_description).toUpperCase()}'` : null}, '${data.uom}', ${data.mother_box},
                                                            ${data.qty_per_mother_box}, ${data.small_box}, ${data.qty_per_small_box}, ${data.tingi}, ${data.total},
                                                            ${data.remarks !== '' ? `'${(data.remarks).toUpperCase()}'` : null}, ${data.photo !== undefined ? `'${data.photo}'` : null},
                                                            ${data.status ? 1 : 0}, ${data.created_by}, '${date}'` })
                                .condition(`RETURNING id`)
                                .build()).rows[0];

            audit.series_no = Global.randomizer(7);
            audit.field = 'all',
            audit.item_id = itm.id;
            audit.action = 'create';
            audit.user_id = data.created_by;
            audit.date = date;

            Global.audit(audit);
            return { result: 'success', message: 'Successfully saved!' }
        }
        else { return { result: 'error', error: errors } }
    }

    update = async (data) => {
        let itm = (await new Builder(`tbl_items`).select().condition(`WHERE id= ${data.id}`).build()).rows[0];
        let date = Global.date(new Date());
        let audits = [];
        let errors = [];

        if(Global.compare(itm.brand_id, data.brand_id)) {
            if(!((await new Builder(`tbl_items`).select().condition(`WHERE brand_id= ${data.brand_id} AND item_code= '${data.item_code}'`).build()).rowCount > 0)) {
                audits.push({ series_no: Global.randomizer(7), table_name: 'tbl_items', item_id: itm.id, field: 'brand_id', previous: itm.brand_id, 
                                        current: data.brand_id, action: 'update', user_id: data.updated_by, date: date });
            }
            else { errors.push({ name: 'item_code', message: 'Item code already exist in this brand!' }); }
        }

        if(Global.compare(itm.rack_id, data.rack_id)) {
            audits.push({ series_no: Global.randomizer(7), table_name: 'tbl_items', item_id: itm.id, field: 'rack_id', previous: itm.rack_id, 
                                    current: data.rack_id, action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(itm.item_code, data.item_code)) {
            if(!((await new Builder(`tbl_items`).select().condition(`WHERE brand_id= ${data.brand_id} AND item_code= '${data.item_code}'`).build()).rowCount > 0)) {
                audits.push({ series_no: Global.randomizer(7), table_name: 'tbl_items', item_id: itm.id, field: 'brand_id', previous: itm.brand_id, 
                                        current: data.brand_id, action: 'update', user_id: data.updated_by, date: date });
            }
            else { errors.push({ name: 'item_code', message: 'Item code already exist!' }); }
        }

        if(Global.compare(itm.uom, data.uom)) {
            audits.push({ series_no: Global.randomizer(7), table_name: 'tbl_items', item_id: itm.id, field: 'uom', previous: itm.uom, 
                                    current: data.uom, action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(itm.total, data.total)) {
            audits.push({ series_no: Global.randomizer(7), table_name: 'tbl_items', item_id: itm.id, field: 'total', previous: itm.total, 
                                    current: data.total, action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(itm.mother_box, data.mother_box)) {
            audits.push({ series_no: Global.randomizer(7), table_name: 'tbl_items', item_id: itm.id, field: 'mother_box', previous: itm.mother_box, 
                                    current: data.mother_box, action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(itm.qty_per_mother_box, data.qty_per_mother_box)) {
            audits.push({ series_no: Global.randomizer(7), table_name: 'tbl_items', item_id: itm.id, field: 'qty_per_mother_box', previous: itm.qty_per_mother_box, 
                                    current: data.qty_per_mother_box, action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(itm.small_box, data.small_box)) {
            audits.push({ series_no: Global.randomizer(7), table_name: 'tbl_items', item_id: itm.id, field: 'small_box', previous: itm.small_box, 
                                    current: data.small_box, action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(itm.qty_per_small_box, data.qty_per_small_box)) {
            audits.push({ series_no: Global.randomizer(7), table_name: 'tbl_items', item_id: itm.id, field: 'qty_per_small_box', previous: itm.qty_per_small_box, 
                                    current: data.qty_per_small_box, action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(itm.tingi, data.tingi)) {
            audits.push({ series_no: Global.randomizer(7), table_name: 'tbl_items', item_id: itm.id, field: 'tingi', previous: itm.tingi, 
                                    current: data.tingi, action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(itm.item_description, data.item_description)) {
            audits.push({ series_no: Global.randomizer(7), table_name: 'tbl_items', item_id: itm.id, field: 'item_description', previous: itm.item_description, 
                                    current: data.item_description !== '' && data.item_description !== null ? (data.item_description).toUpperCase() : null, 
                                    action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(itm.remarks, data.remarks)) {
            audits.push({ series_no: Global.randomizer(7), table_name: 'tbl_items', item_id: itm.id, field: 'remarks', previous: itm.remarks, 
                                    current: data.remarks !== '' && data.remarks !== null ? (data.remarks).toUpperCase() : null, 
                                    action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(itm.status, data.status ? 1 : 0)) {
            audits.push({ series_no: Global.randomizer(7), table_name: 'tbl_items', item_id: itm.id, field: 'status', previous: itm.status, 
                current: data.status ? 1 : 0, action: 'update', user_id: data.updated_by, date: date });
        }

        if(!(errors.length > 0)) {
            await new Builder(`tbl_items`)
                .update(`brand_id= ${data.brand_id}, rack_id= ${data.rack_id}, item_code= '${(data.item_code).toUpperCase()}', 
                                item_description= ${data.item_description !== '' && data.item_description !== null ? `'${(data.item_description).toUpperCase()}'` : null},
                                uom= '${data.uom}', mother_box= ${data.mother_box}, qty_per_mother_box= ${data.qty_per_mother_box},
                                small_box= ${data.small_box}, qty_per_small_box= ${data.qty_per_small_box}, tingi= ${data.tingi}, total= ${data.total},
                                remarks= ${data.remarks !== '' && data.remarks !== null ? `'${(data.remarks).toUpperCase()}'` : null}, photo= ${data.photo !== null ? `'${data.photo}'` : null}, 
                                status= ${data.status ? 1 : 0}, updated_by= ${data.updated_by}, date_updated= '${date}'`)
                .condition(`WHERE id= ${itm.id}`)
                .build();
                
            audits.forEach(item => Global.audit(item));
            return { result: 'success', message: 'Successfully updated!' }
        }
        else { return { result: 'error', error: errors } }
    }
}

module.exports = Items;