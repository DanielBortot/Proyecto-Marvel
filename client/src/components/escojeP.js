import React from "react";
import '../assets/registro.css';

function escojePerfil () {
    return (
        <>
            <div className="tituloContReg">
                <h2 className="titulo">Escoje un perifl</h2>
            </div>
            <div className="row">
                <div className="col">
                    <img src="http://ximg.es/600x400/000/fff" alt="NombrePerfil" width={200} height={200}/>
                    <h4>Nombre de Perfil</h4>
                </div>
                <div className="col">
                    <img src="http://ximg.es/600x400/000/fff" alt="NombrePerfil" width={200} height={200}/>
                    <h4>Nombre de Perfil</h4>
                </div>
                <div className="col">
                    <img src="http://ximg.es/600x400/000/fff" alt="NombrePerfil" width={200} height={200}/>
                    <h4>Nombre de Perfil</h4>
                </div>
             </div>
        </>
    );
}

export {escojePerfil};