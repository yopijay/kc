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
                    case 'system-unit': return await new SystemUnit().formatted(data);
                    case 'laptops': return await new Laptop().formatted(data);
                    case 'mouse': return await new Mouse().formatted(data);
                    case 'keyboard': return await new Keyboard().formatted(data);
                    case 'printer': return await new Printer().formatted(data);
                    case 'monitor': return await new Monitor().formatted(data);
                    case 'networking-equipments': return await new NetworkingEquipment().formatted(data);
                    case 'harddrives': return await new Harddrive().formatted(data);
                    case 'phones': return await new Phone().formatted(data);
                    default: 
                        return (await new Builder(`tbl_assets AS assts`)
                                                            .select(`assts.series_no AS "Series No.", info.serial_no AS "Serial no.", assts.asset_tag AS "Asset Tag", info.brand AS "Brand", info.model AS "Model",
                                                                            info.color AS "Color", info.weight AS "Weight", info.dimension AS "Dimension", info.appearance AS "Appearance", 
                                                                            info.with_sidetable AS "W/ Sidetable", info.with_armrest AS "W/ Armrest", info.assembly_required AS "Assembly required", 
                                                                            info.mount_type AS "Mount type", info.no_of_drawers AS "No. of drawers", info.os AS "Operating system", info.processor AS "Processor",
                                                                            info.video_card AS "Video card", info.ram AS "RAM", info.hdd AS "HDD", info.ssd AS "SSD",
                                                                            info.input_connectivity AS "Input Connectivity", info.resolution AS "Resolution", info.interface AS "Interface", info.orientation AS "Orientation",
                                                                            info.dpi AS "DPI", info.no_of_keys AS "No. of Keys", info.printer_type AS "Printer type", info.screen_size AS "Screen size", 
                                                                            info.aspect_ratio AS "Aspect ratio", info.refresh_rate AS "Refresh rate", info.equipment_type AS "Equipment type", 
                                                                            info.no_of_ports AS "No. of ports", info.data_transfer AS "Data transfer", info.frequency AS "Frequency", info.tool AS "Tool",
                                                                            info.stock AS "Stock", info.capacity AS "Capacity", info.extension AS "Extension", info.date_purchased AS "Date purchased", 
                                                                            info.warranty AS "Warranty", CASE WHEN assts.is_released = 1 THEN 'Released' ELSE 'Vacant' END AS "Is Released", 
                                                                            CASE WHEN assts.status = 1 THEN 'Active' ELSE 'Inactive' END AS "Status",
                                                                            CONCAT(cb.lname, ', ', cb.fname, ' ', cb.mname) AS "Created by", assts.date_created AS "Date created",
                                                                            CONCAT(ub.lname, ', ', ub.fname, ' ', ub.mname) AS "Updated by", assts.date_updated AS "Date updated",
                                                                            CONCAT(db.lname, ', ', db.fname, ' ', db.mname) AS "Deleted by", assts.date_deleted AS "Date deleted",
                                                                            CONCAT(ib.lname, ', ', ib.fname, ' ', ib.mname) AS "Imported by", assts.date_imported AS "Date imported"`)
                                                            .join({ table: `tbl_assets_info AS info`, condition: `info.asset_id = assts.id`, type: `LEFT` })
                                                            .join({ table: `tbl_employee AS cb`, condition: `cb.user_id = assts.created_by`, type: `LEFT` })
                                                            .join({ table: `tbl_employee AS ub`, condition: `ub.user_id = assts.updated_by`, type: `LEFT` })
                                                            .join({ table: `tbl_employee AS db`, condition: `db.user_id = assts.deleted_by`, type: `LEFT` })
                                                            .join({ table: `tbl_employee AS ib`, condition: `ib.user_id = assts.imported_by`, type: `LEFT` })
                                                            .condition(`${data.sub_category_id !== 'all' ? `WHERE assts.sub_category_id= ${data.sub_category_id}` : '' }
                                                                                ${data.searchtxt !== '' ? `AND (assts.series_no LIKE '%${(data.searchtxt).toUpperCase()}%' 
                                                                                                                        OR assts.asset_tag LIKE '%${(data.searchtxt).toUpperCase()}%')` : ''}
                                                                                ORDER BY assts.${data.orderby} ${(data.sort).toUpperCase()}`)
                                                            .build()).rows;
                }

            default: 
                switch(data.sub_category_name) {
                    case 'office-desks': return await new OfficeDesk().original(data);
                    case 'office-chairs': return await new OfficeChair().original(data);
                    case 'whiteboards': return await new Whiteboard().original(data);
                    case 'filing-cabinets': return await new FilingCabinet().original(data);
                    case 'system-unit': return await new SystemUnit().original(data);
                    case 'laptops': return await new Laptop().original(data);
                    case 'mouse': return await new Mouse().original(data);
                    case 'keyboard': return await new Keyboard().original(data);
                    case 'printer': return await new Printer().original(data);
                    case 'monitor': return await new Monitor().original(data);
                    case 'networking-equipments': return await new NetworkingEquipment().original(data);
                    case 'harddrives': return await new Harddrive().original(data);
                    case 'phones': return await new Phone().original(data);
                    default: 
                        return (await new Builder(`tbl_assets AS assts`)
                                                        .select(`assts.id, assts.series_no, assts.category_id, assts.sub_category_id, info.serial_no, assts.asset_tag, info.brand, info.model,
                                                                        info.color, info.weight, info.dimension, info.appearance, info.with_sidetable, info.with_armrest, info.assembly_required, 
                                                                        info.mount_type, info.no_of_drawers, info.os, info.processor, info.video_card, info.ram, info.hdd, info.ssd, info.input_connectivity,
                                                                        info.resolution, info.interface, info.orientation, info.dpi, info.no_of_keys, info.printer_type, info.screen_size, info.aspect_ratio,
                                                                        info.refresh_rate, info.equipment_type, info.no_of_ports, info.data_transfer, info.frequency, info.tool, info.stock, info.capacity,
                                                                        info.extension, info.date_purchased, info.warranty, assts.is_released, assts.status, assts.created_by, assts.updated_by, 
                                                                        assts.deleted_by, assts.imported_by, assts.date_created, assts.date_updated, assts.date_deleted, assts.date_imported`)
                                                        .join({ table: `tbl_assets_info AS info`, condition: `info.asset_id = assts.id`, type: `LEFT` })
                                                        .join({ table: `tbl_employee AS cb`, condition: `cb.user_id = assts.created_by`, type: `LEFT` })
                                                        .join({ table: `tbl_employee AS ub`, condition: `ub.user_id = assts.updated_by`, type: `LEFT` })
                                                        .join({ table: `tbl_employee AS db`, condition: `db.user_id = assts.deleted_by`, type: `LEFT` })
                                                        .join({ table: `tbl_employee AS ib`, condition: `ib.user_id = assts.imported_by`, type: `LEFT` })
                                                        .condition(`${data.sub_category_id !== 'all' ? `WHERE assts.sub_category_id= ${data.sub_category_id}` : '' }
                                                                            ${data.searchtxt !== '' ? `AND (assts.series_no LIKE '%${(data.searchtxt).toUpperCase()}%' 
                                                                                                                    OR assts.asset_tag LIKE '%${(data.searchtxt).toUpperCase()}%')` : ''}
                                                                            ORDER BY assts.${data.orderby} ${(data.sort).toUpperCase()}`)
                                                        .build()).rows;
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