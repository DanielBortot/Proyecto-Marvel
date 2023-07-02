const pool = require('../database');

const persMedio = {
    buscPersMedio: async (req,res) => {
        const {nombrePers} = req.body;
        const pers = await pool.query('SELECT * FROM "Medio" WHERE "Titulo" NOT IN (SELECT "N_Titulo" FROM "Esta" WHERE "N_Personaje"=$1)',[nombrePers]);
        res.send(pers.rows);
    },

    compPersMedio: async (req,res) => {
        const {nombrePers, titulo} = req.body;
        let errores = {};
        const resu = await pool.query('SELECT * FROM "Esta" WHERE "N_Personaje"=$1 AND "N_Titulo"=$2',[nombrePers,titulo]);
        if (resu.rowCount > 0){
            errores.esta = 'Ya existe un personaje relacionado a ese medio';
        }
        res.send(errores);
    },

    addPersMedio: async (req,res) => {
        const {nombrePers, titulo, tipoAct, rol, nombreAct} = req.body;
        await pool.query('INSERT INTO "Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ($1, $2, $3, $4, $5)',[nombrePers,titulo,tipoAct,rol,nombreAct]);
        res.send('creado');
    }
}

module.exports = persMedio;