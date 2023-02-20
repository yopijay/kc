const Builder = require("../../../../function/builder") // Query builder
const Global = require("../../../../function/global"); // Global functions

const audit = { series_no: '', table_name: 'tbl_assets',  item_id: 0, field: '', previous: null, current: null, action: '', user_id: 0, date: '' }; // Used for audit trail
class NetworkingEquipment {
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
    }
}

module.exports = NetworkingEquipment;