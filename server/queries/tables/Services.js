const Builder = require("../../function/builder"); // Query builder
const Global = require('../../function/global'); // Function

const audit = { series_no: '', table_name: 'tbl_services',  item_id: 0, field: '', previous: null, current: null, action: '', user_id: 0, date: '' }; // Used for audit trail
class Services {
    series = async () => { return (await new Builder(`tbl_services`).select(`COUNT(*)`).build()).rows; }
    
    dashboard = async () => {
        return {
            total: (await new Builder(`tbl_services`).select().build()).rowCount,
            pending: (await new Builder(`tbl_services`).select().condition(`WHERE status= 'saved'`).build()).rowCount,
            approved: (await new Builder(`tbl_services`).select().condition(`WHERE status= 'approved'`).build()).rowCount,
            cancelled: (await new Builder(`tbl_services`).select().condition(`WHERE status= 'cancelled'`).build()).rowCount
        }
    }

    list = async (data) => {
        return (await new Builder(`tbl_services AS srvc`)
                        .select(`srvc.id, srvc.series_no, srvc.service_request_no, srvc.date_prepared, srvc.date_requested, srvc.status, sales.so_no, sales.customer, sales.project, sales.date_needed`)
                        .join({ table: `tbl_services_sales AS sales`, condition: `sales.service_id = srvc.id`, type: `LEFT` })
                        .condition(`${data.searchtxt !== '' ? 
                                                `WHERE srvc.service_request_no LIKE '%${(data.searchtxt).toUpperCase()}%' OR sales.customer LIKE '%${(data.searchtxt).toUpperCase()}%'
                                                    OR sales.project LIKE '%${(data.searchtxt).toUpperCase()}%' OR sales.so_no LIKE '%${(data.searchtxt).toUpperCase()}%'` : ''}
                                                ORDER BY ${data.orderby} ${(data.sort).toUpperCase()}`)
                        .build()).rows;
    }

    search = async (data) => {
        return (await new Builder(`tbl_services AS srvc`)
                        .select(`srvc.id, srvc.series_no, srvc.service_request_no, srvc.date_prepared, srvc.date_requested, srvc.status, sales.so_no, sales.customer, sales.project, sales.date_needed`)
                        .join({ table: `tbl_services_sales AS sales`, condition: `sales.service_id = srvc.id`, type: `LEFT` })
                        .condition(`WHERE srvc.service_request_no LIKE '%${(data.searchtxt).toUpperCase()}%' OR sales.customer LIKE '%${(data.searchtxt).toUpperCase()}%'
                                                OR sales.project LIKE '%${(data.searchtxt).toUpperCase()}%' OR sales.so_no LIKE '%${(data.searchtxt).toUpperCase()}%'
                                                ORDER BY ${data.orderby} ${(data.sort).toUpperCase()}`)
                        .build()).rows;
    }

    excel = async (type, data) => {
        return [];
    }

    upload = async (data) => {
        return [];
    }

    specific = async (id) => {
        let data = [];
        if(id !== 'null') {
            data = (await new Builder(`tbl_services AS srvc`)
                            .select(`srvc.*, sales.so_no, sales.po_no, sales.customer, sales.project, sales.service_location, sales.contact_person, sales.position, 
                                            sales.requested_by, sales.requested_by_signature, sales.noted_by_sup, sales.noted_by_sup_signature, sales.date_needed, 
                                            sales.time_expected, sales.warranty, sales.up_to, sales.for_billing, sales.contact_number, technical.evaluated_by, technical.evaluated_by_signature,
                                            technical.eval_noted_by_sup, technical.eval_noted_by_sup_signature, technical.deliveries_to_customer, technical.tools_equipment,
                                            technical.manpower, technical.consumables, technical.others, technical.regular_delivery, technical.to_be_rented, technical.for_rectification,
                                            technical.supplemental_manning, technical.other_purpose, technical.prepared_by, technical.prepared_by_signature, technical.noted_by,
                                            technical.noted_by_signature, technical.authorized_by, technical.authorized_by_signature, technical.approved_by, technical.approved_by_signature,
                                            technical.released_by, technical.released_by_signature, technical.received_by, technical.received_by_signature`)
                            .join({ table: `tbl_services_sales AS sales`, condition: `sales.service_id = srvc.id`, type: `LEFT` })
                            .join({ table: `tbl_services_technical AS technical`, condition: `technical.service_id = srvc.id`, type: `LEFT` })
                            .condition(`WHERE srvc.id= ${id}`)
                            .build()).rows;
            
            data[0]['requests'] = (await new Builder(`tbl_services_requests`).select().condition(`WHERE service_id= ${id} AND status= 'active'`).build()).rows;
            data[0]['items'] = (await new Builder(`tbl_services_items`).select().condition(`WHERE service_id= ${id} AND status= 'active'`).build()).rows;
        }

        return data;
    }

