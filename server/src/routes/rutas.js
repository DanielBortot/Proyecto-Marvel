const router = require('express').Router();
const {personajes, peliculas, series, juegos, comics} = require('../controllers/acciones');

router.get('/personajes', personajes);
router.get('/peliculas', peliculas);
router.get('/series', series);
router.get('/juegos', juegos);
router.get('/comics', comics);

module.exports = router;
