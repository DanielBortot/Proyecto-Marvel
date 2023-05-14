import React from "react";
import { Link } from "react-router-dom";

function Header (){
    
    return (
        <div style={{background: 'rgb(233, 0, 0)', padding: '0 10px'}}>
            <li style={{listStyle: 'none'}}>
                <Link className='btn btn-secondary mx-4' style={{padding: '20px'}} to={'/'}>Inicio</Link>
                <Link className='btn btn-secondary mx-4' style={{padding: '20px'}} to={'/personajes'}>Personajes</Link>
                <Link className='btn btn-secondary mx-4' style={{padding: '20px'}} to={'/peliculas'}>Peliculas</Link>
                <Link className='btn btn-secondary mx-4' style={{padding: '20px'}} to={'/series'}>Series</Link>
                <Link className='btn btn-secondary mx-4' style={{padding: '20px'}} to={'/juegos'}>Juegos</Link>
                <Link className='btn btn-secondary mx-4' style={{padding: '20px'}} to={'/comics'}>Comics</Link>
            </li>
        </div>
    );
}

export {Header};