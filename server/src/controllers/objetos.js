const pool = require('../database');

const objetos = {
    
    buscObjeto: async (req,res) => {
        const {nombreObj} = req.body;
        let errores = {};
        const obj = await pool.query('SELECT * FROM "Objeto" WHERE "Nombre"=$1',[nombreObj]);

        if (obj.rowCount > 0){
            errores.nombreObj = 'Ya existe un objeto con ese nombre';
        }

        res.send(errores);
    },

    addObjeto: async (req,res) => {
        const {nombreObj,descripcion,material,tipo,imagen,nombrePers} = req.body;

        if (nombrePers == 'no'){
            await pool.query('INSERT INTO "Objeto" ("Nombre", "Descripcion", "Material", "Tipo", "Imagen") VALUES ($1, $2, $3, $4, $5)',[nombreObj,descripcion,material,tipo,imagen]);
        }
        else {
            await pool.query('INSERT INTO "Objeto" ("Nombre", "Descripcion", "Material", "Tipo", "Imagen", "N_Personaje") VALUES ($1, $2, $3, $4, $5, $6)',[nombreObj,descripcion,material,tipo,imagen,nombrePers]);
        }

        res.send('creado');
    },

    getObjPers: async (req,res) => {
        const {nombrePers} = req.body;
        const objs = await pool.query('SELECT * FROM "Objeto" WHERE "N_Personaje"=$1',[nombrePers]);
        res.send(objs.rows);
    },

    getObjetos: async (req,res) => {
        const objs = await pool.query('SELECT * FROM "Objeto"');
        res.send(objs.rows);
    }
}

module.exports = objetos;