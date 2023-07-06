const pool = require('../database');

const herVill = {
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
    },

    getHerVill: async (req,res) => {
        const {nombrePers, op} = req.body;
        let pers = [];
        if (op === 1){
            pers = (await pool.query('SELECT * FROM "Heroe" h INNER JOIN "Enfrenta" e ON (h."N_Heroe"=e."N_Heroe") INNER JOIN "Personaje" p ON (p."Nombre"=h."N_Heroe") WHERE e."N_Villano"=$1',[nombrePers])).rows;
        }
        else if (op === 2){
            pers = (await pool.query('SELECT * FROM "Villano" v INNER JOIN "Enfrenta" e ON (v."N_Villano"=e."N_Villano") INNER JOIN "Personaje" p ON (p."Nombre"=v."N_Villano") WHERE e."N_Heroe"=$1',[nombrePers])).rows;
        }
        if (op !== 3){
            for (let i=0; i<pers.length; i++){
                const nac = (await pool.query('SELECT "Nacionalidad" "Nac" FROM "Pers_Nac" WHERE "N_Personaje"=$1',[pers[i].Nombre])).rows
                const ocu = (await pool.query('SELECT "Ocupacion" "Ocup" FROM "Pers_Oc" WHERE "N_Personaje"=$1',[pers[i].Nombre])).rows
                const crea = (await pool.query('SELECT "N_Creador" "Nom_Creador" FROM "Pers_Creador" WHERE "N_Personaje"=$1',[pers[i].Nombre])).rows;
                pers[i] = {...pers[i], nacionalidades: nac, ocupaciones: ocu, creadores: crea}
            }
        }
        res.send(pers);
    },

    getRelacion: async (req,res) => {
        const {nombrePers, op} = req.body;
        let pers = [];
        if (op === 1) {
            pers = (await pool.query('SELECT * FROM "Personaje" p INNER JOIN "RelacionadoVill" r ON (p."Nombre"=r."N_Civil") WHERE r."N_Villano"=$1',[nombrePers])).rows;
        }
        else if (op === 2) {
            pers = (await pool.query('SELECT * FROM "Personaje" p INNER JOIN "RelacionadoHer" r ON (p."Nombre"=r."N_Civil") WHERE r."N_Heroe"=$1',[nombrePers])).rows;
        }
        else if (op === 3) {
            const vill = (await pool.query('SELECT * FROM "Personaje" p INNER JOIN "RelacionadoVill" r ON (p."Nombre"=r."N_Villano") WHERE r."N_Civil"=$1',[nombrePers])).rows;
            const her = (await pool.query('SELECT * FROM "Personaje" p INNER JOIN "RelacionadoHer" r ON (p."Nombre"=r."N_Heroe") WHERE r."N_Civil"=$1',[nombrePers])).rows;
            pers = [...vill, ...her];
        }
        for (let i=0; i<pers.length; i++){
            const nac = (await pool.query('SELECT "Nacionalidad" "Nac" FROM "Pers_Nac" WHERE "N_Personaje"=$1',[pers[i].Nombre])).rows
            const ocu = (await pool.query('SELECT "Ocupacion" "Ocup" FROM "Pers_Oc" WHERE "N_Personaje"=$1',[pers[i].Nombre])).rows
            const crea = (await pool.query('SELECT "N_Creador" "Nom_Creador" FROM "Pers_Creador" WHERE "N_Personaje"=$1',[pers[i].Nombre])).rows;
            pers[i] = {...pers[i], nacionalidades: nac, ocupaciones: ocu, creadores: crea}
        }
        res.send(pers);
    }
}

module.exports = herVill;