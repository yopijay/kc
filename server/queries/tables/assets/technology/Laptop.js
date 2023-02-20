const Builder = require("../../../../function/builder") // Query builder
const Global = require("../../../../function/global"); // Global functions

const audit = { series_no: '', table_name: 'tbl_assets',  item_id: 0, field: '', previous: null, current: null, action: '', user_id: 0, date: '' }; // Used for audit trail
class Laptop {
    formatted = async (data) => {
        return [];
    }

    original = async (data) => {
        return [];
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

        if(Global.compare(assts.resolution, data.resolution)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_assets', item_id: assts.id, 
                                    field: 'resolution', previous: assts.resolution, current: (data.resolution).toUpperCase(), action: 'update', user_id: data.updated_by, date: date });
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

        await new Builder(`tbl_assets`).update(`status= ${data.status ? 1: 0}, updated_by= ${data.updated_by}`).condition(`WHERE id= ${data.id}`).build();
        await new Builder(`tbl_assets_info`)
                            .update(`serial_no= ${data.serial_no !== '' || data.serial_no !== null ? `'${(data.serial_no).toUpperCase()}'` : null},
                                            brand= ${data.brand !== '' || data.brand !== null ? `'${(data.brand).toUpperCase()}'` : null},
                                            model= ${data.model !== '' || data.model !== null ? `'${(data.model).toUpperCase()}'` : null},
                                            os= ${data.os !== '' || data.os !== null ? `'${(data.os).toUpperCase()}'` : null}, 
                                            processor= ${data.processor !== '' || data.processor !== null ? `'${(data.processor).toUpperCase()}'` : null},
                                            video_card= ${data.video_card !== '' || data.video_card !== null ? `'${(data.video_card).toUpperCase()}'` : null},
                                            resolution= ${data.resolution !== '' || data.resolution !== null ? `'${(data.resolution).toUpperCase()}'` : null},
                                            ram= ${data.ram !== '' || data.ram !== null ? `'${(data.ram).toUpperCase()}'` : null}, 
                                            hdd= ${data.hdd !== '' || data.hdd !== null ? `'${(data.hdd).toUpperCase()}'` : null},
                                            ssd= ${data.ssd !== '' || data.ssd !== null ? `'${(data.ssd).toUpperCase()}'` : null},
                                            input_connectivity= ${(data.input_connectivity).length > 0 || 
                                                                                    data.input_connectivity !== '' || 
                                                                                    data.input_connectivity !== null ? `'${JSON.stringify(data.input_connectivity)}'` : null},
                                            date_purchased= '${data.date_purchased}', warranty= ${data.warranty !== '' || data.warranty !== null ? data.warranty : null}`)
                            .condition(`WHERE asset_id= ${data.id}`)
                            .build();

        _audit.forEach(data => Global.audit(data));
        return { result: 'success', message: 'Successfully updated!' }
    }
}

module.exports = Laptop;