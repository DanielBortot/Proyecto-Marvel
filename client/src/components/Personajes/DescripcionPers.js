import React, { useEffect, useState } from "react";
import { useSelector } from "react-redux";
import '../../assets/personajes.css';

function DescripcionPers () {
    const {descripcion} = useSelector(state => state.personajes);
    const [gen, setGen] = useState('');
    
    let {Nombre, Genero, Color_Pelo, Color_Ojos, ocupaciones, nacionalidades, creadores, Nom_Comic, E_Marital} = descripcion;
    useEffect(()=> {
        switch (Genero){
            case 'M':
                setGen('Masculino');
                break;
            case 'F':
                setGen('Femenino');
                break;
            case 'Desc':
                setGen('Desconocido');
                break;
            default:
                setGen('Otro');
        }
    },[])
    return (
        <>
            <div className="descCont">
                <div className="descContImg">
                    <h2>{descripcion.Nombre}</h2>
                    <img src={descripcion.imagen} alt="img"/>
                </div>

                <div className="descContTitu">
                    <div>
                        <p>NOMBRE</p>
                        <p>GENERO</p>
                        <p>COLOR DE CABELLO</p>
                        <p>COLOR DE OJOS</p>
                        <p>OCUPACION</p>
                        <p>NACIONALIDAD</p>
                        <p>CREADORES</p>
                        <p>ESTADO MARITAL</p>
                        <p>NOMBRE DE COMIC</p>
                    </div>
                    <div>
                        <p>{Nombre}</p>
                        <p>{gen}</p>
                        <p>{Color_Pelo}</p>
                        <p>{Color_Ojos}</p>
                        <p>{(ocupaciones.map(ocu => ocu.Ocup)).join(', ')}</p>
                        <p>{(nacionalidades.map(nac => nac.Nac)).join(', ')}</p>
                        <p>{(creadores.map(crea => crea.Nom_Creador)).join(', ')}</p>
                        <p>{E_Marital}</p>
                        <p>{Nom_Comic}</p>
                    </div>
                </div>
            </div>
        </>
    );
}

export {DescripcionPers};