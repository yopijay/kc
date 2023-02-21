const Builder = require("../../../../function/builder") // Query builder
const Global = require("../../../../function/global"); // Global functions

const audit = { series_no: '', table_name: 'tbl_assets',  item_id: 0, field: '', previous: null, current: null, action: '', user_id: 0, date: '' }; // Used for audit trail
class Mouse {
    formatted = async (data) => {
        return (await new Builder(`tbl_assets AS assts`)
                                        .select(`assts.series_no AS "Series No.", info.serial_no AS "Serial no.", assts.asset_tag AS "Asset Tag", info.brand AS "Brand", info.model AS "Model",
                                                        info.color AS "Color", info.dpi AS "DPI", info.interface AS "Interface", info.orientation AS "Orientation",  info.date_purchased AS "Date purchased", 
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
                                                        info.color, info.dpi, info.interface, info.orientation, info.date_purchased, info.warranty, assts.is_released, assts.status, 
                                                        assts.created_by, assts.updated_by, assts.deleted_by, assts.imported_by, assts.date_created, assts.date_updated, assts.date_deleted, assts.date_imported`)
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
        if(data.serial_no !== '') {
            if((await new Builder(`tbl_assets_info`).select().condition(`WHERE serial_no = '${(data.serial_no).toUpperCase()}'`).build()).rowCount > 0) {
                errors.push({ name: 'serial_no', message: 'Serial No. / Product ID already exist!' });
            }
        }

        if(!(errors.length > 0)) {
            await new Builder(`tbl_assets_info`)
                                .insert({ columns: `asset_id, brand, color, serial_no, model, warranty, date_purchased, interface, orientation, dpi`, 
                                                values: `${assets.id}, ${data.brand !== '' ? `'${(data.brand).toUpperCase()}'`: null}, ${data.color !== '' ? `'${(data.color).toUpperCase()}'` : null},
                                                                ${data.serial_no !== '' ? `'${(data.serial_no).toUpperCase()}'` : null}, ${data.model !== '' ? `'${(data.model).toUpperCase()}'` : null}, 
                                                                ${data.warranty !== '' ? data.warranty : null}, '${data.date_purchased}', '${data.interface}', '${data.orientation}', ${data.dpi !== '' ? data.dpi : null}` })
                                .build();
        
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

        if(Global.compare(assts.model, data.model)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_assets', item_id: assts.id, 
                                    field: 'model', previous: assts.model, current: (data.model).toUpperCase(), action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(assts.color, data.color)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_assets', item_id: assts.id, 
                                    field: 'color', previous: assts.color, current: (data.color).toUpperCase(), action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(assts.dpi, data.dpi)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_assets', item_id: assts.id, 
                                    field: 'dpi', previous: assts.dpi, current: data.dpi, action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(assts.interface, data.interface)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_assets', item_id: assts.id, 
                                    field: 'interface', previous: assts.interface, current: data.interface, action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(assts.orientation, data.orientation)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_assets', item_id: assts.id, 
                                    field: 'orientation', previous: assts.orientation, current: data.orientation, action: 'update', user_id: data.updated_by, date: date });
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
                                            model= ${data.model !== '' || data.model !== null ? `'${(data.model).toUpperCase()}'` : null},
                                            color= ${data.color !== '' || data.color !== null ? `'${(data.color).toUpperCase()}'` : null},
                                            dpi= ${data.dpi !== '' || data.dpi !== null ? data.dpi : null}, interface= '${data.interface}', orientation= '${data.orientation}',
                                            date_purchased= '${data.date_purchased}', warranty= ${data.warranty !== '' || data.warranty !== null ? data.warranty : null}`)
                            .condition(`WHERE asset_id= ${data.id}`)
                            .build();

        _audit.forEach(data => Global.audit(data));
        return { result: 'success', message: 'Successfully updated!' }
    }
}

module.exports = Mouse;