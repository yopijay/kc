const Builder = require("../../function/builder"); // Query builder
const Global = require('../../function/global'); // Function

const audit = { series_no: '', table_name: 'tbl_brand',  item_id: 0, field: '', previous: null, current: null, action: '', user_id: 0, date: '' }; // Used for audit trail
class Assets {
    series = async () => { return (await new Builder(`tbl_assets`).select(`COUNT(*)`).build()).rows; }

    dashboard = async () => {
        return [];
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
                                        .join({ table: `tbl_brand AS brd`, condition: `assts.brand_id = brd.id`, type: `LEFT` })
                                        .join({ table: `tbl_assets_info AS info`, condition: `info.assets_id = assts.id`, type: `LEFT` })
                                        .join({ table: `tbl_employee AS cb`, condition: `assts.created_by = cb.user_id`, type: `LEFT` })
                                        .condition(`${data.searchtxt !== '' ? `WHERE assts.series_no LIKE '%${data.searchtxt}%' OR assts.type LIKE '%${data.searchtxt}%'
                                                                OR info.serial_no LIKE '%${data.searchtxt}%' OR info.model LIKE '%${data.searchtxt}%' OR info.sku LIKE '%${data.searchtxt}%'` : ''}
                                                                ORDER BY assts.${data.category} ${(data.orderby).toUpperCase()}`)
                                        .build()).rows;
    }

    excel = async (type, data) => {
        return [];
    }

    search = async (data) => {
        return [];
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