import React from "react";
import '../../assets/personajesMed.css';
import { useNavigate } from "react-router-dom";
import {useDispatch} from "react-redux";
import { descPersonaje } from "../../reducers/personajesSlice";
import axios from "axios";
import { Link } from "react-router-dom";

function CuadroPersOrg ({prop, email}) {
    const dispatch = useDispatch();
    const navigate = useNavigate()
    const {imagen, Nombre} = prop
    const enviar = async ()=> {
        const dato = await (await axios.post('/api/villHer',{Nombre: Nombre})).data;
        let val = {...prop, ...dato}
        dispatch(descPersonaje(val));
        navigate(`/personajes/${Nombre}`);
    }

    const admin = ()=> {
        if (email && email === 'admin@gmail.com'){
            return (
                <>
                    <button className='btn btn-danger' style={{margin: '15px 0 15px 10px'}}>Eliminar Personaje</button>
                    <Link className='btn btn-danger' style={{margin: '15px 0 15px 10px'}}>Modificar Personaje</Link>
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
                                <img src={imagen} alt="..." className="imagen"/>
                            </div>

                            <div className="tituloPers">
                                <h3>{Nombre}</h3>
                            </div>
                        </div>
                        <div className="contPersM2">
                            <p><span style={{fontWeight: 'bolder'}}>CARGO</span>:</p>
                        </div>
                        <div className="contPersM3">
                            <p>{prop.Descripcion}</p>
                        </div>
                    </div>
                </div>
                {admin()}
            </div>
        </>
    )
}

export {CuadroPersOrg};