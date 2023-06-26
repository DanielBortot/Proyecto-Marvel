const pool = require('../database');

const reportes = {
    buscSeries: async (req,res) => {
        const {T_Serie, op} = req.body;
        let errores = {};
        const medios = await pool.query('SELECT * FROM "Medio" WHERE "Titulo"=$1',[T_Serie]);
        const series = await pool.query('SELECT * FROM "Serie" WHERE "Titulo"=$1',[T_Serie]);
        if (medios.rowCount > 0 && !op){
            errores.titulo = 'Ya existe una serie con ese titulo';
        }
        else if (medios.rowCount === 0 && op){
            errores.titulo = 'El titulo que ha ingresado no existe en los Medios';
        }
        else if (series.rowCount > 0 && op){
            errores.titulo = 'Ya existe una serie con ese titulo';
        }
        res.send(errores);
    },

    seriesRep2: async (req,res) => {
        const datos = (await pool.query('SELECT "T_Serie" titulo, "N_Episodios" episodios, "Creador" creador, "Canal" canal, "Tipo" tipo FROM "Serie" WHERE "N_Episodios" > (SELECT AVG("N_Episodios") FROM "Serie")')).rows;

        for (let i=0; i < datos.length; i++){
            const medio = (await pool.query('SELECT "Fecha_Estreno" fecha, "Compania" compania, "Rating" rating, "Sinopsis" sinopsis, "Imagen" imagen FROM "Medio" WHERE "Titulo"=$1',[datos[i].titulo])).rows;
            datos[i] = {...datos[i], ...medio[0]};
        }
        res.send(datos);
    },

    eliminarSerie: async (req,res) => {
        const {T_Serie} = req.body;
        await pool.query('DELETE from "Serie" WHERE "T_Serie"=$1"',[T_Serie]);
        await pool.query('DELETE from "Medio" WHERE "Titulo"=$1"',[T_Serie]);
        res.send('borrado');
    },

    updateMedioSerie: async (req,res) => {
        const {tituloNew,titulo,fecha,compania,rating,sinopsis,imagen,episodios,creador,canal,tipo} = req.body;
        await pool.query('UPDATE "Serie" SET "N_Episodios"=$1, "Creador"=$2, "Canal"=$3, "Tipo"=$4 WHERE "T_Serie"=$5', [episodios,creador,canal,tipo,titulo]);
        await pool.query('UPDATE "Medio" SET "Titulo"=$1, "Fecha_Estreno"=$2, "Compania"=$3, "Rating"=$4, "Sinopsis"=$5, "Imagen"=$6 WHERE "Titulo"=$7',[tituloNew,fecha,compania,rating,sinopsis,imagen,titulo]);
        res.send('actualizado');
    },

    addMedioSerie: async (req,res) => {
        const {titulo,fecha,compania,rating,sinopsis,imagen,episodios,creador,canal,tipo,op} = req.body;
        if (!op){
            await pool.query('INSERT INTO "Medio" ("Titulo", "Fecha_Estreno", "Compania", "Rating", "Sinopsis", "Imagen") VALUES ($1, $2, $3, $4, $5, $6)',[titulo,fecha,compania,rating,sinopsis,imagen]);
        }
        await pool.query('INSERT INTO "Serie" ("T_Serie", "N_Episodios", "Creador", "Canal", "Tipo") VALUES ($1, $2, $3, $4, $5)', [titulo,episodios,creador,canal,tipo]);
        res.send('creado');
    },


    buscPeliculas: async (req,res) => {
        const {T_Pelicula, op} = req.body;
        let errores = {};
        const medios = await pool.query('SELECT * FROM "Medio" WHERE "Titulo"=$1',[T_Pelicula]);
        const peliculas = await pool.query('SELECT * FROM "Pelicula" WHERE "Titulo"=$1',[T_Pelicula]);
        if (medios.rowCount > 0 && !op){
            errores.titulo = 'Ya existe una pelicula con ese titulo';
        }
        else if (medios.rowCount === 0 && op){
            errores.titulo = 'El titulo que ha ingresado no existe en los medios';
        }
        else if (peliculas.rowCount > 0 && op){
            errores.titulo = 'Ya existe una pelicula con ese titulo';
        }
        res.send(errores);
    },

    peliculasRep5: async (req,res) => {
        const tipo = 'Animacion';
        const datos = (await pool.query('SELECT "T_Pelicula" titulo, "Director" director, "Duracion" duracion, "Coste" coste, "Ganancia" ganancia, "Distribuidor" distribuidor, "Tipo" tipo FROM "Pelicula" WHERE (("Duracion" > 150) AND ("Tipo" = $1) AND ("Ganancia" >= (SELECT AVG ("Ganancia") FROM "Pelicula" WHERE "Tipo" = $2))) ORDER BY "Coste"',[tipo,tipo])).rows;

        for (let i=0; i < datos.length; i++){
            const medio = (await pool.query('SELECT "Fecha_Estreno" fecha, "Compania" compania, "Rating" rating, "Sinopsis" sinopsis, "Imagen" imagen FROM "Medio" WHERE "Titulo"=$1',[datos[i].titulo])).rows;
            datos[i] = {...datos[i], ...medio[0]};
        }
        res.send(datos);
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
        const {titulo,fecha,compania,rating,sinopsis,imagen,director,distribuidor,duracion,ganancia,coste,op} = req.body;
        if (!op){
            await pool.query('INSERT INTO "Medio" ("Titulo", "Fecha_Estreno", "Compania", "Rating", "Sinopsis", "Imagen") VALUES ($1, $2, $3, $4, $5, $6)',[titulo,fecha,compania,rating,sinopsis,imagen]);
        }
        await pool.query('INSERT INTO "Pelicula" ("T_Pelicula", "Director", "Distribuidor", "Duracion", "Ganancia", "Coste") VALUES ($1, $2, $3, $4, $5, $6)', [titulo,director,distribuidor,duracion,ganancia,coste]);
        res.send('creado');
    },

    usuariosRepReg: async (req,res) => {
        const suscripcion = 'Vip';
        const pais = 'Venezuela';
        const datos = await pool.query('SELECT U."Email", U."Nombre", U."Apellido", U."Fecha_Nac" FROM "Usuario" U JOIN "Suscripcion" S ON (U."Id_Suscripcion" = S."ID") WHERE ((S."Tipo" = $1) AND (U."Direccion" IN (SELECT "Id_Ciudad" FROM "Ciudad" WHERE "Id_Estado" IN (SELECT "Id_Estado" FROM "Estado" WHERE "Id_Pais" IN (SELECT "Id_Pais" FROM "Pais" WHERE "Nombre" = $2)))))', [suscripcion,pais]);
        res.send(datos.rows);
    }
}

module.exports = reportes;