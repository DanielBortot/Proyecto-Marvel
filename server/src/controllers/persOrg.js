const pool = require('../database');

const persOrg = {
    getPersOrg: async (req,res) => {
        const {nombrePers} = req.body;
        const orgs = await pool.query('SELECT * FROM "Organizacion" WHERE "Nombre" IN (SELECT "N_Organizacion" FROM "Pertenece" WHERE "N_Personaje"=$1)',[nombrePers]);
        res.send(orgs.rows);
    },

    getOrgPerso: async (req,res) => {
        const {nombreOrg} = req.body;
        const pers = await pool.query('SELECT * FROM "Personaje" p INNER JOIN "Pertenece" pe ON (p."Nombre"=pe."N_Personaje") INNER JOIN "Cargo" c ON (c."Cod_Cargo"=pe."Cod_Cargo") WHERE pe."N_Organizacion"=$1',[nombreOrg]);
        res.send(pers.rows);
    }
}

module.exports = persOrg;