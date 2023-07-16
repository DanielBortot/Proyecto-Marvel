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
        const personajes = (await (pool.query('SELECT * FROM "Personaje" WHERE "Nombre" IN (SELECT "N_Personaje" FROM "Crea" WHERE "N_Objeto"=$1)',[nombreObj]))).rows;
        for (let i=0; i<personajes.length; i++){
            const nac = (await pool.query('SELECT "Nacionalidad" "Nac" FROM "Pers_Nac" WHERE "N_Personaje"=$1',[personajes[i].Nombre])).rows
            const ocu = (await pool.query('SELECT "Ocupacion" "Ocup" FROM "Pers_Oc" WHERE "N_Personaje"=$1',[personajes[i].Nombre])).rows
            const crea = (await pool.query('SELECT "N_Creador" "Nom_Creador" FROM "Pers_Creador" WHERE "N_Personaje"=$1',[personajes[i].Nombre])).rows;
            let datos = {};
            const villano = (await pool.query('SELECT * FROM "Villano" WHERE "N_Villano"=$1',[personajes[i].Nombre])).rows;
            const heroe = (await pool.query('SELECT * FROM "Heroe" WHERE "N_Heroe"=$1',[personajes[i].Nombre])).rows;
            const civil = (await pool.query('SELECT * FROM "Civil" WHERE "N_Civil"=$1',[personajes[i].Nombre])).rows;
            if (villano.length > 0){
            datos = {...villano[0], op: 1};
            }
            else if (heroe.length > 0){
                datos = {...heroe[0], op: 2};
            }
            else {
                datos = {...civil[0], op: 3}
            }
            personajes[i] = {...personajes[i], ...datos, nacionalidades: nac, ocupaciones: ocu, creadores: crea}
        }
        res.send(personajes);
    },
    
    delCrea: async (req,res) => {
        const {nombreObj, nombrePers} = req.body;
        await pool.query('DELETE FROM "Crea" WHERE "N_Objeto"=$1 AND "N_Personaje"=$2',[nombreObj,nombrePers]);
        res.send('eliminado');
    }, 
}

module.exports = objetoPers;