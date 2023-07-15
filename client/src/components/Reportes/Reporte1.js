import React, { useEffect, useState } from "react";
import '../../assets/Reporte2.css';
import axios from "axios";

function Reporte1 (){

    const [reporte, setReporte] = useState([]);

    const traerDatos = async ()=> {
        const datos = await (await axios.get('/api/persRep1')).data;
        setReporte(datos);
    }

    useEffect(()=> {
        traerDatos();
    },[])

    return (
        <>  
            <div className="rep2">
                <h3>Heroes o Villanos con poderes artificiales que han sido lideres.</h3>
                <div className="rep2Cont">
                    <div className="rep2item"><span style={{fontWeight: 'bold'}}>Personaje</span></div>
                    <div className="rep2item"><span style={{fontWeight: 'bold'}}>Organización</span></div>
                    {reporte.map(rep => (
                        <>
                            <div className="rep2ContDato" key={rep.titulo}>
                                <div className="rep2item">{rep.Nombre}</div>
                            </div>
                            <div className="rep2item">{rep.N_Organizacion}</div>
                        </>
                    ))}
                </div>
            </div>
        </>
    );
}


export {Reporte1}