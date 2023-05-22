import React from "react";
import { useSelector } from "react-redux";

function DescripcionPers () {
    const {descripcion} = useSelector(state => state.personajes);

    return (
        <>
            <h1>{descripcion.nombre}, {descripcion.tipo}</h1>
        </>
    );
}

export {DescripcionPers};