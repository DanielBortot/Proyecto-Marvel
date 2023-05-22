import React from "react";
import { useSelector } from "react-redux";
import '../../assets/personajes.css';

function DescripcionPers () {
    const {descripcion} = useSelector(state => state.personajes);

    return (
        <>
            <div className="descCont">
                <div className="descContImg">
                    <h2>{descripcion.nombre}</h2>
                    <img src={descripcion.img} alt="img"/>
                </div>

                <div className="descContTitu">
                    <div>
                        <p>NOMBRE</p>
                        <p>GENERO</p>
                        <p>COLOR DE CABELLO</p>
                        <p>COLOR DE OJOS</p>
                        <p>OCUPACION</p>
                        <p>NACIONALIDAD</p>
                        <p>ESTADO MARITAL</p>
                    </div>
                    <div>
                        <p>{descripcion.nombre}</p>
                        <p>{descripcion.genero}</p>
                        <p>color de cabello</p>
                        <p>{descripcion.ojos}</p>
                        <p>{descripcion.ocupacion}</p>
                        <p>{descripcion.nacionalidad}</p>
                        <p>{descripcion.marital}</p>
                    </div>
                </div>
            </div>
        </>
    );
}

export {DescripcionPers};