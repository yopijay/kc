const Builder = require("../../function/builder"); // Query builder
const Global = require('../../function/global'); // Function

// Sub category
// Office furniture
const OfficeChair = require("./assets/office-furniture/OfficeChair");
const OfficeDesk = require("./assets/office-furniture/OfficeDesk");
const Whiteboard = require("./assets/office-furniture/Whiteboard");
const FilingCabinet = require("./assets/office-furniture/FilingCabinet");
// Technology
const SystemUnit = require("./assets/technology/SystemUnit");
const Laptop = require("./assets/technology/Laptop");
const Mouse = require("./assets/technology/Mouse");
const Keyboard = require("./assets/technology/Keyboard");
const Printer = require("./assets/technology/Printer");
const Monitor = require("./assets/technology/Monitor");
const NetworkingEquipment = require("./assets/technology/NetworkingEquipment");
const Harddrive = require("./assets/technology/Harddrive");
const Phone = require("./assets/technology/Phone");

const audit = { series_no: '', table_name: 'tbl_assets',  item_id: 0, field: '', previous: null, current: null, action: '', user_id: 0, date: '' }; // Used for audit trail
class Assets {
    series = async () => { return (await new Builder(`tbl_assets`).select(`COUNT(*)`).build()).rows; }

    assettag = async (data) => {
        return ((await new Builder(`tbl_assets`)
                                        .select()
                                        .condition(`WHERE category_id= ${data.category_id} AND sub_category_id= ${data.sub_category_id}`)
                                        .build()).rowCount).toString();
    }

    dashboard = async () => {
        return {
            total: (await new Builder(`tbl_assets`).select(`COUNT(*)`).build()).rows[0].count,
            released: (await new Builder(`tbl_assets`).select(`COUNT(*)`).condition(`WHERE is_released= 1`).build()).rows[0].count,
            vacant: (await new Builder(`tbl_assets`).select(`COUNT(*)`).condition(`WHERE is_released= 0`).build()).rows[0].count
        }
    }

    specific = async (id) => {
        return (await new Builder(`tbl_assets AS assts`)
                                        .select(`assts.*, info.*, sub.name AS item`)
                                        .join({ table: `tbl_assets_info AS info`, condition: `info.asset_id = assts.id`, type: `LEFT` })
                                        .join({ table: `tbl_sub_category AS sub`, condition: `assts.sub_category_id = sub.id`, type: `LEFT` })
                                        .condition(`WHERE assts.id = ${id}`)
                                        .build()).rows;
    }

    list = async (data) => {
        return (await new Builder(`tbl_assets AS assts`)
                                        .select(`assts.id, assts.series_no, ctgy.name AS category, sctgy.name AS sub_category, assts.asset_tag, assts.is_released, assts.status, 
                                                        CONCAT(cb.lname, ', ', cb.fname, ' ', cb.mname) AS created_by, assts.date_created`)
                                        .join({ table: `tbl_category AS ctgy`, condition: `assts.category_id = ctgy.id`, type: `LEFT` })
                                        .join({ table: `tbl_sub_category AS sctgy`, condition: `assts.sub_category_id = sctgy.id`, type: `LEFT` })
                                        .join({ table: `tbl_employee AS cb`, condition: `assts.created_by = cb.user_id`, type: `LEFT` })
                                        .condition(`${data.sub_category_id !== 'all' || data.searchtxt !== '' ? `WHERE ` : ''}
                                                            ${data.sub_category_id !== 'all' ? `assts.sub_category_id= ${data.sub_category_id} ` : ''}
                                                            ${data.sub_category_id !== 'all' && data.searchtxt !== '' ? `AND ` : ''}
                                                            ${data.searchtxt !== '' ? `(assts.series_no LIKE '%${(data.searchtxt).toUpperCase()}%' 
                                                                                                    OR assts.asset_tag LIKE '%${(data.searchtxt).toUpperCase()}%')` : ''}
                                                            ORDER BY assts.${data.orderby} ${(data.sort).toUpperCase()}`)
                                        .build()).rows;
    }

