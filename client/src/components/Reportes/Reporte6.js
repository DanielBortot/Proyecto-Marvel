import React, { useEffect, useState } from "react";
import '../../assets/Reporte5.css';
import { Link, useNavigate } from "react-router-dom";
import axios from "axios";
import { datosReporte } from "../../reducers/reportesSlice";
import { useDispatch } from "react-redux";

function Reporte6 (){

    const [reporte, setReporte] = useState([]);
    const dispatch = useDispatch();
    const navigate = useNavigate();

    useEffect(()=> {
        const traerDatos = async ()=> {
            const datos = await (await axios.get('/api/Rep6Poderes')).data;
            setReporte(datos);
        }
        traerDatos();
    },[]);

    const eliminar = async (idPers, idPod) => {
        await axios.post('/api/delRep6', {nombrePers: idPers, nombrePod: idPod});
        let lista = [...reporte];
        lista = lista.filter(rep => rep.nombrePers !== idPers || rep.nombrePod !== idPod);
        setReporte(lista);
    }

    const update = async (val) => {
        dispatch(datosReporte(val));
        navigate('modRep6');
    }

    return (
        <>  
            <div className="rep6">
                <Link className='btn btn-danger' style={{margin: '15px 0 10px 15px'}} to={'addRep6'}>Crear Campo</Link>
                <div className="rep6Cont">
                    <div className="rep6item"><span style={{fontWeight: 'bold'}}>Nombre</span></div>
                    <div className="rep6item"><span style={{fontWeight: 'bold'}}>Descripcion</span></div>
                    {reporte.map(rep => (
                        <>
                            <div className="rep6ContDato" key={rep.nombre}>
                                <div className="rep6ContIcon">
                                    <i className="fa-solid fa-trash" onClick={()=> eliminar(rep.nombrePers, rep.nombrePod)}></i>
                                    <i className="fa-solid fa-pen-to-square" onClick={()=> update(rep)}></i>
                                </div>
                                <div className="rep6item">{rep.nombre}</div>
                            </div>
                            <div className="rep6item">{rep.descripcion}</div>
                        </>
                    ))}
                </div>
            </div>
        </>
    );
}


export {Reporte6};