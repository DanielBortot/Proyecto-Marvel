const pool = require('../database');

const historial = {
    addHist: async (req,res) => {
        const {calificacion, tVista, perfil, titulo} = req.body;
        await pool.query('INSERT INTO "Historial" ("N_Titulo", "Id_Perfil", "Calificacion", "Tiempo_Reproduccion") VALUES ($1, $2, $3, $4)',[titulo,perfil,calificacion,tVista]);
        const hist = await pool.query('SELECT MAX("Id_Hist") idhist FROM "Historial" WHERE "Id_Perfil"=$1 AND "N_Titulo"=$2',[perfil,titulo]);
        res.send(hist.rows);
    },

    upHist: async (req,res) => {
        const {calificacion, tVista, perfil, titulo, idHist} = req.body;
        await pool.query('UPDATE "Historial" SET "Calificacion"=$1, "Tiempo_Reproduccion"=$2 WHERE "N_Titulo"=$3 AND "Id_Perfil"=$4 AND "Id_Hist"=$5',[calificacion,tVista,titulo,perfil,idHist]);
        res.send('modificado');
    },

    getHist: async (req,res) => {
        const {perfil, suscrip} = req.body;
        console.log(suscrip);
        //const medios = (await pool.query('SELECT * FROM "Historial" h INNER JOIN "Medio" me ON (h."N_Titulo"=me."Titulo") WHERE "Id_Perfil"=$1',[perfil])).rows;
        let medios = [];
        const medios1 = (await pool.query('SELECT * FROM "Historial" h INNER JOIN "Medio" me ON (h."N_Titulo"=me."Titulo") WHERE (me."Suscripcion" BETWEEN 1 AND $3) AND h."Id_Perfil"=$1 AND h."Tiempo_Reproduccion"<>me."Duracion" AND "Id_Hist" IN (SELECT MAX("Id_Hist") FROM "Historial" WHERE "Id_Perfil"=$2 GROUP BY "N_Titulo") AND h."N_Titulo" NOT IN (SELECT "T_Serie" FROM "Serie")',[perfil,perfil,suscrip])).rows;

        const medios2 = (await pool.query('SELECT * FROM "Historial" h INNER JOIN "Medio" me ON (h."N_Titulo"=me."Titulo") INNER JOIN "Serie" se ON (h."N_Titulo"=se."T_Serie") WHERE (me."Suscripcion" BETWEEN 1 AND $3) AND h."Id_Perfil"=$1 AND se."N_Episodios"<>(h."Tiempo_Reproduccion" / me."Duracion") AND "Id_Hist" IN (SELECT MAX("Id_Hist") FROM "Historial" WHERE "Id_Perfil"=$2 GROUP BY "N_Titulo")',[perfil,perfil,suscrip])).rows;

        medios = [...medios1, ...medios2];

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

    getRec: async (req,res) => {
        const {perfil, suscrip} = req.body;
        //let medios = (await pool.query('SELECT DISTINCT Me.* FROM "Medio" AS Me JOIN "Esta" AS E ON (Me."Titulo" = E."N_Titulo") WHERE (Me."Titulo" NOT IN (SELECT "N_Titulo" FROM "Historial")) AND (E."N_Personaje" IN (SELECT "N_Personaje" FROM "Esta" AS Es JOIN "Medio" AS Med ON (Es."N_Titulo" = Med."Titulo") WHERE Med."Titulo" IN (SELECT H."N_Titulo" FROM "Historial" AS H JOIN "Medio" AS Mo ON (H."N_Titulo" = Mo."Titulo") WHERE ((H."Calificacion" IN (SELECT "Calificacion" FROM "Historial" WHERE ("Id_Hist" = (SELECT MAX("Id_Hist") FROM "Historial") AND ("Calificacion" > 3)))) AND (H."Id_Perfil" = $1)) AND (Mo."Duracion" = H."Tiempo_Reproduccion"))))',[perfil])).rows;

        let medios = (await pool.query('SELECT DISTINCT Me.* FROM "Medio" AS Me JOIN "Esta" AS E ON (Me."Titulo" = E."N_Titulo") WHERE (Me."Titulo" NOT IN (SELECT "N_Titulo" FROM "Historial" WHERE "Id_Perfil" = $1)) AND (E."N_Personaje" IN (SELECT "N_Personaje" FROM "Esta" AS Es JOIN "Medio" AS Med ON (Es."N_Titulo" = Med."Titulo") WHERE Med."Titulo" IN (SELECT H."N_Titulo" FROM "Historial" AS H JOIN "Medio" AS Mo ON (H."N_Titulo" = Mo."Titulo") WHERE ((H."Calificacion" IN (SELECT "Calificacion" FROM "Historial" WHERE ("Id_Hist" = (SELECT MAX("Id_Hist") FROM "Historial") AND ("Calificacion" > 3)))) AND (H."Id_Perfil" = $1)))))',[perfil])).rows;
        
        if (suscrip === 3){
            medios = medios.filter(med => med.Suscripcion === 3 ||  med.Suscripcion === 2 ||  med.Suscripcion === 1)
        }
        else if (suscrip === 2){
            medios = medios.filter(med => med.Suscripcion === 2 ||  med.Suscripcion === 1)
        }
        else if (suscrip === 1){
            medios = medios.filter(med => med.Suscripcion === 1)
        }
        for (let i=0; i<medios.length; i++){
            const pelicula = (await pool.query('SELECT * FROM "Pelicula" WHERE "T_Pelicula"=$1',[medios[i].Titulo])).rows;
            const serie = (await pool.query('SELECT * FROM "Serie" WHERE "T_Serie"=$1',[medios[i].Titulo])).rows;
            const juego = (await pool.query('SELECT * FROM "Juego" WHERE "T_Juego"=$1',[medios[i].Titulo])).rows;
            if (juego.length !== 0){
                const plat = (await pool.query('SELECT "Plataforma" FROM "Plat_Juego" WHERE "T_Juego"=$1',[juego[0].T_Juego])).rows;
                juego[0] = {...juego[0], plataformas: plat}
            }
            medios[i] = {...medios[i], ...pelicula[0], ...serie[0], ...juego[0]};
        }

        res.send(medios)
    },

    upRating: async (req,res) => {
        const {titulo} = req.body;
        const calificacion = (await pool.query('SELECT AVG("Calificacion") promedio FROM "Historial" WHERE "N_Titulo"=$1 AND "Id_Hist" IN (SELECT MAX("Id_Hist") FROM "Historial" WHERE "N_Titulo"=$1 GROUP BY "Id_Perfil")',[titulo])).rows;
        let promedio = calificacion[0].promedio;
        console.log(promedio);
        if (!promedio || promedio < 1){
            promedio = 1;
        }
        else {
            promedio = Math.round(promedio);
        }
        await pool.query('UPDATE "Medio" SET "Rating"=$1 WHERE "Titulo"=$2',[promedio,titulo]);
        res.send('modificado');
    },

    getHistPer: async (req,res) => {
        const {perfil} = req.body;
        const hist = await pool.query('SELECT * FROM "Historial" WHERE "Id_Perfil"=$1',[perfil]);
        res.send(hist.rows);
    },

    getPopu: async (req,res) => {
        const {suscrip} = req.body;
        const peli = (await pool.query('SELECT * FROM "Medio" me INNER JOIN "Pelicula" pe ON (me."Titulo"=pe."T_Pelicula") WHERE (me."Suscripcion" BETWEEN 1 AND $1) ORDER BY me."Rating" DESC LIMIT 1',[suscrip])).rows;
        const serie = (await pool.query('SELECT * FROM "Medio" me INNER JOIN "Serie" pe ON (me."Titulo"=pe."T_Serie") WHERE (me."Suscripcion" BETWEEN 1 AND $1) ORDER BY me."Rating" DESC LIMIT 1',[suscrip])).rows;
        const juego = (await pool.query('SELECT * FROM "Medio" me INNER JOIN "Juego" pe ON (me."Titulo"=pe."T_Juego") WHERE (me."Suscripcion" BETWEEN 1 AND $1) ORDER BY me."Rating" DESC LIMIT 1',[suscrip])).rows;
        const plat = (await pool.query('SELECT "Plataforma" FROM "Plat_Juego" WHERE "T_Juego"=$1',[juego[0].T_Juego])).rows;
        juego[0] = {...juego[0], plataformas: plat}
        let medios = [...juego, ...serie, ...peli];
        res.send(medios);
    }
}

module.exports = historial;