const pool = require('../database');

const civRela = {
    buscCivHer: async (req,res) => {
        const {nombreCiv} = req.body;
        const hers = await pool.query('SELECT * FROM "Heroe" WHERE "N_Heroe" NOT IN (SELECT "N_Heroe" FROM "RelacionadoHer" WHERE "N_Civil"=$1)',[nombreCiv]);
        res.send(hers.rows);
    },

    buscCivVill: async (req,res) => {
        const {nombreCiv} = req.body;
        const vills = await pool.query('SELECT * FROM "Villano" WHERE "N_Villano" NOT IN (SELECT "N_Villano" FROM "RelacionadoVill" WHERE "N_Civil"=$1)',[nombreCiv]);
        res.send(vills.rows);
    },

    compCivPers: async (req,res) => {
        const {nombreCiv, nombrePers, op} = req.body;
        let errores = {};
        let resu = [];
        if (op) {
            resu = await pool.query('SELECT * FROM "RelacionadoVill" WHERE "N_Villano"=$1 AND "N_Civil"=$2',[nombrePers,nombreCiv]);
        }
        else {
            resu = await pool.query('SELECT * FROM "RelacionadoHer" WHERE "N_Heroe"=$1 AND "N_Civil"=$2',[nombrePers,nombreCiv]);
        }
        if (resu.rowCount > 0){
            errores.relacion = 'Ya existe un personaje relacionado a ese civil';
        }
        res.send(errores);
    },

    addCivPers: async (req,res) => {
        const {nombrePers, nombreCiv, op} = req.body;
        if (op){
            await pool.query('INSERT INTO "RelacionadoVill" ("N_Villano", "N_Civil") VALUES ($1, $2)',[nombrePers,nombreCiv]);
        }
        else {
            await pool.query('INSERT INTO "RelacionadoHer" ("N_Heroe", "N_Civil") VALUES ($1, $2)',[nombrePers,nombreCiv]);
        }
        res.send('creado');
    }
}

module.exports = civRela;