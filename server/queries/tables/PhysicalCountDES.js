const Builder = require("../../function/builder"); // Query builder
const Global = require('../../function/global'); // Function

const audit = { series_no: '', table_name: 'tbl_physical_count_des',  item_id: 0, field: '', previous: null, current: null, action: '', user_id: 0, date: '' }; // Used for audit trail
class PhysicalCountDES {
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
                    let item = (await new Builder(`tbl_items AS itm`)
                                        .select(`itm.id, itm.item_code, des.count_by, des.date_counted, des.total, emp.fname, emp.lname`)
                                        .join({ table: `tbl_physical_count_des AS des`, condition: `des.item_id = itm.id`, type: `LEFT` })
                                        .join({ table: `tbl_employee AS emp`, condition: `emp.user_id = des.count_by`, type: `LEFT` })
                                        .condition(`WHERE itm.id= ${itm[count].id}`)
                                        .build()).rows[0];
                    
                    items.push(item);
                }

                return items;
            default:
                for(let count = 0; count < itm.length; count++) {
                    let item = (await new Builder(`tbl_items AS itm`)
                                        .select(`itm.id, itm.item_code, des.count_by, des.date_counted, des.total, emp.fname, emp.lname, rck.branch, rck.floor, rck.code`)
                                        .join({ table: `tbl_physical_count_des AS des`, condition: `des.item_id = itm.id`, type: `LEFT` })
                                        .join({ table: `tbl_employee AS emp`, condition: `emp.user_id = des.count_by`, type: `LEFT` })
                                        .join({ table: `tbl_racks AS rck`, condition: `itm.rack_id = rck.id`, type: `LEFT` })
                                        .condition(`WHERE itm.id= ${itm[count].id} AND des.count_by= ${data.user_id}`)
                                        .build()).rows[0];
                    
                    if(item !== undefined) { items.push(item); }
                }

                return items;
        }
    }
}

module.exports = PhysicalCountDES;