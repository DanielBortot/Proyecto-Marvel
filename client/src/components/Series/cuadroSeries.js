import React from "react";
import '../../assets/personajes.css';
import { useNavigate } from "react-router-dom";
import {useDispatch} from "react-redux";
import { descSerie } from "../../reducers/seriesSlice";


function CuadroSeries ({prop, email}) {
    const dispatch = useDispatch();
    const navigate = useNavigate()
    const {Imagen, T_Serie} = prop
    const enviar = ()=> {
        dispatch(descSerie(prop));
        navigate(`/series/${T_Serie}`);
    }

    const admin = ()=> {
        if (email && email === 'admin@gmail.com'){
            return (<button className='btn btn-danger' style={{margin: '15px 0 15px 10px'}}>Eliminar Serie</button>);
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