import React, { useEffect, useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import '../../assets/personajes.css';
import { Link } from "react-router-dom";
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
import { CuadroPers } from "./cuadroPers";
import { datosReporte } from "../../reducers/reportesSlice";

function DescripcionPers () {
    const {descripcion} = useSelector(state => state.personajes);
    const {descUsuario} = useSelector(state => state.usuario);
    const [gen, setGen] = useState('');
    const [organizaciones, setOrganizaciones] = useState([]);
    const [medios, setMedios] = useState([]);
    const [poderes, setPoderes] = useState([]);
    const [objetos, setObjetos] = useState([]);
    const [enfrenta, setEnfrenta] = useState([]);
    const [relaciones, setRelaciones] = useState([]);
    const dispatch = useDispatch();
    
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
            let enf = await (await axios.post('../api/getHerVill',{nombrePers: Nombre, op: op})).data;
            for (let i=0; i<enf.length;i++){
                const img = imagenes.find(img => img.pos == enf[i].imagen);
                if (img){
                    enf[i].imagen = img.img;
                }
            }
            let rela = await (await axios.post('../api/getRelacion',{nombrePers: Nombre, op: op})).data;
            for (let i=0; i<rela.length;i++){
                const img = imagenes.find(img => img.pos == rela[i].imagen);
                if (img){
                    rela[i].imagen = img.img;
                }
            }
            setMedios(meds);
            setOrganizaciones(orgs);
            setPoderes(pods);
            setObjetos(objs);
            setEnfrenta(enf);
            setRelaciones(rela);
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
    console.log('sss')
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

    const delDatos = async () => {
        await axios.post('/api/delPersonaje',{nombrePers: Nombre});
    }

    const admin = () => {
        if (descUsuario.Email === 'admin@gmail.com'){
            switch (op) {
                case 1:
                    return (
                        <>
                            <div>
                                <Link className='btn btn-danger' style={{margin: '15px 0 15px 10px'}} to={'/personajes/ModVillano'} onClick={()=>{dispatch(datosReporte(descripcion))}}>Modificar Personaje</Link>
                                <Link className='btn btn-danger' style={{margin: '15px 0 15px 10px'}} to={'/personajes'} onClick={delDatos}>Eliminar Personaje</Link>
                            </div>
                        </>);
                case 2:
                    return (
                        <>
                            <div>
                                <Link className='btn btn-danger' style={{margin: '15px 0 15px 10px'}} to={'/personajes/ModHeroe'} onClick={()=>{dispatch(datosReporte(descripcion))}}>Modificar Personaje</Link>
                                <Link className='btn btn-danger' style={{margin: '15px 0 15px 10px'}} to={'/personajes'} onClick={delDatos}>Eliminar Personaje</Link>
                            </div>
                        </>);
                case 3:
                    return (
                        <>
                            <div>
                                <Link className='btn btn-danger' style={{margin: '15px 0 15px 10px'}} to={'/personajes/ModCivil'} onClick={()=>{dispatch(datosReporte(descripcion))}}>Modificar Personaje</Link>
                                <Link className='btn btn-danger' style={{margin: '15px 0 15px 10px'}} to={'/personajes'} onClick={delDatos}>Eliminar Personaje</Link>
                            </div>
                        </>);
            }
        }
        return (<></>);
    }

    return (
        <>
            <div className="descCont">
                <div className="descContImg">
                    <div>
                        <h2>{descripcion.Nombre}</h2>
                    </div>
                    <img className="imagen2" src={descripcion.imagen} alt="img"/>
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
                {admin()}
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
                                return <CuadroSeries prop={med} key={med.T_Serie} email={descUsuario.Email} medios={medios} setMedios={setMedios} pers={Nombre} op={1}/>
                            }
                            else if (med.T_Pelicula){
                                return <CuadroPeliculas prop={med} key={med.T_Pelicula} email={descUsuario.Email} medios={medios} setMedios={setMedios} pers={Nombre} op={1}/>
                            }
                            else if (med.T_Juego){
                                return <CuadroJuegos prop={med} key={med.T_Juego} email={descUsuario.Email} medios={medios} setMedios={setMedios} pers={Nombre} op={1}/>
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
                            return <CuadroOrganizaciones prop={org} key={org.Nombre} email={descUsuario.Email} orgs={organizaciones} setOrgs={setOrganizaciones} pers={Nombre} op={1}/>
                        })}     
            </Carousel>
            </div>
            <br/>
            <div className="tituloCont">
                <h2>Poderes que Pertenecen al Personaje</h2>
            </div>
            <div className="vistaPersM">
                {poderes.map(pod => {
                    return <CuadroPodPers prop={pod} key={pod.Nombre} email={descUsuario.Email} pods={poderes} setPods={setPoderes}/>
                })}
            </div>
            <br/>
            <div className="tituloCont">
                <h2>Objetos que Pertenecen al Personaje</h2>
            </div>
            <div className="vistaPers">
                {objetos.map(obj => {
                    return <CuadroObjeto prop={obj} key={obj.Nombre} email={descUsuario.Email}/>
                })}
            </div>
            <br/>
            <div className="tituloCont">
                <h2>Personajes a los que se enfrenta</h2>
            </div>
            <div className="vistaPers">
                {enfrenta.map(pers => {
                    return <CuadroPers prop={pers} key={pers.Nombre}/>
                })}
            </div>
            <br/>
            <div className="tituloCont">
                <h2>Personajes Relacionados</h2>
            </div>
            <div className="vistaPers">
                {relaciones.map(pers => {
                    return <CuadroPers prop={pers} key={pers.Nombre}/>
                })}
            </div>
        </>
    );
}

export {DescripcionPers};