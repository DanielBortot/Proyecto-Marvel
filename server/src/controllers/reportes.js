const pool = require('../database');

const reportes = {
    buscSeries: async (req,res) => {
        const {T_Serie, op} = req.body;
        let errores = {};
        const medios = await pool.query('SELECT * FROM "Medio" WHERE "Titulo"=$1',[T_Serie]);
        const series = await pool.query('SELECT * FROM "Serie" WHERE "T_Serie"=$1',[T_Serie]);
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
            const promedio = (await pool.query('SELECT AVG("N_Episodios") promedio FROM "Serie"')).rows;
            const medio = (await pool.query('SELECT "Fecha_Estreno" fecha, "Compania" compania, "Rating" rating, "Sinopsis" sinopsis, "Imagen" imagen FROM "Medio" WHERE "Titulo"=$1',[datos[i].titulo])).rows;
            datos[i] = {...datos[i], ...medio[0], ...promedio[0]};
        }
        res.send(datos);
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
        const peliculas = await pool.query('SELECT * FROM "Pelicula" WHERE "T_Pelicula"=$1',[T_Pelicula]);
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
        res.send('borrado');
    },

    updateMedioPelicula: async (req,res) => {
        const {tituloNew,titulo,fecha,compania,rating,sinopsis,imagen,director,distribuidor,duracion,ganancia,coste} = req.body;
        await pool.query('UPDATE "Pelicula" SET "Director"=$1, "Distribuidor"=$2, "Duracion"=$3, "Ganancia"=$4, "Coste"=$5 WHERE "T_Pelicula"=$6', [director,distribuidor,duracion,ganancia,coste,titulo]);
        await pool.query('UPDATE "Medio" SET "Titulo"=$1, "Fecha_Estreno"=$2, "Compania"=$3, "Rating"=$4, "Sinopsis"=$5, "Imagen"=$6 WHERE "Titulo"=$7',[tituloNew,fecha,compania,rating,sinopsis,imagen,titulo]);
        res.send('actualizado');
    },

    addMedioPelicula: async (req,res) => {
        const {titulo,fecha,compania,rating,sinopsis,imagen,director,distribuidor,duracion,ganancia,coste,op,tipo} = req.body;
        if (!op){
            await pool.query('INSERT INTO "Medio" ("Titulo", "Fecha_Estreno", "Compania", "Rating", "Sinopsis", "Imagen") VALUES ($1, $2, $3, $4, $5, $6)',[titulo,fecha,compania,rating,sinopsis,imagen]);
        }
        await pool.query('INSERT INTO "Pelicula" ("T_Pelicula", "Director", "Distribuidor", "Duracion", "Ganancia", "Coste", "Tipo") VALUES ($1, $2, $3, $4, $5, $6, $7)', [titulo,director,distribuidor,duracion,ganancia,coste,tipo]);
        res.send('creado');
    },

    compPod: async (req,res) => {
        const {nombrePod} = req.body;
        let errores = {};
        const poderes = await pool.query('SELECT * FROM "Poder" WHERE "Nombre"=$1',[nombrePod]);

        if (poderes.rowCount > 0) {
            errores.poder = 'Ya existe un poder con ese nombre';
        }
        res.send(errores);
    },

    compPers: async (req,res) => {
        const {nombrePers} = req.body;
        let errores = {};
        const personajes = await pool.query('SELECT * FROM "Personaje" WHERE "Nombre"=$1',[nombrePers]);

        if (personajes.rowCount > 0) {
            errores.personaje = 'Ya existe un personaje con ese nombre';
        }
        res.send(errores);
    },

    compAlias: async (req,res) => {
        const {aliasVill} = req.body;
        let errores = {};
        const alias = await pool.query('SELECT * FROM "Villano" WHERE "Alias"=$1',[aliasVill]);

        if (alias.rowCount > 0 && !opVill) {
            errores.alias = 'Ya existe un villano con ese alias';
        }
        res.send(errores);
    },

    buscPodPersVill: async (req,res) => {
        let {nombrePers, nombrePod, aliasVill, opPers, opVill, opPod} = req.body;
        let errores = {};
        if (opVill){
            const nom = (await pool.query('SELECT "N_Villano" "nombrePers" FROM "Villano" WHERE "Alias"=$1',[aliasVill])).rows;
            nombrePers = nom[0].nombrePers;
        }
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

    // poseeRep6: async (req,res) => {
    //     const obtencion = 'Hereditario';
    //     const palabra = 'Super%';
    //     const datos = (await pool.query('SELECT "N_Personaje" "nombrePers", "N_Poder" "nombrePod", "Obtencion" obtencion FROM "Posee" WHERE (("Obtencion" = $1) AND ("N_Poder" LIKE  $2) AND ("N_Personaje" IN (SELECT "N_Villano" FROM "Villano" GROUP BY "N_Villano" HAVING COUNT(*) < 2)))',[obtencion,palabra])).rows;
        
    //     for (let i=0; i < datos.length; i++){
    //         const poder = (await pool.query('SELECT "Descripcion" descripcion, "Imagen" "imagenPod" FROM "Poder" WHERE "Nombre"=$1',[datos[i].nombrePod])).rows;
    //         const personaje = (await pool.query('SELECT "Genero" genero, "Color_Ojos" ojos, "Color_Pelo" pelo, "Nom_Comic" comic, "E_Marital" "eMarital", imagen "imagenPers" FROM "Personaje" WHERE "Nombre"=$1',[datos[i].nombrePers])).rows;
    //         const nac = (await pool.query('SELECT "Nacionalidad" "Nac" FROM "Pers_Nac" WHERE "N_Personaje"=$1',[datos[i].nombrePers])).rows
    //         const ocu = (await pool.query('SELECT "Ocupacion" "Ocup" FROM "Pers_Oc" WHERE "N_Personaje"=$1',[datos[i].nombrePers])).rows
    //         const crea = (await pool.query('SELECT "N_Creador" "Nom_Creador" FROM "Pers_Creador" WHERE "N_Personaje"=$1',[datos[i].nombrePers])).rows
    //         const villano = (await pool.query('SELECT "Alias" alias, "Objetivo" objetivo FROM "Villano" WHERE "N_Villano"=$1',[datos[i].nombrePers])).rows;
    //         datos[i] = {...datos[i], ...poder[0], ...personaje[0], nacionalidades: nac, ocupaciones: ocu, creadores: crea, ...villano[0]};
    //     }
    //     res.send(datos);
    // },

    poseeRep6: async (req,res) => {
        const obtencion = 'Hereditario';
        const palabra = 'Super%';
        const datos = (await pool.query('SELECT Pd."Nombre" "nombrePod", Pd."Imagen" "ImagenPod", Pd."Descripcion" descripcion FROM "Posee" AS Po JOIN "Poder" AS Pd ON (Po."N_Poder" = Pd."Nombre") JOIN "Villano" AS V ON (Po."N_Personaje" = V."N_Villano") WHERE (Po."Obtencion" = $1) AND (Po."N_Poder" LIKE $2) GROUP BY Pd."Nombre" HAVING COUNT (V."N_Villano") > 2',[obtencion,palabra])).rows;
        
        res.send(datos);
    },

    eliminarPosee: async (req,res) => {
        const {nombrePod} = req.body;
        await pool.query('DELETE from "Poder" WHERE "Nombre"=$2',[nombrePod]);
        res.send('borrado');
    },

    // updatePodPersVill: async (req,res) => {
    //     const {nombrePers,genero,ojos,pelo,comic,eMarital,nacionalidades,ocupaciones,creadores,imagenPers,alias,objetivo,nombrePod,imagenPod,descripcion,obtencion,nombrePersNew,nombrePodNew} = req.body;
    //     await pool.query('UPDATE "Personaje" SET "Nombre"=$1, "Genero"=$2, "Color_Ojos"=$3, "Color_Pelo"=$4, "Nom_Comic"=$5, "E_Marital"=$6, imagen=$7 WHERE "Nombre"=$8',[nombrePersNew,genero,ojos,pelo,comic,eMarital,imagenPers,nombrePers]);
    //     await pool.query('DELETE FROM "Pers_Nac" WHERE "N_Personaje"=$1',[nombrePersNew]);
    //     await pool.query('DELETE FROM "Pers_Oc" WHERE "N_Personaje"=$1',[nombrePersNew]);
    //     await pool.query('DELETE FROM "Pers_Creador" WHERE "N_Personaje"=$1',[nombrePersNew]);
    //     for (let i=0; i<nacionalidades.length; i++){
    //         await pool.query('INSERT "Pers_Nac" SET "N_Personaje"=$1, "Nacionalidad"=$2',[nombrePersNew,nacionalidades[i].Nac]);
    //     }
    //     for (let i=0; i<ocupaciones.length; i++){
    //         await pool.query('INSERT "Pers_Oc" SET "N_Personaje"=$1, "Ocupacion"=$2',[nombrePersNew,ocupaciones[i].Ocup]);
    //     }
    //     for (let i=0; i<creadores.length; i++){
    //         await pool.query('INSERT "Pers_Creador" SET "N_Personaje"=$1, "N_Creador"=$2',[nombrePersNew,creadores[i].Nom_Creador]);
    //     }
    //     await pool.query('UPDATE "Villano" SET "Alias"=$1, "Objetivo"=$2 WHERE "N_Villano"=$3',[alias,objetivo,nombrePersNew]);
    //     await pool.query('UPDATE "Poder" SET "Nombre"=$1, "Imagen"=$2, "Descripcion"=$3 WHERE "Nombre"=$4',[nombrePodNew,imagenPod,descripcion,nombrePod]);
    //     await pool.query('UPDATE "Obtencion"=$1 WHERE "N_Personaje"=$2 AND "N_Poder"=$3',[obtencion,nombrePersNew,nombrePodNew]);

    // },

    updatePodPersVill: async (req,res) => {
        const {nombrePod,imagenPod,descripcion,nombrePodNew} = req.body;
        await pool.query('UPDATE "Poder" SET "Nombre"=$1, "Imagen"=$2, "Descripcion"=$3 WHERE "Nombre"=$4',[nombrePodNew,imagenPod,descripcion,nombrePod]);
        res.send('actualizado')
    },

    addPodPersVill: async (req,res) => {
        let {nombrePers,genero,ojos,pelo,comic,eMarital,nacionalidades,ocupaciones,creadores,imagenPers,alias,objetivo,nombrePod,imagenPod,descripcion,obtencion,opPers,opVill,opPod} = req.body;
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
        else {
            const nom = (await pool.query('SELECT "N_Villano" "nombrePers" FROM "Villano" WHERE "Alias"=$1',[alias])).rows;
            nombrePers = nom[0].nombrePers;
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