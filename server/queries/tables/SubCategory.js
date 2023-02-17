const Builder = require("../../function/builder"); // Query builder
const Global = require('../../function/global'); // Function

const audit = { series_no: '', table_name: 'tbl_sub_category',  item_id: 0, field: '', previous: null, current: null, action: '', user_id: 0, date: '' }; // Used for audit trail
class SubCategory {
    series = async () => { return (await new Builder(`tbl_sub_category`).select(`COUNT(*)`).build()).rows; }

    specific = async (id) => { 
        return (await new Builder(`tbl_sub_category AS sc`)
                                        .select(`sc.*, ctg.module`)
                                        .join({ table: `tbl_category AS ctg`, condition: `sc.category_id = ctg.id`, type: `LEFT` })
                                        .condition(`WHERE sc.id= ${id}`).build()).rows;
    }

    dashboard = async () => {
        return {
            total: (await new Builder(`tbl_sub_category`).select().build()).rowCount,
            supplies: (await new Builder(`tbl_sub_category AS itm`)
                                                .select()
                                                .join({ table: `tbl_category AS ctgy`, condition: `itm.category_id = ctgy.id`, type: `LEFT` })
                                                .condition(`WHERE ctgy.module = 'supplies'`)
                                                .build()).rowCount,
            assets: (await new Builder(`tbl_sub_category AS itm`)
                                            .select()
                                            .join({ table: `tbl_category AS ctgy`, condition: `itm.category_id = ctgy.id`, type: `LEFT` })
                                            .condition(`WHERE ctgy.module = 'assets'`)
                                            .build()).rowCount
        }
    }

    list = async (data) => {
        return (await new Builder(`tbl_sub_category AS sc`)
                                        .select(`sc.id, sc.series_no, ctg.module, ctg.name AS category, sc.name, sc.tag, sc.status, 
                                                        CONCAT(cb.lname, ', ', cb.fname, ' ', cb.mname) AS created_by, sc.date_created`)
                                        .join({ table: `tbl_category AS ctg`, condition: `sc.category_id = ctg.id`, type: `LEFT` })
                                        .join({ table: `tbl_employee AS cb`, condition: `sc.created_by = cb.user_id`, type: `LEFT` })
                                        .condition(`${data.searchtxt !== '' ? `WHERE sc.series_no LIKE '%${data.searchtxt}%' OR sc.name LIKE '%${data.searchtxt}%' OR
                                                                ctg.module LIKE '%${data.searchtxt}%' OR ctg.name LIKE '%${data.searchtxt}%'` : ''} 
                                                            ORDER BY sc.${data.category} ${(data.orderby).toUpperCase()}`)
                                        .build()).rows;
    }

    excel = async (type, data) => {
        switch(type) {
            case 'formatted':
                return (await new Builder(`tbl_sub_category AS sc`)
                                                .select(`sc.series_no AS "Series No.", ctgy.module AS "Module", ctgy.name AS "Category", sc.tag AS "Tag", sc.name AS "Name", 
                                                                CASE WHEN sc.status =1 THEN 'Active' ELSE 'Inactive' END AS "Status",
                                                                CONCAT(cb.lname, ', ', cb.fname, ' ', cb.mname) AS "Created by", sc.date_created AS "Date created", 
                                                                CONCAT(ub.lname, ', ', ub.fname, ' ', ub.mname) AS "Updated by", sc.date_updated AS "Date updated",
                                                                CONCAT(db.lname, ', ', db.fname, ' ', db.mname) AS "Deleted by", sc.date_deleted AS "Date deleted", 
                                                                CONCAT(ib.lname, ', ', ib.fname, ' ', ib.mname) AS "Imported by", sc.date_imported AS "Date imported"`)
                                                .join({ table: `tbl_category AS ctgy`, condition: `sc.category_id = ctgy.id`, type: `LEFT` })
                                                .join({ table: `tbl_employee AS cb`, condition: `sc.created_by = cb.user_id`, type: `LEFT` })
                                                .join({ table: `tbl_employee AS ub`, condition: `sc.updated_by = ub.user_id`, type: `LEFT` })
                                                .join({ table: `tbl_employee AS db`, condition: `sc.deleted_by = db.user_id`, type: `LEFT` })
                                                .join({ table: `tbl_employee AS ib`, condition: `sc.imported_by = ib.user_id`, type: `LEFT` })
                                                .condition(`WHERE sc.series_no LIKE '%${data.searchtxt}%' OR sc.name LIKE '%${data.searchtxt}%' OR
                                                                        ctgy.module LIKE '%${data.searchtxt}%' OR ctgy.name LIKE '%${data.searchtxt}%'
                                                                        ORDER BY sc.${data.category} ${(data.orderby).toUpperCase()}`)
                                                .build()).rows;
            default: return (await new Builder(`tbl_sub_category`).select().condition(`ORDER by ${data.category} ${(data.orderby).toUpperCase()}`).build()).rows;
        }
    }

    search = async (data) => {
        return (await new Builder(`tbl_sub_category AS sc`)
                                        .select(`sc.id, sc.series_no, ctg.module, ctg.name AS category, sc.name, sc.tag, sc.status, 
                                                        CONCAT(cb.lname, ', ', cb.fname, ' ', cb.mname) AS created_by, sc.date_created`)
                                        .join({ table: `tbl_category AS ctg`, condition: `sc.category_id = ctg.id`, type: `LEFT` })
                                        .join({ table: `tbl_employee AS cb`, condition: `sc.created_by = cb.user_id`, type: `LEFT` })
                                        .condition(`WHERE sc.series_no LIKE '%${data.condition}%' OR sc.name LIKE '%${data.condition}%' OR
                                                                ctg.module LIKE '%${data.condition}%' OR ctg.name LIKE '%${data.condition}%' ORDER BY sc.${data.category} ${(data.orderby).toUpperCase()}`)
                                        .build()).rows;
    }

