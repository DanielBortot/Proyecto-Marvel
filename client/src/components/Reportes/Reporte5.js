import React, { useEffect, useState } from "react";
import '../../assets/Reporte5.css';
import axios from "axios";

function Reporte5 (){

    const [reporte, setReporte] = useState([]);

    const traerDatos = async ()=> {
        const datos = await (await axios.get('/api/Rep5Peliculas')).data;
        setReporte(datos);
        console.log(datos);
    }

    useEffect(()=> {
        traerDatos();
    },[]);

    return (
        <>  
            <div className="rep5">
                <h3>Películas que tengan más de 2 horas y media de duración, sean de tipo animada, cuya ganancia sea mayor al promedio de todas las películas del mismo tipo</h3>
                <div className="rep5Cont">
                    <div className="rep5item"><span style={{fontWeight: 'bold'}}>Película</span></div>
                    <div className="rep5item"><span style={{fontWeight: 'bold'}}>Duración</span></div>
                    <div className="rep5item"><span style={{fontWeight: 'bold'}}>Ganancia</span></div>
                    <div className="rep5item"><span style={{fontWeight: 'bold'}}>Costo</span></div>
                    <div className="rep5item"><span style={{fontWeight: 'bold'}}>Estreno</span></div>
                    {reporte.map(rep => (
                        <>
                            <div className="rep5ContDato" key={rep.titulo}>
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