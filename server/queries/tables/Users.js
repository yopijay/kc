const Builder = require("../../function/builder"); // Function
const Global = require("../../function/global"); // Function

const audit = { series_no: '', table_name: 'tbl_users',  item_id: 0, field: '', previous: null, current: null, action: '', user_id: 0, date: '' }; // Used for audit trail
class Users {
    specific = async (id) => { 
        return (await new Builder(`tbl_users AS usr`)
                        .select()
                        .join({ table: `tbl_employee AS emp`, condition: `emp.user_id = usr.id`, type: `LEFT` })
                        .condition(`WHERE usr.id= ${atob(id)}`)
                        .build()).rows;
    }

    dashboard = async () => {
        let summary = [];
        let _count = (await new Builder(`tbl_company`).select(`id, name`).condition(`WHERE status= 1 ORDER BY date_created ASC LIMIT 3`).build()).rows;

        for(let count = 0; count < _count.length; count++) {
            summary.push({ name: _count[count].name,
                                        count: (await new Builder(`tbl_users AS usr`)
                                                        .select(`COUNT(*)`)
                                                        .join({ table: `tbl_employee AS emp`, condition: `emp.user_id = usr.id`, type: `LEFT` })
                                                        .condition(`WHERE emp.company_id= ${_count[count].id} AND usr.status= 1`).build()).rows[0].count });
        }
        
        return {
            total: (await new Builder(`tbl_users`).select(`id`).except(`WHERE id= 1`).build()).rowCount,
            summary
        }
    }
    
    login = async (data) => {
        let email = await new Builder(`tbl_users`).select().condition(`WHERE email= '${data.email}'`).build();
        let verified = await new Builder(`tbl_users`).select().condition(`WHERE email= '${data.email}' AND is_email_verified= 1`).build();
        let creds = await new Builder(`tbl_users`).select().condition(`WHERE email= '${data.email}' AND password= '${data.password}'`).build();

        if(email.rowCount === 1) {
            if(verified.rowCount === 1) {
                if(creds.rowCount === 1) {
                    if(creds.rows[0].is_logged === 0) {
                        let logged_in = await new Builder(`tbl_users`).update(`is_logged= 1`).condition(`WHERE id= ${creds.rows[0].id} RETURNING id`).build();
                        return { result: 'success', id: logged_in.rows[0].id }
                    }
                    else { return { result: 'error', error: [{ name: 'email', message: 'Account already used in another device' }] }}
                }
                else { return { result: 'error', error: [{ name: 'password', message: 'Incorrect password' }] } }
            }
            else { return { result: 'error', error: [{ name: 'email', message: 'Email is not yet verified' }] } }
        }
        else { return { result: 'error', error: [{ name: 'email', message: 'Email doesn`t exist!' }] } }
    }

    profile = async (id) => {
        return (await new Builder(`tbl_users AS usr`)
                        .select(`usr.id, usr.series_no, usr.email, usr.password, usr.contact_no, usr.user_level, usr.status, emp.employee_no, emp.rfid, emp.company_id, 
                                    emp.department_id, emp.position_id, emp.branch, emp.fname, emp.mname, emp.lname, emp.birthdate, emp.address,
                                    emp.vacation_leave, emp.sick_leave, emp.employment_status, emp.civil_status, emp.date_hired, emp.date_resigned`)
                        .join({ table: `tbl_employee AS emp`, condition: `emp.user_id = usr.id`, type: 'LEFT' })
                        .condition(`WHERE usr.id= ${id}`)
                        .build()).rows;
    }

    logout = async (data) => {
        await new Builder(`tbl_users`).update(`is_logged= 0`).condition(`WHERE id= ${data.id}`).build();
        return { result: 'success', message: 'Successfully logged out!' }
    }

    dropdown = async (data) => {
        return [{ id: 0, name: '-- SELECT AN ITEM BELOW --' }]
                        .concat((await new Builder(`tbl_users AS usr`)
                                            .select(`usr.id, CONCAT(info.lname, ', ', info.fname, ' ', info.mname) AS name`)
                                            .join({ table: `tbl_employee AS info`, condition: `info.user_id = usr.id`, type: 'LEFT' })
                                            .condition(`WHERE usr.status = 1 ${data.company_id !== undefined ? `AND info.company_id= ${data.company_id}` : ''}
                                                                ${data.department_id !== undefined ? `AND info.department_id= ${data.department_id}` : ''}
                                                                ${data.branch !== undefined ? `AND info.branch= '${data.branch}'` : ''}
                                                                ORDER BY info.lname ASC`)
                                            .build()).rows);
    }

