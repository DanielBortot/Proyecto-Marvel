
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
                <Route path='/peliculas' element={<VistaPeliculas/>}/>
                <Route path='/juegos' element={<VistaJuegos/>}/>
                <Route path='/comics' element={<VistaComics/>}/>
                <Route path='/usuario' element={<DescUsuario/>}/>
                <Route path='/usuario/resumen' element={<VistaResumen/>}/>
                <Route path='/usuario/info' element={<VistaInfo/>}/>
                <Route path='/usuario/info/modi' element={<ModInfo/>}/>
                <Route path='/usuario/suscr' element={<VistaSuscr/>}/>
                <Route path='/usuario/pago' element={<VistaPago/>}/>
                <Route path='/usuario/historial' element={<VistaHistorial/>}/>
              </Route>
            </Route>
            <Route path='/inicioSesion' element={<Login/>}/>
            <Route path='/registro' element={<Register/>}/>
            <Route path='/Rep2' element={<Reporte2/>}/>
            <Route path='/Rep2/modRep2/:tituloP/:episodiosP' element={<ModRep2/>}/>
          </Routes>
      </div>
      <Footer/>
    </>
  );
}

export default App;
