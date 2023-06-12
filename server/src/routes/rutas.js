const router = require('express').Router();
const {personajes, peliculas, series, juegos, removePersonaje, removePelicula, removeSerie, removeJuego, addPersonaje, addPelicula, addSerie, addJuego, register, login, addPerfil, perfiles, addTarjeta, buscUsuario, buscTarjeta, selecTarjeta, paises, estados, ciudades} = require('../controllers/acciones');

router.get('/personajes', personajes);
router.get('/peliculas', peliculas);
router.get('/series', series);
router.get('/juegos', juegos);
router.get('/paises', paises);

router.delete('/removePersonaje/:id', removePersonaje);
router.delete('/removePelicula/:id', removePelicula);
router.delete('/removeSerie/:id', removeSerie);
router.delete('/removeJuego/:id', removeJuego);

router.post('/addPersonaje', addPersonaje);
router.post('/addPelicula', addPelicula);
router.post('/addSerie', addSerie);
router.post('/addJuego', addJuego);

router.post('/register', register);
router.post('/buscUsuario', buscUsuario);
router.post('/login', login);
router.post('/addPerfil', addPerfil);
router.post('/perfiles', perfiles);
router.post('/addTarjeta', addTarjeta);
router.post('/buscTarjeta', buscTarjeta);
router.post('/selecTarjeta', selecTarjeta);
router.post('/estados', estados);
router.post('/ciudades', ciudades);

module.exports = router;
