const Builder = require("../../function/builder"); // Query builder
const Global = require("../../function/global"); // Global functions

const audit = { series_no: '', table_name: 'tbl_assign_asset',  item_id: 0, field: '', previous: null, current: null, action: '', user_id: 0, date: '' }; // Used for audit trail
class AssignAssets {
    series = async () => { return (await new Builder(`tbl_assign_asset`).select(`COUNT(*)`).build()).rows; }
    specific = async (id) => {
        return (await new Builder(`tbl_assign_asset AS assgn`)
                                        .select(`assgn.*, emp.branch, subctg.name AS item`)
                                        .join({ table: `tbl_employee AS emp`, condition: `assgn.issued_to = emp.user_id`, type: `LEFT` })
                                        .join({ table: `tbl_sub_category AS subctg`, condition: `assgn.sub_category_id = subctg.id`, type: `LEFT` })
                                        .condition(`WHERE assgn.id= ${id}`)
                                        .build()).rows;
    }

    list = async (data) => {
        return (await new Builder(`tbl_assign_asset AS assgn`)
                                        .select(`assgn.id, assgn.series_no, cmp.name AS company, dpt.name AS department, ctg.name AS category, subctg.name AS sub_category,
                                                        CONCAT(it.lname, ', ', it.fname, ' ', it.mname) AS issued_to, assgn.date_created, assgn.status`)
                                        .join({ table: `tbl_company AS cmp`, condition: `assgn.company_id = cmp.id`, type: `LEFT` })
                                        .join({ table: `tbl_department AS dpt`, condition: `assgn.department_id = dpt.id`, type: `LEFT` })
                                        .join({ table: `tbl_category AS ctg`, condition: `assgn.category_id = ctg.id`, type: `LEFT` })
                                        .join({ table: `tbl_sub_category AS subctg`, condition: `assgn.sub_category_id = subctg.id`, type: `LEFT` })
                                        .join({ table: `tbl_employee AS it`, condition: `assgn.issued_to = it.user_id`, type: `LEFT` })
                                        .condition(`${data.sub_category_id !== 'all' || data.searchtxt !== '' ? `WHERE ` : ''}
                                                            ${data.sub_category_id !== 'all' ? `assgn.sub_category_id= ${data.sub_category_id} ` : ''}
                                                            ${data.sub_category_id !== 'all' && data.searchtxt !== '' ? `AND ` : ''}
                                                            ${data.searchtxt !== '' ? `(assgn.series_no LIKE '%${(data.searchtxt).toUpperCase()}%' OR it.lname LIKE '%${(data.searchtxt).toUpperCase()}%' 
                                                                                                        OR it.fname LIKE '%${(data.searchtxt).toUpperCase()}%' OR it.mname LIKE '%${(data.mname).toUpperCase()}%')` : ''}
                                                            ORDER BY assgn.${data.orderby} ${(data.sort).toUpperCase()}`)
                                        .build()).rows;
    }

