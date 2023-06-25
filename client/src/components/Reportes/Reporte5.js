import React, { useEffect, useState } from "react";
import '../../assets/Reporte5.css';
import { Link, useNavigate } from "react-router-dom";
import axios from "axios";
import { datosReporte } from "../../reducers/reportesSlice";
import { useDispatch } from "react-redux";

function Reporte5 (){

    const [reporte, setReporte] = useState([]);
    const dispatch = useDispatch();
    const navigate = useNavigate();

    useEffect(()=> {
        const traerDatos = async ()=> {
            const datos = await (await axios.get('/api/Rep5')).data;
            setReporte(datos);
        }
        traerDatos();
    })

    const eliminar = async (id) => {
        await axios.post('/api/delRep5', {T_Pelicula: id});
        let lista = [...reporte];
        lista = lista.filter(rep => rep.T_Pelicula !== id);
        setReporte(lista);
    }

    const update = async (val) => {
        dispatch(datosReporte(val));
        navigate('modRep5');
    }

    return (
        <>  
            <div className="rep5">
                <Link className='btn btn-danger' style={{margin: '15px 0 10px 15px'}} to={'addRep5'}>Crear Campo</Link>
                <div className="rep5Cont">
                    <div className="rep5item"><span style={{fontWeight: 'bold'}}>Pelicula</span></div>
                    <div className="rep5item"><span style={{fontWeight: 'bold'}}>Duracion</span></div>
                    <div className="rep5item"><span style={{fontWeight: 'bold'}}>Ganancia</span></div>
                    <div className="rep5item"><span style={{fontWeight: 'bold'}}>Costo</span></div>
                    <div className="rep5item"><span style={{fontWeight: 'bold'}}>Estreno</span></div>
                    {reporte.map(rep => (
                        <>
                            <div className="rep5ContDato" key={rep.T_Pelicula}>
                                <div className="rep5ContIcon">
                                    <i className="fa-solid fa-trash" onClick={()=> eliminar(rep.T_Pelicula)}></i>
                                    <i className="fa-solid fa-pen-to-square" onClick={()=> update(rep)}></i>
                                </div>
                                <div className="rep5item">{rep.T_Pelicula}</div>
                            </div>
                            <div className="rep5item">{rep.Duracion}</div>
                            <div className="rep5item">{rep.Ganancia}</div>
                            <div className="rep5item">{rep.Costo}</div>
                            <div className="rep5item">{rep.Estreno}</div>
                        </>
                    ))}
                </div>
            </div>
        </>
    );
}


export {Reporte5}