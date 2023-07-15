const pool = require('../database');

const reportes = {

    persRep1: async (req,res) => {
        const obtencion = 'Artificial';
        const cargo = 100;
        const datos = (await pool.query('SELECT * FROM "Personaje" AS Pe LEFT JOIN "Heroe" AS H ON Pe."Nombre" = H."N_Heroe" LEFT JOIN "Villano" AS V ON Pe."Nombre" = V."N_Villano" LEFT JOIN "Pertenece" per ON per."N_Personaje"= Pe."Nombre" WHERE Pe."Nombre" IN (SELECT "N_Personaje" FROM "Posee" WHERE "Obtencion" = $1) AND Pe."Nombre" IN (SELECT "N_Personaje" FROM "Pertenece" WHERE "Cod_Cargo" = $2) AND (H."N_Heroe" IS NOT NULL OR V."N_Villano" IS NOT NULL);',[obtencion,cargo])).rows;
        
        console.log(datos);
        res.send(datos);
    },

    seriesRep2: async (req,res) => {
        const datos = (await pool.query('SELECT * FROM "Serie" se INNER JOIN "Medio" me ON (se."T_Serie"=me."Titulo") WHERE se."N_Episodios" > (SELECT AVG("N_Episodios") FROM "Serie") ORDER BY se."N_Episodios" DESC')).rows;

        for (let i=0; i < datos.length; i++){
            const promedio = (await pool.query('SELECT AVG("N_Episodios") promedio FROM "Serie"')).rows;
            datos[i] = {...datos[i], ...promedio[0]};
        }
        res.send(datos);
    },

    objetosRep3: async (req,res) => {
        const datos = await pool.query('SELECT "N_Objeto", COUNT ("N_Objeto") cant FROM (SELECT "N_Objeto", "Fecha" FROM  "Combate"  GROUP BY "N_Objeto", "Fecha") AS FOO GROUP BY "N_Objeto" ORDER BY COUNT("N_Objeto") DESC LIMIT 5');

        res.send(datos.rows);
    },

    localiRep4: async (req,res) => {
        const datos = await pool.query('SELECT "Lugar", COUNT(DISTINCT "Fecha") cant FROM "Combate" GROUP BY "Lugar" ORDER BY COUNT(DISTINCT "Fecha") DESC LIMIT 3');
        res.send(datos.rows);
    },

    peliculasRep5: async (req,res) => {
        const tipo = 'Animacion';
        const datos = (await pool.query('SELECT * FROM "Pelicula" pe INNER JOIN "Medio" me ON (pe."T_Pelicula"=me."Titulo") WHERE ((me."Duracion" > 150) AND (pe."Tipo" = $1) AND (pe."Ganancia" >= (SELECT AVG ("Ganancia") FROM "Pelicula" WHERE "Tipo" = $2))) ORDER BY "Coste"',[tipo,tipo])).rows;
        res.send(datos);
    },

    buscPodPersVill: async (req,res) => {
        let {nombrePers, nombrePod, aliasVill, opVill, opPod} = req.body;
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

        if ((personajes.rowCount > 0 || villanos.rowCount > 0) && !opVill){
            errores.personaje = 'Ya existe un personaje con ese nombre';
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
        let {nombrePers,genero,ojos,pelo,comic,eMarital,nacionalidades,ocupaciones,creadores,imagenPers,alias,objetivo,nombrePod,imagenPod,descripcion,obtencion,opVill,opPod} = req.body;
        if (!opVill){
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
    },

    heroesFRep8: async (req,res) => {
        const genero = 'F';
        const tipo = 'Animacion';
        const datos = await pool.query('SELECT "N_Personaje", "N_Titulo" FROM "Esta" WHERE ("N_Titulo" IN (SELECT Me."Titulo" FROM "Medio" AS Me JOIN "Pelicula" AS  Pe ON (Me."Titulo" = Pe."T_Pelicula") WHERE (Pe."Tipo" = $1)) OR "N_Titulo" IN (SELECT Me."Titulo" FROM "Medio" AS Me JOIN "Serie" AS  S ON (Me."Titulo" = S."T_Serie") WHERE (S."Tipo" = $2))) AND ("N_Personaje" IN (SELECT "N_Heroe" FROM "Heroe")) AND ("N_Personaje" IN (SELECT "Nombre" FROM "Personaje" WHERE "Genero" = $3));',[tipo,tipo,genero]);

        res.send(datos.rows);
    }
}

module.exports = reportes;