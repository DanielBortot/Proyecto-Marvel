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
    }
}

module.exports = reportes;