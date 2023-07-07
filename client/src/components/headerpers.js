import React from "react";
import { Link } from "react-router-dom";
import '../assets/estilo.css';

function HeaderPers (){

    return (
        <div className="header3">
            <div className="botones hed">
                <li style={{listStyle: 'none'}}>
                    <Link className='custom-button3 btn btn-secondary px-4 py-4' to={'/personajes'}>Personajes</Link>
                    <Link className='custom-button3 btn btn-secondary px-4 py-4' to={'/organizaciones'}>Organizaciones</Link>
                    <Link className='custom-button3 btn btn-secondary px-4 py-4' to={'/poderes'}>Poderes</Link>
                    <Link className='custom-button3 btn btn-secondary px-4 py-4' to={'/objetos'}>Objetos</Link>             
                </li>
            </div>
        </div>
    );
}

export {HeaderPers};