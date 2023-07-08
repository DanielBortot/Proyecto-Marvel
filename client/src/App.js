
import './assets/App.css';
import { Route, Routes } from 'react-router-dom';
import { Header}  from './components/header';
import { VistaPersonajes } from './components/Personajes/vistaPersonajes';
import { VistaSeries } from './components/Series/vistaSeries';
import { VistaPeliculas } from './components/Peliculas/vistaPeliculas';
import { VistaJuegos } from './components/Juegos/vistaJuegos';
import { VistaComics } from './components/vistaComics';
import { VistaInicio } from './components/inicio';
import { Footer } from './components/footer';
import { DescripcionPers } from './components/Personajes/DescripcionPers';
import { Register } from './components/Usuario/register';
import { Perfil } from './components/Usuario/perfil';
import { DescUsuario } from './components/Usuario/usuario';
import { VistaResumen } from "./components/Usuario/vistaResumen";
import { VistaInfo } from "./components/Usuario/vistaInfo";
import { VistaSuscr } from "./components/Usuario/vistasuscr";
import { VistaPago } from "./components/Usuario/vistaPago";
import { VistaHistorial } from "./components/Usuario/vistaHistorial";
import { Tarjeta } from './components/Usuario/tarjeta';
import { EscogePerfil } from './components/Usuario/escogePerfil';
import { RouteProtectUser } from './RouteProtectUser';
import { RouteProtectPerfil } from './RouteProtectPerfil';
import { Login } from './components/Usuario/login';
import { ModInfo } from './components/Usuario/modUsuario/modInfo';
import { Reporte2 } from './components/Reportes/Reporte2';
import { ModRep2 } from './components/Reportes/modRep2';
import { AgSerie } from './components/Reportes/AgSerie';
import { Reporte5 } from './components/Reportes/Reporte5';
import { AgPelicula } from './components/Reportes/AgPelicula';
import { ModRep5 } from './components/Reportes/modRep5';
import { ReporteReg } from './components/Reportes/ReporteReg';
import { Reporte6 } from './components/Reportes/Reporte6';
import { AgPosee } from './components/Reportes/AgPosee';
import { ModRep6 } from './components/Reportes/modRep6';
import { DescripcionSeries } from './components/Series/DescripcionSerie';
import { DescripcionPeliculas } from './components/Peliculas/DescripcionPeli';
import { VistaRep } from './components/Reportes/VistaRep';
import { ModSus } from './components/Usuario/modUsuario/modSus';
import { DescripcionJuegos } from './components/Juegos/DescripcionJuego';
import { DescripcionOrg } from './components/Organizaciones/DescripcionOrg';
import { VistaOrgs } from './components/Organizaciones/vistaOrg';
import { DescripcionPod } from './components/Poderes/DescripcionPod';
import { VistaPoderes } from './components/Poderes/vistaPoderes';
import { DescripcionObj } from './components/Objetos/DescripcionObjeto';
import { VistaObjetos } from './components/Objetos/vistaObjetos';
import { AgHeroe } from './components/Formularios/Agregar/AgHeroe';
import { AgVillano } from './components/Formularios/Agregar/AgVillano';
import { AgRelacion } from './components/Formularios/Agregar/AgRelacion';
import { AgEnfrenta } from './components/Formularios/Agregar/AgEnfrenta';
import { AgOrganizacion } from './components/Formularios/Agregar/AgOrganizacion';
import { AgObjeto } from './components/Formularios/Agregar/AgObjeto';
import { AgCrea } from './components/Formularios/Agregar/AgCrea';
import { AgPoder } from './components/Formularios/Agregar/AgPoder';
import { AgPoseePers } from './components/Formularios/Agregar/AgPoseePers';
import { AgEsta } from './components/Formularios/Agregar/AgEsta';
import { AgAparece } from './components/Formularios/Agregar/AgAparece';
import { AgJuego } from './components/Formularios/Agregar/AgJuego';

