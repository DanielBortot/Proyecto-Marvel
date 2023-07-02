const pool = require('../database');

const objetoPers = {
    buscHerVill: async (req,res) => {
        const {nombreHer} = req.body;
        const vills = await pool.query('SELECT * FROM "Villano" WHERE "N_Villano" NOT IN (SELECT "N_Villano" FROM "Enfrenta" WHERE "N_Heroe"=$1)',[nombreHer]);
        res.send(vills.rows);
    },

    compHerVill: async (req,res) => {
        const {nombreHer, nombreVill} = req.body;
        let errores = {};
        const resu = await pool.query('SELECT * FROM "Enfrenta" WHERE "N_Heroe"=$1 AND "N_Villano"=$2',[nombreHer,nombreVill]);
        if (resu.rowCount > 0){
            errores.enfrenta = 'Ya existe un heroe relacionado a ese villano';
        }
        res.send(errores);
    },

    addHerVill: async (req,res) => {
        const {nombreHer, nombreVill} = req.body;
        await pool.query('INSERT INTO "Enfrenta" ("N_Heroe", "N_Villano") VALUES ($1, $2)',[nombreHer,nombreVill]);
        res.send('creado');
    }
}

module.exports = objetoPers;