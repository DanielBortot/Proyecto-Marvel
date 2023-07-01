import React, { useEffect, useState } from "react";
import '../../assets/Reporte5.css';
import { Link, useNavigate } from "react-router-dom";
import axios from "axios";
import { datosReporte } from "../../reducers/reportesSlice";
import { useDispatch } from "react-redux";
import { faTrash } from '@fortawesome/free-solid-svg-icons'
import { faPenToSquare} from '@fortawesome/free-solid-svg-icons'
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";

function Reporte5 (){

    const [reporte, setReporte] = useState([]);
    const dispatch = useDispatch();
    const navigate = useNavigate();

    useEffect(()=> {
        const traerDatos = async ()=> {
            const datos = await (await axios.get('/api/Rep5Peliculas')).data;
            setReporte(datos);
        }
        traerDatos();
    },[]);

    const eliminar = async (id) => {
        await axios.post('/api/delRep5', {T_Pelicula: id});
        let lista = [...reporte];
        lista = lista.filter(rep => rep.titulo !== id);
        setReporte(lista);
    }

    const update = async (val) => {
        val.fecha = val.fecha.slice(0,10);
        dispatch(datosReporte(val));
        navigate('modRep5');
    }

    return (
        <>  
            <div className="rep5">
                <Link className='btn btn-danger' style={{margin: '15px 0 10px 15px'}} to={'addRep5'}>Crear Campo</Link>
                <div className="rep5Cont">
                    <div className="rep5item"><span style={{fontWeight: 'bold'}}>Película</span></div>
                    <div className="rep5item"><span style={{fontWeight: 'bold'}}>Duración</span></div>
                    <div className="rep5item"><span style={{fontWeight: 'bold'}}>Ganancia</span></div>
                    <div className="rep5item"><span style={{fontWeight: 'bold'}}>Costo</span></div>
                    <div className="rep5item"><span style={{fontWeight: 'bold'}}>Estreno</span></div>
                    {reporte.map(rep => (
                        <>
                            <div className="rep5ContDato" key={rep.titulo}>
                                <div className="rep5ContIcon">
                                    <FontAwesomeIcon icon={faTrash} onClick={()=> eliminar(rep.titulo)} style={{padding: '5px', cursor: 'pointer'}}/>
                                    <FontAwesomeIcon icon={faPenToSquare} style={{padding: '5px', cursor: 'pointer'}} onClick={()=> update(rep)}/>
                                </div>
                                <div className="rep5item">{rep.titulo}</div>
                            </div>
                            <div className="rep5item">{rep.duracion}</div>
                            <div className="rep5item">{rep.ganancia}</div>
                            <div className="rep5item">{rep.coste}</div>
                            <div className="rep5item">{rep.fecha.slice(0,10)}</div>
                        </>
                    ))}
                </div>
            </div>
        </>
    );
}


export {Reporte5}