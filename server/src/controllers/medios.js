const pool = require('../database');

const medios = {
    buscSeries: async (req,res) => {
        const {T_Serie} = req.body;
        let errores = {};
        const medios = await pool.query('SELECT * FROM "Medio" WHERE "Titulo"=$1',[T_Serie]);
        const series = await pool.query('SELECT * FROM "Serie" WHERE "T_Serie"=$1',[T_Serie]);
        if (medios.rowCount > 0 || series.rowCount > 0){
            errores.titulo = 'Ya existe una serie con ese titulo';
        }
        res.send(errores);
    },

    eliminarSerie: async (req,res) => {
        const {T_Serie} = req.body;
        await pool.query('DELETE FROM "Serie" WHERE "T_Serie"=$1',[T_Serie]);
        res.send('borrado');
    },

    updateMedioSerie: async (req,res) => {
        const {tituloNew,titulo,fecha,compania,rating,sinopsis,imagen,episodios,creador,canal,tipo} = req.body;
        await pool.query('UPDATE "Serie" SET "N_Episodios"=$1, "Creador"=$2, "Canal"=$3, "Tipo"=$4 WHERE "T_Serie"=$5', [episodios,creador,canal,tipo,titulo]);
        await pool.query('UPDATE "Medio" SET "Titulo"=$1, "Fecha_Estreno"=$2, "Compania"=$3, "Rating"=$4, "Sinopsis"=$5, "Imagen"=$6 WHERE "Titulo"=$7',[tituloNew,fecha,compania,rating,sinopsis,imagen,titulo]);
        res.send('actualizado');
    },

    addMedioSerie: async (req,res) => {
        const {titulo,fecha,compania,rating,sinopsis,imagen,episodios,creador,canal,tipo} = req.body;
        await pool.query('INSERT INTO "Medio" ("Titulo", "Fecha_Estreno", "Compania", "Rating", "Sinopsis", "Imagen") VALUES ($1, $2, $3, $4, $5, $6)',[titulo,fecha,compania,rating,sinopsis,imagen]);
        await pool.query('INSERT INTO "Serie" ("T_Serie", "N_Episodios", "Creador", "Canal", "Tipo") VALUES ($1, $2, $3, $4, $5)', [titulo,episodios,creador,canal,tipo]);
        res.send('creado');
    },


    buscPeliculas: async (req,res) => {
        const {T_Pelicula} = req.body;
        let errores = {};
        const medios = await pool.query('SELECT * FROM "Medio" WHERE "Titulo"=$1',[T_Pelicula]);
        const peliculas = await pool.query('SELECT * FROM "Pelicula" WHERE "T_Pelicula"=$1',[T_Pelicula]);
        if (medios.rowCount > 0 || peliculas.rowCount > 0){
            errores.titulo = 'Ya existe una pelicula con ese titulo';
        }
        res.send(errores);
    },

    eliminarPelicula: async (req,res) => {
        const {T_Pelicula} = req.body;
        await pool.query('DELETE from "Pelicula" WHERE "T_Pelicula"=$1"',[T_Pelicula]);
        res.send('borrado');
    },

    updateMedioPelicula: async (req,res) => {
        const {tituloNew,titulo,fecha,compania,rating,sinopsis,imagen,director,distribuidor,duracion,ganancia,coste} = req.body;
        await pool.query('UPDATE "Pelicula" SET "Director"=$1, "Distribuidor"=$2, "Duracion"=$3, "Ganancia"=$4, "Coste"=$5 WHERE "T_Pelicula"=$6', [director,distribuidor,duracion,ganancia,coste,titulo]);
        await pool.query('UPDATE "Medio" SET "Titulo"=$1, "Fecha_Estreno"=$2, "Compania"=$3, "Rating"=$4, "Sinopsis"=$5, "Imagen"=$6 WHERE "Titulo"=$7',[tituloNew,fecha,compania,rating,sinopsis,imagen,titulo]);
        res.send('actualizado');
    },

    addMedioPelicula: async (req,res) => {
        const {titulo,fecha,compania,rating,sinopsis,imagen,director,distribuidor,duracion,ganancia,coste,tipo} = req.body;
        await pool.query('INSERT INTO "Medio" ("Titulo", "Fecha_Estreno", "Compania", "Rating", "Sinopsis", "Imagen") VALUES ($1, $2, $3, $4, $5, $6)',[titulo,fecha,compania,rating,sinopsis,imagen]);
        await pool.query('INSERT INTO "Pelicula" ("T_Pelicula", "Director", "Distribuidor", "Duracion", "Ganancia", "Coste", "Tipo") VALUES ($1, $2, $3, $4, $5, $6, $7)', [titulo,director,distribuidor,duracion,ganancia,coste,tipo]);
        res.send('creado');
    },

    plataformas: async (req,res) => {
        const plataformas = await pool.query('SELECT * FROM "Plataforma"');
        res.send(plataformas.rows);
    },

    addMedioJuego: async (req,res) => {
        const {titulo, fecha, compania, rating, sinopsis, imagen, distribuidor, tipo, plataformas} = req.body;
        await pool.query('INSERT INTO "Medio" ("Titulo", "Fecha_Estreno", "Compania", "Rating", "Sinopsis", "Imagen") VALUES ($1, $2, $3, $4, $5, $6)',[titulo,fecha,compania,rating,sinopsis,imagen]);
        await pool.query('INSERT INTO "Juego" ("T_Juego", "Distribuidor", "Tipo") VALUES ($1, $2, $3)', [titulo,distribuidor,tipo]);
        for (let i=0; i<plataformas.length; i++){
            await pool.query('INSERT INTO "Plat_Juego" ("T_Juego", "Plataforma") VALUES ($1, $2)',[titulo,plataformas[i].nombre]);
        }
        res.send('creado');
    },

    buscJuegos: async (req,res) => {
        const {T_Juego} = req.body;
        let errores = {};
        const medios = await pool.query('SELECT * FROM "Medio" WHERE "Titulo"=$1',[T_Juego]);
        const juegos = await pool.query('SELECT * FROM "Juego" WHERE "T_Juego"=$1',[T_Juego]);
        if (medios.rowCount > 0 || juegos.rowCount > 0){
            errores.titulo = 'Ya existe un juego con ese titulo';
        }
        res.send(errores);
    },
}


module.exports = medios;