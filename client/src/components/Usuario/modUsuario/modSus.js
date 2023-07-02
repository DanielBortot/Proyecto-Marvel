import React from "react";
import '../../../assets/modSus.css';
import axios from "axios";
import { useDispatch, useSelector } from "react-redux";
import { datosSuscripcion } from "../../../reducers/suscripcionSlice";
import { datosUsuario } from "../../../reducers/usuarioSlice";
import { useNavigate } from "react-router-dom";

function ModSus () {

    const {descUsuario} = useSelector(state => state.usuario);
    const dispatch  = useDispatch();
    const navigate = useNavigate();

    const changeSus = async (id) => {
        if (id != 4 && !descUsuario.N_Tarjeta){
            dispatch(datosUsuario({...descUsuario, opSus: id}));
            navigate('/registro/tarjeta');
        }
        else {
            const sus = await (await axios.put('../../api/upSusUsu',{Id_Suscripcion: id, Email: descUsuario.Email})).data;
            dispatch(datosSuscripcion(...sus));
            dispatch(datosUsuario({...descUsuario, Id_Suscripcion: id}))
            navigate('/usuario/suscr');
        }
    }



    return (
        <>
            <div className="modSusCont">
                <div className="modSusItem" onClick={()=>changeSus(1)}>
                    <h2>Gold</h2>
                    <h3>5.99$</h3>
                </div>
                <div className="modSusItem" onClick={()=>changeSus(2)}>
                    <h2>Premium</h2>
                    <h3>9.99$</h3>
                </div>
                <div className="modSusItem" onClick={()=>changeSus(3)}>
                    <h2>Vip</h2>
                    <h3>14.99$</h3>
                </div>
                <div className="modSusItem" onClick={()=>changeSus(4)}>
                    <h2>Free</h2>
                    <h3>0$</h3>
                </div>
            </div>
        </>
    );
}

export {ModSus}