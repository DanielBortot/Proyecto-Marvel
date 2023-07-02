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
    }
}

module.exports = objetos;