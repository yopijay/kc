const Builder = require("../../function/builder"); // Query builder
const Global = require('../../function/global'); // Function

const audit = { series_no: '', table_name: 'tbl_physical_count',  item_id: 0, field: '', previous: null, current: null, action: '', user_id: 0, date: '' }; // Used for audit trail
class PhysicalCount {
    series = async () => { return (await new Builder(`tbl_physical_count`).select(`COUNT(*)`).build()).rows; }
    specific = async id => { return (await new Builder(`tbl_physical_count`).select().condition(`WHERE id= ${id}`).build()).rows; }
    schedule = async date => { return (await new Builder(`tbl_physical_count`).select().condition(`WHERE date_from= '${date}'`).build()).rows; }

    profile = async id => { 
        return (await new Builder(`tbl_physical_count_personnels AS pnl`)
                        .select(`pnl.*, emp.fname, emp.mname, emp.lname`)
                        .join({ table: `tbl_employee AS emp`, condition: `emp.user_id = pnl.user_id`, type: `LEFT` })
                        .condition(`WHERE pnl.user_id= ${id}`)
                        .build()).rows; 
    }

    list = async data => {
        return (await new Builder(`tbl_physical_count AS pc`)
                        .select(`pc.id, pc.series_no, pc.branch, pc.date_from, pc.date_to, pc.type, pc.brands, pc.total_items, pc.status,
                                        CONCAT(cb.lname, ', ', cb.fname, ' ', cb.mname) AS created_by`)
                        .join({ table: `tbl_employee AS cb`, condition: `pc.created_by = cb.user_id`, type: `LEFT` })
                        .condition(`${data.searchtxt !== '' ? `WHERE pc.series_no LIKE '%${(data.searchtxt).toUpperCase()}%' OR pc.status LIKE '%${data.searchtxt}%' OR
                                                pc.date_from LIKE '%${data.searchtxt}%' OR pc.date_to LIKE '%${data.searchtxt}%' OR pc.type LIKE '%${data.searchtxt}%' OR
                                                pc.brands LIKE '%${(data.searchtxt).toUpperCase()}%' OR pc.branch LIKE '%${(data.branch).toUpperCase()}%'` : ''} 
                                                ORDER BY pc.${data.orderby} ${(data.sort).toUpperCase()}`)
                        .build()).rows;
    }

    search = async data => {
        return [];
    }

    save = async data => {
        let date = Global.date(new Date());
        let errors = [];

        if((await new Builder(`tbl_physical_count`).select().condition(`WHERE series_no= '${(data.series_no).toUpperCase()}'`).build()).rowCount > 0) {
            errors.push({ name: 'series_no', message: 'Series number already used!' });
        }

        if((await new Builder(`tbl_physical_count`).select().condition(`WHERE date_from= '${data.date_from}' AND date_to= '${data.date_to}'`).build()).rowCount > 0) {
            errors.push({ name: 'date_from', message: 'Date already occupied!' });
        }

        if(!(errors.length > 0)) {
            let inv = (await new Builder(`tbl_physical_count`)
                            .insert({ columns: `series_no, branch, date_from, date_to, type, brands, total_items, remarks, status, created_by, date_created, personnel`, 
                                            values: `'${(data.series_no).toUpperCase()}', '${JSON.stringify(data.branch)}', '${data.date_from}', '${data.date_to}', '${data.type}',
                                                            '${JSON.stringify(data.type !== 'annual' ? data.brands : [])}', ${data.total_items}, 
                                                            ${data.remarks !== '' ? `'${(data.remarks).toUpperCase()}'` : null}, 'ongoing', ${data.created_by}, '${date}', '${JSON.stringify([])}'` })
                            .condition(`RETURNING id`)
                            .build()).rows[0];

            audit.series_no = Global.randomizer(7);
            audit.field = 'all';
            audit.item_id = inv.id;
            audit.action = 'create';
            audit.user_id = data.created_by;
            audit.date = date;

            Global.audit(audit);
            return { result: 'success', message: 'Successfully saved!' }
        }
        else { return { result: 'error', error: errors } }
    }

