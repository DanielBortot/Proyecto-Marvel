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
    },

    getPersMedio: async (req,res) => {
        const {nombrePers} = req.body;
        const medios = (await pool.query('SELECT * FROM "Medio" WHERE "Titulo" IN (SELECT "N_Titulo" FROM "Esta" WHERE "N_Personaje"=$1)',[nombrePers])).rows;
        for (let i=0; i<medios.length; i++){
            const serie = (await pool.query('SELECT * FROM "Serie" WHERE "T_Serie"=$1',[medios[i].Titulo])).rows;
            const pelicula = (await pool.query('SELECT * FROM "Pelicula" WHERE "T_Pelicula"=$1',[medios[i].Titulo])).rows;
            let juego = (await pool.query('SELECT * FROM "Juego" WHERE "T_Juego"=$1',[medios[i].Titulo])).rows;
            let plats = [];
            if (juego.length > 0){
                plats = (await pool.query('SELECT "Plataforma" FROM "Plat_Juego" WHERE "T_Juego"=$1',[medios[i].Titulo])).rows;
                juego[0] = {...juego[0], plataformas: plats};
            }
            medios[i] = {...medios[i], ...serie[0], ...pelicula[0], ...juego[0]};
        } 
        res.send(medios);
    }
}

module.exports = persMedio;