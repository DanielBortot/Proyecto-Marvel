import React from "react";
import '../../assets/personajes.css';
import { useNavigate } from "react-router-dom";
import {useDispatch} from "react-redux";
import { descSerie } from "../../reducers/seriesSlice";


function CuadroSeries ({prop}) {
    const dispatch = useDispatch();
    const navigate = useNavigate()
    const {Imagen, T_Serie} = prop
    const enviar = ()=> {
        dispatch(descSerie(prop));
        navigate(`${T_Serie}`);
    }

    return (
        <>
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
        </>
    )
}

export {CuadroSeries};