const pool = require('../database');

const objetoPers = {
    buscObjPers: async (req,res) => {
        const {nombrePers} = req.body;
        const objs = await pool.query('SELECT * FROM "Objeto" WHERE "Nombre" NOT IN (SELECT "N_Objeto" FROM "Crea" WHERE "N_Personaje"=$1)',[nombrePers]);
        res.send(objs.rows);
    },

    compObjPers: async (req,res) => {
        const {nombrePers, nombreObj} = req.body;
        let errores = {};
        const resu = await pool.query('SELECT * FROM "Crea" WHERE "N_Personaje"=$1 AND "N_Objeto"=$2',[nombrePers,nombreObj]);
        if (resu.rowCount > 0){
            errores.crea = 'Ya existe un personaje relacionado a ese objeto';
        }
        res.send(errores);
    },

    addObjPers: async (req,res) => {
        const {nombrePers, nombreObj} = req.body;
        await pool.query('INSERT INTO "Crea" ("N_Personaje", "N_Objeto") VALUES ($1, $2)',[nombrePers,nombreObj]);
        res.send('creado');
    },

    getCrea: async (req,res) => {
        const {nombreObj} = req.body;
        const pers = await pool.query('SELECT * FROM "Personaje" WHERE "Nombre" IN (SELECT "N_Personaje" FROM "Crea" WHERE "N_Objeto"=$1)',[nombreObj]);
        res.send(pers.rows);
    },
    
    delCrea: async (req,res) => {
        const {nombreObj, nombrePers} = req.body;
        await pool.query('DELETE FROM "Crea" WHERE "N_Objeto"=$1 AND "N_Personaje"=$2',[nombreObj,nombrePers]);
        res.send('eliminado');
    }, 
}

module.exports = objetoPers;