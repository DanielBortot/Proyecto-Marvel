import React from "react";
import '../../assets/personajesMed.css';
import { Link, useNavigate } from "react-router-dom";
import {useDispatch} from "react-redux";
import { descPoder } from "../../reducers/poderesSlice";
import { datosReporte } from "../../reducers/reportesSlice";

function CuadroPodPers ({prop, email}) {
    const dispatch = useDispatch();
    const navigate = useNavigate()
    const {Imagen, Nombre} = prop
    const enviar = async ()=> {
        dispatch(descPoder(prop));
        navigate(`/poderes/${Nombre}`);
    }

    const admin = ()=> {
        if (email && email === 'admin@gmail.com'){
            return (
                <>
                    <button className='btn btn-danger' style={{margin: '15px 0 15px 10px'}}>Eliminar Poder</button>
                    <Link className='btn btn-danger' onClick={()=>{dispatch(datosReporte(prop))}} style={{margin: '15px 0 15px 10px'}} to={'/poderes/ModPosee'}>Modificar Poder</Link>
                </>
            );
        }
        else {
            return (<></>);
        }
    }

    return (
        <>
            <div>
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
                            <p><span style={{fontWeight: 'bolder'}}>OBTENCION</span>:</p>
                        </div>
                        <div className="contPersM3">
                            <p>{prop.Obtencion}</p>
                        </div>
                    </div>
                </div>
                {admin()}
            </div>
        </>
    )
}

export {CuadroPodPers};