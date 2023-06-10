const pool = require('../database');

const acciones = {
    personajes: async (req, res) => {
        const personajes = await pool.query('SELECT * FROM prueba');
        res.send(personajes.rows);
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
        const peliculas = await pool.query('SELECT * FROM prueba');
        res.send(peliculas.rows);
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
        const series = await pool.query('SELECT * FROM prueba');
        res.send(series.rows);
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
        const juegos = await pool.query('SELECT * FROM prueba');
        res.send(juegos.rows);
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
    
    register: async (req,res) => {
        const {email,contrasena,nombre,apellido,fechaNac,fechaCrea,idSus,direccion,nTarjeta} = req.body;
        try{
            await pool.query('INSERT INTO "Usuario" ("Email", "Contrasena", "Nombre", "Apellido", "Fecha_Nac", "Fecha_Creacion", "Id_Suscripcion", "Direccion", "N_Tarjeta") VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9)',[email,contrasena,nombre,apellido,fechaNac,fechaCrea,idSus,direccion,nTarjeta]);
            res.send([{email,contrasena,nombre,apellido,fechaNac,fechaCrea,idSus,direccion,nTarjeta}]);
        } catch(err) {
            res.send(err);
        }
    },

    login: async (req,res) => {
        const {email,contrasena} = req.body;
        const usuario = await pool.query('SELECT "Email", "Contrasena" FROM "Usuario" WHERE "Email"=$1 AND "Contrasena"=$2',[email,contrasena]);
        if (usuario.rows.length == 0){
            res.send("El usuario o la contrasena no existe");
        } else {
            res.send(usuario.rows);
        }
    },

    addPerfil: async (req,res) => {
        const {dispositivo,nombre,idioma,email,imagen} = req.body;
        const perfiles = await pool.query('SELECT "Id_Perfil" FROM "Perfil" WHERE "Email"=$1',[email]);
        if (perfiles.rows.length == 5){
            res.send('Numero maximo de perfiles en el usuario');
        } else {
            try {
                await pool.query('INSERT INTO "Perfil" ("Dispositivo", "Nombre", "Idioma", "Email", "Imagen") VALUES ($1, $2, $3, $4, $5)',[dispositivo,nombre,idioma,email,imagen]);
                res.send([{dispositivo,nombre,idioma,email,imagen}]);
            } catch (err){
                res.send(err);
            }
        }
    },

    perfiles: async (req,res) => {
        const {email} = req.body;
        const perfiles = await pool.query('SELECT "Id_Perfil" FROM "Perfil" WHERE "Email"=$1',[email]);
        res.send(perfiles.rows);
    },

    addTarjeta: async (req,res) => {
        const {nTarjeta,codSeguridad,fechaVen} = req.body;
        try{
            await pool.query('INSERT INTO "Tarjeta" ("N_Tarjeta", "Cod_Seguridad", "Fecha_Ven") VALUES ($1, $2, $3)',[nTarjeta,codSeguridad,fechaVen]);
            res.send([{nTarjeta,codSeguridad,fechaVen}]);
        } catch (err) {
            res.send(err);
        }
    }
}

module.exports = acciones;