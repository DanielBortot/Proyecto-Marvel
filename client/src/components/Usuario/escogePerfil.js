import React from "react";
import '../../assets/registro.css';
import { useDispatch, useSelector } from "react-redux";
import { setPerfil } from "../../reducers/perfilesSlice";
import { useNavigate } from "react-router-dom";
import { imagenPerfil } from "../../assets/img/imgSelect";

function EscogePerfil () {
    const {descPerfil} = useSelector(state => state.perfiles);
    const dispatch = useDispatch();
    const navigate = useNavigate();


    const escoger = async (perfil) => {
        dispatch(setPerfil(perfil));
        navigate('/');
    }

    return (
        <>
            <div className="tituloContReg">
                <h2 className="titulo">Escoge un perifl</h2>
            </div>
            <div className="row justify-content-center">                
                {descPerfil.map(perfil => (
                    <div className="col-1 d-flex justify-content-center m-5" key={perfil.Id_Perfil}>
                        <div>
                            <img onClick={()=>escoger(perfil)} src={imagenPerfil.find(i => i.pos === perfil.Imagen).img} alt={perfil.Nombre} width={200} height={200}/>
                            <h4>{perfil.Nombre}</h4>
                        </div>
                    </div>
                ))}
            </div>
        </>
    );
}

export {EscogePerfil};