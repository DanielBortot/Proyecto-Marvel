import React from "react";
import '../../assets/personajes.css';
import { useNavigate } from "react-router-dom";
import {useDispatch} from "react-redux";
import { descOrganizacion } from "../../reducers/orgsSlice";


function CuadroOrganizaciones ({prop}) {
    const dispatch = useDispatch();
    const navigate = useNavigate()
    const {Imagen, Nombre} = prop
    const enviar = ()=> {
        dispatch(descOrganizacion(prop));
        navigate(`/organizaciones/${Nombre}`);
    }

    return (
        <>
            <div onClick={enviar} style={{textDecoration: 'none', cursor: "pointer"}}>
                <div className="cajaPers" onClick={enviar}>
                    <div className="bordeImg">
                        <img src={Imagen} alt="..." className="imagen"/>
                    </div>

                    <div className="tituloPers">
                        <h3>{Nombre}</h3>
                    </div>
                </div>
            </div>
        </>
    )
}

export {CuadroOrganizaciones};