const pool = require('../database');

const personajes = {
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
        const {alias, op} = req.body;
        let errores = {};
        let ali = [];
        if (op){
            ali = await pool.query('SELECT * FROM "Villano" WHERE "Alias"=$1',[alias]);
        }
        else {
            ali = await pool.query('SELECT * FROM "Heroe" WHERE "Alias"=$1',[alias]);
        }

        if (ali.rowCount > 0 && op) {
            errores.alias = 'Ya existe un villano con ese alias';
        }
        if (ali.rowCount > 0 && !op){
            errores.alias = 'Ya existe un heroe con ese alias';
        }
        res.send(errores);
    },

    buscVillanos: async (req,res) => {
        const villanos = await pool.query('SELECT * FROM "Villano"');
        res.send(villanos.rows);
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

    buscHeroes: async (req,res) => {
        const heroes = await pool.query('SELECT * FROM "Heroe"');
        res.send(heroes.rows);
    },

    buscCiviles: async (req,res) => {
        const civ = await pool.query('SELECT * FROM "Civil"');
        res.send(civ.rows);
    },

    addPersHeroe: async (req,res) => {
        const {nombrePers,genero,ojos,pelo,comic,eMarital,imagenPers,nacionalidades,ocupaciones,creadores,alias,logotipo,traje,archienemigo} = req.body;

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
        await pool.query('INSERT INTO "Heroe" ("N_Heroe", "Alias", "Logotipo", "Color_Traje", "Archienemigo") VALUES ($1, $2, $3, $4, $5)',[nombrePers,alias,logotipo,traje,archienemigo]);

        res.send('creado');
    },

    addPersVill: async (req,res) => {
        const {nombrePers,genero,ojos,pelo,comic,eMarital,imagenPers,nacionalidades,ocupaciones,creadores,alias,objetivo} = req.body;

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
        await pool.query('INSERT INTO "Villano" ("N_Villano", "Alias", "Objetivo") VALUES ($1, $2, $3, $4, $5)',[nombrePers,alias,objetivo]);

        res.send('creado');
    }
}

module.exports = personajes;