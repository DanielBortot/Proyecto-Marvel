const pool = require('../database');

const orgMedio = {
    buscOrgMedio: async (req,res) => {
        const {nombreOrg} = req.body;
        const meds = await pool.query('SELECT * FROM "Medio" WHERE "Titulo" NOT IN (SELECT "N_Titulo" FROM "Aparece" WHERE "N_Organizacion"=$1)',[nombreOrg]);
        res.send(meds.rows);
    },

    getOrgMedio: async (req,res) => {
        const {nombreOrg} = req.body;
        const medios = (await pool.query('SELECT * FROM "Medio" WHERE "Titulo" IN (SELECT "N_Titulo" FROM "Aparece" WHERE "N_Organizacion"=$1)',[nombreOrg])).rows;
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
    }
}

module.exports = orgMedio;