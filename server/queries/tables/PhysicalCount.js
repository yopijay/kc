const Builder = require("../../function/builder"); // Query builder
const Global = require('../../function/global'); // Function

const audit = { series_no: '', table_name: 'tbl_physical_count',  item_id: 0, field: '', previous: null, current: null, action: '', user_id: 0, date: '' }; // Used for audit trail
class PhysicalCount {
    series = async () => { return (await new Builder(`tbl_physical_count`).select(`COUNT(*)`).build()).rows; }
    specific = async id => { return (await new Builder(`tbl_physical_count`).select().condition(`WHERE id= ${id}`).build()).rows; }
    schedule = async date => { 
        let sched = [];
        let scheds = (await new Builder(`tbl_physical_count`).select().build()).rows;

        scheds.forEach(schd => {
            if(!(((parseInt((new Date(schd.date_from)).getDate()) - parseInt((new Date(date)).getDate()))) < 0 &&
                ((parseInt((new Date(schd.date_to)).getDate()) - parseInt((new Date(date)).getDate()))) < 0)) {
                let total = Math.abs(parseInt((new Date(schd.date_from)).getDate()) - parseInt((new Date(date)).getDate())) +
                                    (parseInt((new Date(schd.date_to)).getDate()) - parseInt((new Date(date)).getDate()));

                if(total <= (((parseInt((new Date(schd.date_to)).getDate()) - parseInt((new Date(schd.date_from)).getDate()))) + 1) && total >= 0) { sched.push(schd); }
            }
        });

        return sched;
    }

    profile = async id => {
        return (await new Builder(`tbl_physical_count_personnels AS pnl`)
                        .select(`pnl.*, emp.fname, emp.mname, emp.lname, pc.branch AS branches, pc.brands AS brands, pc.personnel AS personnels`)
                        .join({ table: `tbl_employee AS emp`, condition: `emp.user_id = pnl.user_id`, type: `LEFT` })
                        .join({ table: `tbl_physical_count AS pc`, condition: `pc.id = pnl.physical_count_id`, type: `LEFT` })
                        .condition(`WHERE pnl.user_id= ${id}`)
                        .build()).rows; 
    }

    list = async data => {
        return (await new Builder(`tbl_physical_count AS pc`)
                        .select(`pc.id, pc.series_no, pc.branch, pc.date_from, pc.date_to, pc.type, pc.brands, pc.total_items, CONCAT(cb.lname, ', ', cb.fname, ' ', cb.mname) AS created_by`)
                        .join({ table: `tbl_employee AS cb`, condition: `pc.created_by = cb.user_id`, type: `LEFT` })
                        .condition(`${data.searchtxt !== '' ? `WHERE pc.series_no LIKE '%${(data.searchtxt).toUpperCase()}%' OR pc.status LIKE '%${data.searchtxt}%' OR
                                                pc.date_from LIKE '%${data.searchtxt}%' OR pc.date_to LIKE '%${data.searchtxt}%' OR pc.type LIKE '%${data.searchtxt}%' OR
                                                pc.brands LIKE '%${(data.searchtxt).toUpperCase()}%' OR pc.branch LIKE '%${(data.branch).toUpperCase()}%'` : ''} 
                                                ORDER BY pc.${data.orderby} ${(data.sort).toUpperCase()}`)
                        .build()).rows;
    }

