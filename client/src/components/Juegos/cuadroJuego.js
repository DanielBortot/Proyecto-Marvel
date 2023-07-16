import React from "react";
import '../../assets/personajes.css';
import { useNavigate } from "react-router-dom";
import {useDispatch} from "react-redux";
import { descJuego, descJuegoHist } from "../../reducers/juegosSlice";
import axios from "axios";

function CuadroJuegos ({prop, email, medios, setMedios, pers, op, org}) {
    const dispatch = useDispatch();
    const navigate = useNavigate()
    const {Imagen, T_Juego} = prop
    const enviar = ()=> {
        if (op !== 5){
            dispatch(descJuego(prop));
            navigate(`/juegos/${T_Juego}`);
        }
        else {
            dispatch(descJuegoHist({...prop, op: 1}));
            navigate('/juegos/reprojuego')
        }
    }

    const delDatos = async ()=> {
        if (op === 1){
            await axios.post('/api/delPersMedio',{titulo: T_Juego, nombrePers: pers});
        }
        if (op === 2){
            await axios.post('/api/delOrgMedio',{titulo: T_Juego, nombreOrg: org});
        }
        const juegos = medios.filter(ser => ser.Titulo !== T_Juego);
        setMedios(juegos);
    }

    const admin = ()=> {
        if (email && email === 'admin@gmail.com'){
            return (<button className='btn btn-danger' onClick={delDatos} style={{margin: '15px 0 15px 10px'}}>Eliminar Juego</button>);
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
                            <h3>{T_Juego}</h3>
                        </div>
                    </div>
                </div>
                {admin()}
            </div>
        </>
    )
}

export {CuadroJuegos};