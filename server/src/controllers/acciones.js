const pool = require('../database');

const acciones = {
    personajes: async (req, res) => {
        const personajes = (await pool.query('SELECT * FROM "Personaje"')).rows;
        for (let i=0; i<personajes.length; i++){
            const nac = (await pool.query('SELECT "Nacionalidad" "Nac" FROM "Pers_Nac" WHERE "N_Personaje"=$1',[personajes[i].Nombre])).rows
            const ocu = (await pool.query('SELECT "Ocupacion" "Ocup" FROM "Pers_Oc" WHERE "N_Personaje"=$1',[personajes[i].Nombre])).rows
            const crea = (await pool.query('SELECT "N_Creador" "Nom_Creador" FROM "Pers_Creador" WHERE "N_Personaje"=$1',[personajes[i].Nombre])).rows;
            let datos = {};
            const villano = (await pool.query('SELECT * FROM "Villano" WHERE "N_Villano"=$1',[personajes[i].Nombre])).rows;
            const heroe = (await pool.query('SELECT * FROM "Heroe" WHERE "N_Heroe"=$1',[personajes[i].Nombre])).rows;
            const civil = (await pool.query('SELECT * FROM "Civil" WHERE "N_Civil"=$1',[personajes[i].Nombre])).rows;
            if (villano.length > 0){
            datos = {...villano[0], op: 1};
            }
            else if (heroe.length > 0){
                datos = {...heroe[0], op: 2};
            }
            else {
                datos = {...civil[0], op: 3}
            }
            personajes[i] = {...personajes[i], ...datos, nacionalidades: nac, ocupaciones: ocu, creadores: crea}
        }
        res.send(personajes);
    },

    personajesPopulares: async (req, res) => {
        const personajesPopulares = (await pool.query('SELECT * FROM "Personaje" WHERE "Nombre" IN (SELECT "N_Personaje" FROM "Esta" WHERE "N_Titulo" IN (SELECT "Titulo" FROM "Medio" WHERE "Rating" > 4))')).rows;
        res.send(personajesPopulares);
    },


    villHer: async (req,res) => {
        const {Nombre} = req.body;
        let datos = {};
        const villano = (await pool.query('SELECT "Alias", "Objetivo" FROM "Villano" WHERE "N_Villano"=$1',[Nombre])).rows;
        const heroe = (await pool.query('SELECT "Alias", "Logotipo", "Color_Traje", "Archienemigo" FROM "Heroe" WHERE "N_Heroe"=$1',[Nombre])).rows;
        if (villano.length > 0){
            datos = {...villano[0], op: 1};
        }
        else if (heroe.length > 0){
            datos = {...heroe[0], op: 2};
        }
        else {
            datos = {op: 3}
        }
        res.send(datos);
    },

    addPersonaje: async (req, res) => {
        const {cont1, cont2 ,cont3} = req.body;
        await pool.query('INSERT INTO prueba (cont1, cont2, cont3) VALUES ($1, $2, $3)', [cont1, cont2, cont3]);
        res.redirect('/api/personajes');
    },

    removePersonaje: async (req,res) => {
        const id = req.params['id'];
        await pool.query('DELETE * FROM prueba WHERE personaje_id = $1', [id]);
        res.redirect('/api/personajes');
    },

    peliculas: async (req, res) => {
        const {suscrip} = req.body;
        let peliculas = [];
        if (suscrip === 3){
            peliculas = (await pool.query('SELECT * FROM "Pelicula"')).rows;
        }
        if (suscrip === 2){
            peliculas = (await pool.query('SELECT * FROM "Pelicula" WHERE "T_Pelicula" IN (SELECT "Titulo" FROM "Medio" WHERE "Suscripcion"=2 OR "Suscripcion"=1 OR "Suscripcion"=4)')).rows;
        }
        if (suscrip === 1){
            peliculas = (await pool.query('SELECT * FROM "Pelicula" WHERE "T_Pelicula" IN (SELECT "Titulo" FROM "Medio" WHERE "Suscripcion"=1 OR "Suscripcion"=4)')).rows;
        }
        if (suscrip === 4){
            peliculas = (await pool.query('SELECT * FROM "Pelicula" WHERE "T_Pelicula" IN (SELECT "Titulo" FROM "Medio" WHERE "Suscripcion"=4)')).rows;
        }
        for (let i=0; i<peliculas.length; i++){
            const medio = (await pool.query('SELECT * FROM "Medio" WHERE "Titulo"=$1',[peliculas[i].T_Pelicula])).rows;
            peliculas[i] = {...peliculas[i], ...medio[0]};
        }
        res.send(peliculas);
    },

    peliculasPopulares: async (req, res) => {
        const peliculasPopulares = (await pool.query('SELECT * FROM "Medio" WHERE "Rating" > 4 AND "Titulo" IN (SELECT "T_Pelicula" FROM "Pelicula")')).rows;
        res.send(peliculasPopulares);
    },

    addPelicula: async (req, res) => {
        const {cont1, cont2 ,cont3} = req.body;
        await pool.query('INSERT INTO prueba (cont1, cont2, cont3) VALUES ($1, $2, $3)', [cont1, cont2, cont3]);
        res.redirect('/api/peliculas');
    },

    removePelicula: async (req,res) => {
        const id = req.params['id'];
        await pool.query('DELETE FROM prueba WHERE pelicula_id = $1', [id]);
        res.redirect('/api/peliculas');
    },

    series: async (req, res) => {
        const {suscrip} = req.body;
        let series = [];
        if (suscrip === 3){
            series = (await pool.query('SELECT * FROM "Serie"')).rows;
        }
        if (suscrip === 2){
            series = (await pool.query('SELECT * FROM "Serie" WHERE "T_Serie" IN (SELECT "Titulo" FROM "Medio" WHERE "Suscripcion"=2 OR "Suscripcion"=1 OR "Suscripcion"=4)')).rows;
        }
        if (suscrip === 1){
            series = (await pool.query('SELECT * FROM "Serie" WHERE "T_Serie" IN (SELECT "Titulo" FROM "Medio" WHERE "Suscripcion"=1 OR "Suscripcion"=4)')).rows;
        }
        if (suscrip === 4){
            series = (await pool.query('SELECT * FROM "Serie" WHERE "T_Serie" IN (SELECT "Titulo" FROM "Medio" WHERE "Suscripcion"=4)')).rows;
        }
        for (let i=0; i<series.length; i++){
            const medio = (await pool.query('SELECT * FROM "Medio" WHERE "Titulo"=$1',[series[i].T_Serie])).rows;
            series[i] = {...series[i], ...medio[0]};
        }
        res.send(series);
    },

    seriesPopulares: async (req, res) => {
        const seriesPopulares = (await pool.query('SELECT * FROM "Medio" WHERE "Rating" > 4 AND "Titulo" IN (SELECT "T_Serie" FROM "Serie")')).rows;
        res.send(seriesPopulares);
    },

    addSerie: async (req, res) => {
        const {cont1, cont2 ,cont3} = req.body;
        await pool.query('INSERT INTO prueba (cont1, cont2, cont3) VALUES ($1, $2, $3)', [cont1, cont2, cont3]);
        res.redirect('/api/series');
    },
    
    removeSerie: async (req,res) => {
        const id = req.params['id'];
        await pool.query('DELETE * FROM prueba WHERE series_id = $1', [id]);
        res.redirect('/api/series');
    },

    juegos: async (req, res) => {
        const {suscrip} = req.body;
        let juegos = [];
        if (suscrip === 3){
            juegos = (await pool.query('SELECT * FROM "Juego"')).rows;
        }
        if (suscrip === 2){
            juegos = (await pool.query('SELECT * FROM "Juego" WHERE "T_Juego" IN (SELECT "Titulo" FROM "Medio" WHERE "Suscripcion"=2 OR "Suscripcion"=1 OR "Suscripcion"=4)')).rows;
        }
        if (suscrip === 1){
            juegos = (await pool.query('SELECT * FROM "Juego" WHERE "T_Juego" IN (SELECT "Titulo" FROM "Medio" WHERE "Suscripcion"=1 OR "Suscripcion"=4)')).rows;
        }
        if (suscrip === 4){
            juegos = (await pool.query('SELECT * FROM "Juego" WHERE "T_Juego" IN (SELECT "Titulo" FROM "Medio" WHERE "Suscripcion"=4)')).rows;
        }
        for (let i=0; i<juegos.length; i++){
            const medio = (await pool.query('SELECT * FROM "Medio" WHERE "Titulo"=$1',[juegos[i].T_Juego])).rows;
            const plat = (await pool.query('SELECT "Plataforma" FROM "Plat_Juego" WHERE "T_Juego"=$1',[juegos[i].T_Juego])).rows
            juegos[i] = {...juegos[i], ...medio[0], plataformas: plat};
        }
        res.send(juegos);
    },

    juegosPopulares: async (req, res) => {
        const juegosPopulares = (await pool.query('SELECT * FROM "Medio" WHERE "Rating" > 4 AND "Titulo" IN (SELECT "T_Juego" FROM "Juego")')).rows;
        res.send(juegosPopulares);
    },

    addJuego: async (req, res) => {
        const {cont1, cont2 ,cont3} = req.body;
        await pool.query('INSERT INTO prueba (cont1, cont2, cont3) VALUES ($1, $2, $3)', [cont1, cont2, cont3]);
        res.redirect('/api/juegos');
    },

    removeJuego: async (req,res) => {
        const id = req.params['id'];
        await pool.query('DELETE * FROM prueba WHERE juego_id = $1', [id]);
        res.redirect('/api/juegos');
    },
    
    buscUsuario: async (req,res) => {
        const {Email,Nombre,Apellido} = req.body;
        let errores = {};
        const usuarios = await pool.query('SELECT "Email", "Nombre", "Apellido" FROM "Usuario" WHERE "Email"=$1 OR "Nombre"=$2 OR "Apellido"=$3',[Email || null, Nombre || null, Apellido || null]);

        if (usuarios.rows.length !== 0){
            usuarios.rows.map(usuario => {
                if (usuario.Email === Email){
                    errores.email = "El email ya existe";
                }
                if (usuario.Nombre === Nombre){
                    errores.nombre = "El nombre ya existe";
                }
                if (usuario.Apellido === Apellido){
                    errores.apellido = "El apellido ya existe";
                }
            });
        }
        res.send(errores);
    },

    register: async (req,res) => {
        const {Email,Contrasena,Nombre,Apellido,Fecha_Nac,Fecha_Creacion,Id_Suscripcion,Direccion,N_Tarjeta} = req.body;
        try{
            await pool.query('INSERT INTO "Usuario" ("Email", "Contrasena", "Nombre", "Apellido", "Fecha_Nac", "Fecha_Creacion", "Id_Suscripcion", "Direccion", "N_Tarjeta") VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9)',[Email,Contrasena,Nombre,Apellido,Fecha_Nac,Fecha_Creacion,Id_Suscripcion,Direccion,N_Tarjeta]);
            res.send([{Email,Contrasena,Nombre,Apellido,Fecha_Nac,Fecha_Creacion,Id_Suscripcion,Direccion,N_Tarjeta}]);
        } catch(err) {
            res.send(err);
        }
    },

    login: async (req,res) => {
        const {Email,Contrasena} = req.body;
        const usuario = await pool.query('SELECT * FROM "Usuario" WHERE "Email"=$1 AND "Contrasena"=$2',[Email,Contrasena]);
        res.send(usuario.rows);
    },

    addPerfil: async (req,res) => {
        const {Dispositivo,Nombre,Idioma,Email,Imagen} = req.body;
        await pool.query('INSERT INTO "Perfil" ("Dispositivo", "Nombre", "Idioma", "Email", "Imagen") VALUES ($1, $2, $3, $4, $5)',[Dispositivo,Nombre,Idioma,Email,Imagen]);
        res.send([{Dispositivo,Nombre,Idioma,Email,Imagen}]);
    },

    perfiles: async (req,res) => {
        const {Email, op} = req.body;
        const perfiles = await pool.query('SELECT * FROM "Perfil" WHERE "Email"=$1',[Email]);
        if (perfiles.rows.length == 5 && op){
            res.send({errTam: 'Numero de perfiles maximos alcanzados'});
        } 
        else if (!op) {
            res.send(perfiles.rows);
        }
        else {
            res.send({});
        }
    },

    buscPerfil: async (req,res) => {
        const {Email, Nombre} = req.body;
        const perfiles = await pool.query('SELECT * FROM "Perfil" WHERE "Email"=$1 AND "Nombre"=$2',[Email,Nombre]);
        if (perfiles.rowCount != 0 && perfiles.rows[0].Nombre === Nombre){
            res.send({errNom: 'Ya existe un perfil con este nombre'})
        } else {
            res.send({});
        }
    },

    buscTarjeta: async (req,res) => {
        const {N_Tarjeta,Cod_Seguridad,Fecha_Ven} = req.body;
        let enc = false;
        const tarjetas = await pool.query('SELECT "N_Tarjeta", "Cod_Seguridad", "Fecha_Ven" FROM "Tarjeta" WHERE "N_Tarjeta"=$1 OR "Cod_Seguridad"=$2 OR "Fecha_Ven"=$3',[N_Tarjeta,Cod_Seguridad,Fecha_Ven]);

        if (tarjetas.rows.length !== 0){
            tarjetas.rows.map(tarjeta => {
                const fecha = tarjeta.Fecha_Ven.toISOString().slice(0,10);
                if (tarjeta.N_Tarjeta == N_Tarjeta && (tarjeta.Cod_Seguridad != Cod_Seguridad || fecha != Fecha_Ven)) {
                    res.send({errTarj: 'Existe la tarjeta ingresada pero el resto de datos son incorrectos'});
                    enc = true;
                }
                else if (tarjeta.N_Tarjeta == N_Tarjeta && tarjeta.Cod_Seguridad == Cod_Seguridad && tarjeta.Fecha_Ven == Fecha_Ven){
                    enc = true;
                    res.send(true);
                }
            });
        }
        if (!enc){
            res.send(false);
        }
    },

    updateUsuTarjeta: async (req,res) => {
        const {N_Tarjeta, Email} = req.body;
        await pool.query('UPDATE "Usuario" SET "N_Tarjeta"=$1 WHERE "Email"=$2',[N_Tarjeta,Email]);
        res.send('Actualizado');
    },

    selecTarjeta: async (req,res) => {
        const {N_Tarjeta} = req.body;
        const tarjeta = await pool.query('SELECT * FROM "Tarjeta" WHERE "N_Tarjeta"=$1',[N_Tarjeta]);
    
        res.send(tarjeta.rows);
    },

    addTarjeta: async (req,res) => {
        const {N_Tarjeta,Cod_Seguridad,Fecha_Ven} = req.body;
        try{
            await pool.query('INSERT INTO "Tarjeta" ("N_Tarjeta", "Cod_Seguridad", "Fecha_Ven") VALUES ($1, $2, $3)',[N_Tarjeta,Cod_Seguridad,Fecha_Ven]);
            res.send([{N_Tarjeta,Cod_Seguridad,Fecha_Ven}]);
        } catch (err) {
            res.send(err);
        }
    },

    paises: async (req,res) => {
        const paises = await pool.query('SELECT * FROM "Pais"');
        res.send(paises.rows);
    },

    estados: async (req,res) => {
        const {Id_Pais} = req.body;
        const estados = await pool.query('SELECT * FROM "Estado" WHERE "Id_Pais"=$1',[Id_Pais || null]);
        res.send(estados.rows);
    },

    ciudades: async (req,res) => {
        const {Id_Estado} = req.body;
        const ciudades = await pool.query('SELECT * FROM "Ciudad" WHERE "Id_Estado"=$1',[Id_Estado || null]);
        res.send(ciudades.rows);
    },

    setPais: async (req,res) => {
        const {Id_Pais} = req.body;
        const paises = await pool.query('SELECT * FROM "Pais" WHERE "Id_Pais"=$1',[Id_Pais]);
        res.send(paises.rows);
    },

    setEstado: async (req,res) => {
        const {Id_Estado} = req.body;
        const estados = await pool.query('SELECT * FROM "Estado" WHERE "Id_Estado"=$1',[Id_Estado]);
        res.send(estados.rows);
    },

    setCiudad: async (req,res) => {
        const {Id_Ciudad} = req.body;
        const ciudades = await pool.query('SELECT * FROM "Ciudad" WHERE "Id_Ciudad"=$1',[Id_Ciudad]);
        res.send(ciudades.rows);
    },

    suscripcion: async (req,res) => {
        const {ID} = req.body;
        const suscripcion = await pool.query('SELECT * FROM "Suscripcion" WHERE "ID"=$1',[ID]);
        res.send(suscripcion.rows);
    },

    updateSusUsuario: async (req,res) => {
        const {Id_Suscripcion, Email} = req.body;
        await pool.query('UPDATE "Usuario" SET "Id_Suscripcion"=$1 WHERE "Email"=$2',[Id_Suscripcion,Email]);
        const sus = await pool.query('SELECT * FROM "Suscripcion" WHERE "ID"=$1',[Id_Suscripcion]);
        
        res.send(sus.rows);
    },

    updateInfoUsuario: async (req,res) => {
        const {Nombre, Apellido, Email, Contrasena, Fecha_Nac, Direccion, EmailAnt} = req.body;
        await pool.query('UPDATE "Usuario" SET "Email"=$1, "Nombre"=$2, "Apellido"=$3, "Contrasena"=$4, "Fecha_Nac"=$5, "Direccion"=$6 WHERE "Email"=$7',[Email,Nombre,Apellido,Contrasena,Fecha_Nac,Direccion,EmailAnt]);
        res.send('Actualizado');
    },

    eliminarUsuario: async (req,res) => {
        const {Email} = req.body;
        const perfiles = (await pool.query('SELECT "Id_Perfil" FROM "Perfil" WHERE "Email"=$1',[Email])).rows;
        for (let i=0; i<=perfiles.length; i++){
            if (i < perfiles.length){
                await pool.query('DELETE FROM "Historial" WHERE "Id_Perfil"=$1',[perfiles[i].Id_Perfil]);
                await pool.query('DELETE FROM "Perfil" WHERE "Id_Perfil"=$1',[perfiles[i].Id_Perfil]);
            }
            else if (i === perfiles.length){
                await pool.query('DELETE FROM "Usuario" WHERE "Email"=$1',[Email]);
            }
        }
        res.send('eliminado');
    }
}

module.exports = acciones;