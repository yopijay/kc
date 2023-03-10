const Builder = require("../../function/builder"); // Query builder
const Global = require('../../function/global'); // Function

const audit = { series_no: '', table_name: 'tbl_services',  item_id: 0, field: '', previous: null, current: null, action: '', user_id: 0, date: '' }; // Used for audit trail
class Services {
    series = async () => { return (await new Builder(`tbl_services`).select(`COUNT(*)`).build()).rows; }
    
    dashboard = async () => {
        return [];
    }

    list = async (data) => {
        return [];
    }

    search = async (data) => {
        return [];
    }

    excel = async (type, data) => {
        return [];
    }

    upload = async (data) => {
        return [];
    }

    specific = async (id) => {
        return [];
    }

    save = async (data) => {
        let date = Global.date(new Date());
        let requests = data.requests;
        let items = data.items;

        let service = (await new Builder(`tbl_services`)
                                                .insert({ columns: `series_no, service_request_no, date_prepared, date_requested, status, created_by, date_created`, 
                                                                values: `'${(data.series_no).toUpperCase()}', '${data.service_request_no}', '${data.date_prepared}', '${data.date_requested}',
                                                                                'pending', ${atob(data.created_by)}, '${date}'` })
                                                .condition(`RETURNING id`)
                                                .build()).rows[0];
        
        await new Builder(`tbl_services_sales`)
            .insert({ columns: `service_id, so_no, po_no, customer, project, service_location, contact_person, position, requested_by, requested_by_signature, requested_by_date,
                                            noted_by_sup, noted_by_sup_signature, noted_by_sup_date, date_needed, time_expected, warranty, up_to, for_billing, contact_number`, 
                            values: `${service.id}, '${(data.so_no).toUpperCase()}', ${data.po_no !== '' ? `'${(data.po_no).toUpperCase()}'` : null}, '${(data.customer).toUpperCase()}', 
                                            '${(data.project).toUpperCase()}', '${(data.service_location).toUpperCase()}', '${(data.contact_person).toUpperCase()}', 
                                            ${data.position !== '' ? `'${(data.position).toUpperCase()}'` : null}, ${data.requested_by !== '' ? `'${(data.requested_by).toUpperCase()}'` : null}, null, 
                                            ${data.requested_by !== '' ? `'${date}'` : null}, ${data.noted_by_sup !== '' ? `'${(data.noted_by_sup).toUpperCase()}'` : null}, null, 
                                            ${data.noted_by_sup !== '' ? `'${date}'` : null}, '${data.date_needed}', ${data.time_expected !== '' ? `'${(data.time_expected).toUpperCase()}'` : null},
                                            ${data.warranty !== '' ? `'${(data.warranty).toUpperCase()}'` : null}, ${data.up_to !== '' ? `'${(data.up_to).toUpperCase()}'` : null},
                                            '${data.for_billing}', ${data.contact_no !== '' ? `'${data.contact_no}'` : null}` })
            .build();

        await new Builder(`tbl_services_technical`)
            .insert({ columns: `service_id, evaluated_by, evaluated_by_signature, evaluated_by_date, eval_noted_by_sup, eval_noted_by_sup_signature, eval_noted_by_sup_date,
                                            deliveries_to_customer, tools_equipment, manpower, consumables, others, regular_delivery, to_be_rented, for_completion, for_rectification, supplemental_manning,
                                            other_purpose, prepared_by, prepared_by_signature, prepared_by_date, noted_by, noted_by_signature, noted_by_date, authorized_by,
                                            authorized_by_signature, authorized_by_date, approved_by, approved_by_signature, approved_by_date, released_by, released_by_signature,
                                            released_by_date, received_by, received_by_signature, received_by_date`, 
                            values: `${service.id}, ${data.evaluated_by !== '' ? `'${(data.evaluated_by).toUpperCase()}'` : null}, null, ${data.evaluated_by !== '' ? `'${date}'` : null},
                                            ${data.eval_noted_by_sup !== '' ? `'${(data.eval_noted_by_sup).toUpperCase()}'` : null}, null, ${data.eval_noted_by_sup !== '' ? `'${date}'` : null},
                                            ${data.deliveries_to_customer ? 1 : 0}, ${data.tools_equipment ? 1 : 0}, ${data.manpower ? 1 : 0}, ${data.consumables ? 1 : 0}, ${data.others ? 1 : 0},
                                            ${data.regular_delivery ? 1 : 0}, ${data.to_be_rented ? 1 : 0}, ${data.for_completion ? 1 : 0}, ${data.for_rectification ? 1 : 0}, ${data.supplemantal_manning ? 1 : 0}, 
                                            ${data.other_purpose ? 1 : 0}, ${data.prepared_by !== '' ? `'${(data.prepared_by).toUpperCase()}'` : null}, null, ${data.prepared_by !== '' ? `'${date}'` : null},
                                            ${data.noted_by !== '' ? `'${(data.noted_by).toUpperCase()}'` : null}, null, ${data.noted_by !== '' ? `'${date}'` : null},
                                            ${data.authorized_by !== '' ? `'${(data.authorized_by).toUpperCase()}'` : null}, null, ${data.authorized_by !== '' ? `'${date}'` : null},
                                            ${data.approved_by !== '' ? `'${(data.approved_by).toUpperCase()}'` : null}, null, ${data.approved_by !== '' ? `'${date}'` : null},
                                            ${data.released_by !== '' ? `'${(data.released_by).toUpperCase()}'` : null}, null, ${data.released_by !== '' ? `'${date}'` : null},
                                            ${data.received_by !== '' ? `'${(data.received_by).toUpperCase()}'` : null}, null, ${data.received_by !== '' ? `'${date}'` : null}` })
            .build();
            
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

            if(items.length > 0) {
                for(let count = 0; count < items.length; count++) {
                    await new Builder(`tbl_services_items`)
                        .insert({ column: `service_id, item, qty, unit, description, status`, 
                                        values: `${service.id}, '${(items[count].item).toUpperCase()}', '${(items[count].qty).toUpperCase()}', 
                                                        ${items[count].description !== '' ? `'${(items[count].description).toUpperCase()}'` : null}, 'active` })
                        .build();
                }
            }
        
        return { result: 'success', message: 'Successfully saved!' };
    }

    update = async (data) => {
        return [];
    }
}

module.exports = Services;