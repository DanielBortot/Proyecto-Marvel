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

        const {imagen, tipo, desc, material, nombre} = {
            imagen: '/static/media/marvel.44665a2082472d0597ec.jpg',
            tipo: 'No Posee',
            desc: 'No Posee',
            material: 'No Posee',
            nombre: `No posee ${nombrePers}`
        }

        await pool.query('INSERT INTO "Objeto" ("Nombre", "Descripcion", "Material", "Tipo", "Imagen", "N_Personaje") VALUES ($1, $2, $3, $4, $5, $6)',[nombre,desc,material,tipo,imagen,nombrePers]);

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

    upPersHeroe: async (req,res) => {
        const {nombrePers,nombreVie,genero,ojos,pelo,comic,eMarital,imagenPers,nacionalidades,ocupaciones,creadores,alias,logotipo,traje,archienemigo} = req.body;
        await pool.query('UPDATE "Personaje" SET "Nombre"=$1, "Genero"=$2, "Color_Ojos"=$3, "Color_Pelo"=$4, "Nom_Comic"=$5, "E_Marital"=$6, imagen=$7 WHERE "Nombre"=$8',[nombrePers,genero,ojos,pelo,comic,eMarital,imagenPers,nombreVie]);
        await pool.query('DELETE FROM "Pers_Nac" WHERE "N_Personaje"=$1',[nombrePers]);
        await pool.query('DELETE FROM "Pers_Oc" WHERE "N_Personaje"=$1',[nombrePers]);
        await pool.query('DELETE FROM "Pers_Creador" WHERE "N_Personaje"=$1',[nombrePers]);
        for (let i = 0; i<nacionalidades.length; i++){
            await pool.query('INSERT INTO "Pers_Nac" ("N_Personaje", "Nacionalidad") VALUES ($1, $2)',[nombrePers,nacionalidades[i].Nac]);
        }
        for (let i = 0; i<ocupaciones.length; i++){
            await pool.query('INSERT INTO "Pers_Oc" ("N_Personaje", "Ocupacion") VALUES ($1, $2)',[nombrePers,ocupaciones[i].Ocup]);
        }
        for (let i = 0; i<creadores.length; i++){
            await pool.query('INSERT INTO "Pers_Creador" ("N_Personaje", "N_Creador") VALUES ($1, $2)',[nombrePers,creadores[i].Nom_Creador]);
        }
        await pool.query('UPDATE "Heroe" SET "Alias"=$1, "Logotipo"=$2, "Color_Traje"=$3, "Archienemigo"=$4 WHERE "N_Heroe"=$5',[alias,logotipo,traje,archienemigo,nombrePers]);
        res.send('modificado')
    },

    addPersVill: async (req,res) => {
        const {nombrePers,genero,ojos,pelo,comic,eMarital,imagenPers,nacionalidades,ocupaciones,creadores,alias,objetivo} = req.body;

        await pool.query('INSERT INTO "Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ($1, $2, $3, $4, $5, $6, $7)',[nombrePers,genero,ojos,pelo,comic,eMarital,imagenPers]);

        const {imagen, tipo, desc, material, nombre} = {
            imagen: '/static/media/marvel.44665a2082472d0597ec.jpg',
            tipo: 'No Posee',
            desc: 'No Posee',
            material: 'No Posee',
            nombre: `No posee ${nombrePers}`
        }

        await pool.query('INSERT INTO "Objeto" ("Nombre", "Descripcion", "Material", "Tipo", "Imagen", "N_Personaje") VALUES ($1, $2, $3, $4, $5, $6)',[nombre,desc,material,tipo,imagen,nombrePers]);

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
        res.send('creado');
    },

    upPersVill: async (req,res) => {
        const {nombrePers,nombreVie,genero,ojos,pelo,comic,eMarital,imagenPers,nacionalidades,ocupaciones,creadores,alias,objetivo} = req.body;

        await pool.query('UPDATE "Personaje" SET "Nombre"=$1, "Genero"=$2, "Color_Ojos"=$3, "Color_Pelo"=$4, "Nom_Comic"=$5, "E_Marital"=$6, imagen=$7 WHERE "Nombre"=$8',[nombrePers,genero,ojos,pelo,comic,eMarital,imagenPers,nombreVie]);
        await pool.query('DELETE FROM "Pers_Nac" WHERE "N_Personaje"=$1',[nombrePers]);
        await pool.query('DELETE FROM "Pers_Oc" WHERE "N_Personaje"=$1',[nombrePers]);
        await pool.query('DELETE FROM "Pers_Creador" WHERE "N_Personaje"=$1',[nombrePers]);
        for (let i = 0; i<nacionalidades.length; i++){
            await pool.query('INSERT INTO "Pers_Nac" ("N_Personaje", "Nacionalidad") VALUES ($1, $2)',[nombrePers,nacionalidades[i].Nac]);
        }
        for (let i = 0; i<ocupaciones.length; i++){
            await pool.query('INSERT INTO "Pers_Oc" ("N_Personaje", "Ocupacion") VALUES ($1, $2)',[nombrePers,ocupaciones[i].Ocup]);
        }
        for (let i = 0; i<creadores.length; i++){
            await pool.query('INSERT INTO "Pers_Creador" ("N_Personaje", "N_Creador") VALUES ($1, $2)',[nombrePers,creadores[i].Nom_Creador]);
        }
        await pool.query('UPDATE "Villano" SET "Alias"=$1, "Objetivo"=$2 WHERE "N_Villano"=$3',[alias,objetivo,nombrePers]);

        res.send('modificado');
    },

    addPersCiv: async (req,res) => {
        const {nombrePers,genero,ojos,pelo,comic,eMarital,imagenPers,nacionalidades,ocupaciones,creadores} = req.body;

        await pool.query('INSERT INTO "Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ($1, $2, $3, $4, $5, $6, $7)',[nombrePers,genero,ojos,pelo,comic,eMarital,imagenPers]);

        const {imagen, tipo, desc, material, nombre} = {
            imagen: '/static/media/marvel.44665a2082472d0597ec.jpg',
            tipo: 'No Posee',
            desc: 'No Posee',
            material: 'No Posee',
            nombre: `No posee ${nombrePers}`
        }

        await pool.query('INSERT INTO "Objeto" ("Nombre", "Descripcion", "Material", "Tipo", "Imagen", "N_Personaje") VALUES ($1, $2, $3, $4, $5, $6)',[nombre,desc,material,tipo,imagen,nombrePers]);

        for (let i = 0; i<nacionalidades.length; i++){
            await pool.query('INSERT INTO "Pers_Nac" ("N_Personaje", "Nacionalidad") VALUES ($1, $2)',[nombrePers,nacionalidades[i].Nac]);
        }
        for (let i = 0; i<ocupaciones.length; i++){
            await pool.query('INSERT INTO "Pers_Oc" ("N_Personaje", "Ocupacion") VALUES ($1, $2)',[nombrePers,ocupaciones[i].Ocup]);
        }
        for (let i = 0; i<creadores.length; i++){
            await pool.query('INSERT INTO "Pers_Creador" ("N_Personaje", "N_Creador") VALUES ($1, $2)',[nombrePers,creadores[i].Nom_Creador]);
        }
        await pool.query('INSERT INTO "Civil" ("N_Civil") VALUES ($1)',[nombrePers]);

        res.send('creado');
    },

    upPersCiv: async (req,res) => {
        const {nombrePers,nombreVie,genero,ojos,pelo,comic,eMarital,imagenPers,nacionalidades,ocupaciones,creadores} = req.body;

        await pool.query('UPDATE "Personaje" SET "Nombre"=$1, "Genero"=$2, "Color_Ojos"=$3, "Color_Pelo"=$4, "Nom_Comic"=$5, "E_Marital"=$6, imagen=$7 WHERE "Nombre"=$8',[nombrePers,genero,ojos,pelo,comic,eMarital,imagenPers,nombreVie]);
        await pool.query('DELETE FROM "Pers_Nac" WHERE "N_Personaje"=$1',[nombrePers]);
        await pool.query('DELETE FROM "Pers_Oc" WHERE "N_Personaje"=$1',[nombrePers]);
        await pool.query('DELETE FROM "Pers_Creador" WHERE "N_Personaje"=$1',[nombrePers]);
        for (let i = 0; i<nacionalidades.length; i++){
            await pool.query('INSERT INTO "Pers_Nac" ("N_Personaje", "Nacionalidad") VALUES ($1, $2)',[nombrePers,nacionalidades[i].Nac]);
        }
        for (let i = 0; i<ocupaciones.length; i++){
            await pool.query('INSERT INTO "Pers_Oc" ("N_Personaje", "Ocupacion") VALUES ($1, $2)',[nombrePers,ocupaciones[i].Ocup]);
        }
        for (let i = 0; i<creadores.length; i++){
            await pool.query('INSERT INTO "Pers_Creador" ("N_Personaje", "N_Creador") VALUES ($1, $2)',[nombrePers,creadores[i].Nom_Creador]);
        }

        res.send('modificado');
    },

    delPersonaje: async (req,res) => {
        const {nombrePers} = req.body;
        const org = await pool.query('SELECT * FROM "Organizacion" WHERE "Fundador"=$1 OR "Lider"=$1',[nombrePers]);
        if (org.length === 0){
            await pool.query('UPDATE "Organizacion" SET "Lider"=NULL WHERE "Lider"=$1',[nombrePers]);
            await pool.query('UPDATE "Heroe" SET "Archienemigo"=NULL WHERE "Archienemigo"=$1',[nombrePers]);
            await pool.query('DELETE FROM "Personaje" WHERE "Nombre"=$1',[nombrePers]);
            await pool.query('UPDATE "Objeto" SET "N_Personaje"=NULL WHERE "N_Personaje"=$1',[nombrePers]);
        }
        res.send('eliminado');
    }
}

module.exports = personajes;