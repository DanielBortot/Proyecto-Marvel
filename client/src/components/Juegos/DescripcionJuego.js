import React from "react";
import { useSelector } from "react-redux";
import '../../assets/personajes.css';

function DescripcionJuegos () {
    const {descripcion} = useSelector(state => state.juegos);
    
    let {Fecha_Estreno, Compania, Rating, Sinopsis, T_Juego, plataformas, Distribuidor, Tipo, Imagen} = descripcion;

    return (
        <>
            <div className="descCont">
                <div className="descContImg">
                    <h2>{T_Juego}</h2>
                    <img src={Imagen} alt="img"/>
                </div>

                <div className="descContTitu">
                    <div>
                        <p>TITULO</p>
                        <p>FECHA DE ESTRENO</p>
                        <p>COMPAÑIA</p>
                        <p>RATING</p>
                        <p>DISTRIBUIDOR</p>
                        <p>PLATAFORMAS</p>
                        <p>TIPO DE JUEGO</p>
                        <p>SINOPSIS</p>
                    </div>
                    <div>
                        <p>{T_Juego}</p>
                        <p>{Fecha_Estreno.slice(0,10)}</p>
                        <p>{Compania}</p>
                        <p>{Rating} Estrella/s</p>
                        <p>{Distribuidor}</p>
                        <p>{(plataformas.map(plat => plat.nombre).join(', ')) || 'Sin informacion'}</p>
                        <p>{Tipo}</p>
                        <p>{Sinopsis}</p>
                    </div>
                </div>
            </div>
        </>
    );
}

export {DescripcionJuegos};