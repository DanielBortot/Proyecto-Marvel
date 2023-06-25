import React, { useEffect, useState } from "react";
import '../../assets/Reporte2.css';
import { Link } from "react-router-dom";
import axios from "axios";

function Reporte2 (){

    const [reporte, setReporte] = useState([]);

    useEffect(()=> {
        const traerDatos = async ()=> {
            const datos = await (await axios.get('/api/Rep2Series')).data;
            setReporte(datos);
        }
        traerDatos();
    })

    const eliminar = async (id) => {
        await axios.post('/api/delRep2');
        const lista = [...reporte];
        lista.filter(rep => rep.T_Serie !== id);
        setReporte(lista);
    }

    return (
        <>  
            <div className="rep2">
                <Link className='btn btn-danger' style={{margin: '15px 0 10px 15px'}} to={'/usuario/info/modi'}>Crear Campo</Link>
                <div className="rep2Cont">
                    <div className="rep2item"><span style={{fontWeight: 'bold'}}>Series</span></div>
                    <div className="rep2item"><span style={{fontWeight: 'bold'}}>Num Episodios</span></div>
                    {reporte.map(rep => (
                        <>
                            <div className="rep2ContDato" key={rep.T_Serie}>
                                <div className="rep2ContIcon">
                                    <i className="fa-solid fa-trash" onClick={()=> eliminar(rep.T_Serie)}></i>
                                    <Link to={`modRep2/${rep.T_Serie}/${rep.N_Episodios}`}><i className="fa-solid fa-pen-to-square"></i></Link>
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