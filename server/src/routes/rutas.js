const router = require('express').Router();

const {personajes, peliculas, series, juegos, removePersonaje, removePelicula, removeSerie, removeJuego, addPersonaje, addPelicula, addSerie, addJuego, register, login, addPerfil, perfiles, addTarjeta, buscUsuario, buscTarjeta, selecTarjeta, paises, estados, ciudades, setCiudad, setEstado, setPais, buscPerfil, suscripcion, updateUsuTarjeta, updateSusUsuario, updateInfoUsuario, eliminarUsuario, villHer} = require('../controllers/acciones');

const { seriesRep2, peliculasRep5, usuariosRepReg, buscPodPersVill, eliminarPosee, addPodPersVill, poseeRep6, updatePodPersVill} = require('../controllers/reportes');

const {eliminarSerie, buscSeries, updateMedioSerie, addMedioSerie, eliminarPelicula, buscPeliculas, updateMedioPelicula, addMedioPelicula, plataformas, addMedioJuego, buscJuegos} = require('../controllers/medios');

const {compPod, buscPoderes} = require('../controllers/poderes');

const {buscVillanos, buscNacionalidades, buscOcupaciones, buscCreadores, compPers, compAlias, addPersHeroe, addPersVill} = require('../controllers/personajes');

const {addObjeto, buscObjeto} = require('../controllers/objetos');

const {buscOrganizacion, addOrganizacion, buscSedes, addSede, organizaciones} = require('../controllers/organizaciones');



router.get('/personajes', personajes);
router.get('/peliculas', peliculas);
router.get('/series', series);
router.get('/juegos', juegos);
router.get('/paises', paises);
router.get('/villanos', buscVillanos);
router.get('/poderes', buscPoderes);
router.get('/nacionalidades', buscNacionalidades);
router.get('/ocupaciones', buscOcupaciones);
router.get('/creadores', buscCreadores);
router.get('/plataformas', plataformas);
router.get('/organizaciones', organizaciones);

router.get('/Rep2Series', seriesRep2);
router.get('/Rep5Peliculas', peliculasRep5);
router.get('/RepRegistro', usuariosRepReg);
router.get('/Rep6Poderes', poseeRep6);

router.delete('/removePersonaje/:id', removePersonaje);
router.delete('/removePelicula/:id', removePelicula);
router.delete('/removeSerie/:id', removeSerie);
router.delete('/removeJuego/:id', removeJuego);

router.post('/addPersonaje', addPersonaje);
router.post('/addPelicula', addPelicula);
router.post('/addSerie', addSerie);
router.post('/addJuego', addJuego);
router.post('/villHer', villHer);

router.post('/register', register);
router.post('/buscUsuario', buscUsuario);
router.post('/login', login);
router.post('/addPerfil', addPerfil);
router.post('/perfiles', perfiles);
router.post('/buscPerfil', buscPerfil)
router.post('/addTarjeta', addTarjeta);
router.post('/buscTarjeta', buscTarjeta);
router.post('/selecTarjeta', selecTarjeta);
router.post('/estados', estados);
router.post('/ciudades', ciudades);
router.post('/setCiudad', setCiudad);
router.post('/setEstado', setEstado);
router.post('/setPais', setPais);
router.post('/suscripcion', suscripcion);
router.post('/delUsuario', eliminarUsuario);

router.post('/delRep2', eliminarSerie);
router.post('/buscSeries', buscSeries);
router.post('/addRep2', addMedioSerie);

router.post('/delRep5', eliminarPelicula);
router.post('/buscPeliculas', buscPeliculas);
router.post('/addRep5', addMedioPelicula);

router.post('/delRep6', eliminarPosee);
router.post('/buscPodPersVill', buscPodPersVill);
router.post('/addRep6', addPodPersVill);
router.post('/compPers', compPers);
router.post('/compPod', compPod);
router.post('/compAlias', compAlias);

router.post('/addMedioJuego', addMedioJuego);
router.post('/buscJuegos', buscJuegos);

router.post('/addPersHeroe', addPersHeroe);
router.post('/addPersVill', addPersVill);

router.post('/addObjeto', addObjeto);
router.post('/buscObjetos', buscObjeto);

router.post('/buscOrg', buscOrganizacion);
router.post('/addOrg', addOrganizacion);

router.post('/buscSedes', buscSedes);
router.post('/addSede', addSede);

router.put('/upUsuTarj', updateUsuTarjeta);
router.put('/upSusUsu', updateSusUsuario);
router.put('/upInfoUsu', updateInfoUsuario);

router.put('/upRep2', updateMedioSerie);
router.put('/upRep5', updateMedioPelicula);
router.put('/upRep6', updatePodPersVill);

module.exports = router;
