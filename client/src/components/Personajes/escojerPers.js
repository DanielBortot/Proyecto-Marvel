import React from "react";
import { Link } from "react-router-dom";
import '../../assets/estilo.css';

function ChosPers (){

    return (
        <div className="header4">
            <div className="botones hed">
                <li style={{listStyle: 'none'}}>
                    <Link className='custom-button3 btn btn-secondary px-4 py-4' to={'/'}>Heroes</Link>
                    <Link className='custom-button3 btn btn-secondary px-4 py-4' to={'/'}>Villanos</Link>
                    <Link className='custom-button3 btn btn-secondary px-4 py-4' to={'/'}>Civiles</Link>
                    <Link className='custom-button3 btn btn-secondary px-4 py-4' to={'/'}>Todos</Link>             
                </li>
            </div>
        </div>
    );
}

export {ChosPers};