    list = async (data) => {
        return (await new Builder(`tbl_users AS usr`)
                        .select(`usr.id, usr.email, usr.status, emp.employee_no, cmp.name AS company, dpt.name AS department, emp.fname, emp.lname, emp.date_hired`)
                        .join({ table: `tbl_employee AS emp`, condition: `emp.user_id = usr.id`, type: `LEFT` })
                        .join({ table: `tbl_company AS cmp`, condition: `emp.company_id = cmp.id`, type: `LEFT` })
                        .join({ table: `tbl_department AS dpt`, condition: `emp.department_id = dpt.id`, type: `LEFT` })
                        .condition(`${data.company_id !== 'all' || data.searchtxt !== '' ? `WHERE `: ''}
                                            ${data.company_id !== 'all' ? `emp.company_id= ${data.company_id}` : ''}
                                            ${data.company_id !== 'all' && data.searchtxt !== '' ? `AND `: ''}
                                            ${data.searchtxt !== '' ? `(emp.employee_no LIKE '%${(data.searchtxt).toUpperCase()}%' OR emp.fname LIKE '%${(data.searchtxt).toUpperCase()}%' 
                                            OR emp.lname LIKE '%${(data.searchtxt).toUpperCase()}%' OR usr.email LIKE '%${(data.searchtxt).toUpperCase()}%')`: ''}`)
                        .except(`WHERE usr.id= ${data.id} 
                                        ORDER BY ${data.orderby === 'date_hired' ? `9 ${(data.sort).toUpperCase()}, 8 ${(data.sort).toUpperCase()}` : 
                                                                data.orderby === 'employee_no' ? `4 ${(data.sort).toUpperCase()}` : 
                                                                data.orderby === 'lname' ? `8 ${(data.sort).toUpperCase()}` : `${data.orderby} ${(data.sort).toUpperCase()}`}`)
                        .build()).rows;
    }