    excel = async (type, data) => {
        switch(type) {
            case 'formatted':
                return (await new Builder(`tbl_assign_asset AS assgn`)
                                                .select(`assgn.series_no AS "Series No.", cmp.name AS "Company", dpt.name AS "Department", ctg.name AS "Category", subctg.name AS "Sub Category",
                                                                asst.asset_tag AS "Asset Tag", CONCAT(it.lname, ', ', it.fname, ' ', it.mname) AS "Issued To", assgn.remarks AS Remarks, 
                                                                CASE WHEN assgn.status = 1 THEN 'Active' ELSE 'Inactive' END AS "Status", 
                                                                CONCAT(cb.lname, ', ', cb.fname, ' ', cb.mname) AS "Created by", assgn.date_created AS "Date created", 
                                                                CONCAT(ub.lname, ', ', ub.fname, ' ', ub.mname) AS "Updated by", assgn.date_updated AS "Date updated",
                                                                CONCAT(db.lname, ', ', db.fname, ' ', db.mname) AS "Deleted by", assgn.date_deleted AS "Date deleted", 
                                                                CONCAT(ib.lname, ', ', ib.fname, ' ', ib.mname) AS "Imported by", assgn.date_imported AS "Date imported"`)
                                                .join({ table: `tbl_company AS cmp`, condition: `assgn.company_id = cmp.id`, type: `LEFT` })
                                                .join({ table: `tbl_department AS dpt`, condition: `assgn.department_id = dpt.id`, type: `LEFT` })
                                                .join({ table: `tbl_category AS ctg`, condition: `assgn.category_id = ctg.id`, type: `LEFT` })
                                                .join({ table: `tbl_sub_category AS subctg`, condition: `assgn.sub_category_id = subctg.id`, type: `LEFT` })
                                                .join({ table: `tbl_assets AS asst`, condition: `assgn.asset_id = asst.id`, type: `LEFT` })
                                                .join({ table: `tbl_employee AS it`, condition: `assgn.issued_to = it.user_id`, type: `LEFT`})
                                                .join({ table: `tbl_employee AS cb`, condition: `assgn.created_by = cb.user_id`, type: `LEFT` })
                                                .join({ table: `tbl_employee AS ub`, condition: `assgn.updated_by = ub.user_id`, type: `LEFT` })
                                                .join({ table: `tbl_employee AS db`, condition: `assgn.deleted_by = db.user_id`, type: `LEFT` })
                                                .join({ table: `tbl_employee AS ib`, condition: `assgn.imported_by = ib.user_id`, type: `LEFT` })
                                                .condition(`${data.sub_category_id !== 'all' || data.searchtxt !== '' ? `WHERE ` : ''}
                                                                    ${data.sub_category_id !== 'all' ? `assgn.sub_category_id= ${data.sub_category_id} ` : ''}
                                                                    ${data.sub_category_id !== 'all' && data.searchtxt !== '' ? `AND ` : ''}
                                                                    ${data.searchtxt !== '' ? `(assgn.series_no LIKE '%${(data.searchtxt).toUpperCase()}%' OR it.lname LIKE '%${(data.searchtxt).toUpperCase()}%' 
                                                                                                                OR it.fname LIKE '%${(data.searchtxt).toUpperCase()}%' OR it.mname LIKE '%${(data.mname).toUpperCase()}%')` : ''}
                                                                    ORDER BY assgn.${data.orderby} ${(data.sort).toUpperCase()}`)
                                                .build()).rows;
            default: return (await new Builder(`tbl_assign_asset`).select().condition(`ORDER BY ${data.orderby} ${(data.sort).toUpperCase()}`).build()).rows;
        }
    }

    search = async (data) => {
        return (await new Builder(`tbl_assign_asset AS assgn`)
                                        .select(`assgn.id, assgn.series_no, cmp.name AS company, dpt.name AS department, ctg.name AS category, subctg.name AS sub_category,
                                                        CONCAT(it.lname, ', ', it.fname, ' ', it.mname) AS issued_to, assgn.date_created, assgn.status`)
                                        .join({ table: `tbl_company AS cmp`, condition: `assgn.company_id = cmp.id`, type: `LEFT` })
                                        .join({ table: `tbl_department AS dpt`, condition: `assgn.department_id = dpt.id`, type: `LEFT` })
                                        .join({ table: `tbl_category AS ctg`, condition: `assgn.category_id = ctg.id`, type: `LEFT` })
                                        .join({ table: `tbl_sub_category AS subctg`, condition: `assgn.sub_category_id = subctg.id`, type: `LEFT` })
                                        .join({ table: `tbl_employee AS it`, condition: `assgn.issued_to = it.user_id`, type: `LEFT` })
                                        .condition(`WHERE (assgn.series_no LIKE '%${(data.searchtxt).toUpperCase()}%' OR it.lname LIKE '%${(data.searchtxt).toUpperCase()}%' 
                                                                OR it.fname LIKE '%${(data.searchtxt).toUpperCase()}%' OR it.mname LIKE '%${(data.searchtxt).toUpperCase()}%')
                                                                ${data.sub_category_id !== 'all' ? ` AND assgn.sub_category_id= ${data.sub_category_id} ` : ''}
                                                                ORDER BY assgn.${data.orderby} ${(data.sort).toUpperCase()}`)
                                        .build()).rows;
    }

