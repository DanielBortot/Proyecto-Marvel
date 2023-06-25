const pool = require('../database');

const reportes = {
    buscSeries: async (req,res) => {
        const {T_Serie} = req.body;
        let errores = {};
        const series = await pool.query('SELECT * FROM "Medio" WHERE "Titulo"=$1',[T_Serie]);
        if (series.rowCount > 0){
            errores.titulo = 'Ya existe una serie con ese titulo';
        }
        res.send(errores);
    },

    seriesRep2: async (req,res) => {
        const datos = await pool.query('SELECT "T_Serie", "N_Episodios" FROM "Serie"');
        res.send(datos.rows);
    },

    eliminarSerie: async (req,res) => {
        const {T_Serie} = req.body;
        await pool.query('DELETE from "Serie" WHERE "T_Serie"=$1"',[T_Serie]);
        await pool.query('DELETE from "Medio" WHERE "Titulo"=$1"',[T_Serie]);
        res.send('borrado');
    },

    updateMedioSerie: async (req,res) => {
        const {tituloNew,titulo,fecha,compania,rating,sinopsis,imagen,episodios,creador,canal} = req.body;
        await pool.query('UPDATE "Serie" SET "N_Episodios"=$1, "Creador"=$2, "Canal"=$3 WHERE "T_Serie"=$4', [episodios,creador,canal,titulo]);
        await pool.query('UPDATE "Medio" SET "Titulo"=$1, "Fecha_Estreno"=$2, "Compania"=$3, "Rating"=$4, "Sinopsis"=$5, "Imagen"=$6 WHERE "Titulo"=$7',[tituloNew,fecha,compania,rating,sinopsis,imagen,titulo]);
        res.send('actualizado');
    },

    addMedioSerie: async (req,res) => {
        const {titulo,fecha,compania,rating,sinopsis,imagen,episodios,creador,canal} = req.body;
        await pool.query('INSERT INTO "Medio" ("Titulo", "Fecha_Estreno", "Compania", "Rating", "Sinopsis", "Imagen") VALUES ($1, $2, $3, $4, $5, $6)',[titulo,fecha,compania,rating,sinopsis,imagen]);
        await pool.query('INSERT INTO "Serie" ("T_Serie", "N_Episodios", "Creador", "Canal") VALUES ($1, $2, $3, $4)', [titulo,episodios,creador,canal]);
        res.send('creado')
    },


    buscPeliculas: async (req,res) => {
        const {T_Pelicula} = req.body;
        let errores = {};
        const peliculas = await pool.query('SELECT * FROM "Medio" WHERE "Titulo"=$1',[T_Pelicula]);
        if (peliculas.rowCount > 0){
            errores.titulo = 'Ya existe una pelicula con ese titulo';
        }
        res.send(errores);
    },

    peliculasRep5: async (req,res) => {
        const datos = await pool.query('SELECT "T_Pelicula", "Duracion" FROM "Pelicula"');
        res.send(datos.rows);
    },

    eliminarPelicula: async (req,res) => {
        const {T_Pelicula} = req.body;
        await pool.query('DELETE from "Pelicula" WHERE "T_Pelicula"=$1"',[T_Pelicula]);
        await pool.query('DELETE from "Pelicula" WHERE "Titulo"=$1"',[T_Pelicula]);
        res.send('borrado');
    },

    updateMedioPelicula: async (req,res) => {
        const {tituloNew,titulo,fecha,compania,rating,sinopsis,imagen,director,distribuidor,duracion,ganancia,coste} = req.body;
        await pool.query('UPDATE "Pelicula" SET "Director"=$1, "Distribuidor"=$2, "Duracion"=$3, "Ganancia"=$4, "Coste"=$5 WHERE "T_Pelicula"=$6', [director,distribuidor,duracion,ganancia,coste,titulo]);
        await pool.query('UPDATE "Medio" SET "Titulo"=$1, "Fecha_Estreno"=$2, "Compania"=$3, "Rating"=$4, "Sinopsis"=$5, "Imagen"=$6 WHERE "Titulo"=$7',[tituloNew,fecha,compania,rating,sinopsis,imagen,titulo]);
        res.send('actualizado');
    },

    addMedioPelicula: async (req,res) => {
        const {titulo,fecha,compania,rating,sinopsis,imagen,director,distribuidor,duracion,ganancia,coste} = req.body;
        await pool.query('INSERT INTO "Medio" ("Titulo", "Fecha_Estreno", "Compania", "Rating", "Sinopsis", "Imagen") VALUES ($1, $2, $3, $4, $5, $6)',[titulo,fecha,compania,rating,sinopsis,imagen]);
        await pool.query('INSERT INTO "Pelicula" ("T_Pelicula", "Director", "Distribuidor", "Duracion", "Ganancia", "Coste") VALUES ($1, $2, $3, $4, $5, $6)', [titulo,director,distribuidor,duracion,ganancia,coste]);
        res.send('creado')
    },
}

module.exports = reportes;