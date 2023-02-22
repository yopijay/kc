// Libraries
const Pool = require('pg').Pool;

const config = process.env.DATABASE_URL ? {
    connectionString: process.env.DATABASE_URL,
    ssl: { rejectUnauthorized: false }
} : {
    user: 'postgres',
    host: 'localhost',
    database: 'db_kc',
    password: 'root',
    port: 5432
}

const pool = new Pool(config);
module.exports = pool;