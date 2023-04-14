const Builder = require("../../function/builder"); // Function
const Global = require("../../function/global"); // Function

const audit = { series_no: '', table_name: 'tbl_users',  item_id: 0, field: '', previous: null, current: null, action: '', user_id: 0, date: '' }; // Used for audit trail
class Tracker {
    series = async () => { return (await new Builder(`tbl_tracker`).select(`COUNT(*)`).build()).rows; }
    specific = async (id) => { return (await new Builder(`tbl_tracker`).select().condition(`WHERE id= ${id}`).build()).rows; }
    filter = async () => { return [{ id: 'all', name: 'ALL' }].concat((await new Builder(`tbl_tracker`).select(`id, name`).condition(`WHERE status= 1 ORDER BY date_created DESC`).build()).rows); }

    dropdown = async () => {
        return [{ id: 0, name: '-- SELECT AN ITEM BELOW --' }]
                        .concat((await new Builder(`tbl_tracker`).select(`id, name`).condition(`WHERE status= 1 ORDER BY date_created DESC`).build()).rows);
    }

    dashboard = async (data) => {
        return {
            total: (await new Builder(`tbl_users AS usr`)
                        .select()
                        .join({ table: `tbl_employee AS emp`, condition: `emp.user_id = usr.id`, type: `LEFT` })
                        .condition(`${data.branch !== 'all' ? `WHERE emp.branch = '${data.branch}'` : ''}`)
                        .except(`WHERE usr.id= 1`)
                        .build()).rowCount,
            unknown: (await new Builder(`tbl_users AS usr`)
                                .select(`DISTINCT trckr.user_id`)
                                .join({ table: `tbl_employee_tracker AS trckr`, condition: `trckr.user_id = usr.id`, type: `LEFT` })
                                .condition(`WHERE ${data.branch !== 'all' ? `trckr.branch= '${data.branch}' AND` : ''} trckr.date_out is NULL`)
                                .except(`WHERE usr.id= 1`)
                                .build()).rowCount
        }
    }

    monitor = async (data) => {
        return (await new Builder(`tbl_users AS usr`)
                        .select()
                        .join({ table: `tbl_employee AS emp`, condition: `emp.user_id = usr.id`, type: `LEFT` })
                        .join({ table: `tbl_employee_tracker AS trckr`, condition: `trckr.user_id = usr.id`, type: `LEFT` })
                        .condition(`WHERE ${data.tracker_id !== '' ? `trckr.tracker_id = ${data.tracker_id} AND` : ''} trckr.date_out IS NULL`)
                        .except(`WHERE usr.id = 1`)
                        .build()).rows;
    }

    list = async (data) => {
        return (await new Builder(`tbl_tracker`)
                        .select(`id, series_no, name, status`)
                        .condition(`${data.searchtxt !== '' ? 
                                            `WHERE series_no LIKE '${(data.searchtxt).toUpperCase()}' OR name LIKE '${(data.searchtxt).toUpperCase()}'` : ''} 
                                            ORDER BY ${data.orderby} ${(data.sort).toUpperCase()}`)
                        .build()).rows;
    }

    excel = async (type, data) => {
        return data;
    }

    search = async (data) => {
        return (await new Builder(`tbl_tracker`)
                        .select(`id, series_no, name, status`)
                        .condition(`WHERE series_no LIKE '${(data.searchtxt).toUpperCase()}' OR name LIKE '${(data.searchtxt).toUpperCase()}' 
                                            ORDER BY ${data.orderby} ${(data.sort).toUpperCase()}`)
                        .build()).rows;
    }

    save = async (data) => {
        let date = Global.date(new Date());
        let errors = [];

        if((await new Builder(`tbl_tracker`).select().condition(`WHERE series_no= '${(data.series_no).toUpperCase()}'`).build()).rowCount > 0) {
            errors.push({ name: 'series_no', message: 'Series number already exist!' });
        }

        if((await new Builder(`tbl_tracker`).select().condition(`WHERE name= '${(data.name).toUpperCase()}'`).build()).rowCount > 0) {
            errors.push({ name: 'name', message: 'Location already exist!' });
        }

        if(!(errors.length > 0)) {
            let trckr = (await new Builder(`tbl_tracker`)
                                .insert({ columns: `series_no, name, status, created_by, date_created`, 
                                                values: `'${(data.series_no).toUpperCase()}', '${(data.name).toUpperCase()}', ${data.status ? 1 : 0}, ${data.created_by}, '${date}'` })
                                .condition(`RETURNING id`)
                                .build()).rows[0];

            audit.series_no = Global.randomizer(7);
            audit.field = 'all',
            audit.item_id = trckr.id;
            audit.action = 'create';
            audit.user_id = data.created_by;
            audit.date = date;

            Global.audit(audit);
            return { result: 'success', message: 'Successfully saved!' }
        }
        else { return { result: 'error', error: errors } }
    }

