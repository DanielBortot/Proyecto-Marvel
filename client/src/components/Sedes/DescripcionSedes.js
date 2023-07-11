import React, { useEffect, useState } from "react";
import { useSelector } from "react-redux";
import '../../assets/personajes.css';
import 'react-multi-carousel/lib/styles.css';
import { Link } from "react-router-dom";

function DescripcionOrg () {
    const {descripcion} = useSelector(state => state.organizaciones);
    const {descUsuario} = useSelector(state => state.usuario);
    
    let {Nombre, Tipo_Edif, Ubicacion, Imagen, N_Org} = descripcion;
    

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
                    <Link className='btn btn-danger' style={{margin: '15px 0 15px 10px'}} to={''}>Modificar Sede</Link>
                    <button className='btn btn-danger' style={{margin: '15px 0 15px 10px'}}>Eliminar Sede</button>
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
                    <img src={Imagen} alt="img"/>
                </div>

                <div className="descContTitu">
                    <div>
                        <p>NOMBRE</p>
                        <p>TIPO DE EDIFICACION</p>
                        <p>UBICACION</p>
                        <p>NOMBRE DE LA ORGANIZACION A LA QUE PERTENECE</p>
                        
                    </div>
                    <div>
                        <p>{Nombre}</p>
                        <p>{Tipo_Edif}</p>
                        <p>{Ubicacion}</p>
                        <p>{N_Org}</p>
                        
                    </div>
                </div>
                {admin()}
            </div>
        </>
    );
}

export {DescripcionOrg};