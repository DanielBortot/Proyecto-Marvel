import React, { useEffect, useState } from "react";
import { useSelector } from "react-redux";
import '../../assets/personajes.css';
import 'react-multi-carousel/lib/styles.css';

function DescripcionOrg () {
    const {descripcion} = useSelector(state => state.organizaciones);
    
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
            </div>
        </>
    );
}

export {DescripcionOrg};