const router = require('express').Router();
const {personajes, peliculas, series, juegos, comics, removePersonaje, removePelicula, removeSerie, removeJuego, removeComic} = require('../controllers/acciones');

router.get('/personajes', personajes);
router.get('/peliculas', peliculas);
router.get('/series', series);
router.get('/juegos', juegos);
router.get('/comics', comics);

router.post('removePersonaje/:id', removePersonaje);
router.post('removePelicula/:id', removePelicula);
router.post('removeSerie/:id', removeSerie);
router.post('removeJuego/:id', removeJuego);
router.post('removeComic/:id', removeComic);

module.exports = router;
