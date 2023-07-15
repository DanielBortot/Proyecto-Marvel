import React, { useEffect, useState } from "react";
import '../../assets/Reporte2.css';
import axios from "axios";

function Reporte8 (){

    const [reporte, setReporte] = useState([]);

    useEffect(()=> {
        const traerDatos = async ()=> {
            const datos = await (await axios.get('/api/heroesFRep8')).data;
            setReporte(datos);
        }
        traerDatos();
    },[])

    return (
        <>  
            <div className="rep2">
                <h3>Heroes que aparezcan en medios animados y sean mujeres.</h3>
                <div className="rep2Cont">
                    <div className="rep2item"><span style={{fontWeight: 'bold'}}>Personaje</span></div>
                    <div className="rep2item"><span style={{fontWeight: 'bold'}}>Medio</span></div>
                    {reporte.map(rep => (
                        <>
                            <div className="rep2ContDato" key={rep.titulo}>
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


export {Reporte8}