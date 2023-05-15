const router = require('express').Router();
const {personajes, peliculas, series, juegos, comics, removePersonaje, removePelicula, removeSerie, removeJuego, removeComic, addPersonaje, addPelicula, addSerie, addJuego, addComic} = require('../controllers/acciones');

router.get('/personajes', personajes);
router.get('/peliculas', peliculas);
router.get('/series', series);
router.get('/juegos', juegos);
router.get('/comics', comics);

router.delete('/removePersonaje/:id', removePersonaje);
router.delete('/removePelicula/:id', removePelicula);
router.delete('/removeSerie/:id', removeSerie);
router.delete('/removeJuego/:id', removeJuego);
router.delete('/removeComic/:id', removeComic);

router.post('/addPersonaje', addPersonaje);
router.post('/addPelicula', addPelicula);
router.post('/addSerie', addSerie);
router.post('/addJuego', addJuego);
router.post('/addComic', addComic);

module.exports = router;
