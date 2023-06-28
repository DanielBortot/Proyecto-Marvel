import React from "react";
import { useSelector } from "react-redux";
import '../../assets/personajes.css';

function DescripcionPeliculas () {
    const {descripcion} = useSelector(state => state.peliculas);
    
    let {Fecha_Estreno, Compania, Rating, Sinopsis, T_Pelicula, Director, Duracion, Coste, Ganancia, Distribuidor, Tipo, Imagen} = descripcion;

    return (
        <>
            <div className="descCont">
                <div className="descContImg">
                    <h2>{T_Pelicula}</h2>
                    <img src={Imagen} alt="img"/>
                </div>

                <div className="descContTitu">
                    <div>
                        <p>TITULO</p>
                        <p>FECHA DE ESTRENO</p>
                        <p>COMPAÑIA</p>
                        <p>RATING</p>
                        <p>DIRECTOR</p>
                        <p>DISTRIBUIDOR</p>
                        <p>DURACION</p>
                        <p>COSTE</p>
                        <p>GANANCIA</p>
                        <p>TIPO DE PELICULA</p>
                        <p>SINOPSIS</p>
                    </div>
                    <div>
                        <p>{T_Pelicula}</p>
                        <p>{Fecha_Estreno.slice(0,10)}</p>
                        <p>{Compania}</p>
                        <p>{Rating} Estrella/s</p>
                        <p>{Director}</p>
                        <p>{Distribuidor}</p>
                        <p>{Duracion} minutos</p>
                        <p>{Coste}$</p>
                        <p>{Ganancia}$</p>
                        <p>{Tipo}</p>
                        <p>{Sinopsis}</p>
                    </div>
                </div>
            </div>
        </>
    );
}

export {DescripcionPeliculas};