const Builder = require("../../function/builder"); // Query builder
const Global = require('../../function/global'); // Function

const audit = { series_no: '', table_name: 'tbl_physical_count_personnel',  item_id: 0, field: '', previous: null, current: null, action: '', user_id: 0, date: '' }; // Used for audit trail
class PhysicalCountPersonnel {
    specific = async id => { 
        return (await new Builder(`tbl_physical_count_personnels AS pnl`)
                        .select(`pnl.*, CONCAT(emp.lname, ', ', emp.fname, ' ', emp.mname) AS name`)
                        .join({ table: `tbl_employee AS emp`, condition: `emp.user_id = pnl.user_id`, type: `LEFT` })
                        .condition(`WHERE pnl.user_id= ${id}`).build()).rows; }

    dropdown = async () => {
        return [{ id: 0, name: '-- SELECT AN ITEM BELOW --' }]
                        .concat((await new Builder(`tbl_physical_count_personnels AS pnl`)
                                        .select(`pnl.user_id AS id, CONCAT(emp.lname, ', ', emp.fname, ' ', emp.mname) AS name`)
                                        .join({ table: `tbl_employee AS emp`, condition: `pnl.user_id = emp.user_id`, type: `LEFT` })
                                        .build()).rows);
    }

    save = async data => {
        let date = Global.date(new Date());
        let pc = (await new Builder(`tbl_physical_count`).select().condition(`WHERE id= ${data.physical_count_id}`).build()).rows[0];
        let pnls = JSON.parse(pc.personnel);
        
        if(data.form === 'create') { pnls.push({ branch: data.branch, type: data.type, employee: data.employee }); }
        else {
            let index = pnls.findIndex(obj => obj.employee.id === data.user_id);
            
            pnls[index]['branch'] = data.branch;
            pnls[index]['type'] = data.type;
            pnls[index]['employee']  = data.employee;
        }

        await new Builder(`tbl_physical_count`)
            .update(`updated_by= ${data.form === 'create' ? data.created_by : data.updated_by}, date_updated= '${date}', personnel= '${JSON.stringify(pnls)}'`)
            .condition(`WHERE id= ${pc.id}`)
            .build();

        await new Builder(`tbl_physical_count_personnels`)
            .update(`physical_count_id= ${data.physical_count_id}, branch= '${data.branch}', type= '${data.type}', 
                            assigned_by= ${data.form === 'create' ? data.created_by : data.updated_by}, assigned_date= '${date}', status= 1`)
            .condition(`WHERE user_id= ${data.employee.id}`)
            .build();

        return { result: 'success', message: 'Successfully saved!' }
    }