    excel = async (type, data) => {
        switch(type) {
            case 'formatted':
                return (await new Builder(`tbl_users AS usr`)
                                .select(`usr.series_no AS "Series No.", emp.employee_no AS "Employee No.", emp.rfid AS "RFID", cmp.name AS "Company", dpt.name AS "Department", 
                                                pst.name AS "Position", usr.email AS "Email", emp.fname AS "First name", emp.mname AS "Middle name", emp.lname AS "Last name",
                                                usr.contact_no AS "Contact No.", emp.gender AS "Gender", emp.civil_status AS "Civil status", emp.birthdate AS "Birthdate",
                                                emp.employment_status AS "Employment Status", emp.branch AS "Branch", usr.user_level AS "User level", emp.date_hired AS "Date hired",
                                                emp.date_resigned AS "Date resigned", CASE WHEN emp.date_resigned IS NULL THEN 'Active' ELSE 'Resigned' END AS "Status",
                                                CONCAT(cb.lname, ', ', cb.fname, ' ', cb.mname) AS "Created by", usr.date_created AS "Date created",
                                                CONCAT(ub.lname, ', ', ub.fname, ' ', ub.mname) AS "Updated by", usr.date_updated AS "Date updated",
                                                CONCAT(db.lname, ', ', db.fname, ' ', db.mname) AS "Deleted by", usr.date_deleted AS "Date deleted",
                                                CONCAT(ib.lname, ', ', ib.fname, ' ', ib.mname) AS "Imported by", usr.date_imported AS "Date imported"`)
                                .join({ table: `tbl_employee AS emp`, condition: `emp.user_id = usr.id`, type: `LEFT` })
                                .join({ table: `tbl_company AS cmp`, condition: `emp.company_id = cmp.id`, type: `LEFT` })
                                .join({ table: `tbl_department AS dpt`, condition: `emp.department_id = dpt.id`, type: `LEFT` })
                                .join({ table: `tbl_position AS pst`, condition: `emp.position_id = pst.id`, type: `LEFT` })
                                .join({ table: `tbl_employee AS cb`, condition: `cb.user_id = usr.created_by`, type: `LEFT` })
                                .join({ table: `tbl_employee AS ub`, condition: `ub.user_id = usr.updated_by`, type: `LEFT` })
                                .join({ table: `tbl_employee AS db`, condition: `db.user_id = usr.deleted_by`, type: `LEFT` })
                                .join({ table: `tbl_employee AS ib`, condition: `ib.user_id = usr.imported_by`, type: `LEFT` })
                                .condition(`${data.company_id !== 'all' || data.searchtxt !== '' ? `WHERE `: ''}
                                                    ${data.company_id !== 'all' ? `emp.company_id= ${data.company_id}` : ''}
                                                    ${data.company_id !== 'all' && data.searchtxt !== '' ? `AND `: ''}
                                                    ${data.searchtxt !== '' ? `(emp.employee_no LIKE '%${(data.searchtxt).toUpperCase()}%' OR emp.fname LIKE '%${(data.searchtxt).toUpperCase()}%' 
                                                    OR emp.lname LIKE '%${(data.searchtxt).toUpperCase()}%' OR usr.email LIKE '%${(data.searchtxt).toUpperCase()}%')`: ''}`)
                                .except(`WHERE usr.id= ${atob(data.id)} 
                                                ORDER BY ${data.orderby === 'date_hired' ? `18 ${(data.sort).toUpperCase()}, 10 ${(data.sort).toUpperCase()}` : 
                                                                        data.orderby === 'employee_no' ? `2 ${(data.sort).toUpperCase()}` : 
                                                                        data.orderby === 'lname' ? `10 ${(data.sort).toUpperCase()}` : `${data.orderby} ${(data.sort).toUpperCase()}`}`)
                                .build()).rows;
            default:
                return (await new Builder(`tbl_users AS usr`)
                                .select(`usr.id, usr.series_no, usr.email, usr.password, usr.contact_no, usr.is_email_verified, usr.is_contact_no_verified, usr.user_level,
                                                emp.employee_no, emp.rfid, emp.company_id, emp.department_id, emp.position_id, emp.fname, emp.mname, emp.lname,
                                                emp.branch, emp.employment_status, emp.gender, emp.civil_status, emp.address, emp.birthdate, emp.date_hired, emp.date_resigned,
                                                usr.status, usr.created_by, usr.updated_by, usr.deleted_by, usr.imported_by, usr.date_created, usr.date_updated,
                                                usr.date_deleted, usr.date_imported`)
                                .join({ table: `tbl_employee AS emp`, condition: `emp.user_id = usr.id`, type: `LEFT` })
                                .condition(`${data.company_id !== 'all' || data.searchtxt !== '' ? `WHERE `: ''}
                                                    ${data.company_id !== 'all' ? `emp.company_id= ${data.company_id}` : ''}
                                                    ${data.company_id !== 'all' && data.searchtxt !== '' ? `AND `: ''}
                                                    ${data.searchtxt !== '' ? `(emp.employee_no LIKE '%${(data.searchtxt).toUpperCase()}%' OR emp.fname LIKE '%${(data.searchtxt).toUpperCase()}%' 
                                                    OR emp.lname LIKE '%${(data.searchtxt).toUpperCase()}%' OR usr.email LIKE '%${(data.searchtxt).toUpperCase()}%')`: ''}`)
                                .except(`WHERE usr.id= ${atob(data.id)} 
                                                ORDER BY ${data.orderby === 'date_hired' ? `23 ${(data.sort).toUpperCase()}, 16 ${(data.sort).toUpperCase()}` : 
                                                                        data.orderby === 'employee_no' ? `9 ${(data.sort).toUpperCase()}` : 
                                                                        data.orderby === 'lname' ? `16 ${(data.sort).toUpperCase()}` : `${data.orderby} ${(data.sort).toUpperCase()}`}`)
                                .build()).rows;
        }
    }

