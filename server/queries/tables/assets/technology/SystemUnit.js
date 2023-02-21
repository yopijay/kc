const Builder = require("../../../../function/builder") // Query builder
const Global = require("../../../../function/global"); // Global functions

const audit = { series_no: '', table_name: 'tbl_assets',  item_id: 0, field: '', previous: null, current: null, action: '', user_id: 0, date: '' }; // Used for audit trail
class SystemUnit {
    formatted = async (data) => {
        return (await new Builder(`tbl_assets AS assts`)
                                        .select(`assts.series_no AS "Series No.", info.serial_no AS "Serial no.", assts.asset_tag AS "Asset Tag", info.brand AS "Brand", info.model AS "Model", 
                                                        info.os AS "Operating System", info.processor AS "Processor", info.video_card AS "Video Card", info.ram AS "RAM", info.hdd AS "HDD", info.ssd AS "SSD", 
                                                        info.input_connectivity AS "Input Connectivity", info.date_purchased AS "Date purchased", info.warranty AS "Warranty",
                                                        CASE WHEN assts.is_released = 1 THEN 'Released' ELSE 'Vacant' END AS "Is Released", 
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
                                        .select(`assts.id, assts.series_no, assts.category_id, assts.sub_category_id, info.serial_no, assts.asset_tag, info.brand, info.model, info.os, info.processor,
                                                        info.video_card, info.ram, info.hdd, info.ssd, info.input_connectivity, info.date_purchased, info.warranty, assts.is_released, assts.status, 
                                                        assts.created_by, assts.updated_by, assts.deleted_by, assts.imported_by, assts.date_created, assts.date_updated, assts.date_deleted, assts.date_imported`)
                                        .join({ table: `tbl_assets_info AS info`, condition: `info.asset_id = assts.id`, type: `LEFT` })
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
                                                        
        await new Builder(`tbl_assets_info`)
                            .insert({ columns: `asset_id, brand, serial_no, model, os, processor, video_card, ram, hdd, ssd, input_connectivity, warranty, date_purchased`, 
                                            values: `${assets.id}, ${data.brand !== '' ? `'${(data.brand).toUpperCase()}'`: null}, ${data.serial_no !== '' ? `'${(data.serial_no).toUpperCase()}'`: null},
                                                            ${data.model !== '' ? `'${(data.model).toUpperCase()}'`: null}, ${data.os !== '' ? `'${(data.os).toUpperCase()}'`: null},
                                                            ${data.processor !== '' ? `'${(data.processor).toUpperCase()}'`: null}, ${data.video_card !== '' ? `'${(data.video_card).toUpperCase()}'`: null},
                                                            ${data.ram !== '' ? `'${(data.ram).toUpperCase()}'`: null}, ${data.hdd !== '' ? `'${(data.hdd).toUpperCase()}'`: null},
                                                            ${data.ssd !== '' ? `'${(data.ssd).toUpperCase()}'`: null}, '${JSON.stringify(data.input_connectivity)}', 
                                                            ${data.warranty !== '' ? data.warranty : null}, '${data.date_purchased}'` })
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
        
        if(Global.compare(assts.os, data.os)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_assets', item_id: assts.id, 
                                    field: 'os', previous: assts.os, current: (data.os).toUpperCase(), action: 'update', user_id: data.updated_by, date: date });
        }
        
        if(Global.compare(assts.processor, data.processor)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_assets', item_id: assts.id, 
                                    field: 'processor', previous: assts.processor, current: (data.processor).toUpperCase(), action: 'update', user_id: data.updated_by, date: date });
        }
        
        if(Global.compare(assts.video_card, data.video_card)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_assets', item_id: assts.id, 
                                    field: 'video_card', previous: assts.video_card, current: (data.video_card).toUpperCase(), action: 'update', user_id: data.updated_by, date: date });
        }
        
        if(Global.compare(assts.ram, data.ram)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_assets', item_id: assts.id, 
                                    field: 'ram', previous: assts.ram, current: (data.ram).toUpperCase(), action: 'update', user_id: data.updated_by, date: date });
        }
        
        if(Global.compare(assts.hdd, data.hdd)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_assets', item_id: assts.id, 
                                    field: 'hdd', previous: assts.hdd, current: (data.hdd).toUpperCase(), action: 'update', user_id: data.updated_by, date: date });
        }
        
        if(Global.compare(assts.ssd, data.ssd)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_assets', item_id: assts.id, 
                                    field: 'ssd', previous: assts.ssd, current: (data.ssd).toUpperCase(), action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(assts.input_connectivity, JSON.stringify(data.input_connectivity))) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_assets', item_id: assts.id, 
                                    field: 'input_connectivity', previous: assts.input_connectivity, current: JSON.stringify(data.input_connectivity), action: 'update', user_id: data.updated_by, date: date });
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

        await new Builder(`tbl_assets`).update(`status= ${data.status ? 1 : 0}, updated_by= ${data.updated_by}, date_updated= '${date}'`).condition(`WHERE id= ${data.id}`).build();
        await new Builder(`tbl_assets_info`)
                            .update(`serial_no= ${data.serial_no !== '' || data.serial_no !== null ? `'${(data.serial_no).toUpperCase()}'` : null},
                                            brand= ${data.brand !== '' || data.brand !== null ? `'${(data.brand).toUpperCase()}'` : null},
                                            model= ${data.model !== '' || data.model !== null ? `'${(data.model).toUpperCase()}'` : null},
                                            os= ${data.os !== '' || data.os !== null ? `'${(data.os).toUpperCase()}'` : null}, 
                                            processor= ${data.processor !== '' || data.processor !== null ? `'${(data.processor).toUpperCase()}'` : null},
                                            video_card= ${data.video_card !== '' || data.video_card !== null ? `'${(data.video_card).toUpperCase()}'` : null},
                                            ram= ${data.ram !== '' || data.ram !== null ? `'${(data.ram).toUpperCase()}'` : null}, 
                                            hdd= ${data.hdd !== '' || data.hdd !== null ? `'${(data.hdd).toUpperCase()}'` : null},
                                            ssd= ${data.ssd !== '' || data.ssd !== null ? `'${(data.ssd).toUpperCase()}'` : null},
                                            input_connectivity= ${(data.input_connectivity).length > 0 || 
                                                                                    data.input_connectivity !== '' || 
                                                                                    data.input_connectivity !== null ? `'${JSON.stringify(data.input_connectivity)}'` : null},
                                            date_purchased= '${data.date_purchased}', warranty= ${data.warranty !== '' || data.warranty !== null ? data.warranty : null}`)
                            .condition(`WHERE asset_id = ${data.id}`)
                            .build();

        _audit.forEach(data => Global.audit(data));
        return { result: 'success', message: 'Successfully updated!' }
    }
}

module.exports = SystemUnit;