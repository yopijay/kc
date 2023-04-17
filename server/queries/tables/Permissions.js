const Builder = require("../../function/builder"); // Function
const Global = require("../../function/global"); // Function

class Users {
    specific = async (id) => { return (await new Builder(`tbl_users_permissions`).select().condition(`WHERE user_id= ${id}`).build()).rows; }

    update = async (data) => {
        let date = Global.date(new Date());
        let permissions = JSON.stringify(data.permissions);
        let _audit = [];
        
        let per = (await new Builder(`tbl_users_permissions`).select().condition(`WHERE user_id= ${data.user_id}`).build()).rows[0];
        
        if(per.permissions !== permissions) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_users_permissions',  item_id: per.id, field: 'permissions', previous: per.permissions, 
                                        current: permissions, action: 'update', user_id: data.updated_by, date: date });
        }

        await new Builder(`tbl_users_permissions`)
            .update(`permissions= '${permissions}', updated_by= ${data.updated_by}, date_updated= '${date}'`)
            .condition(`WHERE user_id= ${data.user_id}`)
            .build();

        _audit.forEach(item => Global.audit(item));
        return { result: 'success', message: 'Permission granted!' }
    }
}

module.exports = Users;