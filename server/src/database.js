const {Pool} = require('pg');
require('dotenv').config({path: __dirname + '/.env'});

const pool = new Pool({
    user: 'postgres',
    host: 'localhost',
    port: '5432',
    database: process.env.database,
    password: process.env.password
});

module.exports = pool;