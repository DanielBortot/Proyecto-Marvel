import React, { useEffect, useState } from "react";
import { useSelector } from "react-redux";
import '../../assets/personajes.css';
import '../../assets/personajesMed.css';
import axios from "axios";
import Carousel from 'react-multi-carousel';
import 'react-multi-carousel/lib/styles.css';
import { CuadroJuegos } from "../Juegos/cuadroJuego";
import { CuadroSeries } from "../Series/cuadroSeries";
import { CuadroPeliculas } from "../Peliculas/cuadroPelicula";
import { imagenes } from "../../assets/img/imgdb";
import { CuadroSedes } from "../Sedes/cuadroSedes";
import { CuadroPersOrg } from "../Personajes/cuadroPersOrg";

function DescripcionOrg () {
    const {descripcion} = useSelector(state => state.organizaciones);
    const [sedes, setSedes] = useState([]);
    const [medios, setMedios] = useState([]);
    const [personajes, setPersonajes] = useState([]);
    
    let {Eslogan, Fundador, Lider, Lugar_Creacion, Nom_Comic, Nombre, Objetivo, Tipo, Imagen} = descripcion;
    useEffect(()=> {
        const getDatos = async () => {
            let meds = await (await axios.post('../api/getOrgMedio', {nombreOrg: Nombre})).data;
            for (let i=0; i<meds.length;i++){
                const img = imagenes.find(img => img.pos == meds[i].Imagen);
                if (img){
                    meds[i].Imagen = img.img;
                }
            }
            let seds = await (await axios.post('../api/getSedes', {nombreOrg: Nombre})).data;
            for (let i=0; i<seds.length;i++){
                const img = imagenes.find(img => img.pos == seds[i].Imagen);
                if (img){
                    seds[i].Imagen = img.img;
                }
            }
            let pers = await (await axios.post('../api/getOrgPerso', {nombreOrg: Nombre})).data;
            for (let i=0; i<pers.length;i++){
                const img = imagenes.find(img => img.pos == pers[i].imagen);
                if (img){
                    pers[i].imagen = img.img;
                }
            }
            setMedios(meds);
            setSedes(seds);
            setPersonajes(pers);
        }
        getDatos();
    },[]);

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
                    <img className="imagen2" src={Imagen} alt="img"/>
                </div>

                <div className="descContTitu">
                    <div>
                        <p>NOMBRE</p>
                        <p>LIDER</p>
                        <p>FUNDADOR</p>
                        <p>LUGAR DE CREACION</p>
                        <p>TIPO DE ORGANIZACION</p>
                        <p>PRIMERA APARICION</p>
                        <p>OBJETIVO DE LA ORGANIZACION</p>
                        <p>ESLOGAN</p>
                        
                    </div>
                    <div>
                        <p>{Nombre}</p>
                        <p>{Lider}</p>
                        <p>{Fundador}</p>
                        <p>{Lugar_Creacion}</p>
                        <p>{Tipo}</p>
                        <p>{Nom_Comic}</p>
                        <p>{Objetivo}</p>
                        <p>{Eslogan}</p>
                        
                    </div>
                </div>
            </div>
            <br/>
            <br/>
            <br/>
            <div className="tituloCont">
                <h2>Medios en los que Aparece la Organizacion</h2>
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
                <h2>Sedes que Pertenecen a la Organizacion</h2>
            </div>
            <div className="carrusel">
            <Carousel 
                responsive={responsive}
                infinite={true}
                centerMode={true}       
            >
                    {sedes.map(sede => {
                            return <CuadroSedes prop={sede} key={sede.Nombre}/>
                        })}     
            </Carousel>
            </div>
            <br/>
            <div className="tituloCont">
                <h2>Personajes que Pertenecen a la Organizacion</h2>
            </div>
            <div className="vistaPersM">
                {personajes.map(pers => {
                    return <CuadroPersOrg prop={pers} key={pers.Nombre}/>
                })}
            </div>
        </>
    );
}

export {DescripcionOrg};