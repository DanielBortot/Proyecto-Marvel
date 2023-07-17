import React, { useEffect, useState } from "react";
import '../../assets/Reporte6.css';
import axios from "axios";

function Reporte6 (){

    const [reporte, setReporte] = useState([]);

    const traerDatos = async ()=> {
        const datos = await (await axios.get('/api/Rep6Poderes')).data;
        setReporte(datos);
    }

    useEffect(()=> {
        traerDatos();
    },[]);

    return (
        <>  
            <div className="rep6">
                <h3>Poderes que son heredados y que tengan en su nombre la cadena “Super”. Además dicho poder lo deben tener al menos 2 villanos.</h3>
                <div className="rep6Cont">
                    <div className="rep6item"><span style={{fontWeight: 'bold'}}>Nombre del Poder</span></div>
                    <div className="rep6item"><span style={{fontWeight: 'bold'}}>Descripción</span></div>
                    {reporte.map(rep => (
                        <>
                            <div className="rep6ContDato" key={rep.nombrePod}>
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