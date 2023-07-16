const pool = require('../database');

const combates = {
    getCombates: async (req,res) => {
        const {buscar, op} = req.body;
        let combs = [];
        if (op === 1){
            combs = await pool.query('SELECT * FROM "Combate" WHERE "N_Personaje"=$1 ORDER BY "Fecha"',[buscar]);
        }
        else if (op === 2){
            combs = await pool.query('SELECT * FROM "Combate" WHERE "N_Poder"=$1 ORDER BY "Fecha"',[buscar]);
        }
        else {
            combs = await pool.query('SELECT * FROM "Combate" WHERE "N_Objeto"=$1 ORDER BY "Fecha"',[buscar]);
        }

        res.send(combs.rows);
    },

    delCombate: async (req,res) => {
        const {nombrePers, nombrePod, nombreObj, fecha} = req.body;
        await pool.query('DELETE FROM "Combate" WHERE "N_Personaje"=$1 AND "N_Poder"=$2 AND "N_Objeto"=$3 AND "Fecha"=$4',[nombrePers,nombrePod,nombreObj,fecha]);
        res.send('eliminado');
    },

    upCombate: async (req,res) => {
        const {nombrePers, nombrePod, nombreObj, fecha, nombrePersVie, nombrePodVie, nombreObjVie, fechaVie, lugar} = req.body;
        await pool.query('UPDATE "Combate" SET "N_Personaje"=$1, "N_Poder"=$2, "N_Objeto"=$3, "Fecha"=$4, "Lugar"=$5 WHERE "N_Personaje"=$6 AND "N_Poder"=$7 AND "N_Objeto"=$8 AND "Fecha"=$9',[nombrePers,nombrePod,nombreObj,fecha,lugar,nombrePersVie,nombrePodVie,nombreObjVie,fechaVie]);
        res.send('modificado');
    },

    addComb: async (req,res) => {
        const {nombrePers, nombrePod, nombreObj, fecha, lugar} = req.body;
        await pool.query('INSERT INTO "Combate" ("N_Personaje", "N_Poder", "N_Objeto", "Fecha", "Lugar") VALUES ($1, $2, $3, $4, $5)',[nombrePers,nombrePod,nombreObj,fecha,lugar]);
        res.send('creado');
    },

    compComb: async (req,res) => {
        const {nombrePers, nombrePod, nombreObj, fecha} = req.body;
        let errores = {};
        const comb = await pool.query('SELECT * FROM "Combate" WHERE "N_Personaje"=$1 AND "N_Poder"=$2 AND "N_Objeto"=$3 AND "Fecha"=$4',[nombrePers,nombrePod,nombreObj,fecha]);

        if (comb.rowCount > 0){
            errores.combate = 'Ya existe ese combate';
        }

        res.send(errores);
    }
}

module.exports = combates;