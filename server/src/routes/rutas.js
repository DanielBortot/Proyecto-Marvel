const router = require('express').Router();

const {personajes, peliculas, series, juegos, removePersonaje, removePelicula, removeSerie, removeJuego, addPersonaje, addPelicula, addSerie, addJuego, register, login, addPerfil, perfiles, addTarjeta, buscUsuario, buscTarjeta, selecTarjeta, paises, estados, ciudades, setCiudad, setEstado, setPais, buscPerfil, suscripcion, updateUsuTarjeta, updateSusUsuario, updateInfoUsuario, eliminarUsuario, villHer} = require('../controllers/acciones');

const { seriesRep2, peliculasRep5, usuariosRepReg, buscPodPersVill, eliminarPosee, addPodPersVill, poseeRep6, updatePodPersVill} = require('../controllers/reportes');

const {eliminarSerie, buscSeries, updateMedioSerie, addMedioSerie, eliminarPelicula, buscPeliculas, updateMedioPelicula, addMedioPelicula, plataformas, addMedioJuego, buscJuegos, upMedioJuego, delMedio} = require('../controllers/medios');

const {compPod, buscPoderes, getPoderes, upPoder, delPoder} = require('../controllers/poderes');

const {buscVillanos, buscHeroes, buscNacionalidades, buscOcupaciones, buscCreadores, buscCiviles, compPers, compAlias, addPersHeroe, addPersVill, upPersHeroe, upPersVill, delPersonaje, addPersCiv, upPersCiv} = require('../controllers/personajes');

const {addObjeto, buscObjeto, getObjPers, getObjetos, upObjeto, delObjeto} = require('../controllers/objetos');

const {buscOrganizacion, addOrganizacion, buscSedes, addSede, organizaciones, getSedes, upOrganizacion, upSede, delOrganizacion} = require('../controllers/organizaciones');

const {buscPodPers, addPodPers, compPodPers, getPodPerso, getPersPod, upPodPers, delPodPers} = require('../controllers/poderPers');

const {buscObjPers, addObjPers, compObjPers} = require('../controllers/objetoPers');

const {buscHerVill, addHerVill, compHerVill, getHerVill, getRelacion} = require('../controllers/HerVill');

const {buscOrgMedio, getOrgMedio, addOrgMedio, compOrgMedio, getMedOrga, upOrgMedio} = require('../controllers/orgMedio');

const {buscPersMedio, addPersMedio, compPersMedio, getPersMedio, getMedPerso, upPersMedio, delPersMedio} = require('../controllers/persMedio');

const {buscCivHer, buscCivVill, addCivPers, compCivPers} = require('../controllers/CivRela');

const {getPersOrg, getOrgPerso, buscOrgPers, getCargo, compOrgPers, addOrgPers, modOrgPers, delOrgPers} = require('../controllers/persOrg');


router.get('/personajes', personajes);
router.get('/peliculas', peliculas);
router.get('/series', series);
router.get('/juegos', juegos);
router.get('/paises', paises);
router.get('/villanos', buscVillanos);
router.get('/heroes', buscHeroes);
router.get('/civiles', buscCiviles);
router.get('/poderes', buscPoderes);
router.get('/nacionalidades', buscNacionalidades);
router.get('/ocupaciones', buscOcupaciones);
router.get('/creadores', buscCreadores);
router.get('/plataformas', plataformas);
router.get('/organizaciones', organizaciones);
router.get('/poderes', getPoderes);
router.get('/getObjetos', getObjetos);
router.get('/getCargo', getCargo);

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
router.post('/delMedio', delMedio);

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
router.post('/addPersCiv', addPersCiv);
router.post('/delPersonaje', delPersonaje);

router.post('/addObjeto', addObjeto);
router.post('/buscObjetos', buscObjeto);
router.post('/delObjeto', delObjeto);
router.post('/getObjPers', getObjPers);

router.post('/buscOrg', buscOrganizacion);
router.post('/addOrg', addOrganizacion);
router.post('/delOrg', delOrganizacion);

router.post('/buscSedes', buscSedes);
router.post('/addSede', addSede);
router.post('/getSedes', getSedes);

router.post('/buscPodPers', buscPodPers);
router.post('/compPodPers', compPodPers);
router.post('/addPodPers', addPodPers);
router.post('/delPodPers', delPodPers);
router.post('/delPoder', delPoder);
router.post('/getPodPerso', getPodPerso);
router.post('/getPersPod', getPersPod);

router.post('/buscObjPers', buscObjPers);
router.post('/compObjPers', compObjPers);
router.post('/addObjPers', addObjPers);

router.post('/buscHerVill', buscHerVill);
router.post('/compHerVill', compHerVill);
router.post('/addHerVill', addHerVill);
router.post('/getHerVill', getHerVill);
router.post('/getRelacion', getRelacion);

router.post('/buscOrgMedio', buscOrgMedio);
router.post('/getOrgMedio', getOrgMedio);
router.post('/compOrgMedio', compOrgMedio);
router.post('/addOrgMedio', addOrgMedio);
router.post('/getMedOrga', getMedOrga);

router.post('/buscPersMedio', buscPersMedio);
router.post('/compPersMedio', compPersMedio);
router.post('/addPersMedio', addPersMedio);
router.post('/delPersMedio', delPersMedio);
router.post('/getPersMedio', getPersMedio);
router.post('/getMedPerso', getMedPerso);

router.post('/buscCivHer', buscCivHer);
router.post('/buscCivVill', buscCivVill);
router.post('/compCivPers', compCivPers);
router.post('/addCivPers', addCivPers);

router.post('/getPersOrg', getPersOrg);
router.post('/getOrgPerso', getOrgPerso);
router.post('/buscOrgPers', buscOrgPers);
router.post('/compOrgPers', compOrgPers);
router.post('/addOrgPers', addOrgPers);
router.post('/delOrgPers', delOrgPers);

router.put('/upUsuTarj', updateUsuTarjeta);
router.put('/upSusUsu', updateSusUsuario);
router.put('/upInfoUsu', updateInfoUsuario);

router.put('/upRep2', updateMedioSerie);
router.put('/upRep5', updateMedioPelicula);
router.put('/upRep6', updatePodPersVill);

router.put('/upPersHeroe', upPersHeroe);
router.put('/upPersVill', upPersVill);
router.put('/upPersCiv', upPersCiv);

router.put('/upObjeto', upObjeto);
router.put('/upPoder', upPoder);
router.put('/upMedioJuego', upMedioJuego);
router.put('/upOrg', upOrganizacion);
router.put('/upOrgMedio', upOrgMedio);
router.put('/upPersMedio', upPersMedio);
router.put('/upSede', upSede);
router.put('/upPodPers', upPodPers);
router.put('/modOrgPers', modOrgPers);

module.exports = router;