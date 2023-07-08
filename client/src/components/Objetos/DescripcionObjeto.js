import React from "react";
import { useDispatch, useSelector } from "react-redux";
import '../../assets/personajes.css';
import '../../assets/personajesMed.css';
import 'react-multi-carousel/lib/styles.css';
import { Link } from "react-router-dom";
import { datosReporte } from "../../reducers/reportesSlice";
import axios from "axios";

function DescripcionObj () {
    const {descripcion} = useSelector(state => state.objetos);
    const {descUsuario} = useSelector(state => state.usuario);
    const dispatch = useDispatch();
    
    let {Nombre, Descripcion, Imagen, Material, Tipo, N_Personaje} = descripcion;
    

    const delDatos = async () => {
        await axios.post('/api/delObjeto',{nombreObj: Nombre});
    }

    const admin = () => {
        if (descUsuario.Email === 'admin@gmail.com'){
            return (
                <div>
                    <Link className='btn btn-danger' onClick={()=>{dispatch(datosReporte(descripcion))}} style={{margin: '15px 0 15px 10px'}} to={'/objetos/ModObjeto'}>Modificar Objeto</Link>
                    <Link className='btn btn-danger' onClick={delDatos} style={{margin: '15px 0 15px 10px'}} to={'/objetos'}>Eliminar Objeto</Link>
                </div>
            );
        }
        return (<></>);
    }

    return (
        <>
            <div className="descCont">
                <div className="descContImg">
                    <h2>{Nombre}</h2>
                    <img classname="imagen2" src={Imagen} alt="img"/>
                </div>

                <div className="descContTitu">
                    <div>
                        <p>NOMBRE</p>
                        <p>TIPO DE OBJETO</p>
                        <p>MATERIAL DEL OBJETO</p>
                        <p>DUEÑO DEL OBJETO</p>
                        <p>DESCRIPCION</p>
                        
                    </div>
                    <div>
                        <p>{Nombre}</p>
                        <p>{Tipo}</p>
                        <p>{Material}</p>
                        <p>{N_Personaje}</p>
                        <p>{Descripcion}</p>
                        
                    </div>
                </div>
                {admin()}
            </div>
        </>
    );
}

export {DescripcionObj};