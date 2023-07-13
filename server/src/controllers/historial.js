const pool = require('../database');

const historial = {
    addHist: async (req,res) => {
        const {calificacion, tVista, perfil, titulo, inicio} = req.body;
        await pool.query('INSERT INTO "Historial" ("N_Titulo", "Id_Perfil", "Calificacion", "Hora_Inicio", "Tiempo_Reproduccion") VALUES ($1, $2, $3, $4, $5)',[titulo,perfil,calificacion, new Date(),tVista]);
        const hist = await pool.query('SELECT MAX("Hora_Inicio") tiempo FROM "Historial";');
        res.send(hist.rows);
    },

    upHist: async (req,res) => {
        const {calificacion, tVista, perfil, titulo, inicio} = req.body;
        console.log(req.body);
        await pool.query('UPDATE "Historial" SET "Calificacion"=$1, "Tiempo_Reproduccion"=$2 WHERE "N_Titulo"=$3 AND "Id_Perfil"=$4 AND "Hora_Inicio"=$5',[calificacion,tVista,titulo,perfil,inicio]);
        res.send('modificado');
    },

    getHist: async (req,res) => {
        const {perfil} = req.body;
        const medios = (await pool.query('SELECT * FROM "Historial" h INNER JOIN "Medio" me ON (h."N_Titulo"=me."Titulo") WHERE "Id_Perfil"=$1',[perfil])).rows;
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

module.exports = historial;