    search = async (data) => {
        return (await new Builder(`tbl_users AS usr`)
                        .select(`usr.id, usr.email, usr.status, emp.employee_no, cmp.name AS company, dpt.name AS department, emp.fname, emp.lname, emp.date_hired`)
                        .join({ table: `tbl_employee AS emp`, condition: `emp.user_id = usr.id`, type: `LEFT` })
                        .join({ table: `tbl_company AS cmp`, condition: `emp.company_id = cmp.id`, type: `LEFT` })
                        .join({ table: `tbl_department AS dpt`, condition: `emp.department_id = dpt.id`, type: `LEFT` })
                        .condition(`WHERE (emp.employee_no LIKE '%${(data.searchtxt).toUpperCase()}%' OR emp.fname LIKE '%${(data.searchtxt).toUpperCase()}%' 
                                            OR emp.lname LIKE '%${(data.searchtxt).toUpperCase()}%' OR usr.email LIKE '%${(data.searchtxt).toUpperCase()}%')
                                            ${data.company_id !== 'all' ? ` AND emp.company_id= ${data.company_id}` : ''}`)
                        .except(`WHERE usr.id= ${atob(data.id)} 
                                        ORDER BY ${data.orderby === 'date_hired' ? `9 ${(data.sort).toUpperCase()}, 8 ${(data.sort).toUpperCase()}` : 
                                                                data.orderby === 'employee_no' ? `4 ${(data.sort).toUpperCase()}` : 
                                                                    data.orderby === 'lname' ? `8 ${(data.sort).toUpperCase()}` : `${data.orderby} ${(data.sort).toUpperCase()}`}`)
                        .build()).rows;
    }

    save = async (data) => {
        let date = Global.date(new Date());
        let errors = [];
        
        let series = (await new Builder(`tbl_users`).select(`COUNT(*)`).build()).rows[0];
        // let email = await new Builder(`tbl_users`).select().condition(`WHERE email= '${data.email}'`).build();
        let name = await new Builder(`tbl_employee`).select().condition(`WHERE fname= '${(data.fname).toUpperCase()}' AND lname= '${(data.lname).toUpperCase()}'`).build();
        // let employee_no = await new Builder(`tbl_employee`).select().condition(`WHERE employee_no= '${data.employee_no}'`).build();
        // let rfid = data.rfid === '' || data.rfid === '-' ? 0 : await new Builder(`tbl_employee`).select().condition(`WHERE rfid= '${data.rfid}'`).build();

        // if(email.rowCount > 0) { errors.push({ name: 'email', message: 'Email already exist!'}); }
        if(name.rowCount > 0) { errors.push({ name: 'lname', message: 'Name already exist!' }); }
        // if(employee_no.rowCount > 0) { errors.push({ name: 'employee_no', message: 'Employee no already used!' }); }
        // if(rfid.rowCount > 0) { errors.push({ name: 'rfid', message: 'RFID already used!' }); }

        if(!(errors.length > 0)) {
            let usr = (await new Builder(`tbl_users`)
                                .insert({ columns: `series_no, email, contact_no, is_email_verified, is_contact_no_verified, user_level, is_logged, status, created_by, date_created`, 
                                                values: `'${Global.series({ label: `USR-`, count: series.count, limit: 7 })}', ${data.email !== '' ? `'${data.email}'` : null}, 
                                                ${data.contact_no !== '' ? `'${data.contact_no}'` : null}, 0, 0, '${data.user_level}', 0, 1, ${atob(data.created_by)}, '${date}'` })
                                .condition(`RETURNING id`)
                                .build()).rows[0];
            await new Builder(`tbl_employee`)
                .insert({ columns: `user_id, employee_no, rfid, company_id, department_id, position_id, fname, mname, lname, branch, 
                                                employment_status, gender, civil_status, address, vacation_leave, sick_leave, birthdate, date_hired`, 
                            values: `${usr.id}, ${data.employee_no !== '' ? `'${data.employee_no}'` : null}, ${data.rfid !== '' ? `'${data.rfid}'` : null}, ${data.company_id}, ${data.department_id}, 
                                            ${data.position_id}, '${(data.fname).toUpperCase()}', ${data.mname !== '' ? `'${(data.mname).toUpperCase()}'` : null}, 
                                            '${(data.lname).toUpperCase()}', '${data.branch}', '${data.employment_status}', '${data.gender}', '${data.civil_status}', 
                                            ${data.address !== '' ? `'${(data.address).toUpperCase()}'` : null}, ${data.vl}, ${data.sl}, '${data.birthdate}', '${data.date_hired}'` })
                .build();
            
            audit.series_no = Global.randomizer(7);
            audit.field = 'all';
            audit.item_id = usr.id;
            audit.action = 'create';
            audit.user_id = atob(data.created_by);
            audit.date = date;

            Global.audit(audit);
            return { result: 'success', message: 'Successfully saved!' }
        }
        else { return { result: 'error', error: errors } }
    }