    update = async data => {
        let date = Global.date(new Date());
        let pc = (await new Builder(`tbl_physical_count`).select().condition(`WHERE id= ${data.id}`).build()).rows[0];
        let qry = '';

        if((data.personnel).length > 0) {
            for(let count = 0; count < (data.personnel).length; count++) { let pnl = (data.personnel)[count]; qry += `${count > 0 ? ' OR ' : ''}user_id != ${pnl.employee.id}`; }
            await new Builder(`tbl_physical_count_personnels`).update(`status= 0, is_logged= 0`).condition(`WHERE ${qry}`).build();
        }

        (data.personnel).forEach(async pnls => {
            let audits = [];
            let pnl = (await new Builder(`tbl_physical_count_personnels`).select().condition(`WHERE user_id= ${pnls.employee.id}`).build()).rows[0];
            
            if(Global.compare(pnl.physical_count_id, data.id)) {
                audits.push({ series_no: Global.randomizer(7), table_name: 'tbl_physical_count_personnels', item_id: pnl.id, field: 'physical_count_id', previous: pnl.physical_count_id, 
                                        current: data.id, action: 'update', user_id: data.updated_by, date: date });
            }

            if(Global.compare(pnl.branch, pnls.branch)) {
                audits.push({ series_no: Global.randomizer(7), table_name: 'tbl_physical_count_personnels', item_id: pnl.id, field: 'branch', previous: pnl.branch, 
                                        current: pnls.branch, action: 'update', user_id: data.updated_by, date: date });
            }

            if(Global.compare(pnl.type, pnls.type)) {
                audits.push({ series_no: Global.randomizer(7), table_name: 'tbl_physical_count_personnels', item_id: pnl.id, field: 'type', previous: pnl.type, 
                                        current: pnls.type, action: 'update', user_id: data.updated_by, date: date });
            }

            if(Global.compare(pnl.assigned_by, data.updated_by)) {
                audits.push({ series_no: Global.randomizer(7), table_name: 'tbl_physical_count_personnels', item_id: pnl.id, field: 'assigned_by', previous: pnl.assigned_by, 
                                        current: data.updated_by, action: 'update', user_id: data.updated_by, date: date });
            }

            await new Builder(`tbl_physical_count_personnels`)
                .update(`physical_count_id= ${data.id}, branch= '${pnls.branch}', type= '${pnls.type}', assigned_by= ${data.updated_by}, assigned_date= '${date}', status= 1`)
                .condition(`WHERE id= ${pnl.id}`)
                .build();

            audits.forEach(data => Global.audit(data));
        });

        if(Global.compare(pc.personnel, JSON.stringify(data.personnel))) {
            Global.audit({ series_no: Global.randomizer(7), table_name: 'tbl_physical_count', item_id: pc.id, field: 'personnel', previous: pc.personnel,
                                        current:  JSON.stringify(data.personnel), action: 'update', user_id: data.updated_by, date: date });
        }

        await new Builder(`tbl_physical_count`).update(`personnel= '${JSON.stringify((data.personnel).length > 0 ? data.personnel : [])}'`).condition(`WHERE id= ${data.id}`).build();
        if(qry === '') { await new Builder(`tbl_physical_count_personnels`).update(`status= 0, is_logged= 0`).build(); }
        return { result: 'success', message: 'Successfully assigned!' }
    }

    login = async data => {
        let errors = [];
        let sched = (await new Builder(`tbl_physical_count`).select().condition(`WHERE date_from= '${data.date}'`).build()).rows[0];
        let emp = (await new Builder(`tbl_employee`).select().condition(`WHERE employee_no= '${data.employee_no}'`).build()).rows[0];

        if(emp === undefined) { errors.push({ name: 'employee_no', message: 'Employee no doesn`t exist!' }); }
        else {
            let assign = await new Builder(`tbl_physical_count_personnels`)
                                    .select()
                                    .condition(`WHERE physical_count_id= ${sched.id} AND user_id= ${emp.user_id} AND branch= '${data.branch}' AND status= 1`)
                                    .build();
                                    
            if(assign.rowCount > 0) {
                let is_logged = await new Builder(`tbl_physical_count_personnels`).select().condition(`WHERE user_id= ${emp.user_id} AND is_logged = 1`).build();
                if(is_logged.rowCount > 0) { errors.push({ name: 'employee_no', message: 'Already logged in in another device!' }); }
            }
            else { errors.push({ name: 'employee_no', message: 'Employee is not registered!' }); }
        }
        
        if(!(errors.length > 0)) {
            await new Builder(`tbl_physical_count_personnels`).update(`is_logged= 1`).condition(`WHERE user_id= ${emp.user_id}`).build();
            return { result: 'success', id: emp.user_id }
        }
        else { return { result: 'error', error: errors } }
    }

    logout = async data => {
        await new Builder(`tbl_physical_count_personnels`).update(`is_logged= 0`).condition(`WHERE user_id= ${data.id}`).build();
        return { result: 'success', message: 'Successfully logged out!' }
    }

    list = async data => {
        return (await new Builder(`tbl_physical_count_personnels AS pnl`)
                        .select(`pnl.*, emp.fname, emp.mname, emp.lname`)
                        .join({ table: `tbl_employee AS emp`, condition: `pnl.user_id = emp.user_id`, type: `LEFT` })
                        .condition(`WHERE pnl.branch= '${data.branch}' AND pnl.physical_count_id= ${data.physical_count_id}`)
                        .except(`WHERE pnl.user_id = ${data.user_id} ORDER BY 1 DESC`)
                        .build()).rows;
    }
}

module.exports = PhysicalCountPersonnel;