    excel = async (type, data) => {
        switch(type) {
            case 'formatted':
                switch(data.sub_category_name) {
                    case 'office-desks': return await new OfficeDesk().formatted(data);
                    case 'office-chairs': return await new OfficeChair().formatted(data);
                    case 'whiteboards': return await new Whiteboard().formatted(data);
                    case 'filing-cabinets': return await new FilingCabinet().formatted(data);
                    case 'system-unit':
                    case 'laptops':
                    case 'mouse':
                    case 'keyboard':
                    case 'printer':
                    case 'monitor':
                    case 'networking-equipments':
                    case 'harddrives':
                    case 'phones':
                    default: return [];
                }

            default: 
                switch(data.sub_category_name) {
                    case 'office-desks': return await new OfficeDesk().original(data);
                    case 'office-chairs': return await new OfficeChair().original(data);
                    case 'whiteboards': return await new Whiteboard().original(data);
                    case 'filing-cabinets': return await new FilingCabinet().original(data);
                    case 'system-unit':
                    case 'laptops':
                    case 'mouse':
                    case 'keyboard':
                    case 'printer':
                    case 'monitor':
                    case 'networking-equipments':
                    case 'harddrives':
                    case 'phones':
                    default: return [];
                }
        }
    }

    search = async (data) => {
        return (await new Builder(`tbl_assets AS assts`)
                                        .select(`assts.id, assts.series_no, ctgy.name AS category, sctgy.name AS sub_category, assts.asset_tag, assts.is_released, assts.status, 
                                                        CONCAT(cb.lname, ', ', cb.fname, ' ', cb.mname) AS created_by, assts.date_created`)
                                        .join({ table: `tbl_category AS ctgy`, condition: `assts.category_id = ctgy.id`, type: `LEFT` })
                                        .join({ table: `tbl_sub_category AS sctgy`, condition: `assts.sub_category_id = sctgy.id`, type: `LEFT` })
                                        .join({ table: `tbl_employee AS cb`, condition: `assts.created_by = cb.user_id`, type: `LEFT` })
                                        .condition(`WHERE (assts.series_no LIKE '%${(data.searchtxt).toUpperCase()}%' OR assts.asset_tag LIKE '%${(data.searchtxt).toUpperCase()}%')
                                                            ${data.sub_category_id !== 'all' ? ` AND assts.sub_category_id= ${data.sub_category_id} ` : ''}
                                                            ORDER BY assts.${data.orderby} ${(data.sort).toUpperCase()}`)
                                        .build()).rows;
    }

    save = async (data) => {
        switch(data.item) {
            // Start for Office Furniture Category
            case 'office-desks': return await new OfficeDesk().save(data);
            case 'office-chairs': return await new OfficeChair().save(data);
            case 'whiteboards': return await new Whiteboard().save(data);
            case 'filing-cabinets': return await new FilingCabinet().save(data);
            // End of Office furniture Category
            // Start of Technology Category
            case 'system-unit': return await new SystemUnit().save(data);
            case 'laptops': return await new Laptop().save(data);
            case 'mouse': return await new Mouse().save(data);
            case 'keyboard': return await new Keyboard().save(data);
            case 'printer': return await new Printer().save(data);
            case 'monitor': return await new Monitor().save(data);
            case 'networking-equipments': return await new NetworkingEquipment().save(data);
            case 'harddrives': return await new Harddrive().save(data);
            case 'phones': return await new Phone().save(data);
            // End of Technology Category
            default: return { result: 'maintenance', message: 'Unable to save! This module is under maintenance!' }
        }
    }

    update = async (data) => {
        switch(data.item) {
            // Start of Office furniture category
            case 'office-desks': return await new OfficeDesk().update(data);
            case 'office-chairs': return await new OfficeChair().update(data);
            case 'whiteboards': return await new Whiteboard().update(data);
            case 'filing-cabinets': return await new FilingCabinet().update(data);
            // End of Office furniture category
            // Start of Technology category
            case 'system-unit': return await new SystemUnit().update(data);
            case 'laptops': return await new Laptop().update(data);
            case 'mouse': return await new Mouse().update(data);
            case 'keyboard': return await new Keyboard().update(data);
            case 'printer': return await new Printer().update(data);
            case 'monitor': return await new Monitor().update(data);
            case 'networking-equipments': return await new NetworkingEquipment().update(data);
            case 'harddrives': return await new Harddrive().update(data);
            case 'phones': return await new Phone().update(data);
            // End of Technology category
            default: return { result: 'maintenance', message: 'Unable to save! This module is under maintenance!' }
        }
    }

    dropdown = async (data) => {
        return [];
    }
}

module.exports = Assets;