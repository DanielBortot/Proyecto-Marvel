import React, { useEffect, useState } from "react";
import { useSelector } from "react-redux";
import '../../assets/personajes.css';
import axios from "axios";
import Carousel from 'react-multi-carousel';
import 'react-multi-carousel/lib/styles.css';
import { CuadroJuegos } from "../Juegos/cuadroJuego";
import { CuadroSeries } from "../Series/cuadroSeries";
import { CuadroPeliculas } from "../Peliculas/cuadroPelicula";
import { imagenes } from "../../assets/img/imgdb";
import { CuadroOrganizaciones } from "../Organizaciones/cuadroOrg";
import { CuadroPodPers } from "../Poderes/cuadroPodPers";
import { CuadroObjeto } from "../Objetos/cuadroObjeto";

function DescripcionPers () {
    const {descripcion} = useSelector(state => state.personajes);
    const [gen, setGen] = useState('');
    const [organizaciones, setOrganizaciones] = useState([]);
    const [medios, setMedios] = useState([]);
    const [poderes, setPoderes] = useState([]);
    const [objetos, setObjetos] = useState([]);
    
    let {Nombre, Genero, Color_Pelo, Color_Ojos, ocupaciones, nacionalidades, creadores, Nom_Comic, E_Marital, op} = descripcion;
    useEffect(()=> {
        const getDatos = async () => {
            let meds = await (await axios.post('../api/getPersMedio', {nombrePers: Nombre})).data;
            for (let i=0; i<meds.length;i++){
                const img = imagenes.find(img => img.pos == meds[i].Imagen);
                if (img){
                    meds[i].Imagen = img.img;
                }
            }
            let orgs = await (await axios.post('../api/getPersOrg',{nombrePers: Nombre})).data;
            for (let i=0; i<orgs.length;i++){
                const img = imagenes.find(img => img.pos == orgs[i].Imagen);
                if (img){
                    orgs[i].Imagen = img.img;
                }
            }
            let pods = await (await axios.post('../api/getPodPerso',{nombrePers: Nombre})).data;
            for (let i=0; i<pods.length;i++){
                const img = imagenes.find(img => img.pos == pods[i].Imagen);
                if (img){
                    pods[i].Imagen = img.img;
                }
            }
            let objs = await (await axios.post('../api/getObjPers',{nombrePers: Nombre})).data;
            for (let i=0; i<objs.length;i++){
                const img = imagenes.find(img => img.pos == objs[i].Imagen);
                if (img){
                    objs[i].Imagen = img.img;
                }
            }
            setMedios(meds);
            setOrganizaciones(orgs);
            setPoderes(pods);
            setObjetos(objs);
        }
        getDatos();
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
                    <h2>{descripcion.Nombre}</h2>
                    <img src={descripcion.imagen} alt="img"/>
                </div>

                <div className="descContTitu">
                    <div>
                        <p>NOMBRE</p>
                        <p>GÉNERO</p>
                        <p>COLOR DE CABELLO</p>
                        <p>COLOR DE OJOS</p>
                        <p>OCUPACIÓN</p>
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
            <br/>
            <br/>
            <br/>
            <div className="tituloCont">
                <h2>Medios a los que Pertenece</h2>
            </div>
            <div className="carrusel">
            <Carousel 
                responsive={responsive}
                infinite={true}
                centerMode={true}       
            >
                    {medios.map(med => {
                            if (med.T_Serie){
                                return <CuadroSeries prop={med} key={med.T_Serie}/>
                            }
                            else if (med.T_Pelicula){
                                return <CuadroPeliculas prop={med} key={med.T_Pelicula}/>
                            }
                            else if (med.T_Juego){
                                return <CuadroJuegos prop={med} key={med.T_Juego}/>
                            }
                        })}     
            </Carousel>
            </div>
            <br/>
            <div className="tituloCont">
                <h2>Organizaciones a los que Pertenece</h2>
            </div>
            <div className="carrusel">
            <Carousel 
                responsive={responsive}
                infinite={true}
                centerMode={true}       
            >
                    {organizaciones.map(org => {
                            return <CuadroOrganizaciones prop={org} key={org.Nombre}/>
                        })}     
            </Carousel>
            </div>
            <br/>
            <div className="tituloCont">
                <h2>Poderes que Pertenecen al Personaje</h2>
            </div>
            <div className="vistaPersM">
                {poderes.map(pod => {
                    return <CuadroPodPers prop={pod} key={pod.Nombre}/>
                })}
            </div>
            <br/>
            <div className="tituloCont">
                <h2>Objetos que Pertenecen al Personaje</h2>
            </div>
            <div className="vistaPers">
                {objetos.map(obj => {
                    return <CuadroObjeto prop={obj} key={obj.Nombre}/>
                })}
            </div>
        </>
    );
}

export {DescripcionPers};