    update = async (data) => {
        let _errors = [];
        let _audit = [];
        let date = Global.date(new Date());
        let usr = (await new Builder(`tbl_users AS usr`)
                            .select()
                            .join({ table: `tbl_employee AS emp`, condition: `emp.user_id = usr.id`, type: `LEFT` })
                            .condition(`WHERE usr.id= ${atob(data.id)}`)
                            .build()).rows[0];

        if(Global.compare(usr.email, data.email)) {
            // if((await new Builder(`tbl_users`).select().condition(`WHERE email= '${data.email}'`).build()).rowCount > 0) { _errors.push({ name: 'email', message: 'Email already used!' }); }
            // else {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_users',  item_id: usr.id, field: 'email', previous: usr.email, 
                                    current: data.email !== '' && data.email !== null ? data.email : null, action: 'update', user_id: atob(data.updated_by), date: date });
            // }
        }
        
        if(Global.compare(usr.fname, data.fname)) {
            if((await new Builder(`tbl_employee`).select().condition(`WHERE fname= '${(data.fname).toUpperCase()}' AND lname= '${(data.lname).toUpperCase()}'`).build()).rowCount > 0) {
                _errors.push({ name: 'fname', message: `First name already used with this last name ${(data.lname).toUpperCase()}` });
            }
            else {
                _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_users',  item_id: usr.id, field: 'fname', previous: usr.fname, 
                                        current: (data.fname).toUpperCase(), action: 'update', user_id: atob(data.updated_by), date: date });
            }
        }

        if(Global.compare(usr.mname, data.mname)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_users',  item_id: usr.id, field: 'mname', previous: usr.mname, 
                                    current: data.mname !== '' && data.mname !== null ? (data.mname).toUpperCase() : null, action: 'update', user_id: atob(data.updated_by), date: date });
        }
        
        if(Global.compare(usr.lname, data.lname)) {
            if((await new Builder(`tbl_employee`).select().condition(`WHERE fname= '${(data.fname).toUpperCase()}' AND lname= '${(data.lname).toUpperCase()}'`).build()).rowCount > 0) {
                _errors.push({ name: 'lname', message: `Last name already used!` });
            }
            else {
                _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_users',  item_id: usr.id, field: 'lname', previous: usr.lname, 
                                        current: (data.lname).toUpperCase(), action: 'update', user_id: atob(data.updated_by), date: date });
            }
        }

        if(Global.compare(usr.contact_no, data.contact_no)) {
            // if((await new Builder(`tbl_users`).select().condition(`WHERE contact_no = '${data.contact_no}' `).build()).rowCount > 0) {
            //     _errors.push({ name: 'contact_no', message: 'Contact no already used!' })
            // }
            // else {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_users',  item_id: usr.id, field: 'contact_no', previous: usr.contact_no, 
                                    current: data.contact_no !== '' && data.contact_no !== null ? data.contact_no : null, action: 'update', user_id: atob(data.updated_by), date: date });
            // }
        }

        if(Global.compare(usr.gender, data.gender)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_users',  item_id: usr.id, field: 'gender', previous: usr.gender, 
                                    current: data.gender, action: 'update', user_id: atob(data.updated_by), date: date });
        }

        if(Global.compare(usr.civil_status, data.civil_status)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_users',  item_id: usr.id, field: 'civil_status', previous: usr.civil_status, 
                                    current: data.civil_status, action: 'update', user_id: atob(data.updated_by), date: date });
        }

        if(Global.compare(usr.birthdate, data.birthdate)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_users',  item_id: usr.id, field: 'birthdate', previous: usr.birthdate, 
                                    current: data.birthdate, action: 'update', user_id: atob(data.updated_by), date: date });
        }

        if(Global.compare(usr.address, data.address)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_users',  item_id: usr.id, field: 'address', previous: usr.address, 
                                    current: data.address !== '' && data.address !== null ? (data.address).toUpperCase() : null, action: 'update', user_id: atob(data.updated_by), date: date });
        }

        if(Global.compare(usr.company_id, data.company_id)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_users',  item_id: usr.id, field: 'company_id', previous: usr.company_id, 
                                    current: data.company_id, action: 'update', user_id: atob(data.updated_by), date: date });
        }

        if(Global.compare(usr.department_id, data.department_id)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_users',  item_id: usr.id, field: 'department_id', previous: usr.department_id, 
                                    current: data.department_id, action: 'update', user_id: atob(data.updated_by), date: date });
        }

        if(Global.compare(usr.position_id, data.position_id)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_users',  item_id: usr.id, field: 'position_id', previous: usr.position_id, 
                                    current: data.position_id, action: 'update', user_id: atob(data.updated_by), date: date });
        }

        if(Global.compare(usr.employee_no, data.employee_no)) {
            // if(data.employee_no !== '' && data.employee_no !== '-') {
            //     if((await new Builder(`tbl_employee`).select().condition(`WHERE employee_no= '${data.employee_no}'`).build()).rowCount > 0) {
            //         _errors.push({ name: 'employee_no', message: 'Employee no already used!' });
            //     }
            // }
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_users',  item_id: usr.id, field: 'employee_no', previous: usr.employee_no, 
                                    current: data.employee_no !== '' && data.employee_no !== null ? data.employee_no : null, action: 'update', user_id: atob(data.updated_by), date: date });
        }

        if(Global.compare(usr.rfid, data.rfid)) {
            // if(data.rfid !== '' && data.rfid !== '-') {
            //     if((await new Builder(`tbl_employee`).select().condition(`WHERE rfid= '${data.rfid}'`).build()).rowCount > 0) {
            //         _errors.push({ name: 'rfid', message: 'RFID already used!' });
            //     }
            // }

            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_users',  item_id: usr.id, field: 'rfid', previous: usr.rfid, 
                                    current: data.rfid !== '' && data.rfid !== null ? data.rfid : null, action: 'update', user_id: atob(data.updated_by), date: date });
        }

        if(Global.compare(usr.branch, data.branch)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_users',  item_id: usr.id, field: 'branch', previous: usr.branch, 
                                    current: data.branch, action: 'update', user_id: atob(data.updated_by), date: date });
        }

        if(Global.compare(usr.employment_status, data.employment_status)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_users',  item_id: usr.id, field: 'employment_status', previous: usr.employment_status, 
                                    current: data.employment_status, action: 'update', user_id: atob(data.updated_by), date: date });
        }

        if(Global.compare(usr.user_level, data.user_level)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_users',  item_id: usr.id, field: 'user_level', previous: usr.user_level, 
                                    current: data.user_level, action: 'update', user_id: atob(data.updated_by), date: date });
        }

        if(Global.compare(usr.date_hired, data.date_hired)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_users',  item_id: usr.id, field: 'date_hired', previous: usr.date_hired, 
                                    current: data.date_hired, action: 'update', user_id: atob(data.updated_by), date: date });
        }
        
        if(!(_errors.length > 0)) {
            await new Builder(`tbl_users`)
                .update(`email= ${data.email !== '' && data.email !== null ? `'${data.email}'` : null}, contact_no= ${data.contact_no !== '' && data.contact_no !== null ? `'${data.contact_no}'` : null}, 
                                user_level= '${data.user_level}', updated_by= ${atob(data.updated_by)}, date_updated= '${date}'`)
                .condition(`WHERE id= ${usr.id}`)
                .build();

            await new Builder(`tbl_employee`)
                .update(`employee_no= ${data.employee_no !== '' && data.employee !== null ? `'${data.employee_no}'` : null}, rfid= ${data.rfid !== '' && data.rfid !== null ? `'${data.rfid}'` : null},
                                company_id= ${data.company_id}, department_id= ${data.department_id}, position_id= ${data.position_id}, fname= '${(data.fname).toUpperCase()}', 
                                mname= ${data.mname !== '' || data.mname !== null ? `'${(data.mname).toUpperCase()}'` : null}, lname= '${(data.lname).toUpperCase()}', branch= '${data.branch}', 
                                employment_status= '${data.employment_status}', gender= '${data.gender}', civil_status= '${data.civil_status}', 
                                address= ${data.address !== '' && data.address !== null ? `'${(data.address).toUpperCase()}'` : null}, birthdate= '${data.birthdate}', date_hired= '${data.date_hired}'`)
                .condition(`WHERE user_id= ${usr.id}`)
                .build();

            _audit.forEach(item => Global.audit(item));
            return { result: 'success', message: 'Successfully updated!' }
        }
        else { return { result: 'error', error: _errors } }
    }
}

module.exports = Users;