const pool = require('../database');

const poderes = {
    compPod: async (req,res) => {
        const {nombrePod} = req.body;
        let errores = {};
        const poderes = await pool.query('SELECT * FROM "Poder" WHERE "Nombre"=$1',[nombrePod]);

        if (poderes.rowCount > 0) {
            errores.poder = 'Ya existe un poder con ese nombre';
        }
        res.send(errores);
    },

    buscPoderes: async (req,res) => {
        const poderes = await pool.query('SELECT * FROM "Poder"');
        res.send(poderes.rows);
    },

    addPoder: async (req,res) => {
        const {nombrePod,imagenPod,descripcion} = req.body;

        await pool.query('INSERT INTO "Poder" VALUES ("Nombre", "Imagen", "Descripcion")',[nombrePod,imagenPod,descripcion]);
        res.send('creado');
    }
}

module.exports = poderes;