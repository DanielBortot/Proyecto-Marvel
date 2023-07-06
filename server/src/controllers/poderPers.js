const pool = require('../database');

const poderPers = {
    buscPodPers: async (req,res) => {
        const {nombrePers} = req.body;
        const pods = await pool.query('SELECT * FROM "Poder" WHERE "Nombre" NOT IN (SELECT "N_Poder" FROM "Posee" WHERE "N_Personaje"=$1)',[nombrePers]);
        res.send(pods.rows);
    },

    compPodPers: async (req,res) => {
        const {nombrePers, nombrePod} = req.body;
        let errores = {};
        const resu = await pool.query('SELECT * FROM "Posee" WHERE "N_Personaje"=$1 AND "N_Poder"=$2',[nombrePers,nombrePod]);
        if (resu.rowCount > 0){
            errores.posee = 'Ya existe un personaje relacionado a ese poder';
        }
        res.send(errores);
    },

    addPodPers: async (req,res) => {
        const {nombrePers, nombrePod, obtencion} = req.body;
        await pool.query('INSERT INTO "Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ($1, $2, $3)',[nombrePers,nombrePod,obtencion]);
        res.send('creado');
    },

    getPodPerso: async (req,res) => {
        const {nombrePers} = req.body;
        const pods = await pool.query('SELECT * FROM "Posee" p INNER JOIN "Poder" po ON (p."N_Poder"=po."Nombre") WHERE p."N_Personaje"=$1',[nombrePers]);
        res.send(pods.rows);
    },

    getPersPod: async (req,res) => {
        const {nombrePod} = req.body;
        const pers = (await pool.query('SELECT * FROM "Posee" p INNER JOIN "Personaje" pe ON (p."N_Personaje"=pe."Nombre") WHERE p."N_Poder"=$1',[nombrePod])).rows;
        for (let i=0; i<pers.length; i++){
            const nac = (await pool.query('SELECT "Nacionalidad" "Nac" FROM "Pers_Nac" WHERE "N_Personaje"=$1',[pers[i].Nombre])).rows
            const ocu = (await pool.query('SELECT "Ocupacion" "Ocup" FROM "Pers_Oc" WHERE "N_Personaje"=$1',[pers[i].Nombre])).rows
            const crea = (await pool.query('SELECT "N_Creador" "Nom_Creador" FROM "Pers_Creador" WHERE "N_Personaje"=$1',[pers[i].Nombre])).rows;
            pers[i] = {...pers[i], nacionalidades: nac, ocupaciones: ocu, creadores: crea}
        }
        res.send(pers);
    }
}

module.exports = poderPers