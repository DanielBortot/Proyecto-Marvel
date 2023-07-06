import React from "react";
import '../../assets/personajesMed.css';
import { useNavigate } from "react-router-dom";
import {useDispatch} from "react-redux";
import { descOrganizacion } from "../../reducers/orgsSlice";


function CuadroOrgMedio ({prop}) {
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
                <div className="cajaPersM" onClick={enviar}>
                    <div className="contPersM1">
                        <div className="bordeImg">
                            <img src={Imagen} alt="..." className="imagen"/>
                        </div>

                        <div className="tituloPers">
                            <h3>{Nombre}</h3>
                        </div>
                    </div>
                    <div className="contPersM2">
                        <p><span style={{fontWeight: 'bolder'}}>ROL</span>:</p>
                        <p><span style={{fontWeight: 'bolder'}}>Estado</span>:</p>
                    </div>
                    <div className="contPersM3">
                        <p>{prop.Rol}</p>
                        <p>{prop.Estado}</p>
                    </div>
                </div>
            </div>
        </>
    )
}

export {CuadroOrgMedio};