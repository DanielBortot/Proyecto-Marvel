const router = require('express').Router();
const {mostrar, agregar} = require('../controllers/acciones');

router.get('/mostrar', mostrar);
router.post('/agregar/:nombre/:desc', agregar);

module.exports = router;
