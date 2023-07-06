const pool = require('../database');

const persOrg = {
    getPersOrg: async (req,res) => {
        const {nombrePers} = req.body;
        const orgs = await pool.query('SELECT * FROM "Organizacion" WHERE "Nombre" IN (SELECT "N_Organizacion" FROM "Pertenece" WHERE "N_Personaje"=$1)',[nombrePers]);
        res.send(orgs.rows);
    },

    getOrgPerso: async (req,res) => {
        const {nombreOrg} = req.body;
        const pers = (await pool.query('SELECT * FROM "Personaje" p INNER JOIN "Pertenece" pe ON (p."Nombre"=pe."N_Personaje") INNER JOIN "Cargo" c ON (c."Cod_Cargo"=pe."Cod_Cargo") WHERE pe."N_Organizacion"=$1',[nombreOrg])).rows;
        for (let i=0; i<pers.length; i++){
            const nac = (await pool.query('SELECT "Nacionalidad" "Nac" FROM "Pers_Nac" WHERE "N_Personaje"=$1',[pers[i].Nombre])).rows
            const ocu = (await pool.query('SELECT "Ocupacion" "Ocup" FROM "Pers_Oc" WHERE "N_Personaje"=$1',[pers[i].Nombre])).rows
            const crea = (await pool.query('SELECT "N_Creador" "Nom_Creador" FROM "Pers_Creador" WHERE "N_Personaje"=$1',[pers[i].Nombre])).rows;
            pers[i] = {...pers[i], nacionalidades: nac, ocupaciones: ocu, creadores: crea}
        }
        res.send(pers);
    }
}

module.exports = persOrg;