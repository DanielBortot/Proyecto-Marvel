import React from "react";
import '../../assets/personajes.css';
import { useNavigate } from "react-router-dom";
import {useDispatch} from "react-redux";
import { descJuego } from "../../reducers/juegosSlice";


function CuadroJuegos ({prop}) {
    const dispatch = useDispatch();
    const navigate = useNavigate()
    const {Imagen, T_Juego} = prop
    const enviar = ()=> {
        dispatch(descJuego(prop));
        navigate(`/juegos/${T_Juego}`);
    }

    return (
        <>
            <div onClick={enviar} style={{textDecoration: 'none', cursor: "pointer"}}>
                <div className="cajaPers" onClick={enviar}>
                    <div className="bordeImg">
                        <img src={Imagen} alt="..." className="imagen"/>
                    </div>

                    <div className="tituloPers">
                        <h3>{T_Juego}</h3>
                    </div>
                </div>
            </div>
        </>
    )
}

export {CuadroJuegos};