const pool = require('../database');

const persMedio = {
    buscPersMedio: async (req,res) => {
        const {nombrePers, op} = req.body;
        let meds = [];
        if (op === 1){
            meds = await pool.query('SELECT * FROM "Medio" me INNER JOIN "Pelicula" pe ON (me."Titulo"=pe."T_Pelicula") WHERE pe."T_Pelicula" NOT IN (SELECT "N_Titulo" FROM "Esta" WHERE "N_Personaje"=$1)',[nombrePers]);
        }
        if (op === 2){
            meds = await pool.query('SELECT * FROM "Medio" me INNER JOIN "Serie" se ON (me."Titulo"=se."T_Serie") WHERE se."T_Serie" NOT IN (SELECT "N_Titulo" FROM "Esta" WHERE "N_Personaje"=$1)',[nombrePers]);
        }
        if (op === 3){
            meds = await pool.query('SELECT * FROM "Medio" me INNER JOIN "Juego" ju ON (me."Titulo"=ju."T_Juego") WHERE ju."T_Juego" NOT IN (SELECT "N_Titulo" FROM "Esta" WHERE "N_Personaje"=$1)',[nombrePers]);
        }
        res.send(meds.rows);
    },

    compPersMedio: async (req,res) => {
        const {nombrePers, titulo} = req.body;
        let errores = {};
        const resu = await pool.query('SELECT * FROM "Esta" WHERE "N_Personaje"=$1 AND "N_Titulo"=$2',[nombrePers,titulo]);
        if (resu.rowCount > 0){
            errores.esta = 'Ya existe un personaje relacionado a ese medio';
        }
        res.send(errores);
    },

    addPersMedio: async (req,res) => {
        const {nombrePers, titulo, tipoAct, rol, nombreAct} = req.body;
        await pool.query('INSERT INTO "Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ($1, $2, $3, $4, $5)',[nombrePers,titulo,tipoAct,rol,nombreAct]);
        res.send('creado');
    },

    delPersMedio: async (req,res) => {
        const {nombrePers, titulo} = req.body;
        await pool.query('DELETE FROM "Esta" WHERE "N_Personaje"=$1 AND "N_Titulo"=$2',[nombrePers,titulo]);
        res.send('eliminado');
    },

    upPersMedio: async (req,res) => {
        const {nombrePers, titulo, tipoAct, rol, nombreAct} = req.body;
        await pool.query('UPDATE "Esta" SET "Tipo_Actor"=$1, "Rol"=$2, "Actor"=$3 WHERE "N_Personaje"=$4 AND "N_Titulo"=$5',[tipoAct,rol,nombreAct,nombrePers,titulo]);
        res.send('modificado');
    },

    getPersMedio: async (req,res) => {
        const {nombrePers, suscrip} = req.body;
        let medios = [];
        if (suscrip === 3){
            medios = (await pool.query('SELECT * FROM "Medio" WHERE "Titulo" IN (SELECT "N_Titulo" FROM "Esta" WHERE "N_Personaje"=$1)',[nombrePers])).rows;
        }
        if (suscrip === 2){
            medios = (await pool.query('SELECT * FROM "Medio" WHERE ("Suscripcion"=2 OR "Suscripcion"=1 OR "Suscripcion"=4) AND "Titulo" IN (SELECT "N_Titulo" FROM "Esta" WHERE "N_Personaje"=$1)',[nombrePers])).rows;
        }
        if (suscrip === 1){
            medios = (await pool.query('SELECT * FROM "Medio" WHERE ("Suscripcion"=1 OR "Suscripcion"=4) AND "Titulo" IN (SELECT "N_Titulo" FROM "Esta" WHERE "N_Personaje"=$1)',[nombrePers])).rows;
        }
        if (suscrip === 4){
            medios = (await pool.query('SELECT * FROM "Medio" WHERE "Suscripcion"=4 AND "Titulo" IN (SELECT "N_Titulo" FROM "Esta" WHERE "N_Personaje"=$1)',[nombrePers])).rows;
        }

        for (let i=0; i<medios.length; i++){
            const serie = (await pool.query('SELECT * FROM "Serie" WHERE "T_Serie"=$1',[medios[i].Titulo])).rows;
            const pelicula = (await pool.query('SELECT * FROM "Pelicula" WHERE "T_Pelicula"=$1',[medios[i].Titulo])).rows;
            let juego = (await pool.query('SELECT * FROM "Juego" WHERE "T_Juego"=$1',[medios[i].Titulo])).rows;
            let plats = [];
            if (juego.length > 0){
                plats = (await pool.query('SELECT "Plataforma" FROM "Plat_Juego" WHERE "T_Juego"=$1',[medios[i].Titulo])).rows;
                juego[0] = {...juego[0], plataformas: plats};
            }
            medios[i] = {...medios[i], ...serie[0], ...pelicula[0], ...juego[0]};
        } 
        res.send(medios);
    },

    getMedPerso: async (req,res) => {
        const {nombreMed} = req.body;
        const pers = (await pool.query('SELECT * FROM "Personaje" p, "Esta" e WHERE p."Nombre"=e."N_Personaje" and e."N_Titulo"=$1',[nombreMed])).rows;
        for (let i=0; i<pers.length; i++){
            const nac = (await pool.query('SELECT "Nacionalidad" "Nac" FROM "Pers_Nac" WHERE "N_Personaje"=$1',[pers[i].Nombre])).rows
            const ocu = (await pool.query('SELECT "Ocupacion" "Ocup" FROM "Pers_Oc" WHERE "N_Personaje"=$1',[pers[i].Nombre])).rows
            const crea = (await pool.query('SELECT "N_Creador" "Nom_Creador" FROM "Pers_Creador" WHERE "N_Personaje"=$1',[pers[i].Nombre])).rows;
            pers[i] = {...pers[i], nacionalidades: nac, ocupaciones: ocu, creadores: crea}
        }
        res.send(pers);
    },
}

module.exports = persMedio;