    save = async (data) => {
        let date = Global.date(new Date());
        let requests = data.requests;

        let service = (await new Builder(`tbl_services`)
                                                .insert({ columns: `series_no, service_request_no, date_prepared, date_requested, status, created_by, date_created`, 
                                                                values: `'${(data.series_no).toUpperCase()}', '${data.service_request_no}', '${data.date_prepared}', '${data.date_requested}',
                                                                                'saved', ${data.created_by}, '${date}'` })
                                                .condition(`RETURNING id`)
                                                .build()).rows[0];
        
        await new Builder(`tbl_services_sales`)
            .insert({ columns: `service_id, so_no, po_no, customer, project, service_location, contact_person, position, date_needed, time_expected, warranty, up_to, for_billing, contact_number`, 
                            values: `${service.id}, ${data.so_no !== '' ? `'${(data.so_no).toUpperCase()}'` : null}, ${data.po_no !== '' ? `'${(data.po_no).toUpperCase()}'` : null}, 
                                            '${(data.customer).toUpperCase()}', '${(data.project).toUpperCase()}', '${(data.service_location).toUpperCase()}', '${(data.contact_person).toUpperCase()}', 
                                            ${data.position !== '' ? `'${(data.position).toUpperCase()}'` : null}, '${data.date_needed}', 
                                            ${data.time_expected !== '' ? `'${(data.time_expected).toUpperCase()}'` : null}, ${data.warranty !== '' ? `'${(data.warranty).toUpperCase()}'` : null}, 
                                            ${data.up_to !== '' ? `'${(data.up_to).toUpperCase()}'` : null}, '${data.for_billing}', ${data.contact_number !== '' ? `'${data.contact_number}'` : null}` })
            .build();

        // await new Builder(`tbl_services_technical`)
        //     .insert({ columns: `service_id, evaluated_by, evaluated_by_signature, evaluated_by_date, eval_noted_by_sup, eval_noted_by_sup_signature, eval_noted_by_sup_date,
        //                                     deliveries_to_customer, tools_equipment, manpower, consumables, others, regular_delivery, to_be_rented, for_completion, for_rectification, 
        //                                     supplemental_manning, other_purpose, prepared_by, prepared_by_signature, prepared_by_date, noted_by, noted_by_signature, noted_by_date, 
        //                                     authorized_by, authorized_by_signature, authorized_by_date, approved_by, approved_by_signature, approved_by_date, released_by, 
        //                                     released_by_signature, released_by_date, received_by, received_by_signature, received_by_date`, 
        //                     values: `${service.id}, ${data.evaluated_by !== '' ? `'${(data.evaluated_by).toUpperCase()}'` : null}, ${data.evaluated_by_signature !== '' ? `'${data.evaluated_by_signature}'` : null}, 
        //                                     ${data.evaluated_by !== '' ? `'${date}'` : null}, ${data.eval_noted_by_sup !== '' ? `'${(data.eval_noted_by_sup).toUpperCase()}'` : null}, 
        //                                     ${data.eval_noted_by_sup_signature !== '' ? `'${data.eval_noted_by_sup_signature}'` : null}, ${data.eval_noted_by_sup !== '' ? `'${date}'` : null},
        //                                     ${data.deliveries_to_customer ? 1 : 0}, ${data.tools_equipment ? 1 : 0}, ${data.manpower ? 1 : 0}, ${data.consumables ? 1 : 0}, ${data.others ? 1 : 0},
        //                                     ${data.regular_delivery ? 1 : 0}, ${data.to_be_rented ? 1 : 0}, ${data.for_completion ? 1 : 0}, ${data.for_rectification ? 1 : 0}, ${data.supplemantal_manning ? 1 : 0}, 
        //                                     ${data.other_purpose ? 1 : 0}, ${data.prepared_by !== '' ? `'${(data.prepared_by).toUpperCase()}'` : null}, 
        //                                     ${data.prepared_by_signature !== '' ? `'${data.prepared_by_signature}'` : null}, ${data.prepared_by !== '' ? `'${date}'` : null},
        //                                     ${data.noted_by !== '' ? `'${(data.noted_by).toUpperCase()}'` : null}, ${data.noted_by_signature !== '' ? `'${data.noted_by_signature}'` : null}, 
        //                                     ${data.noted_by !== '' ? `'${date}'` : null}, ${data.authorized_by !== '' ? `'${(data.authorized_by).toUpperCase()}'` : null}, 
        //                                     ${data.authorized_by_signature !== '' ? `'${data.authorized_by_signature}'` : null}, ${data.authorized_by !== '' ? `'${date}'` : null},
        //                                     ${data.approved_by !== '' ? `'${(data.approved_by).toUpperCase()}'` : null}, ${data.approved_by_signature !== '' ? `'${data.approved_by_signature}'` : null}, 
        //                                     ${data.approved_by !== '' ? `'${date}'` : null}, ${data.released_by !== '' ? `'${(data.released_by).toUpperCase()}'` : null}, 
        //                                     ${data.released_by_signature !== '' ? `'${data.released_by_signature}'` : null}, ${data.released_by !== '' ? `'${date}'` : null},
        //                                     ${data.received_by !== '' ? `'${(data.received_by).toUpperCase()}'` : null}, ${data.received_by_signature !== '' ? `'${data.received_by_signature}'` : null}, 
        //                                     ${data.received_by !== '' ? `'${date}'` : null}` })
        //     .build();
            
        if(requests.length > 0) {
            for(let count = 0; count < requests.length; count++) {
                await new Builder(`tbl_services_requests`)
                    .insert({ columns: `service_id, request, personnel, date_from, date_to, time_from, time_to, status`, 
                                    values: `${service.id}, '${(requests[count].request).toUpperCase()}', '${(requests[count].personnel).toUpperCase()}', '${requests[count].date_from}',
                                                    '${requests[count].date_to}', ${requests[count].time_from !== '' ? `'${(requests[count].time_from).toUpperCase()}'` : null},
                                                    ${requests[count].time_to !== '' ? `'${(requests[count].time_to).toUpperCase()}'` : null}, 'active'` })
                    .build();
            }
        }

        // if(items.length > 0) {
        //     for(let count = 0; count < items.length; count++) {
        //         await new Builder(`tbl_services_items`)
        //             .insert({ column: `service_id, item, qty, unit, description, status`, 
        //                             values: `${service.id}, '${(items[count].item).toUpperCase()}', '${(items[count].qty).toUpperCase()}', 
        //                                             ${items[count].description !== '' ? `'${(items[count].description).toUpperCase()}'` : null}, 'active` })
        //             .build();
        //     }
        // }
            
        audit.series_no = Global.randomizer(7);
        audit.field = 'all';
        audit.item_id = service.id;
        audit.action = 'create';
        audit.user_id = data.created_by;
        audit.date = date;

        Global.audit(audit);
        return { result: 'success', message: 'Successfully saved!' };
    }