    save = async data => {
        let date = Global.date(new Date());
        let errors = [];

        if((await new Builder(`tbl_physical_count`).select().condition(`WHERE series_no= '${(data.series_no).toUpperCase()}'`).build()).rowCount > 0) {
            errors.push({ name: 'series_no', message: 'Series number already used!' });
        }

        if((await new Builder(`tbl_physical_count`).select().condition(`WHERE date_from= '${data.date_from}' AND date_to= '${data.date_to}'`).build()).rowCount > 0) {
            errors.push({ name: 'date_from', message: 'Date already occupied!' });
        }

        if(!(errors.length > 0)) {
            let inv = (await new Builder(`tbl_physical_count`)
                            .insert({ columns: `series_no, branch, date_from, date_to, type, brands, total_items, remarks, created_by, date_created, personnel`, 
                                            values: `'${(data.series_no).toUpperCase()}', '${JSON.stringify(data.branch)}', '${data.date_from}', '${data.date_to}', '${data.type}',
                                                            '${JSON.stringify(data.type !== 'annual' ? data.brands : [])}', ${data.total_items}, 
                                                            ${data.remarks !== '' ? `'${(data.remarks).toUpperCase()}'` : null}, ${data.created_by}, '${date}', '${JSON.stringify([])}'` })
                            .condition(`RETURNING id`)
                            .build()).rows[0];

            audit.series_no = Global.randomizer(7);
            audit.field = 'all';
            audit.item_id = inv.id;
            audit.action = 'create';
            audit.user_id = data.created_by;
            audit.date = date;

            Global.audit(audit);
            return { result: 'success', message: 'Successfully saved!' }
        }
        else { return { result: 'error', error: errors } }
    }

