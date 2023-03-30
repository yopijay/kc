const Builder = require("../../function/builder"); // Query builder
const Global = require('../../function/global'); // Function

const audit = { series_no: '', table_name: 'tbl_services',  item_id: 0, field: '', previous: null, current: null, action: '', user_id: 0, date: '' }; // Used for audit trail
class Services {
    series = async () => { return (await new Builder(`tbl_services`).select(`COUNT(*)`).build()).rows; }
    
    dashboard = async (data) => {
        switch(data.type) {
            case 'requests': 
                return {
                    total: (await new Builder(`tbl_services`).select().build()).rowCount,
                    pending: (await new Builder(`tbl_services`).select().condition(`WHERE status = 'saved' OR status= 'posted'`).build()).rowCount,
                    approved: (await new Builder(`tbl_services`).select().condition(`WHERE status != 'saved' AND status != 'posted' AND status != 'closed'`).build()).rowCount,
                    closed: (await new Builder(`tbl_services`).select().condition(`WHERE status = 'closed'`).build()).rowCount
                }
            case 'evaluation': 
                return {
                    total: (await new Builder(`tbl_services`).select().condition(`WHERE status != 'saved'`).build()).rowCount,
                    pending: (await new Builder(`tbl_services`).select().condition(`WHERE status = 'posted'`).build()).rowCount,
                    approved: (await new Builder(`tbl_services`).select().condition(`WHERE status != 'posted' AND status != 'closed' AND status != 'saved'`).build()).rowCount,
                    closed: (await new Builder(`tbl_services`).select().condition(`WHERE status = 'closed'`).build()).rowCount
                }
            case 'dispatch': 
                return {
                    total: (await new Builder(`tbl_services AS srvc`)
                                .select()
                                .join({ table: `tbl_services_sales AS sales`, condition: `sales.service_id = srvc.id`, type: `LEFT` })
                                .condition(`WHERE sales.requested_by_signature IS NOT NULL AND srvc.status != 'saved' AND srvc.status != 'posted'`).build()).rowCount,
                    dispatched: (await new Builder(`tbl_services AS srvc`)
                                            .select()
                                            .join({ table: `tbl_services_sales AS sales`, condition: `sales.service_id = srvc.id`, type: `LEFT` })
                                            .condition(`WHERE sales.requested_by_signature IS NOT NULL AND srvc.status = 'dispatch' OR srvc.status = 'done'`).build()).rowCount,
                    pending: (await new Builder(`tbl_services AS srvc`)
                                            .select()
                                            .join({ table: `tbl_services_sales AS sales`, condition: `sales.service_id = srvc.id`, type: `LEFT` })
                                            .condition(`WHERE sales.requested_by_signature IS NOT NULL AND srvc.status = 'approved'`).build()).rowCount,
                    closed: (await new Builder(`tbl_services AS srvc`)
                                            .select()
                                            .join({ table: `tbl_services_sales AS sales`, condition: `sales.service_id = srvc.id`, type: `LEFT` })
                                            .condition(`WHERE sales.requested_by_signature IS NOT NULL AND srvc.status = 'closed'`).build()).rowCount,
                }
            case 'report':
                return {
                    ongoing: (await new Builder(`tbl_services`).select().condition(`WHERE status= 'dispatch'`).build()).rowCount,
                    cancelled: (await new Builder(`tbl_services AS srvc`)
                                    .select()
                                    .join({ table: `tbl_services_technical AS technical`, condition: `technical.service_id = srvc.id`, type: `LEFT` })
                                    .condition(`WHERE technical.evaluated_by_signature IS NOT NULL AND technical.noted_by_signature IS NOT NULL 
                                                            AND technical.received_by_signature IS NOT NULL AND srvc.status = 'closed'`)
                                    .build()).rowCount
                }
            default: 
        }
    }

    list = async (data) => {
        return (await new Builder(`tbl_services AS srvc`)
                        .select(`srvc.id, srvc.series_no, srvc.service_request_no, srvc.date_prepared, srvc.date_requested, srvc.status, sales.so_no, sales.customer, sales.project, sales.date_needed`)
                        .join({ table: `tbl_services_sales AS sales`, condition: `sales.service_id = srvc.id`, type: `LEFT` })
                        .join({ table: `tbl_services_technical AS technical`, condition: `technical.service_id = srvc.id`, type: `LEFT` })
                        .condition(`${data.searchtxt !== '' || (data.phase !== 'request') ? `WHERE`: ''}
                                                ${data.phase === 'evaluation' ? ` srvc.status != 'saved'` : 
                                                    data.phase === 'dispatch' ? ` sales.requested_by_signature IS NOT NULL AND srvc.status != 'saved' AND srvc.status != 'posted'` :
                                                    data.phase === 'report' ? ` srvc.status = 'dispatch'` : ''}
                                                ${data.searchtxt !== '' ? 
                                                    ` AND (srvc.service_request_no LIKE '%${(data.searchtxt).toUpperCase()}%' OR sales.customer LIKE '%${(data.searchtxt).toUpperCase()}%'
                                                        OR sales.project LIKE '%${(data.searchtxt).toUpperCase()}%' OR sales.so_no LIKE '%${(data.searchtxt).toUpperCase()}%') ` : ''}
                                                ORDER BY ${data.orderby} ${(data.sort).toUpperCase()}`)
                        .build()).rows;
    }

