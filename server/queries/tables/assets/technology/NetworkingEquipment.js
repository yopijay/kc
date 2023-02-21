const Builder = require("../../../../function/builder") // Query builder
const Global = require("../../../../function/global"); // Global functions

const audit = { series_no: '', table_name: 'tbl_assets',  item_id: 0, field: '', previous: null, current: null, action: '', user_id: 0, date: '' }; // Used for audit trail
class NetworkingEquipment {
    formatted = async (data) => {
        return (await new Builder(`tbl_assets AS assts`)
                                        .select(`assts.series_no AS "Series No.", info.serial_no AS "Serial no.", assts.asset_tag AS "Asset Tag", info.brand AS "Brand", info.model AS "Model",
                                                        info.equipment_type AS "Equipment type", info.no_of_ports AS "No. of Ports", info.data_transfer AS "Data transfer", info.frequency AS "Frequency",
                                                        info.tool AS "Tool", info.stock AS "Stock", info.date_purchased AS "Date purchased", 
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
                                        .condition(`WHERE assts.sub_category_id= ${data.sub_category_id}
                                                            ${data.searchtxt !== '' ? `AND (assts.series_no LIKE '%${(data.searchtxt).toUpperCase()}%' 
                                                                                                    OR assts.asset_tag LIKE '%${(data.searchtxt).toUpperCase()}%')` : ''}
                                                            ORDER BY assts.${data.orderby} ${(data.sort).toUpperCase()}`)
                                        .build()).rows;
    }

    original = async (data) => {
        return (await new Builder(`tbl_assets AS assts`)
                                        .select(`assts.id, assts.series_no, assts.category_id, assts.sub_category_id, info.serial_no, assts.asset_tag, info.brand, info.model,
                                                        info.equipment_type, info.no_of_ports, info.data_transfer, info.frequency, info.tool, info.stock,
                                                        info.date_purchased, info.warranty, assts.is_released, assts.status, assts.created_by, assts.updated_by, assts.deleted_by, 
                                                        assts.imported_by, assts.date_created, assts.date_updated, assts.date_deleted, assts.date_imported`)
                                        .join({ table: `tbl_assets_info AS info`, condition: `info.asset_id = assts.id`, type: `LEFT` })
                                        .join({ table: `tbl_employee AS cb`, condition: `cb.user_id = assts.created_by`, type: `LEFT` })
                                        .join({ table: `tbl_employee AS ub`, condition: `ub.user_id = assts.updated_by`, type: `LEFT` })
                                        .join({ table: `tbl_employee AS db`, condition: `db.user_id = assts.deleted_by`, type: `LEFT` })
                                        .join({ table: `tbl_employee AS ib`, condition: `ib.user_id = assts.imported_by`, type: `LEFT` })
                                        .condition(`WHERE assts.sub_category_id= ${data.sub_category_id}
                                                            ${data.searchtxt !== '' ? `AND (assts.series_no LIKE '%${(data.searchtxt).toUpperCase()}%' 
                                                                                                    OR assts.asset_tag LIKE '%${(data.searchtxt).toUpperCase()}%')` : ''}
                                                            ORDER BY assts.${data.orderby} ${(data.sort).toUpperCase()}`)
                                        .build()).rows;
    }
    
    save = async (data) => {
        let date = Global.date(new Date());
        let errors = [];

        let assets = (await new Builder(`tbl_assets`)
                                                        .insert({ columns: `series_no, category_id, sub_category_id, asset_tag, is_released, status, created_by, date_created`, 
                                                                        values: `'${(data.series_no).toUpperCase()}', ${data.category_id}, ${data.sub_category_id}, '${(data.asset_tag).toUpperCase()}',
                                                                                        0, ${data.status ? 1 : 0}, ${data.created_by}, '${date}'` })
                                                        .condition(`RETURNING id`)
                                                        .build()).rows[0];
        if(!(errors.length > 0)) {
            switch(data.equipment_type) {
                case 'switch':
                    await new Builder(`tbl_assets_info`)
                                        .insert({ columns: `asset_id, brand, color, serial_no, model, warranty, date_purchased, equipment_type, no_of_ports`, 
                                                        values: `${assets.id}, ${data.brand !== '' ? `'${(data.brand).toUpperCase()}'` : null}, ${data.color !== '' ? `'${(data.color).toUpperCase()}'` : null},
                                                                        ${data.serial_no !== '' ? `'${(data.serial_no).toUpperCase()}'` : null}, ${data.model !== '' ? `'${(data.model).toUpperCase()}'` : null}, 
                                                                        ${data.warranty !== '' ? data.warranty : null}, '${data.date_purchased}', '${data.equipment_type}', 
                                                                        ${data.no_of_ports !== '' ? data.no_of_ports : null}` })
                                        .build();
                    break;
                case 'router':
                    await new Builder(`tbl_assets_info`)
                                        .insert({ columns: `asset_id, brand, color, serial_no, model, warranty, date_purchased, equipment_type, no_of_ports, data_transfer, frequency`, 
                                                        values: `${assets.id}, ${data.brand !== '' ? `'${(data.brand).toUpperCase()}'` : null}, ${data.color !== '' ? `'${(data.color).toUpperCase()}'` : null},
                                                                        ${data.serial_no !== '' ? `'${(data.serial_no).toUpperCase()}'` : null}, ${data.model !== '' ? `'${(data.model).toUpperCase()}'` : null}, 
                                                                        ${data.warranty !== '' ? data.warranty : null}, '${data.date_purchased}', '${data.equipment_type}', 
                                                                        ${data.no_of_ports !== '' ? data.no_of_ports : null}, ${data.data_transfer !== '' ? `'${(data.data_transfer).toUpperCase()}'` : null}, 
                                                                        ${data.frequency !== '' ? `'${(data.frequency).toUpperCase()}'` : null}` })
                                        .build();
                    break;
                case 'tools':
                    await new Builder(`tbl_assets_info`)
                                        .insert({ columns: `asset_id, brand, serial_no, warranty, date_purchased, equipment_type, tool, stock`, 
                                                        values: `${assets.id}, ${data.brand !== '' ? `'${(data.brand).toUpperCase()}'` : null}, ${data.serial_no !== '' ? `'${(data.serial_no).toUpperCase()}'` : null}, 
                                                                        ${data.warranty !== '' ? data.warranty : null}, '${data.date_purchased}', '${data.equipment_type}', 
                                                                        ${data.tool !== '' ? `'${(data.tool).toUpperCase()}'` : null}, ${data.stock !== '' ? data.stock : null}` })
                                        .build();
                    break;
                default: ''
            }
        
            audit.series_no = Global.randomizer(7);
            audit.field = 'all';
            audit.item_id = assets.id;
            audit.action = 'create';
            audit.user_id = data.created_by;
            audit.date = date;

            Global.audit(audit);
            return { result: 'success', message: 'Successfully saved!' }
        }
        else { return { result: 'error', error: errors } }
    }

    update = async (data) => {
        let assts = (await new Builder(`tbl_assets AS assts`)
                                                .select()
                                                .join({ table: `tbl_assets_info AS info`, condition: `info.asset_id = assts.id`, type: `LEFT` })
                                                .condition(`WHERE assts.id= ${data.id}`)
                                                .build()).rows[0];

        let date = Global.date(new Date());
        let _audit = [];
        let errors = [];

        if(Global.compare(assts.serial_no, data.serial_no)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_assets', item_id: assts.id, 
                                    field: 'serial_no', previous: assts.serial_no, current: (data.serial_no).toUpperCase(), action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(assts.brand, data.brand)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_assets', item_id: assts.id, 
                                    field: 'brand', previous: assts.brand, current: (data.brand).toUpperCase(), action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(assts.tool, data.tool)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_assets', item_id: assts.id, 
                                    field: 'tool', previous: assts.tool, current: (data.tool).toUpperCase(), action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(assts.stock, data.stock)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_assets', item_id: assts.id, 
                                    field: 'stock', previous: assts.stock, current: data.stock, action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(assts.date_purchased, data.date_purchased)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_assets', item_id: assts.id, 
                                    field: 'date_purchased', previous: assts.date_purchased, current: data.date_purchased, action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(assts.warranty, data.warranty)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_assets', item_id: assts.id, 
                                    field: 'warranty', previous: assts.warranty, current: data.warranty, action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(assts.status, data.status ? 1 : 0)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_assets', item_id: assts.id, 
                                    field: 'status', previous: assts.status, current: data.status ? 1 : 0, action: 'update', user_id: data.updated_by, date: date });
        }

        await new Builder(`tbl_assets`).update(`status= ${data.status ? 1: 0}, updated_by= ${data.updated_by}, date_updated= '${date}'`).condition(`WHERE id= ${data.id}`).build();
        await new Builder(`tbl_assets_info`)
                            .update(`serial_no= ${data.serial_no !== '' || data.serial_no !== null ? `'${(data.serial_no).toUpperCase()}'` : null},
                                            brand= ${data.brand !== '' || data.brand !== null ? `'${(data.brand).toUpperCase()}'` : null},
                                            tool= ${data.tool !== '' || data.tool !== null ? `'${(data.tool).toUpperCase()}'` : null},
                                            stock= ${data.stock !== '' || data.stock !== null ? data.stock : null}, date_purchased= '${data.date_purchased}', 
                                            warranty= ${data.warranty !== '' || data.warranty !== null ? data.warranty : null}`)
        .condition(`WHERE asset_id= ${data.id}`)
        .build();

        _audit.forEach(data => Global.audit(data));
        return { result: 'success', message: 'Successfully updated!' }
    }
}

module.exports = NetworkingEquipment;