    save = async (data) => {
        let date = Global.date(new Date());
        let issuance = (await new Builder(`tbl_assign_asset`)
                                                    .insert({ columns: `series_no, company_id, department_id, category_id, sub_category_id, asset_id, issued_to, remarks, status, created_by, date_created`, 
                                                                    values: `'${(data.series_no).toUpperCase()}', ${data.company_id}, ${data.department_id}, ${data.category_id}, ${data.sub_category_id}, 
                                                                                    ${data.asset_id}, ${data.issued_to}, ${data.remarks !== '' ? `'${(data.remarks).toUpperCase()}'` : null}, ${data.status ? 1 : 0},
                                                                                    ${data.created_by}, '${date}'` })
                                                    .condition(`RETURNING id`)
                                                    .build()).rows[0];
    
        audit.series_no = Global.randomizer(7);
        audit.field = 'all';
        audit.item_id = issuance.id;
        audit.action = 'create';
        audit.user_id = data.created_by;
        audit.date = date;

        Global.audit(audit);
        
        await new Builder(`tbl_assets`).update(`is_released= 1`).condition(`WHERE id= ${data.asset_id}`).build();
    
        audit.series_no = Global.randomizer(7);
        audit.field = 'is_released';
        audit.item_id = data.asset_id;
        audit.action = 'issuance';
        audit.user_id = data.created_by;
        audit.date = date;

        Global.audit(audit);
        return { result: 'success', message: 'Successfully saved!' }
    }

    update = async (data) => {
        let assgn = (await new Builder(`tbl_assign_asset`).select().condition(`WHERE id= ${data.id}`).build()).rows[0];
        let date = Global.date(new Date());
        let _audit = [];
        let _errors = [];

        if(Global.compare(assgn.company_id, data.company_id)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_assign_asset',  item_id: assgn.id, 
                            field: 'company_id', previous: assgn.company_id, current: data.company_id, action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(assgn.department_id, data.department_id)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_assign_asset',  item_id: assgn.id, 
                            field: 'department_id', previous: assgn.department_id, current: data.department_id, action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(assgn.issued_to, data.issued_to)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_assign_asset',  item_id: assgn.id, 
                            field: 'issued_to', previous: assgn.issued_to, current: data.issued_to, action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(assgn.remarks, data.remarks)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_assign_asset',  item_id: assgn.id, 
                            field: 'remarks', previous: (assgn.remarks).toUpperCase(), current: (data.remarks).toUpperCase(), action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(assgn.status, data.status ? 1 : 0)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_assign_asset',  item_id: assgn.id, 
                            field: 'status', previous: assgn.status, current: data.status ? 1 : 0, action: 'update', user_id: data.updated_by, date: date });
        }

        if(!(_errors.length > 0)) {
            await new Builder(`tbl_assign_asset`)
                                .update(`company_id= ${data.company_id}, department_id= ${data.department_id}, issued_to= ${data.issued_to},
                                                remarks= ${data.remarks !== '' ? `'${(data.remarks).toUpperCase()}'` : null}, status= ${data.status ? 1 : 0}, updated_by= ${data.updated_by}, 
                                                date_updated= '${date}'`)
                                .condition(`WHERE id= ${assgn.id}`)
                                .build();

            _audit.forEach(data => Global.audit(data));
            console.log(_audit);
            return { result: 'success', message: 'Successfully updated!' }
        }
        else { return { result: 'error', error: _errors } }
    }
}

module.exports = AssignAssets;