import React from "react";
import { Link } from "react-router-dom";
import '../assets/estilo.css';

function Header (){
    
    return (
        <div style={{background: 'rgb(236  , 29, 36)', padding: '0 10px', position: 'sticky'}}>
            <div className="logo">FANATIC DB</div>
            <div className="botones">
                <li style={{listStyle: 'none'}}>
                    <Link className='custom-button btn btn-secondary mx-4 px-4 py-4' to={'/'}>Inicio</Link>
                    <Link className='custom-button btn btn-secondary mx-4 px-4 py-4' to={'/personajes'}>Personajes</Link>
                    <Link className='custom-button btn btn-secondary mx-4 px-4 py-4' to={'/peliculas'}>Peliculas</Link>
                    <Link className='custom-button btn btn-secondary mx-4 px-4 py-4' to={'/series'}>Series</Link>
                    <Link className='custom-button btn btn-secondary mx-4 px-4 py-4' to={'/juegos'}>Juegos</Link>
                    <Link className='custom-button btn btn-secondary mx-4 px-4 py-4' to={'/comics'}>Comics</Link>
                    <Link className='custom-button2 btn btn-secondary mx-4 px-4 py-4' to={'/inicioSesion'}>Iniciar Sesion</Link>
                    <Link className='custom-button2 btn btn-secondary mx-4 px-4 py-4' to={'/registro'}>Registrarse</Link>
                </li>
            </div>
        </div>
    );
}

export {Header};