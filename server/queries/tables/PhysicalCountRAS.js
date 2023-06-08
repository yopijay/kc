const Builder = require("../../function/builder"); // Query builder
const Global = require('../../function/global'); // Function

const audit = { series_no: '', table_name: 'tbl_physical_count_ras',  item_id: 0, field: '', previous: null, current: null, action: '', user_id: 0, date: '' }; // Used for audit trail
class PhysicalCountRAS {
    list = async data => {
        let branch = { quezon_ave: 'qa', sto_domingo: 'sd', manila: 'ma' };
        
        switch(data.type) {
            case 'admin':
                return (await new Builder(`tbl_physical_count_rcs AS rcs`)
                                .select(`rcs.id, itm.item_code, emp.fname, emp.lname, rcs.date_counted`)
                                .join({ table: `tbl_items AS itm`, condition: `rcs.item_id = itm.id`, type: `LEFT` })
                                .join({ table: `tbl_racks AS rck`, condition: `itm.rack_id = rck.id`, type: `LEFT` })
                                .join({ table: `tbl_employee AS emp`, condition: `rcs.count_by = emp.user_id`, type: `LEFT` })
                                .condition(`WHERE rcs.physical_count_id= ${data.physical_count_id} AND rck.branch= '${branch[data.branch]}'`)
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
        console.log(data);
    }
}

module.exports = PhysicalCountRAS;