    search = async (data) => {
        return (await new Builder(`tbl_services AS srvc`)
                        .select(`srvc.id, srvc.series_no, srvc.service_request_no, srvc.date_prepared, srvc.date_requested, srvc.status, sales.so_no, sales.customer, sales.project, sales.date_needed`)
                        .join({ table: `tbl_services_sales AS sales`, condition: `sales.service_id = srvc.id`, type: `LEFT` })
                        .join({ table: `tbl_services_technical AS technical`, condition: `technical.service_id = srvc.id`, type: `LEFT` })
                        .condition(`WHERE (srvc.service_request_no LIKE '%${(data.searchtxt).toUpperCase()}%' OR sales.customer LIKE '%${(data.searchtxt).toUpperCase()}%'
                                                OR sales.project LIKE '%${(data.searchtxt).toUpperCase()}%' OR sales.so_no LIKE '%${(data.searchtxt).toUpperCase()}%')
                                                ${data.phase === 'evaluation' ? ` AND srvc.status != 'saved'` :
                                                    data.phase === 'dispatch' ? ` AND sales.requested_by_signature IS NOT NULL` :
                                                    data.phase === 'report' ? ` AND technical.evaluated_by_signature IS NOT NULL AND technical.noted_by_signature IS NOT NULL 
                                                                                                    AND technical.received_by_signature IS NOT NULL` : ''}
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
                                            sales.time_expected, sales.warranty, sales.up_to, sales.for_billing, sales.contact_number, sales.requests, technical.evaluated_by, technical.evaluated_by_signature,
                                            technical.eval_noted_by_sup, technical.eval_noted_by_sup_signature, technical.deliveries_to_customer, technical.tools_equipment,
                                            technical.manpower, technical.consumables, technical.others, technical.regular_delivery, technical.to_be_rented, technical.for_completion,
                                            technical.for_rectification, technical.supplemental_manning, technical.other_purpose, technical.prepared_by, technical.prepared_by_signature, technical.noted_by,
                                            technical.noted_by_signature, technical.authorized_by, technical.authorized_by_signature, technical.approved_by, technical.approved_by_signature,
                                            technical.released_by, technical.released_by_signature, technical.received_by, technical.received_by_signature, technical.items, report.work_done,
                                            report.personnel_deployed, report.sub_contractors, report.recommendation, report.recommendation_signature, report.recommendation_date,
                                            report.comments, report.comments_signature, report.comments_date`)
                            .join({ table: `tbl_services_sales AS sales`, condition: `sales.service_id = srvc.id`, type: `LEFT` })
                            .join({ table: `tbl_services_technical AS technical`, condition: `technical.service_id = srvc.id`, type: `LEFT` })
                            .join({ table: `tbl_services_report AS report`, condition: `report.service_id = srvc.id`, type: `LEFT` })
                            .condition(`WHERE srvc.id= ${id}`)
                            .build()).rows;
        }

