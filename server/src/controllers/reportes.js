const pool = require('../database');

const reportes = {
    buscSeries: async (req,res) => {
        const {T_Serie} = req.body;
        let errores = {};
        const series = await pool.query('SELECT * FROM "Serie" WHERE "T_Serie"=$1',[T_Serie]);
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

    updateSerie: async (req,res) => {
        const {T_Serie, T_SerieNew, Episodios} = req.body;
        await pool.query('UPDATE "Serie" SET "N_Episodios"=$1 WHERE "Titulo"=$2', [Episodios, T_Serie]);
        await pool.query('UPDATE "Medio" SET "Titulo"=$1 WHERE "Titulo"=$2',[T_SerieNew, T_Serie]);
        res.send('actualizado');
    }
}

module.exports = reportes;