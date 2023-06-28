import React from "react";
import { useSelector } from "react-redux";
import '../../assets/personajes.css';

function DescripcionSeries () {
    const {descripcion} = useSelector(state => state.series);
    
    let {Fecha_Estreno, Compania, Rating, Sinopsis, T_Serie, N_Episodios, Creador, Canal, Tipo, Imagen} = descripcion;

    return (
        <>
            <div className="descCont">
                <div className="descContImg">
                    <h2>{T_Serie}</h2>
                    <img src={Imagen} alt="img"/>
                </div>

                <div className="descContTitu">
                    <div>
                        <p>TITULO</p>
                        <p>FECHA DE ESTRENO</p>
                        <p>COMPAÑIA</p>
                        <p>RATING</p>
                        <p>NUMERO DE EPISODIOS</p>
                        <p>CREADOR</p>
                        <p>CANAL</p>
                        <p>TIPO DE SERIE</p>
                        <p>SINOPSIS</p>
                    </div>
                    <div>
                        <p>{T_Serie}</p>
                        <p>{Fecha_Estreno.slice(0,10)}</p>
                        <p>{Compania}</p>
                        <p>{Rating} Estrella/s</p>
                        <p>{N_Episodios}</p>
                        <p>{Creador}</p>
                        <p>{Canal}</p>
                        <p>{Tipo}</p>
                        <p>{Sinopsis}</p>
                    </div>
                </div>
            </div>
        </>
    );
}

export {DescripcionSeries};