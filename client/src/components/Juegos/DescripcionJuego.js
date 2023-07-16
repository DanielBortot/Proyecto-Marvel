import React, { useEffect, useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import '../../assets/personajes.css';
import '../../assets/personajesMed.css';
import { imagenes } from "../../assets/img/imgdb";
import axios from "axios";
import { CuadroOrgMedio } from "../Organizaciones/cuadroOrgMedio";
import { CuadroPersMedio } from "../Personajes/cuadroPersMedio";
import { Link } from "react-router-dom";
import { datosReporte } from "../../reducers/reportesSlice";
import { descJuegoHist } from "../../reducers/juegosSlice";

function DescripcionJuegos () {
    const {descripcion} = useSelector(state => state.juegos);
    const {descUsuario} = useSelector(state => state.usuario);
    const {perfilUso} = useSelector(state => state.perfiles);
    const [organizaciones, setOrganizaciones] = useState([]);
    const [personajes, setPersonajes] = useState([]);
    const dispatch = useDispatch();
    
    let {Fecha_Estreno, Compania, Rating, Sinopsis, T_Juego, plataformas, Distribuidor, Tipo, Imagen, Duracion, Suscripcion} = descripcion;

    useEffect(()=> {
        const getDatos = async ()=> {
            let orgs = await (await axios.post('../api/getMedOrga', {nombreMed: T_Juego})).data;
            for (let i=0; i<orgs.length;i++){
                const img = imagenes.find(img => img.pos == orgs[i].Imagen);
                if (img){
                    orgs[i].Imagen = img.img;
                }
            }
            let pers = await (await axios.post('../api/getMedPerso', {nombreMed: T_Juego})).data;
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
        dispatch(descJuegoHist({Titulo: T_Juego, Id_Perfil: perfilUso.Id_Perfil, Duracion: Duracion, op: 0}))
    },[]);

    const delDatos = async () => {
        await axios.post('/api/delMedio',{titulo: T_Juego});
    }

    const admin = () => {
        if (descUsuario.Email === 'admin@gmail.com'){
            return (
                <div>
                    <Link className='btn btn-danger' onClick={()=>{dispatch(datosReporte(descripcion))}} style={{margin: '15px 0 15px 10px'}} to={'/juegos/ModJuego'}>Modificar Juego</Link>
                    <Link className='btn btn-danger' onClick={delDatos} style={{margin: '15px 0 15px 10px'}} to={'/juegos'}>Eliminar Juego</Link>
                </div>
            );
        }
        return (<></>);
    }

    const suscrip = () => {
        switch (Suscripcion){
            case 1:
                return <p>Gold</p>
            case 2:
                return <p>Premium</p>
            case 3:
                return <p>Vip</p>
            case 4:
                return <p>Free</p>
            default:
                return <p>Bloqueado</p>
        }
    }

    return (
        <>
            <div className="descCont">
                <div className="descContImg">
                    <h2>{T_Juego}</h2>
                    <img className="imagen2" src={Imagen} alt="img"/>
                </div>

                <div className="descContTitu">
                    <div>
                        <p>TITULO</p>
                        <p>FECHA DE ESTRENO</p>
                        <p>COMPAÑIA</p>
                        <p>RATING</p>
                        <p>DISTRIBUIDOR</p>
                        <p>PLATAFORMAS</p>
                        <p>TIPO DE JUEGO</p>
                        <p>DURACION PROMEDIO</p>
                        <p>SUSCRIPCION</p>
                        <p>SINOPSIS</p>
                    </div>
                    <div>
                        <p>{T_Juego}</p>
                        <p>{Fecha_Estreno.slice(0,10)}</p>
                        <p>{Compania}</p>
                        <p>{Rating} Estrella/s</p>
                        <p>{Distribuidor}</p>
                        <p>{(plataformas.map(plat => plat.Plataforma).join(', ')) || 'Sin informacion'}</p>
                        <p>{Tipo}</p>
                        <p>{Duracion} minutos</p>
                        {suscrip()}
                        <p>{Sinopsis}</p>
                    </div>
                </div>
                {admin()}
                <div><Link className='btn btn-danger' style={{margin: '15px 0 15px 10px'}} to={'/juegos/reprojuegos'}>Reproducir</Link></div>
            </div>
            <br/>
            <br/>
            <br/>
            <div className="tituloCont">
                <h2>Organizaciones que participan en el medio</h2>
            </div>
            <div className="vistaPersM">
                {organizaciones.map(org => {
                    return <CuadroOrgMedio prop={org} key={org.Nombre} email={descUsuario.Email} orgs={organizaciones} setOrgs={setOrganizaciones}/>
                })}
            </div>
            <br/>
            <div className="tituloCont">
                <h2>Personajes que participan en el medio</h2>
            </div>
            <div className="vistaPersM">
                {personajes.map(pers => {
                    return <CuadroPersMedio prop={pers} key={pers.Nombre} email={descUsuario.Email} pers={personajes} setPers={setPersonajes}/>
                })}
            </div>
        </>
    );
}

export {DescripcionJuegos};