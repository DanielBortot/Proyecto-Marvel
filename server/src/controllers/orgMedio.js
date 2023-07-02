const pool = require('../database');

const orgMedio = {
    buscOrgMedio: async (req,res) => {
        const {nombreOrg} = req.body;
        const meds = await pool.query('SELECT * FROM "Medio" WHERE "Titulo" NOT IN (SELECT "N_Titulo" FROM "Aparece" WHERE "N_Organizacion"=$1)',[nombreOrg]);
        res.send(meds.rows);
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