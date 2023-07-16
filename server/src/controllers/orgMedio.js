const pool = require('../database');

const orgMedio = {
    buscOrgMedio: async (req,res) => {
        const {nombreOrg,op} = req.body;
        let meds = [];
        if (op === 1){
            meds = await pool.query('SELECT * FROM "Medio" me INNER JOIN "Pelicula" pe ON (me."Titulo"=pe."T_Pelicula") WHERE pe."T_Pelicula" NOT IN (SELECT "N_Titulo" FROM "Aparece" WHERE "N_Organizacion"=$1)',[nombreOrg]);
        }
        if (op === 2){
            meds = await pool.query('SELECT * FROM "Medio" me INNER JOIN "Serie" se ON (me."Titulo"=se."T_Serie") WHERE se."T_Serie" NOT IN (SELECT "N_Titulo" FROM "Aparece" WHERE "N_Organizacion"=$1)',[nombreOrg]);
        }
        if (op === 3){
            meds = await pool.query('SELECT * FROM "Medio" me INNER JOIN "Juego" ju ON (me."Titulo"=ju."T_Juego") WHERE ju."T_Juego" NOT IN (SELECT "N_Titulo" FROM "Aparece" WHERE "N_Organizacion"=$1)',[nombreOrg]);
        }
        res.send(meds.rows);
    },

    getOrgMedio: async (req,res) => {
        const {nombreOrg, suscrip} = req.body;
        let medios = [];
        if (suscrip === 4){
            medios = (await pool.query('SELECT * FROM "Medio" WHERE "Titulo" IN (SELECT "N_Titulo" FROM "Aparece" WHERE "N_Organizacion"=$1)',[nombreOrg])).rows;
        }
        if (suscrip === 3){
            medios = (await pool.query('SELECT * FROM "Medio" WHERE ("Suscripcion" BETWEEN 1 AND 3) AND "Titulo" IN (SELECT "N_Titulo" FROM "Aparece" WHERE "N_Organizacion"=$1)',[nombreOrg])).rows;
        }
        if (suscrip === 2){
            medios = (await pool.query('SELECT * FROM "Medio" WHERE ("Suscripcion" BETWEEN 1 AND 2) AND "Titulo" IN (SELECT "N_Titulo" FROM "Aparece" WHERE "N_Organizacion"=$1)',[nombreOrg])).rows;
        }
        if (suscrip === 1){
            medios = (await pool.query('SELECT * FROM "Medio" WHERE "Suscripcion"=1 AND "Titulo" IN (SELECT "N_Titulo" FROM "Aparece" WHERE "N_Organizacion"=$1)',[nombreOrg])).rows;
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

    getMedOrga: async (req,res) => {
        const {nombreMed} = req.body;
        const orgs = await pool.query('SELECT * FROM "Organizacion" o, "Aparece" a WHERE o."Nombre"=a."N_Organizacion" and a."N_Titulo"=$1',[nombreMed]);
        res.send(orgs.rows);
    },

    compOrgMedio: async (req,res) => {
        const {nombreOrg, titulo} = req.body;
        let errores = {};
        const resu = await pool.query('SELECT * FROM "Aparece" WHERE "N_Organizacion"=$1 AND "N_Titulo"=$2',[nombreOrg,titulo]);
        if (resu.rowCount > 0){
            errores.aparece = 'Ya existe una organizacion relacionado a ese medio';
        }
        res.send(errores);
    },

    addOrgMedio: async (req,res) => {
        const {nombreOrg, titulo, rol, estado} = req.body;
        await pool.query('INSERT INTO "Aparece" ("N_Organizacion", "N_Titulo", "Estado", "Rol") VALUES ($1, $2, $3, $4)',[nombreOrg,titulo,estado,rol]);
        res.send('creado');
    },

    delOrgMedio: async (req,res) => {
        const {nombreOrg, titulo} = req.body;
        await pool.query('DELETE FROM "Aparece" WHERE "N_Organizacion"=$1 AND "N_Titulo"=$2',[nombreOrg,titulo]);
        res.send('eliminado');
    },

    upOrgMedio: async (req,res) => {
        const {nombreOrg, titulo, rol, estado} = req.body;
        await pool.query('UPDATE "Aparece" SET "Estado"=$1, "Rol"=$2 WHERE "N_Organizacion"=$3 AND "N_Titulo"=$4',[estado,rol,nombreOrg,titulo]);
        res.send('modificado');
    },
}

module.exports = orgMedio;