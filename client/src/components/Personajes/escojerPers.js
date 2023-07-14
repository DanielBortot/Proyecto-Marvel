import React from "react";
import '../../assets/estilo.css';

function ChosPers ({setFil}){

    return (
        <div className="header4">
            <div className="botones hed">
                <li style={{listStyle: 'none'}}>
                    <div className='custom-button3 btn btn-secondary px-4 py-4' onClick={()=>setFil(1)}>Heroes</div>
                    <div className='custom-button3 btn btn-secondary px-4 py-4' onClick={()=>setFil(2)}>Villanos</div>
                    <div className='custom-button3 btn btn-secondary px-4 py-4' onClick={()=>setFil(3)}>Civiles</div>
                    <div className='custom-button3 btn btn-secondary px-4 py-4' onClick={()=>setFil(0)}>Todos</div>             
                </li>
            </div>
        </div>
    );
}

export {ChosPers};