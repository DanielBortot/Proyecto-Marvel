import React, { useEffect, useState } from "react";
import '../../assets/Reporte2.css';
import axios from "axios";

function Reporte4 (){

    const [reporte, setReporte] = useState([]);

    useEffect(()=> {
        const traerDatos = async ()=> {
            const datos = await (await axios.get('/api/localiRep4')).data;
            setReporte(datos);
        }
        traerDatos();
    },[])

    return (
        <>  
            <div className="rep2">
                <h3>Las 3 localizaciones donde se desarrollan más combates.</h3>
                <div className="rep2Cont">
                    <div className="rep2item"><span style={{fontWeight: 'bold'}}>Lugar</span></div>
                    <div className="rep2item"><span style={{fontWeight: 'bold'}}>Cantidad de combates</span></div>
                    {reporte.map(rep => (
                        <>
                            <div className="rep2ContDato" key={rep.Lugar}>
                                <div className="rep2item">{rep.Lugar}</div>
                            </div>
                            <div className="rep2item">{rep.cant}</div>
                        </>
                    ))}
                </div>
            </div>
        </>
    );
}


export {Reporte4}