const Builder = require("../../../../function/builder") // Query builder
const Global = require("../../../../function/global"); // Global functions

const audit = { series_no: '', table_name: 'tbl_assets',  item_id: 0, field: '', previous: null, current: null, action: '', user_id: 0, date: '' }; // Used for audit trail
class Whiteboard {
    formatted = async (data) => {
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
    }

    original = async (data) => {
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
        
        if(Global.compare(assts.brand, data.brand)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_assets', item_id: assts.id, 
                                    field: 'brand', previous: assts.brand, current: (data.brand).toUpperCase(), action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(assts.dimension, data.dimension)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_assets', item_id: assts.id, 
                                    field: 'dimension', previous: assts.dimension, current: (data.dimension).toUpperCase(), action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(assts.mount_type, data.mount_type)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_assets', item_id: assts.id, 
                                    field: 'mount_type', previous: assts.mount_type, current: data.mount_type, action: 'update', user_id: data.updated_by, date: date });
        }
        
        if(Global.compare(assts.appearance, data.appearance)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_assets', item_id: assts.id, 
                                    field: 'appearance', previous: assts.appearance, current: data.appearance, action: 'update', user_id: data.updated_by, date: date });
        }

        await new Builder(`tbl_assets`).update(`status= ${data.status ? 1 : 0}, updated_by= ${data.updated_by}, date_updated= '${date}'`).condition(`WHERE id= ${data.id}`).build();
        await new Builder(`tbl_assets_info`)
                            .update(`brand= ${data.brand !== '' || data.brand !== null ? `'${(data.brand).toUpperCase()}'` : null},
                                            dimension= ${data.dimension !== '' || data.dimension !== null ? `'${(data.dimension).toUpperCase()}'` : null},
                                            mount_type= '${data.mount_type}', appearance= '${data.appearance}'`)
                            .condition(`WHERE asset_id= ${data.id}`)
                            .build();

        _audit.forEach(data => Global.audit(data));
        return { result: 'success', message: 'Successfully updated!' }
    }
}

module.exports = Whiteboard;