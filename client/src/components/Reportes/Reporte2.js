import React, { useEffect, useState } from "react";
import '../../assets/Reporte2.css';
import { Link, useNavigate } from "react-router-dom";
import axios from "axios";
import { useDispatch } from "react-redux";
import { datosReporte } from "../../reducers/reportesSlice";

function Reporte2 (){

    const [reporte, setReporte] = useState([]);
    const dispatch = useDispatch();
    const navigate = useNavigate();

    useEffect(()=> {
        const traerDatos = async ()=> {
            const datos = await (await axios.get('/api/Rep2Series')).data;
            setReporte(datos);
        }
        traerDatos();
    })

    const eliminar = async (id) => {
        await axios.post('/api/delRep2', {T_Serie: id});
        let lista = [...reporte];
        lista = lista.filter(rep => rep.T_Serie !== id);
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
                            <div className="rep2ContDato" key={rep.T_Serie}>
                                <div className="rep2ContIcon">
                                    <i className="fa-solid fa-trash" onClick={()=> eliminar(rep.T_Serie)}></i>
                                    <i className="fa-solid fa-pen-to-square" onClick={()=> update(rep)}></i>
                                </div>
                                <div className="rep2item">{rep.T_Serie}</div>
                            </div>
                            <div className="rep2item">{rep.N_Episodios}</div>
                        </>
                    ))}
                </div>
            </div>
        </>
    );
}


export {Reporte2}