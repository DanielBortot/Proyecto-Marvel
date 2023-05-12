const pool = require('../database');

const acciones = {
    mostrar: async (req, res) => {
        const personas = await pool.query('SELECT * FROM prueba');
        res.send(personas.rows);
    },
    agregar: async (req,res) => {
        const {nombre, desc} = req.params;
        try {
            const agregar = await pool.query('INSERT INTO prueba (nombre, descripcion) VALUES ($1, $2)', [nombre, desc]);
            res.redirect('/api/mostrar');
        } catch(err){
            res.send('Formato invalido')
        }
    }
}

module.exports = acciones;