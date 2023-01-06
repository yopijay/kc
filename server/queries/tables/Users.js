const Builder = require("../../function/builder"); // Function

class Users {
    login = async (data) => {
        let email = await new Builder(`tbl_users`).select().condition(`WHERE email= '${data.email}'`).build();
        let verified = await new Builder(`tbl_users`).select().condition(`WHERE email= '${data.email}' AND is_email_verified= 1`).build();
        let creds = await new Builder(`tbl_users`).select().condition(`WHERE email= '${data.email}' AND password= '${data.password}'`).build();

        if(email.rowCount === 1) {
            if(verified.rowCount === 1) {
                if(creds.rowCount === 1) {
                    if(creds.rows[0].is_logged === 0) {
                        let logged_in = await new Builder(`tbl_users`).update(`is_logged= 1`).condition(`WHERE id= ${creds.rows[0].id} RETURNING id`).build();
                        return { result: 'success', message: { id: btoa(logged_in.rows[0].id) } }
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
                                        .select(`usr.id, usr.series_no, usr.email, usr.password, usr.contact_no, usr.user_level, usr.status, emp.employee_no, emp.rfid, emp.company_id, emp.department_id, emp.position_id,
                                                    emp.branch, emp.fname, emp.mname, emp.lname, emp.bmonth, emp.bday, emp.byear, emp.address,
                                                    emp.vl, emp.sl, emp.employment_status, emp.civil_status, emp.sss, emp.philhealth, emp.tin, emp.hdmf, emp.date_hired, emp.date_resigned`)
                                        .join({ table: `tbl_employee AS emp`, condition: `emp.user_id = usr.id`, type: 'LEFT' })
                                        .condition(`WHERE usr.id= ${id}`)
                                        .build()).rows;
    }

    logout = async (data) => {
        await new Builder(`tbl_users`).update(`is_logged= 0`).condition(`WHERE id= ${atob(data.id)}`).build();
        return { result: 'success', message: 'Successfully logged out!' }
    }

    dropdown = async (data) => { return (await new Builder(`tbl_users AS usr`).select(`usr.id, CONCAT(info.lname, ', ', info.fname, ' ', info.mname) AS name`).join({ table: `tbl_employee AS info`, condition: `info.user_id = usr.id`, type: 'LEFT' }).condition(`WHERE usr.status = 1 ORDER BY info.lname ASC`).build()).rows; }
}

module.exports = Users;