    update = async (data) => {
        let trckr = (await new Builder(`tbl_tracker`).select().condition(`WHERE id= ${data.id}`).build()).rows[0];
        let date = Global.date(new Date());
        let _audit = [];
        let _errors = [];

        if(Global.compare(trckr.name, data.name)) {
            if(!((await new Builder(`tbl_tracker`).select().condition(`WHERE name= '${(data.name).toUpperCase()}'`).build()).rowCount > 0)) {
                _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_tracker', item_id: trckr.id, field: 'name', previous: trckr.name,
                                        current: (data.name).toUpperCase(), action: 'update', user_id: data.updated_by, date: date });
            }
            else { _errors.push({ name: 'name', message: 'Location already exist!' }); }
        }

        if(Global.compare(trckr.status, data.status ? 1 : 0)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_tracker', item_id: trckr.id, field: 'status', previous: trckr.status, 
                                    current: data.status ? 1 : 0, action: 'update', user_id: data.updated_by, date: date });
        }

        if(!(_errors.length > 0)) {
            await new Builder(`tbl_tracker`)
                .update(`name= '${(data.name).toUpperCase()}', status= ${data.status ? 1 : 0}, updated_by= ${data.updated_by}, date_updated= '${date}'`)
                .condition(`WHERE id= ${trckr.id}`)
                .build();

            _audit.forEach(data => Global.audit(data));
            return { result: 'success', message: 'Successfully updated!' }
        }
        else { return { result: 'error', error: _errors } }
    }

    track = async (data) => {
        let currdate = Global.date(new Date());
        let date = new Date();
        let time = `${date.getHours() >= 10 ? '' : '0'}${date.getHours()}:${(date.getMinutes()) >= 10 ? '' : '0'}${date.getMinutes()}:${(date.getSeconds()) >= 10 ? '' : '0'}${date.getSeconds()}`;

        let trckr = (await new Builder(`tbl_employee_tracker`)
                            .select()
                            .condition(`WHERE tracker_id= ${data.tracker_id} AND user_id= ${data.id} AND date_in= '${data.date}' AND branch= '${data.branch}' AND date_out is NULL`)
                            .build()).rows[0];
                            
        if(!trckr) {
            let _prev = (await new Builder(`tbl_employee_tracker`)
                                .select()
                                .condition(`WHERE user_id= ${data.id} AND date_in= '${data.date}' AND date_out is NULL`)
                                .build()).rows;

            if(!(_prev.length > 0)) {
                let _in = (await new Builder(`tbl_employee_tracker`)
                                    .insert({ columns: `series_no, tracker_id, branch, user_id, date_in, time_in, date_created`, 
                                                    values: `'${Global.randomizer(7)}', ${data.tracker_id}, '${data.branch}', ${data.id}, '${data.date}', '${time}', '${currdate}'` })
                                    .condition(`RETURNING id`)
                                    .build()).rows[0];

                Global.audit({ series_no: Global.randomizer(7), table_name: 'tbl_employee_tracker', item_id: _in.id, field: 'all', previous: null,
                    current: null, action: 'in', user_id: data.id, date: currdate });
                    
                return { result: 'success', message: 'Department In!' }
            }
            else {
                return { result: 'error', message: 'Please sign out in another department first!' }
            }
        }
        else {
            await new Builder(`tbl_employee_tracker`).update(`date_out= '${data.date}', time_out= '${time}', date_updated= '${currdate}'`).condition(`WHERE id= ${trckr.id}`).build();

            Global.audit({ series_no: Global.randomizer(7), table_name: 'tbl_employee_tracker', item_id: trckr.id, field: 'all', previous: null,
                current: null, action: 'out', user_id: data.id, date: currdate });
                
            return { result: 'success', message: 'Department Out!' }
        }
    }

    logs = async (data) => {
        return (await new Builder(`tbl_employee_tracker AS trckr`)
                        .select()
                        .join({ table: `tbl_employee AS emp`, condition: `emp.user_id = trckr.user_id`, type: `LEFT` })
                        .condition(`WHERE trckr.date_in= '${data.date}' ${data.branch !== 'all' ? `AND trckr.branch= '${data.branch}' ` : ''}
                                            ${data.tracker_id !== 'all' ? `AND trckr.tracker_id= ${data.tracker_id}` : ''}
                                            ORDER BY trckr.date_created DESC`)
                        .build()).rows;
    }
}

module.exports = Tracker;