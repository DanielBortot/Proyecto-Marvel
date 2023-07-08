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
    },

    buscOrgPers: async (req,res) => {
        const {nombrePers} = req.body;
        const orgs = await pool.query('SELECT * FROM "Organizacion" WHERE "Nombre" NOT IN (SELECT "N_Organizacion" FROM "Pertenece" WHERE "N_Personaje"=$1)',[nombrePers]);
        res.send(orgs.rows);
    },

    getCargo: async (req,res) => {
        const cargos = await pool.query('SELECT * FROM "Cargo"');
        res.send(cargos.rows)
    },
    
    compOrgPers: async (req,res) => {
        const {nombrePers, nombreOrg} = req.body;
        let errores = {};
        const resu = await pool.query('SELECT * FROM "Pertenece" WHERE "N_Personaje"=$1 AND "N_Organizacion"=$2',[nombrePers,nombreOrg]);
        if (resu.rowCount > 0){
            errores.pertenece = 'Ya existe un personaje relacionado a esa organizacion';
        }
        res.send(errores);
    },

    addOrgPers: async (req,res) => {
        const {nombrePers, nombreOrg, cargo} = req.body;
        await pool.query('INSERT INTO "Pertenece" ("N_Personaje", "N_Organizacion", "Cod_Cargo") VALUES ($1, $2, $3)',[nombrePers,nombreOrg,cargo]);
        res.send('creado');
    },

    modOrgPers: async (req,res) => {
        const {nombrePers, nombreOrg, cargo} = req.body;
        await pool.query('UPDATE "Pertenece" SET "Cod_Cargo"=$1 WHERE "N_Personaje"=$2 AND "N_Organizacion"=$3',[cargo,nombrePers,nombreOrg]);
        res.send('modificado');
    },
}

module.exports = persOrg;