import React from "react";
import '../../assets/personajes.css';
import { useNavigate } from "react-router-dom";
import {useDispatch} from "react-redux";
import { descPelicula } from "../../reducers/peliculasSlice";


function CuadroPeliculas ({prop}) {
    const dispatch = useDispatch();
    const navigate = useNavigate()
    const {Imagen, T_Pelicula} = prop
    const enviar = ()=> {
        dispatch(descPelicula(prop));
        navigate(`${T_Pelicula}`);
    }

    return (
        <>
            <div onClick={enviar} style={{textDecoration: 'none', cursor: "pointer"}}>
                <div className="cajaPers" onClick={enviar}>
                    <div className="bordeImg">
                        <img src={Imagen} alt="..." className="imagen"/>
                    </div>

                    <div className="tituloPers">
                        <h3>{T_Pelicula}</h3>
                    </div>
                </div>
            </div>
        </>
    )
}

export {CuadroPeliculas};