    update = async data => {
        let pc = (await new Builder(`tbl_physical_count`).select().condition(`WHERE id= ${data.id}`).build()).rows[0];
        let date = Global.date(new Date());
        let audits = [];
        let errors = [];
        
        if(Global.compare(pc.branch, JSON.stringify(data.branch))) {
            audits.push({ series_no: Global.randomizer(7), table_name: 'tbl_physical_count', item_id: pc.id, field: 'branch', previous: pc.branch, 
                                    current: JSON.stringify(data.branch), action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(pc.date_from, data.date_from)) {
            if(!((await new Builder(`tbl_physical_count`).select().condition(`WHERE date_from= '${data.date_from}'`).build()).rowCount > 0)) {
                audits.push({ series_no: Global.randomizer(7), table_name: 'tbl_physical_count', item_id: pc.id, field: 'date_from', previous: pc.date_from, 
                                        current: data.date_from, action: 'update', user_id: data.updated_by, date: date });
            }
            else { errors.push({ name: 'date_from', message: 'Date already occupied!' }); }
        }

        if(Global.compare(pc.date_to, data.date_to)) {
            if(!((await new Builder(`tbl_physical_count`).select().condition(`WHERE date_to= '${data.date_to}'`).build()).rowCount > 0)) {
                audits.push({ series_no: Global.randomizer(7), table_name: 'tbl_physical_count', item_id: pc.id, field: 'date_to', previous: pc.date_to, 
                                        current: data.date_to, action: 'update', user_id: data.updated_by, date: date });
            }
            else { errors.push({ name: 'date_to', message: 'Date already occupied!' }); }
        }
        
        if(Global.compare(pc.type, data.type)) {
            audits.push({ series_no: Global.randomizer(7), table_name: 'tbl_physical_count', item_id: pc.id, field: 'type', previous: pc.type, 
                                    current: data.type, action: 'update', user_id: data.updated_by, date: date });
        }
        
        if(Global.compare(pc.total_items, data.total_items)) {
            audits.push({ series_no: Global.randomizer(7), table_name: 'tbl_physical_count', item_id: pc.id, field: 'total_items', previous: pc.total_items, 
                                    current: data.total_items, action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(pc.remarks, data.remarks)) {
            audits.push({ series_no: Global.randomizer(7), table_name: 'tbl_physical_count', item_id: pc.id, field: 'remarks', previous: pc.remarks, 
                                    current: data.remarks !== '' && data.remarks !== null ? (data.remarks).toUpperCase() : null, action: 'update', user_id: data.updated_by, date: date });
        }
        
        if(Global.compare(pc.brands, JSON.stringify(data.brands))) {
            audits.push({ series_no: Global.randomizer(7), table_name: 'tbl_physical_count', item_id: pc.id, field: 'brands', previous: pc.brands, 
                                    current: JSON.stringify(data.brands), action: 'update', user_id: data.updated_by, date: date });
        }

        if(!(errors.length > 0)) {
            await new Builder(`tbl_physical_count`)
                .update(`branch= '${JSON.stringify(data.branch)}', date_from= '${data.date_from}', date_to= '${data.date_to}', type= '${data.type}',
                                brands= '${JSON.stringify(data.type !== 'annual' ? data.brands : [])}', total_items= ${data.total_items}, 
                                remarks= ${data.remarks !== '' && data.remarks !== null ? `'${(data.remarks).toUpperCase()}'` : null}, status= '${data.status}',
                                updated_by= ${data.updated_by}, date_updated= '${date}'`)
                .condition(`WHERE id= ${pc.id}`)
                .build();

            audits.forEach(data => Global.audit(data));
            return { result: 'success', message: 'Successfully updated!' }
        }
        else { return { result: 'error', error: errors } }
    }

    login = async (data) => {
        // let errors = [];
        // let sched = (await new Builder(`tbl_physical_count`).select().condition(`WHERE date_from= '${data.date}'`).build()).rows[0];
        // let emp = (await new Builder(`tbl_employee`)
        //                     .select(`user_id AS employee, CONCAT(lname, ', ', fname, ' ', mname) AS name`)
        //                     .condition(`WHERE employee_no= '${data.employee_no}'`)
        //                     .build()).rows;
        
        // if(emp.length === 0) { errors.push({ name: 'employee_no', message: 'Employee no doesn`t exist!' }); }
        // if(emp.length > 0) { 
        //     emp[0]['branch'] = data.branch;

        //     if(!((JSON.parse(sched.personnel)).some(pnl => pnl.employee === emp[0].employee && pnl.branch === emp[0].branch))) { 
        //         errors.push({ name: 'employee_no', message: 'Employee not found!' }); 
        //     }
        //     if((await new Builder(`tbl_physical_count_personnels`).select().condition(`WHERE user_id= ${emp[0].employee} AND is_logged= 1`).build()).rowCount > 0) {
        //         errors.push({ name: 'employee_no', message: 'Employee already logged in!' });
        //     }
        // }

        // if(!(errors.length > 0)) {
        //     await new Builder(`tbl_physical_count_personnels`).update(`is_logged= 1`).condition(`WHERE user_id= ${emp[0].employee}`).build();
        //     return { result: 'success', id: emp[0].employee } 
        // }
        // else { return { result: 'error', error: errors } }
    }

    logout = async data => {
        // await new Builder(`tbl_physical_count_personnels`).update(`is_logged= 0`).condition(`WHERE user_id= ${data.id}`).build();
        // return { result: 'success', message: 'Successfully logged out!' }
    }
}

module.exports = PhysicalCount;