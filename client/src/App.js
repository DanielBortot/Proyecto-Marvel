
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
import { Login } from './components/login';
import { Register } from './components/register';
import { Perfil } from './components/perfil';
import { DescUsuario } from './components/Usuario/usuario';

function App() {
  return (
    <>
      <Header/>
      <div className='mx-3 my-2'>
        <Routes>
          <Route path='/' element={<VistaInicio/>}/>
          <Route path='/personajes' element={<VistaPersonajes/>}/>
          <Route path='/personajes/:nombre' element={<DescripcionPers/>}/>
          <Route path='/series' element={<VistaSeries/>}/>
          <Route path='/peliculas' element={<VistaPeliculas/>}/>
          <Route path='/juegos' element={<VistaJuegos/>}/>
          <Route path='/comics' element={<VistaComics/>}/>
          <Route path='/inicioSesion' element={<Login/>}/>
          <Route path='/registro' element={<Register/>}/>
          <Route path='/perfil' element={<Perfil/>}/>
          <Route path='/usuario' element={<DescUsuario/>}/>

        </Routes>
      </div>
      <Footer/>
    </>
  );
}

export default App;
