import React, { useEffect, useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import '../../assets/personajes.css';
import '../../assets/personajesMed.css';
import axios from "axios";
import 'react-multi-carousel/lib/styles.css';
import { imagenes } from "../../assets/img/imgdb";
import { CuadroPers } from "../Personajes/cuadroPers";
import { Link } from "react-router-dom";
import { datosReporte } from "../../reducers/reportesSlice";

function DescripcionPod () {
    const {descripcion} = useSelector(state => state.poderes);
    const {descUsuario} = useSelector(state => state.usuario);
    const [personajes, setPersonajes] = useState([]);
    const dispatch = useDispatch();
    
    let {Nombre, Descripcion, Imagen} = descripcion;
    useEffect(()=> {
        const getDatos = async () => {
            let pers = await (await axios.post('../api/getPersPod', {nombrePod: Nombre})).data;
            for (let i=0; i<pers.length;i++){
                const img = imagenes.find(img => img.pos == pers[i].imagen);
                if (img){
                    pers[i].imagen = img.img;
                }
            }
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

    const admin = () => {
        if (descUsuario.Email === 'admin@gmail.com'){
            return (
                <div>
                    <Link className='btn btn-danger' onClick={()=>{dispatch(datosReporte(descripcion))}} style={{margin: '15px 0 15px 10px'}} to={'/poderes/ModPoder'}>Modificar Poder</Link>
                    <button className='btn btn-danger' style={{margin: '15px 0 15px 10px'}}>Eliminar Poder</button>
                </div>
            );
        }
        return (<></>);
    }

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
                        <p>DESCRIPCION</p>
                        
                    </div>
                    <div>
                        <p>{Nombre}</p>
                        <p>{Descripcion}</p>
                        
                    </div>
                </div>
                {admin()}
            </div>
            <br/>
            <br/>
            <br/>
            <div className="tituloCont">
                <h2>Personajes que Poseen el Poder</h2>
            </div>
            <div className="vistaPersM">
                {personajes.map(pers => {
                    return <CuadroPers prop={pers} key={pers.Nombre} email={descUsuario.Email}/>
                })}
            </div>
        </>
    );
}

export {DescripcionPod};