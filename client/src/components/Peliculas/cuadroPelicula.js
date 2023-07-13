import React from "react";
import '../../assets/personajes.css';
import { useNavigate } from "react-router-dom";
import {useDispatch} from "react-redux";
import { descPeliHist, descPelicula } from "../../reducers/peliculasSlice";
import axios from "axios";

function CuadroPeliculas ({prop, email, medios, setMedios, pers, op, org}) {
    const dispatch = useDispatch();
    const navigate = useNavigate()
    const {Imagen, T_Pelicula} = prop
    const enviar = ()=> {
        if (op !== 5) {
            dispatch(descPelicula(prop));
            navigate(`/peliculas/${T_Pelicula}`);
        }
        else {
            dispatch(descPeliHist(prop));
            navigate('/peliculas/repropeli');
        }
    }

    const delDatos = async ()=> {
        if (op === 1){
            await axios.post('/api/delPersMedio',{titulo: T_Pelicula, nombrePers: pers});
        }
        if (op === 2){
            await axios.post('/api/delOrgMedio',{titulo: T_Pelicula, nombreOrg: org});
        }
        const peliculas = medios.filter(ser => ser.Titulo !== T_Pelicula);
        setMedios(peliculas);
    }

    const admin = ()=> {
        if (email && email === 'admin@gmail.com'){
            return (<button className='btn btn-danger' onClick={delDatos} style={{margin: '15px 0 15px 10px'}}>Eliminar Pelicula</button>);
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
                            <h3>{T_Pelicula}</h3>
                        </div>
                    </div>
                </div>
                {admin()}
            </div>
        </>
    )
}

export {CuadroPeliculas};