    update = async data => {
        let pc = (await new Builder(`tbl_physical_count`).select().condition(`WHERE id= ${data.id}`).build()).rows[0];
        let date = Global.date(new Date());
        let audits = [];
        let errors = [];
        
        if(Global.compare(pc.branch, JSON.stringify(data.branch))) {
            audits.push({ series_no: Global.randomizer(7), table_name: 'tbl_physical_count', item_id: pc.id, field: 'branch', previous: pc.branch, 
                                    current: JSON.stringify(data.branch), action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(pc.date_from, data.date_from)) {
            if(!((await new Builder(`tbl_physical_count`).select().condition(`WHERE date_from= '${data.date_from}'`).build()).rowCount > 0)) {
                audits.push({ series_no: Global.randomizer(7), table_name: 'tbl_physical_count', item_id: pc.id, field: 'date_from', previous: pc.date_from, 
                                        current: data.date_from, action: 'update', user_id: data.updated_by, date: date });
            }
            else { errors.push({ name: 'date_from', message: 'Date already occupied!' }); }
        }

        if(Global.compare(pc.date_to, data.date_to)) {
            if(!((await new Builder(`tbl_physical_count`).select().condition(`WHERE date_to= '${data.date_to}'`).build()).rowCount > 0)) {
                audits.push({ series_no: Global.randomizer(7), table_name: 'tbl_physical_count', item_id: pc.id, field: 'date_to', previous: pc.date_to, 
                                        current: data.date_to, action: 'update', user_id: data.updated_by, date: date });
            }
            else { errors.push({ name: 'date_to', message: 'Date already occupied!' }); }
        }
        
        if(Global.compare(pc.type, data.type)) {
            audits.push({ series_no: Global.randomizer(7), table_name: 'tbl_physical_count', item_id: pc.id, field: 'type', previous: pc.type, 
                                    current: data.type, action: 'update', user_id: data.updated_by, date: date });
        }
        
        if(Global.compare(pc.total_items, data.total_items)) {
            audits.push({ series_no: Global.randomizer(7), table_name: 'tbl_physical_count', item_id: pc.id, field: 'total_items', previous: pc.total_items, 
                                    current: data.total_items, action: 'update', user_id: data.updated_by, date: date });
        }

        if(Global.compare(pc.remarks, data.remarks)) {
            audits.push({ series_no: Global.randomizer(7), table_name: 'tbl_physical_count', item_id: pc.id, field: 'remarks', previous: pc.remarks, 
                                    current: data.remarks !== '' && data.remarks !== null ? (data.remarks).toUpperCase() : null, action: 'update', user_id: data.updated_by, date: date });
        }
        
        if(Global.compare(pc.brands, JSON.stringify(data.brands))) {
            audits.push({ series_no: Global.randomizer(7), table_name: 'tbl_physical_count', item_id: pc.id, field: 'brands', previous: pc.brands, 
                                    current: JSON.stringify(data.brands), action: 'update', user_id: data.updated_by, date: date });
        }

        if(!(errors.length > 0)) {
            await new Builder(`tbl_physical_count`)
                .update(`branch= '${JSON.stringify(data.branch)}', date_from= '${data.date_from}', date_to= '${data.date_to}', type= '${data.type}',
                                brands= '${JSON.stringify(data.type !== 'annual' ? data.brands : [])}', total_items= ${data.total_items}, 
                                remarks= ${data.remarks !== '' && data.remarks !== null ? `'${(data.remarks).toUpperCase()}'` : null},
                                updated_by= ${data.updated_by}, date_updated= '${date}'`)
                .condition(`WHERE id= ${pc.id}`)
                .build();

            audits.forEach(data => Global.audit(data));
            return { result: 'success', message: 'Successfully updated!' }
        }
        else { return { result: 'error', error: errors } }
    }

    counts = async data => {
        const pc = (await new Builder(`tbl_physical_count`).select().condition(`WHERE id= ${JSON.parse(data).id}`).build()).rows[0]
        let branch = { quezon_ave: 'qa', sto_domingo: 'sd', manila: 'ma' };
        let items = [];
        let brands = null;
        let query = '';

        if((JSON.parse(pc.brands)).length > 0) { brands = JSON.parse(pc.brands); }
        else { brands = (await new Builder(`tbl_brand`).select(`id AS brand_id, name AS brand_name`).condition(`WHERE status = 1`).build()).rows; }

        for(let count = 0; count < brands.length; count++) { query += `${count > 0 ? ' OR ' : ''}itm.brand_id= ${brands[count].brand_id}`; }

        let itm = (await new Builder(`tbl_items AS itm`)
                            .select(`itm.*`)
                            .join({ table: `tbl_racks AS rck`, condition: `itm.rack_id = rck.id`, type: `LEFT` })
                            .condition(`WHERE (${query}) AND rck.branch= '${branch[JSON.parse(data).branch]}' ORDER BY itm.item_code DESC`)
                            .build()).rows;
                            
        for(let count = 0; count < itm.length; count++) {
            let item = (await new Builder(`tbl_items AS itm`)
                                .select(`itm.id, itm.item_code, rcs.count_by, rcs.date_counted, rcs.total, emp.fname, emp.lname`)
                                .join({ table: `tbl_physical_count_rcs AS rcs`, condition: `rcs.item_id = itm.id`, type: `LEFT` })
                                .join({ table: `tbl_employee AS emp`, condition: `emp.user_id = rcs.count_by`, type: `LEFT` })
                                .condition(`WHERE itm.id= ${itm[count].id} AND rcs.date_counted IS NULL`)
                                .build()).rows[0];
            
            if(item !== undefined) { items.push(item); }
        }

        return {
            rcs: items.length,
            ras: (await new Builder(`tbl_physical_count_ras`).select().condition(`WHERE physical_count_id= ${JSON.parse(data).id} AND date_counted IS NULL`).build()).rowCount,
            des: (await new Builder(`tbl_physical_count_dis`).select().condition(`WHERE physical_count_id= ${JSON.parse(data).id} AND date_counted IS NULL`).build()).rowCount,
        }
    }

    dashboard = async data => {
        return {
            total: (await new Builder(`tbl_physical_count`).select().condition(`WHERE id= ${data.id}`).build()).rows[0].total_items,
            rcs: (await new Builder(`tbl_physical_count_rcs`).select().condition(`WHERE physical_count_id= ${data.id}`).build()).rowCount,
            ras: (await new Builder(`tbl_physical_count_ras`).select().condition(`WHERE physical_count_id= ${data.id}`).build()).rowCount,
            dis: (await new Builder(`tbl_physical_count_dis`).select().condition(`WHERE physical_count_id= ${data.id}`).build()).rowCount,
        };
    }

    reports = async data => {
        let items = [];

        if(data.branch !== undefined && data.brands !== undefined) {
            let branch = { quezon_ave: 'qa', sto_domingo: 'sd', manila: 'ma', cavite: 'ca' };
            let brnch = '';
            let brd = '';
            
            if(Array.isArray(data.branch)) { for(let count = 0; count < (data.branch).length; count++) { brnch += `${count > 0 ? ' OR ' : ''}rck.branch= '${branch[(data.branch)[count].id]}'`; } }
            else { brnch= `rck.branch= '${data.branch}'`; }
            
            if(Array.isArray(data.brands)) {
                let brands = null;
    
                if((data.brands).length > 0) { brands = data.brands; }
                else { brands = (await new Builder(`tbl_brand`).select(`id AS brand_id, name AS brand_name`).condition(`WHERE status = 1`).build()).rows; }
    
                for(let count = 0; count < brands.length; count++) { brd += `${count > 0 ? ' OR ' : ''}itm.brand_id= ${brands[count].brand_id}`; }
            }
            else { brd= `itm.brand_id = ${data.brands}`; }
                                
            items = (await new Builder(`tbl_items AS itm`)
                            .select(`itm.*, brd.name AS brand, rck.branch, rck.floor, rck.code`)
                            .join({ table: `tbl_brand AS brd`, condition: `itm.brand_id = brd.id`, type: `LEFT` })
                            .join({ table: `tbl_racks AS rck`, condition: `itm.rack_id = rck.id`, type: `LEFT` })
                            .condition(`WHERE (${brnch}) AND (${brd}) ORDER BY itm.item_code DESC`)
                            .build()).rows;
        }
                            
        for(let count = 0; count < items.length; count++) {
            let rcs = (await new Builder(`tbl_physical_count_rcs AS rcs`).select()
                            .join({ table: `tbl_employee AS emp`, condition: `rcs.count_by = emp.user_id`, type: `LEFT` })
                            .condition(`WHERE rcs.item_id= ${items[count].id} AND rcs.physical_count_id= ${data.id}`).build()).rows[0];
            let ras = (await new Builder(`tbl_physical_count_ras AS ras`).select()
                            .join({ table: `tbl_employee AS emp`, condition: `ras.count_by = emp.user_id`, type: `LEFT` })
                            .condition(`WHERE ras.item_id= ${items[count].id} AND ras.physical_count_id= ${data.id}`).build()).rows[0];
            let dis = (await new Builder(`tbl_physical_count_dis AS dis`).select()
                            .join({ table: `tbl_employee AS emp`, condition: `dis.count_by = emp.user_id`, type: `LEFT` })
                            .condition(`WHERE dis.item_id= ${items[count].id} AND dis.physical_count_id= ${data.id}`).build()).rows[0];

            if(rcs !== undefined) { 
                items[count]['rcs'] = rcs.count_by; 
                items[count]['rcs_date'] = rcs.date_counted; 
                items[count]['rcs_name'] = `${(rcs.lname).toUpperCase()}, ${(rcs.fname).toUpperCase()}`; 
            }
            if(ras !== undefined) { 
                items[count]['ras'] = ras.count_by; 
                items[count]['ras_date'] = ras.date_counted; 
                items[count]['ras_name'] = `${(ras.lname).toUpperCase()}, ${(ras.fname).toUpperCase()}`; 
            }
            if(dis !== undefined) { 
                items[count]['dis'] = dis.count_by; 
                items[count]['dis_date'] = dis.date_counted; 
                items[count]['dis_name'] = `${(dis.lname).toUpperCase()}, ${(dis.fname).toUpperCase()}`; 
            }
        }
 
        return items;
    }
}

module.exports = PhysicalCount;