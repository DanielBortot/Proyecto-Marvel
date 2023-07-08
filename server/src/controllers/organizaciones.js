const pool = require('../database');

const organizaciones = {
    buscOrganizacion: async (req,res) => {
        const {nombreOrg} = req.body;
        let errores = {}
        const org = await pool.query('SELECT * FROM "Organizacion" WHERE "Nombre"=$1',[nombreOrg]);
        if (org.rowCount > 0){
            errores.nombreOrg = 'Ya existe una organizacion con ese nombre';
        }
        res.send(errores);
    },

    addOrganizacion: async (req,res) => {
        const {nombreOrg,eslogan,lider,fundador,tipo,lugarCrea,comic,objetivo,imagen} = req.body;
        await pool.query('INSERT INTO "Organizacion" ("Nombre", "Eslogan", "Lider", "Fundador", "Tipo", "Nom_Comic", "Imagen", "Objetivo", "Lugar_Creacion") VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9)',[nombreOrg,eslogan,lider,fundador,tipo,comic,imagen,objetivo,lugarCrea]);
        res.send('creado');
    },

    delOrganizacion: async (req,res) => {
        const {nombreOrg} = req.body;
        await pool.query('DELETE FROM "Organizacion" WHERE "Nombre"=$1',[nombreOrg]);
        res.send('eliminado');
    },

    upOrganizacion: async (req,res) => {
        const {nombreOrg,nombreOrgVie,eslogan,lider,fundador,tipo,lugarCrea,comic,objetivo,imagen} = req.body;
        await pool.query('UPDATE "Organizacion" SET "Nombre"=$1, "Eslogan"=$2, "Lider"=$3, "Fundador"=$4, "Tipo"=$5, "Nom_Comic"=$6, "Imagen"=$7, "Objetivo"=$8, "Lugar_Creacion"=$9 WHERE "Nombre"=$10',[nombreOrg,eslogan,lider,fundador,tipo,comic,imagen,objetivo,lugarCrea,nombreOrgVie]);
        res.send('modificado');
    },

    buscSedes: async (req,res) => {
        const {nombreSede,nombreOrg} = req.body;
        let errores = {}
        const sede = await pool.query('SELECT * FROM "Sede" WHERE "Nombre"=$1 AND "N_Org"=$2',[nombreSede,nombreOrg]);
        if (sede.rowCount > 0) {
            errores.nombreSede = 'Ya existe una sede con ese nombre en la organizacion seleccionada';
        }
        res.send(errores);
    },

    addSede: async (req,res) => {
        const {nombreSede,tipoEdif,ubicacion,imagen,nombreOrg} = req.body;
        await pool.query('INSERT INTO "Sede" ("Nombre", "Tipo_Edif", "Ubicacion", "Imagen", "N_Org") VALUES ($1, $2, $3, $4, $5)',[nombreSede,tipoEdif,ubicacion,imagen,nombreOrg]);
        res.send('creado');
    },

    upSede: async (req,res) => {
        const {nombreSede,nombreSedeVie,tipoEdif,ubicacion,imagen,nombreOrg} = req.body;
        await pool.query('UPDATE "Sede" SET "Nombre"=$1, "Tipo_Edif"=$2, "Ubicacion"=$3, "Imagen"=$4 WHERE "Nombre"=$5 AND "N_Org"=$6',[nombreSede,tipoEdif,ubicacion,imagen,nombreSedeVie,nombreOrg]);
        res.send('modificado');
    },

    organizaciones: async (req,res) => {
        const org = await pool.query('SELECT * FROM "Organizacion"');
        res.send(org.rows);
    },

    getSedes: async (req,res) => {
        const {nombreOrg} = req.body;
        const sedes = await pool.query('SELECT * FROM "Sede" WHERE "N_Org"=$1',[nombreOrg]);
        res.send(sedes.rows);
    }
}

module.exports = organizaciones;