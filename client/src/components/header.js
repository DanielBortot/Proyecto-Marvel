import React from "react";
import { Link } from "react-router-dom";

function Header (){
    
    return (
        <div style={{background: 'rgb(233, 0, 0)', padding: '0 10px', position: 'sticky'}}>
            <li style={{listStyle: 'none'}}>
                <Link className='btn btn-secondary mx-4 px-4 py-4' to={'/'}>Inicio</Link>
                <Link className='btn btn-secondary mx-4 px-4 py-4' to={'/personajes'}>Personajes</Link>
                <Link className='btn btn-secondary mx-4 px-4 py-4' to={'/peliculas'}>Peliculas</Link>
                <Link className='btn btn-secondary mx-4 px-4 py-4' to={'/series'}>Series</Link>
                <Link className='btn btn-secondary mx-4 px-4 py-4' to={'/juegos'}>Juegos</Link>
                <Link className='btn btn-secondary mx-4 px-4 py-4' to={'/comics'}>Comics</Link>
            </li>
        </div>
    );
}

export {Header};