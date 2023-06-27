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
        await pool.query('DELETE from "Medio" WHERE "Titulo"=$1"',[T_Pelicula]);
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


    buscPodPersVill: async (req,res) => {
        const {nombrePers, nombrePod, aliasVill, opPers, opVill, opPod} = req.body;
        let errores = {};
        const personajes = await pool.query('SELECT * FROM "Personaje" WHERE "Nombre"=$1',[nombrePers]);
        const villanos = await pool.query('SELECT * FROM "Villano" WHERE "N_Villano"=$1',[nombrePers]);
        const alias = await pool.query('SELECT * FROM "Villano" WHERE "Alias"=$1',[aliasVill]);
        const poderes = await pool.query('SELECT * FROM "Poder" WHERE "Nombre"=$1',[nombrePod]);
        const posee = await pool.query('SELECT * FROM "Posee" WHERE "N_Personaje"=$1 AND "N_Poder"=$2',[nombrePers,nombrePod]);

        if (personajes.rowCount > 0 && !opPers && !opVill){
            errores.personaje = 'Ya existe un personaje con ese nombre';
        }
        else if (personajes.rowCount === 0 && opPers && !opVill){
            errores.personaje = 'El personaje que ha ingresado no existe';
        }
        else if (villanos.rowCount > 0 && opPers && !opVill){
            errores.personaje = 'Ya existe un villano asociado al personaje ingresado';
        }
        if (alias.rowCount > 0 && !opVill) {
            errores.alias = 'Ya existe un villano con ese alias';
        }
        if (poderes.rowCount > 0 && !opPod) {
            errores.poder = 'Ya existe un poder con ese nombre';
        }
        if (posee.rowCount > 0){
            errores.posee = 'El villano y poder seleccionados ya estan asociados';
        }

        res.send(errores);
    },

    buscVillanos: async (req,res) => {
        const villanos = await pool.query('SELECT * FROM "Villano"');
        res.send(villanos.rows);
    },

    buscPoderes: async (req,res) => {
        const poderes = await pool.query('SELECT * FROM "Poder"');
        res.send(poderes.rows);
    },

    buscNacionalidades: async (req,res) => {
        const nacionalidades = await pool.query('SELECT * FROM "Nacionalidad"');
        res.send(nacionalidades.rows);
    },

    buscOcupaciones: async (req,res) => {
        const ocupaciones = await pool.query('SELECT * FROM "Ocupacion"');
        res.send(ocupaciones.rows);
    },

    buscCreadores: async (req,res) => {
        const creadores = await pool.query('SELECT * FROM "Creador"');
        res.send(creadores.rows);
    },

    poseeRep6: async (req,res) => {
        const obtencion = 'Hereditario';
        const palabra = 'Super%';
        const datos = (await pool.query('SELECT * FROM "Posee" WHERE (("Obtencion" = $1) AND ("N_Poder" LIKE  $2) AND ("N_Personaje" IN (SELECT "N_Villano" FROM "Villano" GROUP BY "N_Villano" HAVING COUNT(*) < 2)))',[obtencion,palabra])).rows;
        res.send(datos);
    },

    eliminarPosee: async (req,res) => {
        const {nombrePers, nombrePod} = req.body;
        await pool.query('DELETE from "Posee" WHERE "N_Personaje"=$1" AND "N_Poder"=$2',[nombrePers,nombrePod]);
        res.send('borrado');
    },

    updatePodPersVill: async (req,res) => {
        const {tituloNew,titulo,fecha,compania,rating,sinopsis,imagen,director,distribuidor,duracion,ganancia,coste} = req.body;
        await pool.query('UPDATE "Pelicula" SET "Director"=$1, "Distribuidor"=$2, "Duracion"=$3, "Ganancia"=$4, "Coste"=$5 WHERE "T_Pelicula"=$6', [director,distribuidor,duracion,ganancia,coste,titulo]);
        await pool.query('UPDATE "Medio" SET "Titulo"=$1, "Fecha_Estreno"=$2, "Compania"=$3, "Rating"=$4, "Sinopsis"=$5, "Imagen"=$6 WHERE "Titulo"=$7',[tituloNew,fecha,compania,rating,sinopsis,imagen,titulo]);
        res.send('actualizado');
    },

    addPodPersVill: async (req,res) => {
        const {nombrePers,genero,ojos,pelo,comic,eMarital,nacionalidades,ocupaciones,creadores,imagenPers,alias,objetivo,nombrePod,imagenPod,descripcion,obtencion,opPers,opVill,opPod} = req.body;
        if (!opPers && !opVill){
            await pool.query('INSERT INTO "Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ($1, $2, $3, $4, $5, $6, $7)',[nombrePers,genero,ojos,pelo,comic,eMarital,imagenPers]);
            for (let i = 0; i<nacionalidades.length; i++){
                await pool.query('INSERT INTO "Pers_Nac" ("N_Personaje", "Nacionalidad") VALUES ($1, $2)',[nombrePers,nacionalidades[i].Nac]);
            }
            for (let i = 0; i<ocupaciones.length; i++){
                await pool.query('INSERT INTO "Pers_Oc" ("N_Personaje", "Ocupacion") VALUES ($1, $2)',[nombrePers,ocupaciones[i].Ocup]);
            }
            for (let i = 0; i<creadores.length; i++){
                await pool.query('INSERT INTO "Pers_Creador" ("N_Personaje", "N_Creador") VALUES ($1, $2)',[nombrePers,creadores[i].Nom_Creador]);
            }
            await pool.query('INSERT INTO "Villano" ("N_Villano", "Alias", "Objetivo") VALUES ($1, $2, $3)',[nombrePers,alias,objetivo]);
        }
        else if (opPers && !opVill){
            await pool.query('INSERT INTO "Villano" ("N_Villano", "Alias", "Objetivo") VALUES ($1, $2, $3)',[nombrePers,alias,objetivo]);
        }
        if (!opPod){
            await pool.query('INSERT INTO "Poder" ("Nombre", "Imagen", "Descripcion") VALUES ($1, $2, $3)',[nombrePod,imagenPod,descripcion]);
        }
        await pool.query('INSERT INTO "Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ($1, $2, $3)',[nombrePers,nombrePod,obtencion]);

        
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