    save = async (data) => {
        let date = Global.date(new Date());
        let errors = [];

        if((await new Builder(`tbl_sub_category`).select().condition(`WHERE series_no= '${(data.series_no).toUpperCase()}'`).build()).rowCount > 0) {
            errors.push({ name: 'name', message: 'Series number already exist!' });
        }

        if((await new Builder(`tbl_sub_category`).select().condition(`WHERE tag= '${(data.tag).toUpperCase()}'`).build()).rowCount > 0) {
            errors.push({ name: 'tag', message: 'Tag already used in other sub-category' });
        }

        if((await new Builder(`tbl_sub_category`).select().condition(`WHERE category_id= ${data.category_id} AND name= '${(data.name).toUpperCase()}'`).build()).rowCount > 0) {
            errors.push({ name: 'name', message: 'Sub-category already exist in this category!' });
        }

        if(!(errors.length > 0)) {
            let sc = (await new Builder(`tbl_sub_category`)
                                                .insert({ columns: `series_no, category_id, name, tag, status, created_by, date_created`, 
                                                                values: `'${(data.series_no).toUpperCase()}', ${data.category_id}, '${(data.name).toUpperCase()}', '${(data.tag).toUpperCase()}',
                                                                                ${data.status ? 1 : 0}, ${data.created_by}, '${date}'` })
                                                .condition(`RETURNING id`)
                                                .build()).rows[0];
            
            audit.series_no = Global.randomizer(7);
            audit.field = 'all';
            audit.item_id = sc.id;
            audit.action = 'create';
            audit.user_id = data.created_by;
            audit.date = date;

            Global.audit(audit);
            return { result: 'success', message: 'Successfully saved!' }
        }
        else { return { result: 'error', error: errors } }

    }

    update = async (data) => {
        let sc = (await new Builder(`tbl_sub_category`).select().condition(`WHERE id= ${data.id}`).build()).rows[0];
        let date = Global.date(new Date());
        let _audit = [];
        let _errors= [];

        if(Global.compare(sc.category_id, data.category_id)) {
            if(!((await new Builder(`tbl_sub_category`).select().condition(`WHERE category_id= ${data.category_id} AND name= '${(data.name).toUpperCase()}'`).build()).rowCount > 0)) {
                _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_sub_category',  item_id: sc.id, 
                                field: 'name', previous: sc.category_id, current: data.category_id, action: 'update', user_id: data.updated_by, date: date });
            }
            else { _errors.push({ name: 'name', message: 'Sub-category already exist in this category!' }); }
        }

        if(Global.compare(sc.tag, data.tag)) {
            if(!((await new Builder(`tbl_sub_category`).select().condition(`WHERE tag= '${(data.tag).toUpperCase()}'`).build()).rowCount > 0)) {
                _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_sub_category',  item_id: sc.id, 
                                field: 'tag', previous: sc.tag, current: (data.tag).toUpperCase(), action: 'update', user_id: data.updated_by, date: date });
            }
            else { _errors.push({ name: 'tag', message: 'Tag already used in other sub-category!' }); }
        }

        if(Global.compare(sc.name, data.name)) {
            if(!((await new Builder(`tbl_sub_category`).select().condition(`WHERE category_id= ${data.category_id} AND name= '${(data.name).toUpperCase()}'`).build()).rowCount > 0)) {
                _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_sub_category',  item_id: sc.id, 
                                field: 'name', previous: sc.name, current: (data.name).toUpperCase(), action: 'update', user_id: data.updated_by, date: date });
            }
            else { _errors.push({ name: 'name', message: 'Sub-category already exist in this category!' }); }
        }

        if(Global.compare(sc.status, data.status ? 1 : 0)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_sub_category',  item_id: sc.id, 
                            field: 'status', previous: sc.status, current: data.status ? 1 : 0, action: 'update', user_id: data.updated_by, date: date });
        }

        if(!(_errors.length > 0)) {
            await new Builder(`tbl_sub_category`)
                                .update(`category_id= ${data.category_id}, name= '${(data.name).toUpperCase()}', tag= '${(data.tag).toUpperCase()}', status= ${data.status ? 1: 0}, 
                                                updated_by= ${data.updated_by}, date_updated= '${date}'`)
                                .condition(`WHERE id= ${sc.id}`)
                                .build();
            _audit.forEach(data => Global.audit(data));
            return { result: 'success', message: 'Successfully updated!' }
        }
        else { return { result: 'error', error: _errors } }
    }

    upload = async (data) => {
        return [];
    }

    dropdown = async (data) => {
        return [{ id: 0, name: '-- SELECT AN ITEM BELOW --' }]
                        .concat((await new Builder(`tbl_sub_category`).select(`id, name, tag`).condition(`WHERE category_id= ${data.category_id} AND status= 1 ORDER BY name ASC`).build()).rows);
    }

    filter = async (data) => {
        let ctgy = (await new Builder(`tbl_category`).select('id').condition(`WHERE module= '${data.module}'`).build()).rows;
        let condition = '';

        ctgy.forEach((data, index) => condition += `${index !== 0 ? 'OR ' : ''}category_id= ${data.id}`);
        
        return [{ id: 'all', name: 'ALL' }].concat((await new Builder(`tbl_sub_category`).select(`id, name`).condition(`WHERE ${condition}AND status= 1 ORDER BY name ASC`).build()).rows);
    }
}

module.exports = SubCategory;