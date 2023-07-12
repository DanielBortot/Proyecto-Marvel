import React from "react";
import '../../assets/personajes.css';
import { useNavigate } from "react-router-dom";
import {useDispatch} from "react-redux";
import { descObjeto } from "../../reducers/objetosSlice";
import axios from "axios";

function CuadroObjeto ({prop, email, objs, setObjs}) {
    const dispatch = useDispatch();
    const navigate = useNavigate()
    const {Imagen, Nombre} = prop
    const enviar = async ()=> {
        dispatch(descObjeto(prop));
        navigate(`/objetos/${Nombre}`);
    }

    const delDatos = async () => {
        await axios.put('/api/upTieneObj',{nombreObj: Nombre});
        const objetos = objs.filter(obj => obj.Nombre !== Nombre);
        setObjs(objetos);
    }

    const admin = ()=> {
        if (email && email === 'admin@gmail.com'){
            return (<button className='btn btn-danger' onClick={delDatos} style={{margin: '15px 0 15px 10px'}}>Eliminar Objeto</button>);
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

export {CuadroObjeto};