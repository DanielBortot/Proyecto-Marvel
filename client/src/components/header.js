import React from "react";
import { Link } from "react-router-dom";
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faUser } from '@fortawesome/free-solid-svg-icons'
import '../assets/estilo.css';

function Header (){
    
    return (
        <div className="header">
            <div className="logo hed">FANATIC DB</div>
            <div className="botones hed">
                <li style={{listStyle: 'none'}}>
                    <Link className='custom-button btn btn-secondary px-4 py-4' to={'/'}>Inicio</Link>
                    <Link className='custom-button btn btn-secondary px-4 py-4' to={'/personajes'}>Personajes</Link>
                    <Link className='custom-button btn btn-secondary px-4 py-4' to={'/peliculas'}>Peliculas</Link>
                    <Link className='custom-button btn btn-secondary px-4 py-4' to={'/series'}>Series</Link>
                    <Link className='custom-button btn btn-secondary px-4 py-4' to={'/juegos'}>Juegos</Link>
                    <Link className='custom-button btn btn-secondary px-4 py-4' to={'/escogePerfil'}>Perf</Link>
                    
                </li>
            </div>
            <div className="inisesion hed">
                <Link className='custom-button2 btn btn-secondary px-4 py-4' to={'/inicioSesion'}>Iniciar Sesion</Link>
                <Link className='custom-button2 btn btn-secondary px-4 py-4' to={'/usuario/resumen'}><FontAwesomeIcon icon={faUser} style={{color: "#ffffff",width: 40,}} /></Link>
            </div>
        </div>
    );
}

export {Header};