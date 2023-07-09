import React, { useEffect, useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import '../../assets/personajes.css';
import '../../assets/personajesMed.css';
import { imagenes } from "../../assets/img/imgdb";
import axios from "axios";
import { CuadroPersMedio } from "../Personajes/cuadroPersMedio";
import { CuadroOrgMedio } from "../Organizaciones/cuadroOrgMedio";
import { Link } from "react-router-dom";
import { datosReporte } from "../../reducers/reportesSlice";

function DescripcionPeliculas () {
    const {descripcion} = useSelector(state => state.peliculas);
    const {descUsuario} = useSelector(state => state.usuario);
    const [organizaciones, setOrganizaciones] = useState([]);
    const [personajes, setPersonajes] = useState([]);
    const dispatch = useDispatch();
    
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

    const delDatos = async () => {
        await axios.post('/api/delMedio',{titulo: T_Pelicula});
    }

    const admin = () => {
        if (descUsuario.Email === 'admin@gmail.com'){
            return (
                <div>
                    <Link className='btn btn-danger' onClick={()=>{dispatch(datosReporte(descripcion))}} style={{margin: '15px 0 15px 10px'}} to={'/peliculas/ModPelicula'}>Modificar Pelicula</Link>
                    <Link className='btn btn-danger' onClick={delDatos} style={{margin: '15px 0 15px 10px'}} to={'/peliculas'}>Eliminar Pelicula</Link>
                </div>
            );
        }
        return (<></>);
    }

    return (
        <>
            <div className="descCont">
                <div className="descContImg">
                    <h2>{T_Pelicula}</h2>
                    <img classname="imagen2" src={Imagen} alt="img"/>
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
                {admin()}
            </div>
            <br/>
            <br/>
            <br/>
            <div className="tituloCont">
                <h2>Organizaciones que participan en el medio</h2>
            </div>
            <div className="vistaPersM">
                {organizaciones.map(org => {
                    return <CuadroOrgMedio prop={org} key={org.Nombre} email={descUsuario.Email}/>
                })}
            </div>
            <br/>
            <div className="tituloCont">
                <h2>Personajes que participan en el medio</h2>
            </div>
            <div className="vistaPersM">
                {personajes.map(pers => {
                    return <CuadroPersMedio prop={pers} key={pers.Nombre} email={descUsuario.Email}/>
                })}
            </div>
        </>
    );
}

export {DescripcionPeliculas};