    update = async (data) => {
        let date = Global.date(new Date());
        let requests = data.requests;
        let _audit = [];
        let _errors = [];
        
        let srvc = (await new Builder(`tbl_services AS srvc`)
                            .select(`srvc.*, sales.so_no, sales.po_no, sales.customer, sales.project, sales.contact_person, sales.position, sales.date_needed, sales.time_expected, sales.up_to,
                                            sales.for_billing, sales.contact_number`)
                            .join({ table: `tbl_services_sales AS sales`, condition: `sales.service_id = srvc.id`, type: `LEFT` })
                            .condition(`WHERE srvc.id= ${data.id}`)
                            .build()).rows;
        
        srvc[0]['requests'] = (await new Builder(`tbl_services_requests`).select().condition(`WHERE service_id= ${data.id}`).build()).rows;

        if(Global.compare(srvc[0].date_prepared, data.date_prepared)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_services', item_id: srvc[0].id, field: 'date_prepared', previous: srvc[0].date_prepared, 
                                    current: data.date_prepared, action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(srvc[0].date_requested, data.date_requested)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_services', item_id: srvc[0].id, field: 'date_requested', previous: srvc[0].date_requested, 
                                    current: data.date_requested, action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(srvc[0].customer, data.customer)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_services', item_id: srvc[0].id, field: 'customer', previous: srvc[0].customer, 
                                    current: (data.customer).toUpperCase(), action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(srvc[0].project, data.project)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_services', item_id: srvc[0].id, field: 'project', previous: srvc[0].project, 
                                    current: (data.project).toUpperCase(), action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(srvc[0].so_no, data.so_no)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_services', item_id: srvc[0].id, field: 'so_no', previous: srvc[0].so_no, 
                                    current: data.so_no !== '' && data.so_no !== null ? data.so_no : null, action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(srvc[0].service_location, data.service_location)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_services', item_id: srvc[0].id, field: 'service_location', previous: srvc[0].service_location, 
                                    current: (data.service_location).toUpperCase(), action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(srvc[0].po_no, data.po_no)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_services', item_id: srvc[0].id, field: 'po_no', previous: srvc[0].po_no, 
                                    current: data.po_no !== '' && data.po_no !== null ? data.po_no : null, action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(srvc[0].contact_person, data.contact_person)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_services', item_id: srvc[0].id, field: 'contact_person', previous: srvc[0].contact_person, 
                                    current: (data.contact_person).toUpperCase(), action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(srvc[0].position, data.position)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_services', item_id: srvc[0].id, field: 'position', previous: srvc[0].position, 
                                    current: data.position !== '' && data.position !== null ? (data.position).toUpperCase() : null, action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(srvc[0].contact_number, data.contact_number)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_services', item_id: srvc[0].id, field: 'contact_number', previous: srvc[0].contact_number, 
                                    current: data.contact_number !== '' && data.contact_number !== null ? data.contact_number : null, action: 'update', user_id: data.updated_by, date: date });
        }
        
        for(let count = 0; count < (srvc[0].requests).length; count++) {
            (data.requests).find(({ id }) => {
                console.log(id);
                // if(id !== undefined) {
                //     if((srvc[0].requests)[count].id === id) {
                //         console.log('update');
                //     }
                //     else {
                //         console.log('delete');
                //     }
                // }
                // else { 
                //     console.log('create');
                // }
            });
        }
        // if((srvc[0].requests).filter(elem => (data.requests).find(({ id }) => elem.id === id)).length > 0) {
        // (srvc[0].requests).filter(elem => (data.requests).find(({ id }) => {
        // }));
        // }

        return data;
    }
}

module.exports = Services;