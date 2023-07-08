import React from "react";
import { useDispatch, useSelector } from "react-redux";
import '../../assets/personajes.css';
import '../../assets/personajesMed.css';
import 'react-multi-carousel/lib/styles.css';
import { Link } from "react-router-dom";
import { datosReporte } from "../../reducers/reportesSlice";

function DescripcionObj () {
    const {descripcion} = useSelector(state => state.objetos);
    const {descUsuario} = useSelector(state => state.usuario);
    const dispatch = useDispatch();
    
    let {Nombre, Descripcion, Imagen, Material, Tipo, N_Personaje} = descripcion;
    

    const responsive = {
        superLargeDesktop: {
          // the naming can be any, depends on you.
          breakpoint: { max: 2000, min: 1024 },
          items: 4
        },
        desktop: {
          breakpoint: { max: 1024, min: 800 },
          items: 4
        },
        tablet: {
          breakpoint: { max: 1024, min: 464 },
          items: 2
        },
        mobile: {
          breakpoint: { max: 464, min: 0 },
          items: 1
        }
    };

    const admin = () => {
        if (descUsuario.Email === 'admin@gmail.com'){
            return (
                <div>
                    <Link className='btn btn-danger' onClick={()=>{dispatch(datosReporte(descripcion))}} style={{margin: '15px 0 15px 10px'}} to={'/objetos/ModObjeto'}>Modificar Objeto</Link>
                    <button className='btn btn-danger' style={{margin: '15px 0 15px 10px'}}>Eliminar Objeto</button>
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