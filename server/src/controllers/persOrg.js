const pool = require('../database');

const persOrg = {
    getPersOrg: async (req,res) => {
        const {nombrePers} = req.body;
        const orgs = await pool.query('SELECT * FROM "Organizacion" WHERE "Nombre" IN (SELECT "N_Organizacion" FROM "Pertenece" WHERE "N_Personaje"=$1)',[nombrePers]);
        res.send(orgs.rows);
    }
}

module.exports = persOrg;