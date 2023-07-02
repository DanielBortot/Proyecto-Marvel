
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
                <Route path='/comics' element={<VistaComics/>}/>
                <Route path='/usuario' element={<DescUsuario/>}/>
                <Route path='/usuario/resumen' element={<VistaResumen/>}/>
                <Route path='/usuario/info' element={<VistaInfo/>}/>
                <Route path='/usuario/info/modi' element={<ModInfo/>}/>
                <Route path='/usuario/suscr' element={<VistaSuscr/>}/>
                <Route path='/usuario/suscr/modSus' element={<ModSus/>}></Route>
                <Route path='/usuario/pago' element={<VistaPago/>}/>
                <Route path='/usuario/historial' element={<VistaHistorial/>}/>
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
