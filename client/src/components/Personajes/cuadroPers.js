import React from "react";
import '../../assets/personajes.css';
import { useNavigate } from "react-router-dom";
import {useDispatch} from "react-redux";
import { descPersonaje } from "../../reducers/personajesSlice";
import axios from "axios";

function CuadroPers (prop) {
    const dispatch = useDispatch();
    const navigate = useNavigate()
    const {imagen, Nombre, Genero, Color_Ojos, Color_Pelo, ocupaciones, nacionalidades, E_Marital, Nom_Comic} = prop

    const enviar = async ()=> {
        const dato = await (await axios.post('/api/villHer',{Nombre: Nombre})).data;
        let val = {...prop, ...dato}
        dispatch(descPersonaje(val));
        navigate(`${Nombre}`);
    }

    return (
        <>
            <div onClick={enviar} style={{textDecoration: 'none', cursor: "pointer"}}>
                <div className="cajaPers" onClick={enviar}>
                    <div className="bordeImg">
                        <img src={imagen} alt="..." className="imagen"/>
                    </div>

                    <div className="tituloPers">
                        <h3>{Nombre}</h3>
                    </div>
                </div>
            </div>
        </>
    )
}

export {CuadroPers};