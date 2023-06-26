import React, { useEffect, useState } from "react";
import '../../assets/ReporteReg.css';
import axios from "axios";

function ReporteReg (){

    const [reporte, setReporte] = useState([]);

    useEffect(()=> {
        const traerDatos = async ()=> {
            const datos = await (await axios.get('/api/RepRegistro')).data;
            setReporte(datos);
        }
        traerDatos();
    })

    return (
        <>  
            <div className="repReg">
                <div className="repRegCont">
                    <div className="repRegitem"><span style={{fontWeight: 'bold'}}>Email</span></div>
                    <div className="repRegitem"><span style={{fontWeight: 'bold'}}>Nombre</span></div>
                    <div className="repRegitem"><span style={{fontWeight: 'bold'}}>Apellido</span></div>
                    <div className="repRegitem"><span style={{fontWeight: 'bold'}}>Fecha de Nacimiento</span></div>
                    {reporte.map(rep => (
                        <>
                            <div className="repRegitem">{rep.Email}</div>
                            <div className="repRegitem">{rep.Nombre}</div>
                            <div className="repRegitem">{rep.Apellido}</div>
                            <div className="repRegitem">{rep.Fecha_Nac.slice(0,10)}</div>
                        </>
                    ))}
                </div>
            </div>
        </>
    );
}


export {ReporteReg}