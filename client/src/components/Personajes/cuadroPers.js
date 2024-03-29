import React from "react";
import '../../assets/personajes.css';
import { useNavigate } from "react-router-dom";
import {useDispatch} from "react-redux";
import { descPersonaje } from "../../reducers/personajesSlice";
import axios from "axios";

function CuadroPers ({prop, email, pod, pers, setPers, op, obj, per, act, setAct}) {
    const dispatch = useDispatch();
    const navigate = useNavigate()
    const {imagen, Nombre, Alias} = prop;
    const enviar = async ()=> {
        dispatch(descPersonaje(prop));
        setAct(!act);
        navigate(`/personajes/${Nombre}`);
    }

    const delDatos = async () => {
        if (op === 3){
            await axios.post('/api/delPodPers',{nombrePers: Nombre, nombrePod: pod});
        }
        else if (op === 4){
            await axios.post('/api/delCrea',{nombrePers: Nombre, nombreObj: obj});
        }
        else if (op === 5){
            if (per.N_Villano){
                await axios.post('/api/delCivRela',{nombrePers: per.Nombre, nombreCiv: Nombre, op: true});
            }
            else {
                await axios.post('/api/delCivRela',{nombrePers: per.Nombre, nombreCiv: Nombre, op: false});
            }
        }
        else if (op === 6){
            if (per.N_Villano){
                await axios.post('/api/delHerVill', {nombreHer: Nombre, nombreVill: per.N_Villano});
            }
            else{
                await axios.post('/api/delHerVill', {nombreHer: per.N_Heroe, nombreVill: Nombre});
            }
        }
        const personajes = pers.filter(per => per.Nombre !== Nombre);
        setPers(personajes);
    }

    const admin = ()=> {
        if (email && email === 'admin@gmail.com'){
            return (<button className='btn btn-danger' onClick={delDatos} style={{margin: '15px 0 15px 10px'}}>Eliminar Personaje</button>);
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
                            <img src={imagen} alt="..." className="imagen"/>
                        </div>

                        <div className="tituloPers">
                            <h3>{Alias ? Alias : Nombre}</h3>
                            <h5>{Alias ? Nombre : ''}</h5>
                        </div>
                    </div>
                </div>
                {admin()}
            </div>
        </>
    )
}

export {CuadroPers};