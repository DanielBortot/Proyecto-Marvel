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
    }
}

module.exports = poderPers