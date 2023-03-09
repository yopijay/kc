const Builder = require("../../function/builder");

class UserAccess {
    components = async (id) => {
        // let modules = (await new Builder(`tbl_users_access AS ua`)
        //                                             .select(`MAX(LOWER(mdl.name)) AS module, MAX(LOWER(sm.name)) AS sub_module, MAX(sm.path) AS path, 
        //                                                             MAX(ua.is_read) AS is_read, MAX(ua.is_create) AS is_create, MAX(ua.is_update) AS is_update, MAX(ua.is_delete) AS is_delete,
        //                                                             MAX(ua.is_import) AS is_import, MAX(ua.is_export) AS`)
        //                                             .join({ table: `tbl_module AS mdl`, condition: `ua.module_id = mdl.id`, type: `LEFT` })
        //                                             .join({ table: `tbl_sub_module AS sm`, condition: `ua.sub_module_id = sm.id`, type: `LEFT` })
        //                                             .condition(`WHERE ua.user_id= ${atob(id)} GROUP BY mdl.name ORDER BY sm.date_created ASC`)
        //                                             .build()).rows;
        // return modules
        // console.log(new Builder(`tbl_users_access`).select().condition(`WHERE user_id= ${atob(id)} GROUP BY module_id ORDER BY date_created ASC`).test());
        return (await new Builder(`tbl_users_access AS ua`)
                                        .select(`LOWER(mdl.name) AS module, LOWER(sm.name) AS sub_module, sm.path, ua.is_read, ua.is_create, ua.is_update, ua.is_delete,
                                                        ua.is_import, ua.is_export`)
                                        .join({ table: `tbl_module AS mdl`, condition: `ua.module_id = mdl.id`, type: `LEFT` })
                                        .join({ table: `tbl_sub_module AS sm`, condition: `ua.sub_module_id = sm.id`, type: `LEFT` })
                                        .condition(`WHERE ua.user_id= ${atob(id)} ORDER BY sm.date_created ASC`)
                                        .build()).rows;
    }
}

module.exports = UserAccess;