function App() {
  return (
    <>
      <Header/>
      <div className='mx-3 my-2'>
          <Routes>  
            <Route element={<RouteProtectUser/>}>
              <Route path='/escogePerfil' element={<EscogePerfil/>}/>
              <Route path='/registro/tarjeta' element={<Tarjeta/>}/>
              <Route path='/perfil' element={<Perfil/>}/>
              <Route element={<RouteProtectPerfil/>}>
                <Route path='/' element={<VistaInicio/>}/>
                <Route path='/personajes' element={<VistaPersonajes/>}/>
                <Route path='/personajes/:nombre' element={<DescripcionPers/>}/>
                <Route path='/series' element={<VistaSeries/>}/>
                <Route path='/series/:titulo' element={<DescripcionSeries/>}/>
                <Route path='/peliculas' element={<VistaPeliculas/>}/>
                <Route path='/peliculas/:titulo' element={<DescripcionPeliculas/>}/>
                <Route path='/juegos' element={<VistaJuegos/>}/>
                <Route path='/juegos/:titulo' element={<DescripcionJuegos/>}/>
                <Route path='/organizaciones' element={<VistaOrgs/>}/>
                <Route path='/organizaciones/:nombre' element={<DescripcionOrg/>}/>
                <Route path='/poderes' element={<VistaPoderes/>}/>
                <Route path='/poderes/:nombre' element={<DescripcionPod/>}/>
                <Route path='/objetos' element={<VistaObjetos/>}/>
                <Route path='/objetos/:nombre' element={<DescripcionObj/>}/>
                <Route path='/comics' element={<VistaComics/>}/>
                <Route path='/usuario' element={<DescUsuario/>}/>
                <Route path='/usuario/resumen' element={<VistaResumen/>}/>
                <Route path='/usuario/info' element={<VistaInfo/>}/>
                <Route path='/usuario/info/modi' element={<ModInfo/>}/>
                <Route path='/usuario/suscr' element={<VistaSuscr/>}/>
                <Route path='/usuario/suscr/modSus' element={<ModSus/>}></Route>
                <Route path='/usuario/pago' element={<VistaPago/>}/>
                <Route path='/usuario/historial' element={<VistaHistorial/>}/>

                <Route path='/personajes/AgHeroe' element={<AgHeroe/>}/>
                <Route path='/personajes/AgVillano' element={<AgVillano/>}/>
                <Route path='/personajes/AgCivil' element={<></>}/>
                <Route path='/personajes/AgRelacion' element={<AgRelacion/>}/>
                <Route path='/personajes/AgEnfrentamiento' element={<AgEnfrenta/>}/>
                <Route path='/personajes/AgCombate' element={<></>}/>

                <Route path='/organizaciones/AgOrganizacion' element={<AgOrganizacion/>}/>
                <Route path='/organizaciones/AgPersOrg' element={<></>}/>

                <Route path='/objetos/AgObjeto' element={<AgObjeto/>}/>
                <Route path='/objetos/AgCreador' element={<AgCrea/>}/>

                <Route path='/poderes/AgPoder' element={<AgPoder/>}/>
                <Route path='/poderes/AgPosee' element={<AgPoseePers/>}/>

                <Route path='/peliculas/AgPelicula' element={<AgPelicula/>}/>
                <Route path='/peliculas/AgPersPeli' element={<AgEsta/>}/>
                <Route path='/peliculas/AgOrgPeli' element={<AgAparece/>}/>

                <Route path='/series/AgSerie' element={<AgSerie/>}/>
                <Route path='/series/AgPersSerie' element={<AgEsta/>}/>
                <Route path='/series/AgOrgSerie' element={<AgAparece/>}/>

                <Route path='/juegos/AgJuego' element={<AgJuego/>}/>
                <Route path='/juegos/AgPersJuego' element={<AgEsta/>}/>
                <Route path='/juegos/AgOrgJuego' element={<AgAparece/>}/>
              </Route>
            </Route>
            <Route path='/inicioSesion' element={<Login/>}/>
            <Route path='/registro' element={<Register/>}/>
            <Route path='/otros' element={<VistaRep/>}/>
            <Route path='/Rep2' element={<Reporte2/>}/>
            <Route path='/Rep2/addRep2' element={<AgSerie/>}/>
            <Route path='/Rep2/modRep2' element={<ModRep2/>}/>
            <Route path='/Rep5' element={<Reporte5/>}/>
            <Route path='/Rep5/addRep5' element={<AgPelicula/>}/>
            <Route path='/Rep5/modRep5' element={<ModRep5/>}/>
            <Route path='/RepReg' element={<ReporteReg/>}/>
            <Route path='/Rep6' element={<Reporte6/>}/>
            <Route path='/Rep6/addRep6' element={<AgPosee/>}/>
            <Route path='/Rep6/modRep6' element={<ModRep6/>}/>
          </Routes>
      </div>
      <Footer/>
    </>
  );
}

export default App;
