import React, { useEffect, useState } from "react";
import { useSelector } from "react-redux";
import '../../assets/personajes.css';
import '../../assets/personajesMed.css';
import { imagenes } from "../../assets/img/imgdb";
import axios from "axios";
import { CuadroOrgMedio } from "../Organizaciones/cuadroOrgMedio";
import { CuadroPersMedio } from "../Personajes/cuadroPersMedio";

function DescripcionJuegos () {
    const {descripcion} = useSelector(state => state.juegos);
    const [organizaciones, setOrganizaciones] = useState([]);
    const [personajes, setPersonajes] = useState([]);
    
    let {Fecha_Estreno, Compania, Rating, Sinopsis, T_Juego, plataformas, Distribuidor, Tipo, Imagen} = descripcion;

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
    },[]);

    return (
        <>
            <div className="descCont">
                <div className="descContImg">
                    <h2>{T_Juego}</h2>
                    <img classname="imagen2" src={Imagen} alt="img"/>
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
                        <p>SINOPSIS</p>
                    </div>
                    <div>
                        <p>{T_Juego}</p>
                        <p>{Fecha_Estreno.slice(0,10)}</p>
                        <p>{Compania}</p>
                        <p>{Rating} Estrella/s</p>
                        <p>{Distribuidor}</p>
                        <p>{(plataformas.map(plat => plat.nombre).join(', ')) || 'Sin informacion'}</p>
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
            <div className="vistaPersM">
                {organizaciones.map(org => {
                    return <CuadroOrgMedio prop={org} key={org.Nombre}/>
                })}
            </div>
            <br/>
            <div className="tituloCont">
                <h2>Personajes que participan en el medio</h2>
            </div>
            <div className="vistaPersM">
                {personajes.map(pers => {
                    return <CuadroPersMedio prop={pers} key={pers.Nombre}/>
                })}
            </div>
        </>
    );
}

export {DescripcionJuegos};