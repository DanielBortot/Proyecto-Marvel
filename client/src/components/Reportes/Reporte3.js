import React, { useEffect, useState } from "react";
import '../../assets/Reporte2.css';
import axios from "axios";

function Reporte3 (){

    const [reporte, setReporte] = useState([]);

    useEffect(()=> {
        const traerDatos = async ()=> {
            const datos = await (await axios.get('/api/objetosRep3')).data;
            setReporte(datos);
        }
        traerDatos();
    },[])

    return (
        <>  
            <div className="rep2">
                <h3>Los 5 objetos mas usados por heroes y villanos.</h3>
                <div className="rep2Cont">
                    <div className="rep2item"><span style={{fontWeight: 'bold'}}>Objeto</span></div>
                    <div className="rep2item"><span style={{fontWeight: 'bold'}}>Veces usado</span></div>
                    {reporte.map(rep => (
                        <>
                            <div className="rep2ContDato" key={rep.N_Objeto}>
                                <div className="rep2item">{rep.N_Objeto}</div>
                            </div>
                            <div className="rep2item">{rep.cant}</div>
                        </>
                    ))}
                </div>
            </div>
        </>
    );
}


export {Reporte3}