import React, { useEffect, useState } from "react";
import { useSelector } from "react-redux";
import '../../assets/personajes.css';
import { imagenes } from "../../assets/img/imgdb";
import axios from "axios";
import { CuadroOrganizaciones } from "../Organizaciones/cuadroOrg";
import { CuadroPers } from "../Personajes/cuadroPers";

function DescripcionPeliculas () {
    const {descripcion} = useSelector(state => state.peliculas);
    const [organizaciones, setOrganizaciones] = useState([]);
    const [personajes, setPersonajes] = useState([]);
    
    let {Fecha_Estreno, Compania, Rating, Sinopsis, T_Pelicula, Director, Duracion, Coste, Ganancia, Distribuidor, Tipo, Imagen} = descripcion;

    useEffect(()=> {
        const getDatos = async ()=> {
            let orgs = await (await axios.post('../api/getMedOrga', {nombreMed: T_Pelicula})).data;
            for (let i=0; i<orgs.length;i++){
                const img = imagenes.find(img => img.pos == orgs[i].Imagen);
                if (img){
                    orgs[i].Imagen = img.img;
                }
            }
            let pers = await (await axios.post('../api/getMedPerso', {nombreMed: T_Pelicula})).data;
            for (let i=0; i<pers.length;i++){
                const img = imagenes.find(img => img.pos == pers[i].imagen);
                if (img){
                    pers[i].imagen = img.img;
                }
            } 
            setOrganizaciones(orgs);
            setPersonajes(pers);
        }
        getDatos();
    },[]);

    return (
        <>
            <div className="descCont">
                <div className="descContImg">
                    <h2>{T_Pelicula}</h2>
                    <img src={Imagen} alt="img"/>
                </div>

                <div className="descContTitu">
                    <div>
                        <p>TITULO</p>
                        <p>FECHA DE ESTRENO</p>
                        <p>COMPAÑIA</p>
                        <p>RATING</p>
                        <p>DIRECTOR</p>
                        <p>DISTRIBUIDOR</p>
                        <p>DURACIÓN</p>
                        <p>COSTE</p>
                        <p>GANANCIA</p>
                        <p>TIPO DE PELICULA</p>
                        <p>SINOPSIS</p>
                    </div>
                    <div>
                        <p>{T_Pelicula}</p>
                        <p>{Fecha_Estreno.slice(0,10)}</p>
                        <p>{Compania}</p>
                        <p>{Rating} Estrella/s</p>
                        <p>{Director}</p>
                        <p>{Distribuidor}</p>
                        <p>{Duracion} minutos</p>
                        <p>{Coste}$</p>
                        <p>{Ganancia}$</p>
                        <p>{Tipo}</p>
                        <p>{Sinopsis}</p>
                    </div>
                </div>
            </div>
            <br/>
            <br/>
            <br/>
            <div className="tituloCont">
                <h2>Organizaciones que participan en el medio</h2>
            </div>
            <div className="vistaPers">
                {organizaciones.map(org => {
                    return <CuadroOrganizaciones prop={org} key={org.Nombre}/>
                })}
            </div>
            <br/>
            <div className="tituloCont">
                <h2>Personajes que participan en el medio</h2>
            </div>
            <div className="vistaPers">
                {personajes.map(pers => {
                    return <CuadroPers prop={pers} key={pers.Nombre}/>
                })}
            </div>
        </>
    );
}

export {DescripcionPeliculas};