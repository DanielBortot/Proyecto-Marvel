const pool = require('../database');

const acciones = {
    personajes: async (req, res) => {
        const personajes = await pool.query('SELECT * FROM prueba');
        res.send(personajes.rows);
    },
    removePersonaje: async (req,res) => {
        const id = req.params['id'];
        await pool.query('DELETE * FROM prueba WHERE personaje_id = $1', [id]);
        res.redirect('/api/personajes');
    },
    peliculas: async (req, res) => {
        const peliculas = await pool.query('SELECT * FROM prueba');
        res.send(peliculas.rows);
    },
    removePelicula: async (req,res) => {
        const id = req.params['id'];
        await pool.query('DELETE * FROM prueba WHERE pelicula_id = $1', [id]);
        res.redirect('/api/peliculas');
    },
    series: async (req, res) => {
        const series = await pool.query('SELECT * FROM prueba');
        res.send(series.rows);
    },
    removeSerie: async (req,res) => {
        const id = req.params['id'];
        await pool.query('DELETE * FROM prueba WHERE series_id = $1', [id]);
        res.redirect('/api/series');
    },
    juegos: async (req, res) => {
        const juegos = await pool.query('SELECT * FROM prueba');
        res.send(juegos.rows);
    },
    removeJuego: async (req,res) => {
        const id = req.params['id'];
        await pool.query('DELETE * FROM prueba WHERE juego_id = $1', [id]);
        res.redirect('/api/juegos');
    },
    comics: async (req, res) => {
        const comics = await pool.query('SELECT * FROM prueba');
        res.send(comics.rows);
    },
    removeComic: async (req,res) => {
        const id = req.params['id'];
        await pool.query('DELETE * FROM prueba WHERE comic_id = $1', [id]);
        res.redirect('/api/comics');
    }
}

module.exports = acciones;