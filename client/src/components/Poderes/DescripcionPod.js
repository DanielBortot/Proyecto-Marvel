import React, { useEffect, useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import '../../assets/personajes.css';
import '../../assets/personajesMed.css';
import axios from "axios";
import 'react-multi-carousel/lib/styles.css';
import { imagenes } from "../../assets/img/imgdb";
import { CuadroPers } from "../Personajes/cuadroPers";
import { Link, useNavigate } from "react-router-dom";
import { datosReporte } from "../../reducers/reportesSlice";
import { faTrash } from '@fortawesome/free-solid-svg-icons'
import { faPenToSquare} from '@fortawesome/free-solid-svg-icons'
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";

function DescripcionPod () {
    const {descripcion} = useSelector(state => state.poderes);
    const {descUsuario} = useSelector(state => state.usuario);
    const [personajes, setPersonajes] = useState([]);
    const [combates, setCombates] = useState([]);
    const dispatch = useDispatch();
    const navigate = useNavigate();
    
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

            let combs = await (await axios.post('../api/getCombates', {buscar: Nombre, op: 2})).data;

            setPersonajes(pers);
            setCombates(combs);
        }
        getDatos();
    },[]);

    const delDatos = async () => {
        await axios.post('/api/delPoder',{nombrePod: Nombre});
    }

    const admin = () => {
        if (descUsuario.Email === 'admin@gmail.com'){
            return (
                <div>
                    <Link className='btn btn-danger' onClick={()=>{dispatch(datosReporte(descripcion))}} style={{margin: '15px 0 15px 10px'}} to={'/poderes/ModPoder'}>Modificar Poder</Link>
                    <Link className='btn btn-danger' onClick={delDatos} style={{margin: '15px 0 15px 10px'}} to={'/poderes'}>Eliminar Poder</Link>
                </div>
            );
        }
        return (<></>);
    }

    const eliminar = async (comb) => {
        await axios.post('../api/delCombate', {nombrePers: comb.N_Personaje, nombrePod: Nombre, nombreObj: comb.N_Objeto, fecha: comb.Fecha});
        let lista = [...combates];
        lista = lista.filter(c => c.N_Personaje !== comb.N_Personaje || c.N_Objeto !== comb.N_Objeto || c.Fecha !== comb.Fecha);
        setCombates(lista);
    }

    const update = async (comb) => {
        dispatch(datosReporte(comb));
        navigate('/poderes/modComb');
    }

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
                        <p>DESCRIPCIÓN</p>
                        
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
                    return <CuadroPers prop={pers} key={pers.Nombre} email={descUsuario.Email} pod={Nombre} pers={personajes} setPers={setPersonajes} op={3}/>
                })}
            </div>
            <br/>
            <div className="tituloCont">
                <h2>Combates Donde se ha Usado el Poder</h2>
            </div>
            <div className="comb">
                <div className="combCont">
                    <div className="combitem"><span style={{fontWeight: 'bold'}}>Lugar de la pelea</span></div>
                    <div className="combitem"><span style={{fontWeight: 'bold'}}>Personajes que participaron</span></div>
                    <div className="combitem"><span style={{fontWeight: 'bold'}}>Objetos usados</span></div>
                    <div className="combitem"><span style={{fontWeight: 'bold'}}>Fecha de la pelea</span></div>
                    {combates.map(comb => (
                        <>
                            <div className="combContDato">
                                <div className="combContIcon">
                                    <FontAwesomeIcon icon={faTrash} onClick={()=>eliminar(comb)} style={{padding: '5px', cursor: 'pointer'}}/>
                                    <FontAwesomeIcon icon={faPenToSquare} onClick={()=>{update(comb)}} style={{padding: '5px', cursor: 'pointer'}}/>
                                </div>
                                <div className="combitem">{comb.Lugar}</div>
                            </div>
                            <div className="combitem">{comb.N_Personaje}</div>
                            <div className="combitem">{comb.N_Objeto}</div>
                            <div className="combitem">{comb.Fecha.slice(0,10)}</div>
                        </>
                    ))}
                </div>
            </div>
        </>
    );
}

export {DescripcionPod};