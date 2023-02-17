const Builder = require("../../function/builder"); // Query builder
const Global = require('../../function/global'); // Function

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
                                        .select()
                                        .join({ table: `tbl_assets_info AS info`, condition: `info.asset_id = assts.id`, type: `LEFT` })
                                        .condition(`WHERE assts.id = ${id}`)
                                        .build()).rows;
    }

    list = async (data) => {
        if((Object.keys(data)).length > 0) {
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
    }

    excel = async (type, data) => {
        switch(type) {
            case 'formatted':
                switch(data.sub_category_name) {
                    case 'office-desks':
                        return (await new Builder(`tbl_assets AS assts`)
                                                        .select(`assts.series_no AS "Series No.", assts.asset_tag AS "Asset Tag", info.brand AS "Brand", info.color AS "Color", info.weight AS "Weight",
                                                                        info.dimension AS "Dimension", info.appearance AS "Appearance", info.with_sidetable AS "W/ Side table",
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
                    case 'office-chairs':
                        return (await new Builder(`tbl_assets AS assts`)
                                                        .select(`assts.series_no AS "Series No.", assts.asset_tag AS "Asset Tag", info.brand AS "Brand", info.color AS "Color", info.weight AS "Weight",
                                                                        info.dimension AS "Dimension", info.appearance AS "Appearance", info.with_armrest AS "W/ Armrest",
                                                                        info.assembly_required AS "Assembly required", CASE WHEN assts.is_released = 1 THEN 'Released' ELSE 'Vacant' END AS "Is Released", 
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
                    case 'whiteboards':
                        return (await new Builder(`tbl_assets AS assts`)
                                                        .select(`assts.series_no AS "Series No.", assts.asset_tag AS "Asset Tag", info.brand AS "Brand",
                                                                        info.dimension AS "Dimension", info.appearance AS "Appearance", info.mount_type AS "Mount Type",
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
                    case 'filing-cabinets':
                        return (await new Builder(`tbl_assets AS assts`)
                                                        .select(`assts.series_no AS "Series No.", assts.asset_tag AS "Asset Tag", info.brand AS "Brand",
                                                                        info.dimension AS "Dimension", info.appearance AS "Appearance", info.no_of_drawers AS "No. of Drawers",
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
                    case 'system-unit':
                    default: return [];
                }
                // return (await new Builder(`tbl_assets AS assts`)
                //                                 .select(`assts.series_no AS "Series No.", assts.asset_tag AS "Asset Tag|", CASE WHEN assts.status =1 THEN 'Active' ELSE 'Inactive' END AS "Status",
                //                                                 CONCAT(cb.lname, ', ', cb.fname, ' ', cb.mname) AS "Created by", assts.date_created AS "Date created", 
                //                                                 CONCAT(ub.lname, ', ', ub.fname, ' ', ub.mname) AS "Updated by", assts.date_updated AS "Date updated",
                //                                                 CONCAT(db.lname, ', ', db.fname, ' ', db.mname) AS "Deleted by", assts.date_deleted AS "Date deleted", 
                //                                                 CONCAT(ib.lname, ', ', ib.fname, ' ', ib.mname) AS "Imported by", assts.date_imported AS "Date imported"`)
                //                                 .join({ table: `tbl_category AS ctgy`, condition: `assts.category_id = ctgy.id`, type: `LEFT` })
                //                                 .join({ table: `tbl_sub_category AS sctgy`, condition: `assts.sub_category_id = sctgy.id`, type: `LEFT` })
                //                                 .join({ table: `tbl_assets_info AS info`, condition: `info.assets_id = assts.id`, type: `LEFT` })
                //                                 .join({ table: `tbl_employee AS cb`, condition: `cb.user_id = assts.created_by`, type: `LEFT` })
                //                                 .join({ table: `tbl_employee AS ub`, condition: `ub.user_id = assts.updated_by`, type: `LEFT` })
                //                                 .join({ table: `tbl_employee AS db`, condition: `db.user_id = assts.deleted_by`, type: `LEFT` })
                //                                 .join({ table: `tbl_employee AS ib`, condition: `ib.user_id = assts.imported_by`, type: `LEFT` })
                //                                 .condition(`WHERE (assts.series_no LIKE '%${data.searchtxt}%' OR assts.asset_tag LIKE '%${data.searchtxt}%'
                //                                                         OR info.model LIKE '%${data.searchtxt}%' OR info.sku LIKE '%${data.searchtxt}%')
                //                                                         ${data.sub_category_id !== 'all' ? ` AND assts.sub_category_id= ${data.sub_category_id} ` : ''}
                //                                                         ORDER BY assts.${data.orderby} ${(data.sort).toUpperCase()}`)
                //                                 .build()).rows;
            default: 
                switch(data.sub_category_name) {
                    case 'office-desks':
                        return (await new Builder(`tbl_assets AS assts`)
                                                        .select(`assts.id, assts.series_no, assts.category_id, assts.sub_category_id, assts.asset_tag, info.brand, info.color, info.weight, info.dimension,
                                                                        info.appearance, info.with_sidetable, assts.is_released, assts.status, assts.created_by, assts.updated_by, assts.deleted_by, assts.imported_by,
                                                                        assts.date_created, assts.date_updated, assts.date_deleted, assts.date_imported`)
                                                        .join({ table: `tbl_assets_info AS info`, condition: `info.asset_id = assts.id`, type: `LEFT` })
                                                        .condition(`WHERE assts.sub_category_id= ${data.sub_category_id}
                                                                            ${data.searchtxt !== '' ? `AND (assts.series_no LIKE '%${(data.searchtxt).toUpperCase()}%' 
                                                                                                                    OR assts.asset_tag LIKE '%${(data.searchtxt).toUpperCase()}%')` : ''}
                                                                            ORDER BY assts.${data.orderby} ${(data.sort).toUpperCase()}`)
                                                        .build()).rows;
                    case 'office-chairs':
                        return (await new Builder(`tbl_assets AS assts`)
                                                        .select(`assts.id, assts.series_no, assts.category_id, assts.sub_category_id, assts.asset_tag, info.brand, info.color, info.weight, info.dimension,
                                                                        info.appearance, info.with_armrest, info.assembly_required, assts.is_released, assts.status, assts.created_by, assts.updated_by, 
                                                                        assts.deleted_by, assts.imported_by, assts.date_created, assts.date_updated, assts.date_deleted, assts.date_imported`)
                                                        .join({ table: `tbl_assets_info AS info`, condition: `info.asset_id = assts.id`, type: `LEFT` })
                                                        .condition(`WHERE assts.sub_category_id= ${data.sub_category_id}
                                                                            ${data.searchtxt !== '' ? `AND (assts.series_no LIKE '%${(data.searchtxt).toUpperCase()}%' 
                                                                                                                    OR assts.asset_tag LIKE '%${(data.searchtxt).toUpperCase()}%')` : ''}
                                                                            ORDER BY assts.${data.orderby} ${(data.sort).toUpperCase()}`)
                                                        .build()).rows;
                    case 'whiteboards':
                        return (await new Builder(`tbl_assets AS assts`)
                                                        .select(`assts.id, assts.series_no, assts.category_id, assts.sub_category_id, assts.asset_tag, info.brand, info.dimension,
                                                                        info.appearance, info.mount_type, assts.is_released, assts.status, assts.created_by, assts.updated_by, 
                                                                        assts.deleted_by, assts.imported_by, assts.date_created, assts.date_updated, assts.date_deleted, assts.date_imported`)
                                                        .join({ table: `tbl_assets_info AS info`, condition: `info.asset_id = assts.id`, type: `LEFT` })
                                                        .condition(`WHERE assts.sub_category_id= ${data.sub_category_id}
                                                                            ${data.searchtxt !== '' ? `AND (assts.series_no LIKE '%${(data.searchtxt).toUpperCase()}%' 
                                                                                                                    OR assts.asset_tag LIKE '%${(data.searchtxt).toUpperCase()}%')` : ''}
                                                                            ORDER BY assts.${data.orderby} ${(data.sort).toUpperCase()}`)
                                                        .build()).rows;
                    case 'filing-cabinets':
                        return (await new Builder(`tbl_assets AS assts`)
                                                        .select(`assts.id, assts.series_no, assts.category_id, assts.sub_category_id, assts.asset_tag, info.brand, info.dimension,
                                                                        info.appearance, info.no_of_drawers, assts.is_released, assts.status, assts.created_by, assts.updated_by, 
                                                                        assts.deleted_by, assts.imported_by, assts.date_created, assts.date_updated, assts.date_deleted, assts.date_imported`)
                                                        .join({ table: `tbl_assets_info AS info`, condition: `info.asset_id = assts.id`, type: `LEFT` })
                                                        .condition(`WHERE assts.sub_category_id= ${data.sub_category_id}
                                                                            ${data.searchtxt !== '' ? `AND (assts.series_no LIKE '%${(data.searchtxt).toUpperCase()}%' 
                                                                                                                    OR assts.asset_tag LIKE '%${(data.searchtxt).toUpperCase()}%')` : ''}
                                                                            ORDER BY assts.${data.orderby} ${(data.sort).toUpperCase()}`)
                                                        .build()).rows;
                    default: return [];
                }
                // return (await new Builder(`tbl_assets AS assts`)
                //                                         .select()
                //                                         .join({ table: `tbl_assets_info AS info`, condition: `info.asset_id = assts.id`, type: 'LEFT' })
                //                                         .condition(`ORDER by ${data.orderby} ${(data.sort).toUpperCase()}`)
                //                                         .build()).rows;
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
        let date = Global.date(new Date());
        let errors = [];

        let assets = (await new Builder(`tbl_assets`)
                                                        .insert({ columns: `series_no, category_id, sub_category_id, asset_tag, is_released, status, created_by, date_created`, 
                                                                        values: `'${(data.series_no).toUpperCase()}', ${data.category_id}, ${data.sub_category_id}, '${(data.asset_tag).toUpperCase()}',
                                                                                        0, ${data.status ? 1 : 0}, ${data.created_by}, '${date}'` })
                                                        .condition(`RETURNING id`)
                                                        .build()).rows[0];
        
        switch(data.item) {
            // Start for Office Furniture Category
            case 'office-desks':
                await new Builder(`tbl_assets_info`)
                                    .insert({ columns: `asset_id, brand, color, weight, dimension, appearance, with_sidetable`, 
                                                    values: `${assets.id}, ${data.brand !== '' ? `'${(data.brand).toUpperCase()}'`: null}, ${data.color !== '' ? `'${(data.color).toUpperCase()}'` : null}, 
                                                                    ${data.weight !== '' ? `'${(data.weight).toUpperCase()}'` : null}, ${data.dimension !== '' ? `'${(data.dimension).toUpperCase()}'` : null},
                                                                    '${data.appearance}', '${data.with_sidetable}'` })
                                    .build();
            
                audit.series_no = Global.randomizer(7);
                audit.field = 'all';
                audit.item_id = assets.id;
                audit.action = 'create';
                audit.user_id = data.created_by;
                audit.date = date;
    
                Global.audit(audit);
                return { result: 'success', message: 'Successfully saved!' }
            case 'office-chairs':
                await new Builder(`tbl_assets_info`)
                                    .insert({ columns: `asset_id, brand, color, weight, dimension, appearance, with_armrest, assembly_required`, 
                                                    values: `${assets.id}, ${data.brand !== '' ? `'${(data.brand).toUpperCase()}'`: null}, ${data.color !== '' ? `'${(data.color).toUpperCase()}'` : null}, 
                                                    ${data.weight !== '' ? `'${(data.weight).toUpperCase()}'` : null}, ${data.dimension !== '' ? `'${(data.dimension).toUpperCase()}'` : null},
                                                    '${data.appearance}', '${data.with_armrest}', '${data.assembly_required}'` })
                                    .build();
            
                audit.series_no = Global.randomizer(7);
                audit.field = 'all';
                audit.item_id = assets.id;
                audit.action = 'create';
                audit.user_id = data.created_by;
                audit.date = date;
    
                Global.audit(audit);
                return { result: 'success', message: 'Successfully saved!' }
            case 'whiteboards':
                await new Builder(`tbl_assets_info`)
                                    .insert({ columns: `asset_id, brand, dimension, appearance, mount_type`, 
                                                    values: `${assets.id}, ${data.brand !== '' ? `'${(data.brand).toUpperCase()}'`: null}, ${data.dimension !== '' ? `'${(data.dimension).toUpperCase()}'`: null},
                                                                    '${data.appearance}', '${data.mount_type}'` })
                                    .build();
            
                audit.series_no = Global.randomizer(7);
                audit.field = 'all';
                audit.item_id = assets.id;
                audit.action = 'create';
                audit.user_id = data.created_by;
                audit.date = date;
    
                Global.audit(audit);
                return { result: 'success', message: 'Successfully saved!' }
            case 'filing-cabinets':
                await new Builder(`tbl_assets_info`)
                                    .insert({ columns: `asset_id, brand, dimension, appearance, no_of_drawers`, 
                                                    values: `${assets.id}, ${data.brand !== '' ? `'${(data.brand).toUpperCase()}'`: null}, ${data.dimension !== '' ? `'${(data.dimension).toUpperCase()}'`: null},
                                                                    '${data.appearance}', ${data.no_of_drawers !== '' ? data.no_of_drawers : null}` })
                                    .build();
            
                audit.series_no = Global.randomizer(7);
                audit.field = 'all';
                audit.item_id = assets.id;
                audit.action = 'create';
                audit.user_id = data.created_by;
                audit.date = date;
    
                Global.audit(audit);
                return { result: 'success', message: 'Successfully saved!' }
            // End of Office furniture Category
            // Start of Technology Category
            case 'system-unit':
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
            case 'laptops':
                if(!(errors.length > 0)) {
                    await new Builder(`tbl_assets_info`)
                                        .insert({ columns: `asset_id, brand, serial_no, model, os, processor, video_card, ram, hdd, ssd, input_connectivity, warranty, date_purchased, resolution`, 
                                                        values: `${assets.id}, ${data.brand !== '' ? `'${(data.brand).toUpperCase()}'`: null}, ${data.serial_no !== '' ? `'${(data.serial_no).toUpperCase()}'`: null},
                                                                        ${data.model !== '' ? `'${(data.model).toUpperCase()}'`: null}, ${data.os !== '' ? `'${(data.os).toUpperCase()}'`: null},
                                                                        ${data.processor !== '' ? `'${(data.processor).toUpperCase()}'`: null}, ${data.video_card !== '' ? `'${(data.video_card).toUpperCase()}'`: null},
                                                                        ${data.ram !== '' ? `'${(data.ram).toUpperCase()}'`: null}, ${data.hdd !== '' ? `'${(data.hdd).toUpperCase()}'`: null},
                                                                        ${data.ssd !== '' ? `'${(data.ssd).toUpperCase()}'`: null}, '${JSON.stringify(data.input_connectivity)}', 
                                                                        ${data.warranty !== '' ? data.warranty : null}, '${data.date_purchased}', ${data.resolution !== '' ? `'${(data.resolution).toUpperCase()}'` : null}` })
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
            case 'mouse':
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
            case 'keyboard':
                if(!(errors.length > 0)) {
                    await new Builder(`tbl_assets_info`)
                                        .insert({ columns: `asset_id, brand, color, serial_no, model, warranty, date_purchased, interface, no_of_keys`, 
                                                        values: `${assets.id}, ${data.brand !== '' ? `'${(data.brand).toUpperCase()}'`: null}, ${data.color !== '' ? `'${(data.color).toUpperCase()}'` : null},
                                                                        ${data.serial_no !== '' ? `'${(data.serial_no).toUpperCase()}'` : null}, ${data.model !== '' ? `'${(data.model).toUpperCase()}'` : null}, 
                                                                        ${data.warranty !== '' ? data.warranty : null}, '${data.date_purchased}', '${data.interface}', ${data.no_of_keys !== '' ? data.no_of_keys : null}` })
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
            case 'printer':
                if(!(errors.length > 0)) {
                    await new Builder(`tbl_assets_info`)
                                        .insert({ columns: `asset_id, brand, color, dimension, serial_no, model, warranty, date_purchased, interface, printer_type`, 
                                                        values: `${assets.id}, ${data.brand !== '' ? `'${(data.brand).toUpperCase()}'`: null}, ${data.color !== '' ? `'${(data.color).toUpperCase()}'` : null},
                                                                        ${data.dimension !== '' ? `'${(data.dimension).toUpperCase()}'` : null}, ${data.serial_no !== '' ? `'${(data.serial_no).toUpperCase()}'` : null}, 
                                                                        ${data.model !== '' ? `'${(data.model).toUpperCase()}'` : null}, ${data.warranty !== '' ? data.warranty : null}, '${data.date_purchased}', 
                                                                        '${data.interface}', '${data.printer_type}'` })
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
            case 'monitor':
                if(!(errors.length > 0)) {
                    await new Builder(`tbl_assets_info`)
                                        .insert({ columns: `asset_id, brand, color, dimension, serial_no, model, input_connectivity, warranty, date_purchased, resolution,
                                                                        screen_size, aspect_ratio, refresh_rate`, 
                                                        values: `${assets.id}, ${data.brand !== '' ? `'${(data.brand).toUpperCase()}'`: null}, ${data.color !== '' ? `'${(data.color).toUpperCase()}'` : null},
                                                                        ${data.dimension !== '' ? `'${(data.dimension).toUpperCase()}'` : null}, ${data.serial_no !== '' ? `'${(data.serial_no).toUpperCase()}'` : null}, 
                                                                        ${data.model !== '' ? `'${(data.model).toUpperCase()}'` : null}, '${JSON.stringify(data.input_connectivity)}', 
                                                                        ${data.warranty !== '' ? data.warranty : null}, '${data.date_purchased}', ${data.resolution !== '' ? `'${(data.resolution).toUpperCase()}'` : null},
                                                                        ${data.screen_size !== '' ? `'${(data.screen_size).toUpperCase()}'` : null}, ${data.aspect_ratio !== '' ? `'${(data.aspect_ratio).toUpperCase()}'` : null},
                                                                        ${data.refresh_rate !== '' ? `'${(data.refresh_rate).toUpperCase()}'` : null}` })
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
            case 'networking-equipments':
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
                                                                values: `${assets.id}, ${data.brand !== '' ? `'${(data.brand).toUpperCase()}'` : null}, ${data.color !== '' ? `'${(data.color).toUpperCase()}'` : null},
                                                                                ${data.model !== '' ? `'${(data.model).toUpperCase()}'` : null}, ${data.warranty !== '' ? data.warranty : null}, '${data.date_purchased}',
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
            case 'harddrives':
                if(!(errors.length > 0)) {
                    await new Builder(`tbl_assets_info`)
                                        .insert({ columns: `asset_id, brand, color, serial_no, model, warranty, date_purchased, capacity`, 
                                                        values: `${assets.id}, ${data.brand !== '' ? `'${(data.brand).toUpperCase()}'`: null}, ${data.color !== '' ? `'${(data.color).toUpperCase()}'` : null},
                                                                        ${data.serial_no !== '' ? `'${(data.serial_no).toUpperCase()}'` : null}, ${data.model !== '' ? `'${(data.model).toUpperCase()}'` : null}, 
                                                                        ${data.warranty !== '' ? data.warranty : null}, '${data.date_purchased}', ${data.capacity !== '' ? `'${(data.capacity).toUpperCase()}'` : null}` })
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
            case 'phones':
                if(!(errors.length > 0)) {
                    await new Builder(`tbl_assets_info`)
                                        .insert({ columns: `asset_id, brand, color, serial_no, model, warranty, date_purchased, extension`, 
                                                        values: `${assets.id}, ${data.brand !== '' ? `'${(data.brand).toUpperCase()}'`: null}, ${data.color !== '' ? `'${(data.color).toUpperCase()}'` : null},
                                                                        ${data.serial_no !== '' ? `'${(data.serial_no).toUpperCase()}'` : null}, ${data.model !== '' ? `'${(data.model).toUpperCase()}'` : null}, 
                                                                        ${data.warranty !== '' ? data.warranty : null}, '${data.date_purchased}', ${data.extension !== '' ? `'${(data.extension).toUpperCase()}'` : null}` })
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
            default: return { result: 'maintenance', message: 'Unable to save! This module is under maintenance!' }
        }
    }

    update = async (data) => {
        return [];
    }

    dropdown = async (data) => {
        return [];
    }
}

module.exports = Assets;