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

    const traerDatos = async ()=> {
        const datos = await (await axios.get('/api/Rep5Peliculas')).data;
        setReporte(datos);
        console.log(datos);
    }

    useEffect(()=> {
        traerDatos();
    },[]);

    const eliminar = async (id) => {
        await axios.post('/api/delRep5', {T_Pelicula: id});
        let lista = [...reporte];
        lista = lista.filter(rep => rep.Titulo !== id);
        setReporte(lista);
        traerDatos();
    }

    const update = async (val) => {
        dispatch(datosReporte(val));
        navigate('ModRep5');
    }

    return (
        <>  
            <div className="rep5">
                <h3>Películas que tengan más de 2 horas y media de duración, sean de tipo animada, cuya ganancia sea mayor al promedio de todas las películas del mismo tipo</h3>
                <Link className='btn btn-danger' style={{margin: '15px 0 10px 15px'}} to={'addRep5'}>Crear Pelicula</Link>
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
                                    <FontAwesomeIcon icon={faTrash} onClick={()=> eliminar(rep.Titulo)} style={{padding: '5px', cursor: 'pointer'}}/>
                                    <FontAwesomeIcon icon={faPenToSquare} style={{padding: '5px', cursor: 'pointer'}} onClick={()=> update(rep)}/>
                                </div>
                                <div className="rep5item">{rep.Titulo}</div>
                            </div>
                            <div className="rep5item">{rep.Duracion}</div>
                            <div className="rep5item">{rep.Ganancia}</div>
                            <div className="rep5item">{rep.Coste}</div>
                            <div className="rep5item">{rep.Fecha_Estreno.slice(0,10)}</div>
                        </>
                    ))}
                </div>
            </div>
        </>
    );
}


export {Reporte5}