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
    
    buscUsuario: async (req,res) => {
        const {Email,Nombre,Apellido} = req.body;
        let errores = {};
        const usuarios = await pool.query('SELECT "Email", "Nombre", "Apellido" FROM "Usuario" WHERE "Email"=$1 OR "Nombre"=$2 OR "Apellido"=$3',[Email,Nombre,Apellido]);

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
        const {Email} = req.body;
        const perfiles = await pool.query('SELECT "Id_Perfil" FROM "Perfil" WHERE "Email"=$1',[Email]);
        res.send(perfiles.rows);
    },

    buscTarjeta: async (req,res) => {
        const {N_Tarjeta,Cod_Seguridad,Fecha_Ven} = req.body;
        let enc = false;
        const tarjetas = await pool.query('SELECT "N_Tarjeta", "Cod_Seguridad", "Fecha_Ven" FROM "Tarjeta" WHERE "N_Tarjeta"=$1 OR "Cod_Seguridad"=$2 OR "Fecha_Ven"=$3',[N_Tarjeta,Cod_Seguridad,Fecha_Ven]);

        if (tarjetas.rows.length !== 0){
            tarjetas.rows.map(tarjeta => {
                if (tarjeta.N_Tarjeta == N_Tarjeta && tarjeta.Cod_Seguridad == Cod_Seguridad && tarjeta.Fecha_Ven == Fecha_Ven){
                    enc = true;
                }
            });
        }

        res.send(enc);
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
    }
}

module.exports = acciones;