        return data;
    }

    save = async (data) => {
        let date = Global.date(new Date());
        let requests = JSON.stringify(data.requests);

        let service = (await new Builder(`tbl_services`)
                                                .insert({ columns: `series_no, service_request_no, date_prepared, date_requested, status, created_by, date_created`, 
                                                                values: `'${(data.series_no).toUpperCase()}', '${data.service_request_no}', '${data.date_prepared}', '${data.date_requested}',
                                                                                '${data.status}', ${data.created_by}, '${date}'` })
                                                .condition(`RETURNING id`)
                                                .build()).rows[0];
        
        await new Builder(`tbl_services_sales`)
            .insert({ columns: `service_id, so_no, po_no, customer, project, service_location, contact_person, position, date_needed, time_expected, warranty, up_to, 
                                            for_billing, contact_number, requests`, 
                            values: `${service.id}, ${data.so_no !== '' ? `'${(data.so_no).toUpperCase()}'` : null}, ${data.po_no !== '' ? `'${(data.po_no).toUpperCase()}'` : null}, 
                                            '${(data.customer).toUpperCase()}', '${(data.project).toUpperCase()}', '${(data.service_location).toUpperCase()}', '${(data.contact_person).toUpperCase()}', 
                                            ${data.position !== '' ? `'${(data.position).toUpperCase()}'` : null}, '${data.date_needed}', 
                                            ${data.time_expected !== '' ? `'${(data.time_expected).toUpperCase()}'` : null}, ${data.warranty !== '' ? `'${(data.warranty).toUpperCase()}'` : null}, 
                                            ${data.up_to !== '' ? `'${(data.up_to).toUpperCase()}'` : null}, '${data.for_billing}', ${data.contact_number !== '' ? `'${data.contact_number}'` : null}, '${requests}'` })
            .build();

        await new Builder(`tbl_services_technical`).insert({ columns: `service_id`, values: `${service.id}` }).build();
        await new Builder(`tbl_services_report`).insert({ columns: `service_id`, values: `${service.id}` }).build();
        
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
        let requests = JSON.stringify(data.requests);
        let _audit = [];
        let _errors = [];
        
        let srvc = (await new Builder(`tbl_services AS srvc`)
                            .select(`srvc.*, sales.so_no, sales.po_no, sales.customer, sales.project, sales.service_location, sales.contact_person, sales.position, sales.date_needed, 
                                            sales.time_expected, sales.warranty, sales.up_to, sales.for_billing, sales.contact_number, sales.requests`)
                            .join({ table: `tbl_services_sales AS sales`, condition: `sales.service_id = srvc.id`, type: `LEFT` })
                            .condition(`WHERE srvc.id= ${data.id}`)
                            .build()).rows;

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

        if(srvc[0].requests !== requests) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_services', item_id: srvc[0].id, field: 'requests', previous: srvc[0].requests, 
                                    current: requests, action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(srvc[0].date_needed, data.date_needed)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_services', item_id: srvc[0].id, field: 'date_needed', previous: srvc[0].date_needed, 
                                    current: data.date_needed, action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(srvc[0].time_expected, data.time_expected)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_services', item_id: srvc[0].id, field: 'time_expected', previous: srvc[0].time_expected, 
                                    current: (data.time_expected).toUpperCase(), action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(srvc[0].warranty, data.warranty)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_services', item_id: srvc[0].id, field: 'warranty', previous: srvc[0].warranty, 
                                    current: data.warranty !== '' && data.warranty !== null ? (data.warranty).toUpperCase() : null, action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(srvc[0].up_to, data.up_to)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_services', item_id: srvc[0].id, field: 'up_to', previous: srvc[0].up_to, 
                                    current: data.up_to !== '' && data.up_to !== null ? (data.up_to).toUpperCase() : null, action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(srvc[0].for_billing, data.for_billing)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_services', item_id: srvc[0].id, field: 'for_billing', previous: srvc[0].for_billing, 
                                    current: data.for_billing, action: 'update', user_id: data.updated_by, date: date });
        }

        if(!(_errors.length > 0)) {
            await new Builder(`tbl_services`)
                .update(`date_prepared= '${data.date_prepared}', date_requested= '${data.date_requested}', status= '${data.status}', updated_by= ${data.updated_by}, date_updated= '${date}'`)
                .condition(`WHERE id= ${data.id}`)
                .build();

            await new Builder(`tbl_services_sales`)
                .update(`so_no= ${data.so_no !== '' && data.so_no !== null ? `'${(data.so_no).toUpperCase()}'` : null}, 
                                po_no= ${data.po_no !== '' && data.po_no !== null ? `'${(data.po_no).toUpperCase()}'` : null}, customer= '${(data.customer).toUpperCase()}', 
                                project= '${(data.project).toUpperCase()}', service_location= '${(data.service_location).toUpperCase()}', contact_person= '${(data.contact_person).toUpperCase()}', 
                                position= ${data.position !== '' && data.position !== null ? `'${(data.position).toUpperCase()}'` : null}, date_needed= '${data.date_needed}', 
                                time_expected= '${(data.time_expected).toUpperCase()}', warranty= ${data.warranty !== '' && data.warranty !== null ? `'${(data.warranty).toUpperCase()}'` : null}, 
                                up_to= ${data.up_to !== '' && data.up_to !== null ? `'${(data.up_to).toUpperCase()}'` : null}, for_billing= '${data.for_billing}', 
                                contact_number= ${data.contact_number !== '' && data.contact_number !== null ? `'${(data.contact_number).toUpperCase()}'` : null}, 
                                requests= '${requests}'`)
                .condition(`WHERE service_id= ${data.id}`)
                .build();

            _audit.forEach(data => Global.audit(data));
            return { result: 'success', message: 'Successfully updated!' }
        }
        else { return { result: 'error', error: _errors } }
    }

    approve = async (data) => {
        let date = Global.date(new Date());
        let requests = JSON.stringify(data.requests);
        let _audit = [];
        let _errors = [];
        
        let srvc = (await new Builder(`tbl_services AS srvc`)
                            .select(`srvc.*, sales.so_no, sales.po_no, sales.customer, sales.project, sales.service_location, sales.contact_person, sales.position, sales.date_needed, 
                                            sales.time_expected, sales.warranty, sales.up_to, sales.for_billing, sales.contact_number, sales.requests, sales.requested_by, sales.requested_by_signature,
                                            sales.requested_by_date, sales.noted_by_sup, sales.noted_by_sup_signature, sales.noted_by_sup_date`)
                            .join({ table: `tbl_services_sales AS sales`, condition: `sales.service_id = srvc.id`, type: `LEFT` })
                            .condition(`WHERE srvc.id= ${data.id}`)
                            .build()).rows;

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

        if(srvc[0].requests !== requests) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_services', item_id: srvc[0].id, field: 'requests', previous: srvc[0].requests, 
                                    current: requests, action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(srvc[0].date_needed, data.date_needed)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_services', item_id: srvc[0].id, field: 'date_needed', previous: srvc[0].date_needed, 
                                    current: data.date_needed, action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(srvc[0].time_expected, data.time_expected)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_services', item_id: srvc[0].id, field: 'time_expected', previous: srvc[0].time_expected, 
                                    current: (data.time_expected).toUpperCase(), action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(srvc[0].warranty, data.warranty)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_services', item_id: srvc[0].id, field: 'warranty', previous: srvc[0].warranty, 
                                    current: data.warranty !== '' && data.warranty !== null ? (data.warranty).toUpperCase() : null, action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(srvc[0].up_to, data.up_to)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_services', item_id: srvc[0].id, field: 'up_to', previous: srvc[0].up_to, 
                                    current: data.up_to !== '' && data.up_to !== null ? (data.up_to).toUpperCase() : null, action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(srvc[0].for_billing, data.for_billing)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_services', item_id: srvc[0].id, field: 'for_billing', previous: srvc[0].for_billing, 
                                    current: data.for_billing, action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(srvc[0].requested_by, data.requested_by)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_services', item_id: srvc[0].id, field: 'requested_by', previous: srvc[0].requested_by, 
                                    current: (data.requested_by).toUpperCase(), action: 'update', user_id: data.updated_by, date: date });
        }

        if(srvc[0].requested_by_signature !== data.requested_by_signature) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_services', item_id: srvc[0].id, field: 'requested_by_signature', previous: srvc[0].requested_by_signature, 
                                    current: data.requested_by_signature, action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(srvc[0].noted_by_sup, data.noted_by_sup)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_services', item_id: srvc[0].id, field: 'noted_by_sup', previous: srvc[0].noted_by_sup, 
                                    current: (data.noted_by_sup).toUpperCase(), action: 'update', user_id: data.updated_by, date: date });
        }

        if(srvc[0].noted_by_sup_signature !== data.noted_by_sup_signature) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_services', item_id: srvc[0].id, field: 'noted_by_sup_signature', previous: srvc[0].noted_by_sup_signature, 
                                    current: data.noted_by_sup_signature, action: 'update', user_id: data.updated_by, date: date });
        }

        if(!(_errors.length > 0)) {
            await new Builder(`tbl_services`)
                .update(`date_prepared= '${data.date_prepared}', date_requested= '${data.date_requested}', status= 'approved', updated_by= ${data.updated_by}, date_updated= '${date}'`)
                .condition(`WHERE id= ${data.id}`)
                .build();

            await new Builder(`tbl_services_sales`)
                .update(`so_no= ${data.so_no !== '' && data.so_no !== null ? `'${(data.so_no).toUpperCase()}'` : null}, 
                                po_no= ${data.po_no !== '' && data.po_no !== null ? `'${(data.po_no).toUpperCase()}'` : null}, customer= '${(data.customer).toUpperCase()}', 
                                project= '${(data.project).toUpperCase()}', service_location= '${(data.service_location).toUpperCase()}', contact_person= '${(data.contact_person).toUpperCase()}', 
                                position= ${data.position !== '' && data.position !== null ? `'${(data.position).toUpperCase()}'` : null}, date_needed= '${data.date_needed}', 
                                time_expected= '${(data.time_expected).toUpperCase()}', warranty= ${data.warranty !== '' && data.warranty !== null ? `'${(data.warranty).toUpperCase()}'` : null}, 
                                up_to= ${data.up_to !== '' && data.up_to !== null ? `'${(data.up_to).toUpperCase()}'` : null}, for_billing= '${data.for_billing}', 
                                contact_number= ${data.contact_number !== '' && data.contact_number !== null ? `'${(data.contact_number).toUpperCase()}'` : null}, 
                                requests= '${requests}', requested_by= '${(data.requested_by).toUpperCase()}', requested_by_signature= '${data.requested_by_signature}',
                                requested_by_date= ${data.requested_by_signature !== null ? `CURRENT_TIMESTAMP` : null}, noted_by_sup= '${(data.noted_by_sup).toUpperCase()}',
                                noted_by_sup_signature= ${data.noted_by_sup_signature !== null ? `'${data.noted_by_sup_signature}'` : null}, 
                                noted_by_sup_date= ${data.noted_by_sup_date !== null ? `CURRENT_TIMESTAMP` : null}`)
                .condition(`WHERE service_id= ${data.id}`)
                .build();

            _audit.forEach(data => Global.audit(data));
            return { result: 'success', message: 'Successfully updated!' }
        }
        else { return { result: 'error', error: _errors } }
    }

    closed = async (data) => {
        let date = Global.date(new Date());

        await new Builder(`tbl_services`).update(`status= 'closed'`).condition(`WHERE id= ${data.id}`).build();
        
        audit.series_no = Global.randomizer(7);
        audit.field = 'all';
        audit.item_id = data.id;
        audit.action = 'updated';
        audit.user_id = data.updated_by;
        audit.date = date;

        Global.audit(audit);
        return { result: 'success', message: 'Successfully closed!' }
    }

    dispatch = async (data) => {
        let date = Global.date(new Date());
        let items = JSON.stringify(data.items);
        let _audit = [];
        let _errors = [];
        
        let srvc = (await new Builder(`tbl_services AS srvc`)
                            .select(`srvc.*, tech.evaluated_by, tech.evaluated_by_signature, tech.evaluated_by_date, tech.eval_noted_by_sup, tech.eval_noted_by_sup_signature,
                                            tech.eval_noted_by_sup_date, tech.deliveries_to_customer, tech.tools_equipment, tech.manpower, tech.consumables, tech.others,
                                            tech.regular_delivery, tech.to_be_rented, tech.for_completion, tech.for_rectification, tech.supplemental_manning, tech.other_purpose,
                                            tech.prepared_by, tech.prepared_by_signature, tech.prepared_by_date, tech.noted_by, tech.noted_by_signature, tech.noted_by_date,
                                            tech.authorized_by, tech.authorized_by_signature, tech.authorized_by_date, tech.approved_by, tech.approved_by_signature, tech.approved_by_date,
                                            tech.released_by, tech.released_by_signature, tech.released_by_date, tech.received_by, tech.received_by_signature, tech.received_by_date, tech.items`)
                            .join({ table: `tbl_services_technical AS tech`, condition: `tech.service_id = srvc.id`, type: `LEFT` })
                            .condition(`WHERE srvc.id= ${data.id}`)
                            .build()).rows;

        if(Global.compare(srvc[0].evaluated_by, data.evaluated_by)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_services', item_id: srvc[0].id, field: 'evaluated_by', previous: srvc[0].evaluated_by, 
                                    current: (data.evaluated_by).toUpperCase(), action: 'update', user_id: data.updated_by, date: date });
        }

        if(srvc[0].evaluated_by_signature !== data.evaluated_by_signature) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_services', item_id: srvc[0].id, field: 'evaluated_by_signature', previous: srvc[0].evaluated_by_signature, 
                                    current: data.evaluated_by_signature, action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(srvc[0].eval_noted_by_sup, data.eval_noted_by_sup)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_services', item_id: srvc[0].id, field: 'eval_noted_by_sup', previous: srvc[0].eval_noted_by_sup, 
                                    current: (data.eval_noted_by_sup).toUpperCase(), action: 'update', user_id: data.updated_by, date: date });
        }

        if(srvc[0].eval_noted_by_sup_signature !== data.eval_noted_by_sup_signature) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_services', item_id: srvc[0].id, field: 'eval_noted_by_sup_signature', previous: srvc[0].eval_noted_by_sup_signature, 
                                    current: data.eval_noted_by_sup_signature, action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(srvc[0].deliveries_to_customer, data.deliveries_to_customer ? 1 : 0)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_services', item_id: srvc[0].id, field: 'deliveries_to_customer', previous: srvc[0].deliveries_to_customer, 
                                    current: data.deliveries_to_customer ? 1 : 0, action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(srvc[0].tools_equipment, data.tools_equipment ? 1 : 0)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_services', item_id: srvc[0].id, field: 'tools_equipment', previous: srvc[0].tools_equipment, 
                                    current: data.tools_equipment ? 1 : 0, action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(srvc[0].manpower, data.manpower ? 1 : 0)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_services', item_id: srvc[0].id, field: 'manpower', previous: srvc[0].manpower, 
                                    current: data.manpower ? 1 : 0, action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(srvc[0].consumables, data.consumables ? 1 : 0)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_services', item_id: srvc[0].id, field: 'consumables', previous: srvc[0].consumables, 
                                    current: data.consumables ? 1 : 0, action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(srvc[0].others, data.others ? 1 : 0)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_services', item_id: srvc[0].id, field: 'others', previous: srvc[0].others, 
                                    current: data.others ? 1 : 0, action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(srvc[0].regular_delivery, data.regular_delivery ? 1 : 0)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_services', item_id: srvc[0].id, field: 'regular_delivery', previous: srvc[0].regular_delivery, 
                                    current: data.regular_delivery ? 1 : 0, action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(srvc[0].for_completion, data.for_completion ? 1 : 0)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_services', item_id: srvc[0].id, field: 'for_completion', previous: srvc[0].for_completion, 
                                    current: data.for_completion ? 1 : 0, action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(srvc[0].for_rectification, data.for_rectification ? 1 : 0)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_services', item_id: srvc[0].id, field: 'for_rectification', previous: srvc[0].for_rectification, 
                                    current: data.for_rectification ? 1 : 0, action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(srvc[0].supplemental_manning, data.supplemental_manning ? 1 : 0)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_services', item_id: srvc[0].id, field: 'supplemental_manning', previous: srvc[0].supplemental_manning, 
                                    current: data.supplemental_manning ? 1 : 0, action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(srvc[0].to_be_rented, data.to_be_rented ? 1 : 0)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_services', item_id: srvc[0].id, field: 'to_be_rented', previous: srvc[0].to_be_rented, 
                                    current: data.to_be_rented ? 1 : 0, action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(srvc[0].other_purpose, data.other_purpose ? 1 : 0)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_services', item_id: srvc[0].id, field: 'other_purpose', previous: srvc[0].other_purpose, 
                                    current: data.other_purpose ? 1 : 0, action: 'update', user_id: data.updated_by, date: date });
        }

        if(data.items !== null) {
            if(srvc[0].items !== items) {
                _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_services', item_id: srvc[0].id, field: 'items', previous: srvc[0].items, 
                                        current: items, action: 'update', user_id: data.updated_by, date: date });
            }
        }

        if(Global.compare(srvc[0].prepared_by, data.prepared_by)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_services', item_id: srvc[0].id, field: 'prepared_by', previous: srvc[0].prepared_by, 
                                    current: (data.prepared_by).toUpperCase(), action: 'update', user_id: data.updated_by, date: date });
        }

        if(srvc[0].prepared_by_signature !== data.prepared_by_signature) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_services', item_id: srvc[0].id, field: 'prepared_by_signature', previous: srvc[0].prepared_by_signature, 
                                    current: data.prepared_by_signature, action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(srvc[0].noted_by, data.noted_by)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_services', item_id: srvc[0].id, field: 'noted_by', previous: srvc[0].noted_by, 
                                    current: (data.noted_by).toUpperCase(), action: 'update', user_id: data.updated_by, date: date });
        }

        if(srvc[0].noted_by_signature !== data.noted_by_signature) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_services', item_id: srvc[0].id, field: 'noted_by_signature', previous: srvc[0].noted_by_signature, 
                                    current: data.noted_by_signature, action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(srvc[0].released_by, data.released_by)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_services', item_id: srvc[0].id, field: 'released_by', previous: srvc[0].released_by, 
                                    current: (data.released_by).toUpperCase(), action: 'update', user_id: data.updated_by, date: date });
        }

        if(srvc[0].released_by_signature !== data.released_by_signature) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_services', item_id: srvc[0].id, field: 'released_by_signature', previous: srvc[0].released_by_signature, 
                                    current: data.released_by_signature, action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(srvc[0].authorized_by, data.authorized_by)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_services', item_id: srvc[0].id, field: 'authorized_by', previous: srvc[0].authorized_by, 
                                    current: (data.authorized_by).toUpperCase(), action: 'update', user_id: data.updated_by, date: date });
        }

        if(srvc[0].authorized_by_signature !== data.authorized_by_signature) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_services', item_id: srvc[0].id, field: 'authorized_by_signature', previous: srvc[0].authorized_by_signature, 
                                    current: data.authorized_by_signature, action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(srvc[0].approved_by, data.approved_by)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_services', item_id: srvc[0].id, field: 'approved_by', previous: srvc[0].approved_by, 
                                    current: (data.approved_by).toUpperCase(), action: 'update', user_id: data.updated_by, date: date });
        }

        if(srvc[0].approved_by_signature !== data.approved_by_signature) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_services', item_id: srvc[0].id, field: 'approved_by_signature', previous: srvc[0].approved_by_signature, 
                                    current: data.approved_by_signature, action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(srvc[0].received_by, data.received_by)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_services', item_id: srvc[0].id, field: 'received_by', previous: srvc[0].received_by, 
                                    current: (data.received_by).toUpperCase(), action: 'update', user_id: data.updated_by, date: date });
        }

        if(srvc[0].received_by_signature !== data.received_by_signature) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_services', item_id: srvc[0].id, field: 'received_by_signature', previous: srvc[0].received_by_signature, 
                                    current: data.received_by_signature, action: 'update', user_id: data.updated_by, date: date });
        }

        if(!(_errors.length > 0)) {
            await new Builder(`tbl_services`).update(`status= '${data.status}', updated_by= ${data.updated_by}, date_updated= '${date}'`).condition(`WHERE id= ${data.id}`).build();
            await new Builder(`tbl_services_technical`)
                .update(`evaluated_by= ${data.evaluated_by !== null ? `'${(data.evaluated_by).toUpperCase()}'` : null}, 
                                evaluated_by_signature= ${data.evaluated_by_signature !== null ? `'${data.evaluated_by_signature}'` : null},
                                evaluated_by_date= ${data.evaluated_by_signature !== null ? `'${date}'` : null},
                                eval_noted_by_sup= ${data.eval_noted_by_sup !== null ? `'${(data.eval_noted_by_sup).toUpperCase()}'` : null},
                                eval_noted_by_sup_signature= ${data.eval_noted_by_sup_signature !== null ? `'${data.eval_noted_by_sup_signature}'` : null},
                                eval_noted_by_sup_date= ${data.eval_noted_by_sup_signature !== null ? `'${date}'` : null},
                                deliveries_to_customer= ${data.deliveries_to_customer ? 1 : 0}, tools_equipment= ${data.tools_equipment ? 1 : 0}, manpower= ${data.manpower ? 1 : 0},
                                consumables= ${data.consumables ? 1 : 0}, others= ${data.others ? 1 : 0}, regular_delivery= ${data.regular_delivery ? 1 : 0}, to_be_rented= ${data.to_be_rented ? 1 : 0},
                                for_completion= ${data.for_completion ? 1 : 0}, for_rectification= ${data.for_rectification ? 1 : 0}, 
                                supplemental_manning= ${data.supplemental_manning ? 1 : 0}, other_purpose= ${data.other_purpose ? 1 : 0}, 
                                prepared_by= ${data.prepared_by !== null ? `'${(data.prepared_by).toUpperCase()}'` : null},
                                prepared_by_signature= ${data.prepared_by_signature !== null ? `'${data.prepared_by_signature}'` : null},
                                prepared_by_date= ${data.prepared_by_signature !== null ? `'${date}'` : null},
                                noted_by= ${data.noted_by !== null ? `'${(data.noted_by).toUpperCase()}'` : null}, 
                                noted_by_signature= ${data.noted_by_signature !== null ? `'${data.noted_by_signature}'` : null},
                                noted_by_date= ${data.noted_by_signature !== null ? `'${date}'` : null}, 
                                authorized_by= ${data.authorized_by !== null ? `'${(data.authorized_by).toUpperCase()}'` : null},
                                authorized_by_signature= ${data.authorized_by_signature !== null ? `'${data.authorized_by_signature}'` : null},
                                authorized_by_date= ${data.authorized_by_signature !== null ? `'${date}'` : null}, 
                                approved_by= ${data.approved_by !== null ? `'${(data.approved_by).toUpperCase()}'` : null},
                                approved_by_signature= ${data.approved_by_signature !== null ? `'${data.approved_by_signature}'` : null},
                                approved_by_date= ${data.approved_by_signature !== null ? `'${date}'` : null}, 
                                released_by= ${data.released_by !== null ? `'${(data.released_by).toUpperCase()}'` : null},
                                released_by_signature= ${data.released_by_signature !== null ? `'${data.released_by_signature}'` : null},
                                released_by_date= ${data.released_by_signature !== null ? `'${date}'` : null}, 
                                received_by= ${data.received_by !== null ? `'${(data.received_by).toUpperCase()}'` : null},
                                received_by_signature= ${data.received_by_signature !== null ? `'${data.received_by_signature}'` : null},
                                received_by_date= ${data.received_by_signature !== null ? `'${date}'` : null}, 
                                items= ${data.items !== null ? `'${items}'` : null}`)
                .condition(`WHERE service_id= ${data.id}`)
                .build();

            _audit.forEach(data => Global.audit(data));
            return { result: 'success', message: 'Successfully updated!' }
        }
        else { return { result: 'error', error: _errors } }
    }

    report = async (data) => {
        let date = Global.date(new Date());
        let work_done = JSON.stringify(data.work_done);
        let personnel_deployed = JSON.stringify(data.personnel_deployed);
        let sub_contractors = JSON.stringify(data.sub_contractors);
        let _audit = [];
        let _errors = [];
        
        let srvc = (await new Builder(`tbl_services AS srvc`)
                            .select(`srvc.*, report.work_done, report.personnel_deployed, report.sub_contractors, recommendation, recommendation_signature, comments, comments_signature`)
                            .join({ table: `tbl_services_report AS report`, condition: `report.service_id = srvc.id`, type: `LEFT` })
                            .condition(`WHERE srvc.id= ${data.id}`)
                            .build()).rows;

        if(srvc[0].work_done !== work_done) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_services', item_id: srvc[0].id, field: 'work_done', previous: srvc[0].work_done, 
                                    current: work_done, action: 'update', user_id: data.updated_by, date: date });
        }

        if(srvc[0].personnel_deployed !== personnel_deployed) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_services', item_id: srvc[0].id, field: 'personnel_deployed', previous: srvc[0].personnel_deployed, 
                                    current: personnel_deployed, action: 'update', user_id: data.updated_by, date: date });
        }

        if(data.sub_contractors !== null) {
            if(srvc[0].sub_contractors !== sub_contractors) {
                _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_services', item_id: srvc[0].id, field: 'sub_contractors', previous: srvc[0].sub_contractors, 
                                        current: sub_contractors, action: 'update', user_id: data.updated_by, date: date });
            }
        }

        if(Global.compare(srvc[0].recommendation, data.recommendation)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_services', item_id: srvc[0].id, field: 'recommendation', previous: srvc[0].recommendation, 
                                    current: (data.recommendation).toUpperCase(), action: 'update', user_id: data.updated_by, date: date });
        }

        if(srvc[0].recommendation_signature !== data.recommendation_signature) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_services', item_id: srvc[0].id, field: 'recommendation_signature', previous: srvc[0].recommendation_signature, 
                                    current: data.recommendation_signature, action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(srvc[0].comments, data.comments)) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_services', item_id: srvc[0].id, field: 'comments', previous: srvc[0].comments, 
                                    current: (data.comments).toUpperCase(), action: 'update', user_id: data.updated_by, date: date });
        }

        if(srvc[0].comments_signature !== data.comments_signature) {
            _audit.push({ series_no: Global.randomizer(7), table_name: 'tbl_services', item_id: srvc[0].id, field: 'comments_signature', previous: srvc[0].comments_signature, 
                                    current: data.comments_signature, action: 'update', user_id: data.updated_by, date: date });
        }
        
        if(!(_errors.length > 0)) {
            await new Builder(`tbl_services`).update(`status='${data.status}', updated_by= ${data.updated_by}, date_updated= '${date}'`).condition(`WHERE id= ${data.id}`).build();
            await new Builder(`tbl_services_report`)
                .update(`work_done= ${data.work_done !== null && (data.work_done).length > 0 ? `'${work_done}'` : null}, 
                                personnel_deployed= ${data.personnel_deployed !== null && (data.personnel_deployed).length > 0 ? `'${personnel_deployed}'` : null},
                                sub_contractors= ${data.sub_contractors !== null && (data.sub_contractors).length > 0 ? `'${sub_contractors}'` : null},
                                recommendation= ${data.recommendation !== null && data.recommendation !== '' ? `'${(data.recommendation).toUpperCase()}'` : null},
                                recommendation_signature= ${data.recommendation_signature !== null && data.recommendation_signature !== '' ? `'${data.recommendation_signature}'` : null },
                                recommendation_date= ${data.recommendation_signature !== null && data.recommendation_signature !== '' ? `'${date}'` : null},
                                comments= ${data.comments !== null && data.comments !== '' ? `'${(data.comments).toUpperCase()}'` : null},
                                comments_signature= ${data.comments_signature !== null && data.comments_signature !== '' ? `'${data.comments_signature}'` : null },
                                comments_date= ${data.comments_signature !== null && data.comments_signature !== '' ? `'${date}'` : null}`)
                .condition(`WHERE service_id= ${data.id}`)
                .build();

            _audit.forEach(data => Global.audit(data));
            return { result: 'success', message: 'Successfully updated!' }
        }
        else { return { result: 'error', error: _errors } }

        return data;
    }
}

module.exports = Services;