const Builder = require("../../function/builder"); // Query builder
const Global = require('../../function/global'); // Function

const audit = { series_no: '', table_name: 'tbl_physical_count_rcs',  item_id: 0, field: '', previous: null, current: null, action: '', user_id: 0, date: '' }; // Used for audit trail
class PhysicalCountRCS {
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
                            .insert({ columns: `series_no, brand_id, rack_id, item_code, mother_box, qty_per_mother_box, small_box, qty_per_small_box,
                                                            tingi, total, status, created_by, date_created`, 
                                            values: `'${(data.itm_series_no).toUpperCase()}', ${data.brand_id}, ${data.id}, '${(data.item_code).toUpperCase()}', 0, 0, 0, 0, 0, 0, 1,
                                                            ${data.rcs_created_by}, '${date}'` })
                            .condition(`RETURNING *`)
                            .build()).rows[0];

                Global.audit({ series_no: Global.randomizer(7), table_name: 'tbl_items', item_id: itm.id, field: 'all', previous: null, current: null, action: 'create', user_id: data.rcs_created_by, date: date });
            }
        }

        let rcs = await new Builder(`tbl_physical_count_rcs`).select().condition(`WHERE physical_count_id= ${data.physical_count_id} AND item_id= ${itm.id}`).build();

        // if(rcs.rowCount > 0) {
        //     await new Builder(`tbl_physical_count_rcs`)
        //         .update(``)
        //         .condition(`WHERE id= ${rcs[0].id}`);
        // }
        // else {

        // }
        // if(!((await new Builder(`tbl_physical_count_rcs`).select().condition(`WHERE physical_count_id= ${data.physical_count_id} AND item_id= ${itm.id}`).build()).rowCount > 0)) {
        //     await new Builder(`tbl_physical_count_rcs`)
        //         .update(`count_by= ${data.rcs}, assigned_by= ${data.rcs_created_by}, date_assigned= '${date}'`)
        //         .condition(`WHERE `)
        // }
        // else {

        // }

        // if(data.item_id !== null) {
            
        // }
        // else {
        //     if((await new Builder(`tbl_items`).select().condition(`WHERE item_code= '${data.item_code}'`).build()).rowCount > 0) {
        //         errors.push({ name: 'item_code', message: 'Item code already exist!' });
        //     }

        //     if(!(errors.length > 0)) {
        //         let itm = (await new Builder(`tbl_items`)
                                    // .insert({ columns: `series_no, brand_id, rack_id, item_code, mother_box, qty_per_mother_box, small_box, qty_per_small_box,
                                    //                                 tingi, total, status, created_by, date_created`, 
                                    //                 values: `'${(data.itm_series_no).toUpperCase()}', ${data.brand_id}, ${data.id}, '${(data.item_code).toUpperCase()}', 0, 0, 0, 0, 0, 0, 1,
                                    //                                 ${data.rcs_created_by}, '${date}'` })
        //                             .condition(`RETURNING id`)
        //                             .build()).rows[0];
            
        //         let rcs = (await new Builder(`tbl_physical_count_rcs`)
        //                         .insert({ columns: `physical_count_id, item_id, qty_mother_box, qty_per_mother_box, qty_small_box, qty_per_small_box, tingi, total,
        //                                                         count_by, assigned_by, date_assigned`, 
        //                                         values: `${data.physical_count_id}, ${itm.id}, 0, 0, 0, 0, 0, 0, ${data.rcs}, ${data.rcs_created_by}, '${date}'` })
        //                         .condition(`RETURNING id`)
        //                         .build()).rows[0];
        //         Global.audit({ series_no: Global.randomizer(7), table_name: 'tbl_physical_count_rcs', item_id: rcs.id, field: 'all', previous: null, current: null, action: 'create', user_id: data.rcs_created_by, date: date });
    
        //         return { result: 'success', message: 'Successfully saved!' }
        //     }
        //     else { return { result: 'error', error: errors } }
        // }
    }
}

module.exports = PhysicalCountRCS;
