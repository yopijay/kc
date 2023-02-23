const Builder = require("../../function/builder"); // Query builder
const Global = require("../../function/global"); // Global functions

const audit = { series_no: '', table_name: 'tbl_assign_asset',  item_id: 0, field: '', previous: null, current: null, action: '', user_id: 0, date: '' }; // Used for audit trail
class AssignAssets {
    series = async () => { return (await new Builder(`tbl_assign_asset`).select(`COUNT(*)`).build()).rows; }
    specific = async (id) => { return (await new Builder(`tbl_assign_asset`).select().condition(`WHERE id= ${id}`).build()).rows; }

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
        return [];
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
                                                                                    ${data.asset_id}, ${data.users_id}, ${data.remarks !== '' ? `'${(data.remarks).toUpperCase()}'` : null}, ${data.status ? 1 : 0},
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
        return [];
    }
}

module.exports = AssignAssets;