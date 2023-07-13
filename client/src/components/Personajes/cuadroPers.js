import React, { useEffect, useState } from "react";
import '../../assets/personajes.css';
import { useNavigate } from "react-router-dom";
import {useDispatch} from "react-redux";
import { descPersonaje } from "../../reducers/personajesSlice";
import axios from "axios";

function CuadroPers ({prop, email, pod, pers, setPers, op, obj}) {
    const dispatch = useDispatch();
    const navigate = useNavigate()
    const [val, setVal] = useState({});
    const {imagen, Nombre} = prop

    useEffect(()=> {
        const datos = async () => {
            const dato = await (await axios.post('/api/villHer',{Nombre: Nombre})).data;
            let val = {...prop, ...dato}
            setVal(val);
        }
        datos();
    },[])

    const enviar = async ()=> {
        dispatch(descPersonaje(val));
        navigate(`/personajes/${Nombre}`);
    }

    const delDatos = async () => {
        if (op === 3){
            await axios.post('/api/delPodPers',{nombrePers: Nombre, nombrePod: pod});
        }
        else if (op === 4){
            await axios.post('/api/delCrea',{nombrePers: Nombre, nombreObj: obj});
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
                            <h3>{val.Alias ? val.Alias : Nombre}</h3>
                            <p>{val.Alias ? Nombre : ''}</p>
                        </div>
                    </div>
                </div>
                {admin()}
            </div>
        </>
    )
}

export {CuadroPers};