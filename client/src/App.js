
import './assets/App.css';
import { Route, Routes } from 'react-router-dom';
import {Header}  from './components/header';
import { VistaPersonajes } from './components/vistaPersonajes';
import { VistaSeries } from './components/vistaSeries';
import { VistaPeliculas } from './components/vistaPeliculas';
import { VistaJuegos } from './components/vistaJuegos';
import { VistaComics } from './components/vistaComics';

function App() {
  return (
    <>
      <Header/>
      <Routes>
        <Route path='/personajes' element={<VistaPersonajes/>}/>
        <Route path='/series' element={<VistaSeries/>}/>
        <Route path='/peliculas' element={<VistaPeliculas/>}/>
        <Route path='/juegos' element={<VistaJuegos/>}/>
        <Route path='/comics' element={<VistaComics/>}/>
      </Routes>
    </>
  );
}

export default App;
