import React, { useEffect, useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import '../../assets/personajes.css';
import '../../assets/personajesMed.css';
import 'react-multi-carousel/lib/styles.css';
import { Link, useNavigate } from "react-router-dom";
import { datosReporte } from "../../reducers/reportesSlice";
import { imagenes } from "../../assets/img/imgdb";
import { CuadroPers } from "../Personajes/cuadroPers";
import axios from "axios";
import { faTrash } from '@fortawesome/free-solid-svg-icons'
import { faPenToSquare} from '@fortawesome/free-solid-svg-icons'
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";

function DescripcionObj () {
    const {descripcion} = useSelector(state => state.objetos);
    const {descUsuario} = useSelector(state => state.usuario);
    const [personajes, setPersonajes] = useState([]);
    const [combates, setCombates] = useState([]);
    const [actualizar, setActualizar] = useState(false);
    const dispatch = useDispatch();
    const navigate = useNavigate();
    
    let {Nombre, Descripcion, Imagen, Material, Tipo, N_Personaje} = descripcion;
    
    useEffect(()=> {
        const getDatos = async () => {
            let pers = await (await axios.post('/api/getCrea',{nombreObj: Nombre})).data;
            for (let i=0; i<pers.length;i++){
                const img = imagenes.find(img => img.pos == pers[i].imagen);
                if (img){
                    pers[i].imagen = img.img;
                }
            }

            let combs = await (await axios.post('../api/getCombates', {buscar: Nombre, op: 3})).data;

            setPersonajes(pers);
            setCombates(combs);
        }
        getDatos();
    },[actualizar])

    const delDatos = async () => {
        await axios.post('/api/delObjeto',{nombreObj: Nombre});
    }

    const admin = () => {
        if (descUsuario.Email === 'admin@gmail.com'){
            return (
                <div>
                    <Link className='btn btn-danger' onClick={()=>{dispatch(datosReporte(descripcion))}} style={{margin: '15px 0 15px 10px'}} to={'/objetos/ModObjeto'}>Modificar Objeto</Link>
                    <Link className='btn btn-danger' onClick={delDatos} style={{margin: '15px 0 15px 10px'}} to={'/objetos'}>Eliminar Objeto</Link>
                </div>
            );
        }
        return (<></>);
    }

    const eliminar = async (comb) => {
        await axios.post('../api/delCombate', {nombrePers: comb.N_Personaje, nombrePod: comb.N_Poder, nombreObj: Nombre, fecha: comb.Fecha});
        let lista = [...combates];
        lista = lista.filter(c => c.N_Personaje !== comb.N_Personaje || c.N_Poder !== comb.N_Poder || c.Fecha !== comb.Fecha);
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
                        <p>TIPO DE OBJETO</p>
                        <p>MATERIAL DEL OBJETO</p>
                        <p>DUEÑO DEL OBJETO</p>
                        <p>DESCRIPCIÓN</p>
                        
                    </div>
                    <div>
                        <p>{Nombre}</p>
                        <p>{Tipo}</p>
                        <p>{Material}</p>
                        <p>{N_Personaje || 'No lo posee nadie'}</p>
                        <p>{Descripcion}</p>
                        
                    </div>
                </div>
                {admin()}
            </div>
            <br/>
            <br/>
            <br/>
            <div className="tituloCont">
                <h2>Personajes que Crearon el Objeto</h2>
            </div>
            <div className="vistaPersM">
                {personajes.map(pers => {
                    return <CuadroPers prop={pers} key={pers.Nombre} email={descUsuario.Email} obj={Nombre} pers={personajes} setPers={setPersonajes} act={actualizar} setAct={setActualizar} op={4}/>
                })}
            </div>
            <br/>
            <div className="tituloCont">
                <h2>Combates Donde se ha Usado el Objeto</h2>
            </div>
            <div className="comb">
                <div className="combCont">
                    <div className="combitem"><span style={{fontWeight: 'bold'}}>Lugar de la pelea</span></div>
                    <div className="combitem"><span style={{fontWeight: 'bold'}}>Personajes que participaron</span></div>
                    <div className="combitem"><span style={{fontWeight: 'bold'}}>Poderes usados</span></div>
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
                            <div className="combitem">{comb.N_Poder}</div>
                            <div className="combitem">{comb.Fecha.slice(0,10)}</div>
                        </>
                    ))}
                </div>
            </div>
        </>
    );
}

export {DescripcionObj};