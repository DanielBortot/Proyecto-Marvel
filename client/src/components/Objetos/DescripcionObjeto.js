import React from "react";
import { useSelector } from "react-redux";
import '../../assets/personajes.css';
import '../../assets/personajesMed.css';
import 'react-multi-carousel/lib/styles.css';

function DescripcionObj () {
    const {descripcion} = useSelector(state => state.objetos);
    
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
            </div>
        </>
    );
}

export {DescripcionObj};