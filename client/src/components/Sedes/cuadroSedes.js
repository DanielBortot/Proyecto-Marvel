import React from "react";
import '../../assets/personajes.css';
import { useNavigate } from "react-router-dom";
import {useDispatch} from "react-redux";
import { descSede } from "../../reducers/orgsSlice";
import axios from "axios";

function CuadroSedes ({prop, email, sedes, setSedes, org}) {
    const dispatch = useDispatch();
    const navigate = useNavigate()
    const {Imagen, Nombre} = prop
    const enviar = ()=> {
        dispatch(descSede(prop));
        navigate(`/sedes/${Nombre}`);
    }

    const delDatos = async ()=> {
        await axios.post('/api/delSede',{nombreSede: Nombre, nombreOrg: org});
        const ss = sedes.filter(sede => sede.Nombre !== Nombre);
        setSedes(ss);
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
                            <h3>{Nombre}</h3>
                        </div>
                    </div>
                </div>
                {admin()}
            </div>
        </>
    )
}

export {CuadroSedes};