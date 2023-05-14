import React from "react";
import { Link } from "react-router-dom";

const style = {textDecoration: 'none', color: 'white', padding: '20px', display: 'inline-block', background: 'rgb(90, 74, 74)', marginRight: '15px'};

function Header (){
    
    return (
        <div style={{background: 'rgb(233, 0, 0)', padding: '0 10px'}}>
            <li style={{listStyle: 'none'}}>
                <Link style={style} to={'/'}>Inicio</Link>
                <Link style={style} to={'/personajes'}>Personajes</Link>
                <Link style={style} to={'/peliculas'}>Peliculas</Link>
                <Link style={style} to={'/series'}>Series</Link>
                <Link style={style} to={'/juegos'}>Juegos</Link>
                <Link style={style} to={'/comics'}>Comics</Link>
            </li>
        </div>
    );
}

export {Header};