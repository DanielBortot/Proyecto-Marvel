import React from "react";
import '../../assets/personajes.css';
import { useNavigate } from "react-router-dom";
import {useDispatch} from "react-redux";
import { descSerie, descSerieHist } from "../../reducers/seriesSlice";
import axios from "axios";

function CuadroSeries ({prop, email, medios, setMedios, pers, op, org}) {
    const dispatch = useDispatch();
    const navigate = useNavigate()
    const {Imagen, T_Serie} = prop
    const enviar = ()=> {
        if (op !== 5){
            dispatch(descSerie(prop));
            navigate(`/series/${T_Serie}`);
        }
        else {
            dispatch(descSerieHist(prop));
            navigate('/series/reproserie');
        }
    }
    const delDatos = async ()=> {
        if (op === 1){
            await axios.post('/api/delPersMedio',{titulo: T_Serie, nombrePers: pers});
        }
        if (op === 2){
            await axios.post('/api/delOrgMedio',{titulo: T_Serie, nombreOrg: org});
        }
        const series = medios.filter(ser => ser.Titulo !== T_Serie);
        setMedios(series);
    }

    const admin = ()=> {
        if (email && email === 'admin@gmail.com'){
            return (<button className='btn btn-danger' onClick={delDatos} style={{margin: '15px 0 15px 10px'}}>Eliminar Serie</button>);
        }
        else {
            return (<></>);
        }
    }

    return (
        <>
            <div>
                <div onClick={enviar} style={{textDecoration: 'none', cursor: "pointer"}}>
                    <div className="cajaPers" onClick={enviar}>
                        <div className="bordeImg">
                            <img src={Imagen} alt="..." className="imagen"/>
                        </div>

                        <div className="tituloPers">
                            <h3>{T_Serie}</h3>
                        </div>
                    </div>
                </div>
                {admin()}
            </div>
        </>
    )
}

export {CuadroSeries};