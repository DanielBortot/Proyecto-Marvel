import React from "react";
import '../../assets/personajes.css';
import { Link } from "react-router-dom";
import {useDispatch} from "react-redux";
import { descPersonaje } from "../../reducers/personajesSlice";

function CuadroPers ({img, tipo, nombre, genero, ojos, ocupacion, nacionalidad, marital}) {
    const dispatch = useDispatch();

    const enviar = ()=> {
        dispatch(descPersonaje({img: img, nombre: nombre, tipo: tipo, genero: genero, ojos: ojos, ocupacion: ocupacion, nacionalidad: nacionalidad, marital: marital}));
    }

    return (
        <>
            <Link to={`${nombre}`} style={{textDecoration: 'none'}}>
                <div className="cajaPers" onClick={enviar}>
                    <div className="bordeImg">
                        <img src={img} alt="..." className="imagen"/>
                    </div>

                    <div className="tituloPers">
                        <h3>{nombre}</h3>
                        <p>{tipo}</p>
                    </div>
                </div>
            </Link>
        </>
    )
}

export {CuadroPers};