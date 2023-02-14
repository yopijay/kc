const Builder = require("../../function/builder"); // Query builder
const Global = require('../../function/global'); // Function

const audit = { series_no: '', table_name: 'tbl_assets',  item_id: 0, field: '', previous: null, current: null, action: '', user_id: 0, date: '' }; // Used for audit trail
class Assets {
    series = async () => { return (await new Builder(`tbl_assets`).select(`COUNT(*)`).build()).rows; }

    dashboard = async () => {
        return {
            total: (await new Builder(`tbl_assets`).select(`COUNT(*)`).build()).rows[0].count,
            released: (await new Builder(`tbl_assets`).select(`COUNT(*)`).condition(`WHERE is_released= 1`).build()).rows[0].count,
            vacant: (await new Builder(`tbl_assets`).select(`COUNT(*)`).condition(`WHERE is_released= 0`).build()).rows[0].count
        }
    }

    specific = async (id) => {
        return (await new Builder(`tbl_assets AS assts`)
                                        .select()
                                        .join({ table: `tbl_assets_info AS info`, condition: `info.assets_id = assts.id`, type: `LEFT` })
                                        .condition(`WHERE assts.id = ${id}`)
                                        .build()).rows;
    }

    list = async (data) => {
        return (await new Builder(`tbl_assets AS assts`)
                                        .select(`assts.id, assts.series_no, ctgy.name AS category, brd.name AS brand, assts.type, CONCAT(cb.lname, ', ', cb.fname, ' ', cb.mname) AS created_by,
                                                        info.serial_no, info.model, info.sku, assts.date_created`)
                                        .join({ table: `tbl_category AS ctgy`, condition: `assts.category_id = ctgy.id`, type: `LEFT` })
                                        .join({ table: `tbl_sub_category AS brd`, condition: `assts.sub_category_id = brd.id`, type: `LEFT` })
                                        .join({ table: `tbl_assets_info AS info`, condition: `info.assets_id = assts.id`, type: `LEFT` })
                                        .join({ table: `tbl_employee AS cb`, condition: `assts.created_by = cb.user_id`, type: `LEFT` })
                                        .condition(`${data.searchtxt !== '' ? `WHERE assts.series_no LIKE '%${data.searchtxt}%' OR assts.type LIKE '%${data.searchtxt}%'
                                                                OR info.serial_no LIKE '%${data.searchtxt}%' OR info.model LIKE '%${data.searchtxt}%' OR info.sku LIKE '%${data.searchtxt}%'` : ''}
                                                                ORDER BY assts.${data.category} ${(data.orderby).toUpperCase()}`)
                                        .build()).rows;
    }

    excel = async (type, data) => {
        switch(type) {
            case 'formatted':
                return (await new Builder(`tbl_assets AS assts`)
                                                .select(`assts.series_no AS "Series No.", CASE WHEN assts.status =1 THEN 'Active' ELSE 'Inactive' END AS "Status",
                                                                CONCAT(cb.lname, ', ', cb.fname, ' ', cb.mname) AS "Created by", assts.date_created AS "Date created", 
                                                                CONCAT(ub.lname, ', ', ub.fname, ' ', ub.mname) AS "Updated by", assts.date_updated AS "Date updated",
                                                                CONCAT(db.lname, ', ', db.fname, ' ', db.mname) AS "Deleted by", assts.date_deleted AS "Date deleted", 
                                                                CONCAT(ib.lname, ', ', ib.fname, ' ', ib.mname) AS "Imported by", assts.date_imported AS "Date imported"`)
                                                .join({ table: `tbl_category AS ctgy`, condition: `assts.category_id = ctgy.id`, type: `LEFT` })
                                                .join({ table: `tbl_sub_category AS brd`, condition: `assts.sub_category_id = brd.id`, type: `LEFT` })
                                                .join({ table: `tbl_assets_info AS info`, condition: `info.assets_id = assts.id`, type: `LEFT` })
                                                .join({ table: `tbl_employee AS cb`, condition: `cb.user_id = assts.created_by`, type: `LEFT` })
                                                .join({ table: `tbl_employee AS ub`, condition: `ub.user_id = assts.updated_by`, type: `LEFT` })
                                                .join({ table: `tbl_employee AS db`, condition: `db.user_id = assts.deleted_by`, type: `LEFT` })
                                                .join({ table: `tbl_employee AS ib`, condition: `ib.user_id = assts.imported_by`, type: `LEFT` })
                                                .condition(`WHERE assts.series_no LIKE '%${data.searchtxt}%' OR assts.type LIKE '%${data.searchtxt}%'
                                                                        OR info.serial_no LIKE '%${data.searchtxt}%' OR info.model LIKE '%${data.searchtxt}%' OR info.sku LIKE '%${data.searchtxt}%'
                                                                        ORDER BY assts.${data.category} ${(data.orderby).toUpperCase()}`)
                                                .build()).rows;
            default: return (await new Builder(`tbl_assets AS assts`)
                                                        .select()
                                                        .join({ table: `tbl_assets_info AS info`, condition: `info.assets_id = assts.id`, type: 'LEFT' })
                                                        .condition(`ORDER by ${data.category} ${(data.orderby).toUpperCase()}`)
                                                        .build()).rows;
        }
    }

    search = async (data) => {
        return (await new Builder(`tbl_assets AS assts`)
                                        .select(`assts.id, assts.series_no, ctgy.name AS category, brd.name AS brand, assts.type, CONCAT(cb.lname, ', ', cb.fname, ' ', cb.mname) AS created_by,
                                                        info.serial_no, info.model, info.sku, assts.date_created`)
                                        .join({ table: `tbl_category AS ctgy`, condition: `assts.category_id = ctgy.id`, type: `LEFT` })
                                        .join({ table: `tbl_sub_category AS brd`, condition: `assts.sub_category_id = brd.id`, type: `LEFT` })
                                        .join({ table: `tbl_assets_info AS info`, condition: `info.assets_id = assts.id`, type: `LEFT` })
                                        .join({ table: `tbl_employee AS cb`, condition: `assts.created_by = cb.user_id`, type: `LEFT` })
                                        .condition(`WHERE assts.series_no LIKE '%${data.searchtxt}%' OR assts.type LIKE '%${data.searchtxt}%'
                                                                OR info.serial_no LIKE '%${data.searchtxt}%' OR info.model LIKE '%${data.searchtxt}%' OR info.sku LIKE '%${data.searchtxt}%'
                                                                ORDER BY assts.${data.category} ${(data.orderby).toUpperCase()}`)
                                        .build()).rows;
    }

    save = async (data) => {
        return [];
    }

    update = async (data) => {
        return [];
    }

    dropdown = async (data) => {
        return [];
    }
}

module.exports = Assets;