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
    },

    delCivRela: async (req,res) => {
        const {nombrePers, nombreCiv, op} = req.body;
        if (op) {
            await pool.query('DELETE FROM "RelacionadoVill" WHERE "N_Villano"=$1 AND "N_Civil"=$2',[nombrePers,nombreCiv]);
        }
        else {
            await pool.query('DELETE FROM "RelacionadoHer" WHERE "N_Heroe"=$1 AND "N_Civil"=$2',[nombrePers,nombreCiv]);
        }
        res.send('eliminado');
    },

    getRelacion: async (req,res) => {
        const {nombrePers, op} = req.body;
        let pers = [];
        if (op === 1) {
            pers = (await pool.query('SELECT p.*, r."N_Civil" FROM "Personaje" p INNER JOIN "RelacionadoVill" r ON (p."Nombre"=r."N_Civil") WHERE r."N_Villano"=$1',[nombrePers])).rows;
        }
        else if (op === 2) {
            pers = (await pool.query('SELECT p.*, r."N_Civil" FROM "Personaje" p INNER JOIN "RelacionadoHer" r ON (p."Nombre"=r."N_Civil") WHERE r."N_Heroe"=$1',[nombrePers])).rows;
        }
        else if (op === 3) {
            const vill = (await pool.query('SELECT p.*, v.* FROM "Personaje" p INNER JOIN "RelacionadoVill" r ON (p."Nombre"=r."N_Villano") INNER JOIN "Villano" v ON (v."N_Villano"=r."N_Villano") WHERE r."N_Civil"=$1',[nombrePers])).rows;
            const her = (await pool.query('SELECT p.*, h.* FROM "Personaje" p INNER JOIN "RelacionadoHer" r ON (p."Nombre"=r."N_Heroe") INNER JOIN "Heroe" h ON (h."N_Heroe"=r."N_Heroe") WHERE r."N_Civil"=$1',[nombrePers])).rows;
            pers = [...vill, ...her];
        }
        for (let i=0; i<pers.length; i++){
            const nac = (await pool.query('SELECT "Nacionalidad" "Nac" FROM "Pers_Nac" WHERE "N_Personaje"=$1',[pers[i].Nombre])).rows
            const ocu = (await pool.query('SELECT "Ocupacion" "Ocup" FROM "Pers_Oc" WHERE "N_Personaje"=$1',[pers[i].Nombre])).rows
            const crea = (await pool.query('SELECT "N_Creador" "Nom_Creador" FROM "Pers_Creador" WHERE "N_Personaje"=$1',[pers[i].Nombre])).rows;
            let op = 0;
            if (pers[i].N_Villano){
                op = 1;
            }
            else if (pers[i].N_Heroe){
                op = 2;
            }
            else {
                op = 3;
            }
            pers[i] = {...pers[i], nacionalidades: nac, ocupaciones: ocu, creadores: crea, op: op}
        }
        res.send(pers);
    }
}

module.exports = civRela;