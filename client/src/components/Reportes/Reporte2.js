import React, { useEffect, useState } from "react";
import '../../assets/Reporte2.css';
import axios from "axios";

function Reporte2 (){

    const [reporte, setReporte] = useState([]);
    const [promedio, setPromedio] = useState('');

    const traerDatos = async ()=> {
        const datos = await (await axios.get('/api/Rep2Series')).data;
        setReporte(datos);
        setPromedio(Math.floor(datos[0].promedio))
    }

    useEffect(()=> {
        traerDatos();
    },[])

    return (
        <>  
            <div className="rep2">
                <h3>Series que han tenido más episodios que el promedio</h3>
                <div className="rep2Cont">
                    <div className="rep2item"><span style={{fontWeight: 'bold'}}>Serie</span></div>
                    <div className="rep2item"><span style={{fontWeight: 'bold'}}>Num Episodios</span></div>
                    {reporte.map(rep => (
                        <>
                            <div className="rep2ContDato" key={rep.Titulo}>
                                <div className="rep2item">{rep.Titulo}</div>
                            </div>
                            <div className="rep2item">{rep.N_Episodios}</div>
                        </>
                    ))}
                </div>
                <div style={{margin: '15px auto 10px 15px', fontWeight: 'bold'}}>Promedio de Episodios: {promedio}</div>
            </div>
        </>
    );
}


export {Reporte2}