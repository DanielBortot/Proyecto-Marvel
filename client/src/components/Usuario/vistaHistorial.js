import React, { useEffect, useState } from "react";
import '../../assets/usuario.css';
import '../../assets/historial.css';
import { SideMenu } from "./sideMenu";
import axios from "axios";
import { useSelector } from "react-redux";

function VistaHistorial () {

    const [historial, setHistorial] = useState([]);
    const {perfilUso} = useSelector(state => state.perfiles);

    useEffect(()=> {
        const getHist = async () => {
            const hist = await (await axios.post('/api/getHistPer',{perfil: perfilUso.Id_Perfil})).data;
            setHistorial(hist);
        }
        getHist();
    },[])

    return (
        <>
            <div className="container">
                <div className="row">
                    <div className="col-4 menubar">
                        <SideMenu/>
                    </div>
                    <div className="col-8">
                        <div className="tituloresumen">
                            <h1 className="p-15px">Historial</h1>
                            <div className="p-15px resumenbar">
                                <div className="histCont">
                                    <div className="histitem"><span style={{fontWeight: 'bold'}}>Medio</span></div>
                                    <div className="histitem"><span style={{fontWeight: 'bold'}}>Calificacion</span></div>
                                    <div className="histitem"><span style={{fontWeight: 'bold'}}>Tiempo de reproduccion</span></div>
                                    {historial.map(rep => (
                                        <>
                                            <div className="histContDato" key={rep.Id_Hist}>
                                                <div className="histitem">{rep.N_Titulo}</div>
                                            </div>
                                            <div className="histitem">{rep.Calificacion} Estrella/s</div>
                                            <div className="histitem">{rep.Tiempo_Reproduccion} Minutos</div>
                                        </>
                                    ))}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>   
            </div>  
        </>    
    );
}

export {VistaHistorial};