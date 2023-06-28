import React, { useEffect, useState } from "react";
import { useSelector } from "react-redux";
import '../../assets/personajes.css';

function DescripcionPers () {
    const {descripcion} = useSelector(state => state.personajes);
    const [gen, setGen] = useState('');
    
    let {Nombre, Genero, Color_Pelo, Color_Ojos, ocupaciones, nacionalidades, creadores, Nom_Comic, E_Marital, op} = descripcion;
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
    },[]);

    const infoTit = () => {
        if (op == 1){
            return (
                <>
                    <p>ALIAS DE VILLANO</p>
                    <p>OBJETIVO</p>
                </>
            );
        }
        else if (op == 2){
            return (
            <>
                <p>ALIAS DE HEROE</p>
                <p>COLOR DE TRAJE</p>
                <p>ARCHIENEMIGO</p>
            </>
            );
        }
        else {
            return(<></>);
        }
    }

    const info = () => {
        if (op == 1){
            return (
                <>
                    <p>{descripcion.Alias}</p>
                    <p>{descripcion.Objetivo}</p>
                </>
            );
        }
        else if (op == 2){
            return (
            <>
                <p>{descripcion.Alias}</p>
                <p>{descripcion.Color_Traje}</p>
                <p>{descripcion.Archienemigo || "No posee"}</p>
            </>
            );
        }
        else {
            return(<></>);
        }
    }

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
                        {infoTit()}
                    </div>
                    <div>
                        <p>{Nombre}</p>
                        <p>{gen}</p>
                        <p>{Color_Pelo}</p>
                        <p>{Color_Ojos}</p>
                        <p>{(ocupaciones.map(ocu => ocu.Ocup)).join(', ') || 'Sin informacion'}</p>
                        <p>{(nacionalidades.map(nac => nac.Nac)).join(', ') || 'Sin informacion'}</p>
                        <p>{(creadores.map(crea => crea.Nom_Creador)).join(', ') || 'Sin informacion'}</p>
                        <p>{E_Marital}</p>
                        <p>{Nom_Comic}</p>
                        {info()}
                    </div>
                </div>
            </div>
        </>
    );
}

export {DescripcionPers};