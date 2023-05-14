const pool = require('../database');

const acciones = {
    personajes: async (req, res) => {
        const personas = await pool.query('SELECT * FROM prueba');
        res.send(personas.rows);
    },
    peliculas: async (req, res) => {
        const peliculas = await pool.query('SELECT * FROM prueba');
        res.send(peliculas.rows);
    },
    series: async (req, res) => {
        const series = await pool.query('SELECT * FROM prueba');
        res.send(series.rows);
    },
    juegos: async (req, res) => {
        const juegos = await pool.query('SELECT * FROM prueba');
        res.send(juegos.rows);
    },
    comics: async (req, res) => {
        const comics = await pool.query('SELECT * FROM prueba');
        res.send(comics.rows);
    }
}

module.exports = acciones;