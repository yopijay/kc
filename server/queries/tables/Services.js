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
                        .join({ table: `tbl_services_technical AS technical`, condition: `technical.service_id = srvc.id`, type: `LEFT` })
                        .condition(`${data.searchtxt !== '' || (data.phase !== 'request' && data.phase !== 'evaluation') ? `WHERE`: ''}
                                                ${data.phase === 'dispatch' ? ` sales.requested_by_signature IS NOT NULL` :
                                                    data.phase === 'report' ? ` technical.evaluated_by_signature IS NOT NULL AND technical.noted_by_signature IS NOT NULL 
                                                                                                    AND technical.received_by_signature IS NOT NULL` : ''}
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
                                                ${data.phase === 'dispatch' ? ` sales.requested_by_signature IS NOT NULL` :
                                                    data.phase === 'report' ? ` technical.evaluated_by_signature IS NOT NULL AND technical.noted_by_signature IS NOT NULL 
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
                                            technical.manpower, technical.consumables, technical.others, technical.regular_delivery, technical.to_be_rented, technical.for_rectification,
                                            technical.supplemental_manning, technical.other_purpose, technical.prepared_by, technical.prepared_by_signature, technical.noted_by,
                                            technical.noted_by_signature, technical.authorized_by, technical.authorized_by_signature, technical.approved_by, technical.approved_by_signature,
                                            technical.released_by, technical.released_by_signature, technical.received_by, technical.received_by_signature, technical.items`)
                            .join({ table: `tbl_services_sales AS sales`, condition: `sales.service_id = srvc.id`, type: `LEFT` })
                            .join({ table: `tbl_services_technical AS technical`, condition: `technical.service_id = srvc.id`, type: `LEFT` })
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
                                                                                'saved', ${data.created_by}, '${date}'` })
                                                .condition(`RETURNING id`)
                                                .build()).rows[0];
        
        await new Builder(`tbl_services_sales`)
            .insert({ columns: `service_id, so_no, po_no, customer, project, service_location, contact_person, position, date_needed, time_expected, warranty, up_to, 
                                            for_billing, contact_number, requests`, 
                            values: `${service.id}, ${data.so_no !== '' ? `'${(data.so_no).toUpperCase()}'` : null}, ${data.po_no !== '' ? `'${(data.po_no).toUpperCase()}'` : null}, 
                                            '${(data.customer).toUpperCase()}', '${(data.project).toUpperCase()}', '${(data.service_location).toUpperCase()}', '${(data.contact_person).toUpperCase()}', 
                                            ${data.position !== '' ? `'${(data.position).toUpperCase()}'` : null}, '${data.date_needed}', 
                                            ${data.time_expected !== '' ? `'${(data.time_expected).toUpperCase()}'` : null}, ${data.warranty !== '' ? `'${(data.warranty).toUpperCase()}'` : null}, 
                                            ${data.up_to !== '' ? `'${(data.up_to).toUpperCase()}'` : null}, '${data.for_billing}', ${data.contact_number !== '' ? `'${data.contact_number}'` : null},
                                            '${requests}'` })
            .build();
            
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
                .update(`date_prepared= '${data.date_prepared}', date_requested= '${data.date_requested}', updated_by= ${data.updated_by}, date_updated= '${date}'`)
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

    declined = async (data) => {
        let date = Global.date(new Date());
        let requests = JSON.stringify(data.requests);
        let _audit = [];
        let _errors = [];

        return data;
    }

    dispatch = async (data) => {
        let date = Global.date(new Date());
        let requests = JSON.stringify(data.requests);
        let _audit = [];
        let _errors = [];

        return data;
    }
}

module.exports = Services;