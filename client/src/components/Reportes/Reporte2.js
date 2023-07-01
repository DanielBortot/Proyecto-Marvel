import React, { useEffect, useState } from "react";
import '../../assets/Reporte2.css';
import { Link, useNavigate } from "react-router-dom";
import axios from "axios";
import { useDispatch } from "react-redux";
import { datosReporte } from "../../reducers/reportesSlice";
import { faTrash } from '@fortawesome/free-solid-svg-icons'
import { faPenToSquare} from '@fortawesome/free-solid-svg-icons'
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";

function Reporte2 (){

    const [reporte, setReporte] = useState([]);
    const [promedio, setPromedio] = useState('');
    const dispatch = useDispatch();
    const navigate = useNavigate();

    useEffect(()=> {
        const traerDatos = async ()=> {
            const datos = await (await axios.get('/api/Rep2Series')).data;
            setReporte(datos);
            console.log(datos);
            setPromedio(Math.floor(datos[0].promedio))
        }
        traerDatos();
    },[])

    const eliminar = async (id) => {
        await axios.post('/api/delRep2', {T_Serie: id});
        let lista = [...reporte];
        lista = lista.filter(rep => rep.titulo !== id);
        setReporte(lista);
    }

    const update = async (val) => {
        dispatch(datosReporte(val));
        navigate('modRep2');
    }

    return (
        <>  
            <div className="rep2">
                <Link className='btn btn-danger' style={{margin: '15px 0 10px 15px'}} to={'addRep2'}>Crear Campo</Link>
                <div className="rep2Cont">
                    <div className="rep2item"><span style={{fontWeight: 'bold'}}>Serie</span></div>
                    <div className="rep2item"><span style={{fontWeight: 'bold'}}>Num Episodios</span></div>
                    {reporte.map(rep => (
                        <>
                            <div className="rep2ContDato" key={rep.titulo}>
                                <div className="rep2ContIcon">
                                    <FontAwesomeIcon icon={faTrash} onClick={()=> eliminar(rep.titulo)} style={{padding: '5px', cursor: 'pointer'}}/>
                                    <FontAwesomeIcon icon={faPenToSquare} style={{padding: '5px', cursor: 'pointer'}} onClick={()=> update(rep)}/>
                                </div>
                                <div className="rep2item">{rep.titulo}</div>
                            </div>
                            <div className="rep2item">{rep.episodios}</div>
                        </>
                    ))}
                </div>
                <div style={{margin: '15px auto 10px 15px', fontWeight: 'bold'}}>Promedio de Episodios: {promedio}</div>
            </div>
        </>
    );
}


export {Reporte2}