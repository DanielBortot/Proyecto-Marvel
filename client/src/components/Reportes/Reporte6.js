import React, { useEffect, useState } from "react";
import '../../assets/Reporte6.css';
import { Link, useNavigate } from "react-router-dom";
import axios from "axios";
import { datosReporte } from "../../reducers/reportesSlice";
import { useDispatch } from "react-redux";
import { faTrash } from '@fortawesome/free-solid-svg-icons'
import { faPenToSquare} from '@fortawesome/free-solid-svg-icons'
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";

function Reporte6 (){

    const [reporte, setReporte] = useState([]);
    const dispatch = useDispatch();
    const navigate = useNavigate();

    const traerDatos = async ()=> {
        const datos = await (await axios.get('/api/Rep6Poderes')).data;
        setReporte(datos);
    }

    useEffect(()=> {
        traerDatos();
    },[]);

    const eliminar = async (idPod) => {
        await axios.post('/api/delRep6', {nombrePod: idPod});
        let lista = [...reporte];
        lista = lista.filter(rep => rep.nombrePod !== idPod);
        setReporte(lista);
        traerDatos();
    }

    const update = async (val) => {
        dispatch(datosReporte(val));
        navigate('modRep6');
    }

    return (
        <>  
            <div className="rep6">
                <h3>Poderes que son heredados y que tengan en su nombre la cadena “Super”. Además dicho poder lo deben tener al menos 2 villanos</h3>
                <Link className='btn btn-danger' style={{margin: '15px 0 10px 15px'}} to={'addRep6Her'}>Crear Heroe</Link>
                <Link className='btn btn-danger' style={{margin: '15px 0 10px 15px'}} to={'addRep6Vill'}>Crear Villano</Link>
                <Link className='btn btn-danger' style={{margin: '15px 0 10px 15px'}} to={'addRep6Civ'}>Crear Civil</Link>
                <Link className='btn btn-danger' style={{margin: '15px 0 10px 15px'}} to={'addRep6Pod'}>Crear Poder</Link>
                <Link className='btn btn-danger' style={{margin: '15px 0 10px 15px'}} to={'addRep6Posee'}>Crear Relacion Entre Personaje y Poder</Link>
                <div className="rep6Cont">
                    <div className="rep6item"><span style={{fontWeight: 'bold'}}>Nombre del Poder</span></div>
                    <div className="rep6item"><span style={{fontWeight: 'bold'}}>Descripción</span></div>
                    {reporte.map(rep => (
                        <>
                            <div className="rep6ContDato" key={rep.nombrePod}>
                                <div className="rep6ContIcon">
                                    <FontAwesomeIcon icon={faTrash} onClick={()=> eliminar(rep.nombrePod)} style={{padding: '5px', cursor: 'pointer'}}/>
                                    <FontAwesomeIcon icon={faPenToSquare} style={{padding: '5px', cursor: 'pointer'}} onClick={()=> update(rep)}/>
                                </div>
                                <div className="rep6item">{rep.nombrePod}</div>
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