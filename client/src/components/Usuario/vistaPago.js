import React from "react";
import { SideMenu } from "./sideMenu";
import { Link } from "react-router-dom";
import { useDispatch, useSelector } from "react-redux";
import axios from "axios";
import { datosUsuario } from "../../reducers/usuarioSlice";
import { delTarjeta } from "../../reducers/tarjetaSlice";
import { datosSuscripcion } from "../../reducers/suscripcionSlice";

function VistaPago () {
    const {descTarjeta} = useSelector(state => state.tarjeta);
    const {descUsuario} = useSelector(state => state.usuario);
    const dispatch = useDispatch();

    const delSusUsu = async () => {
        await axios.put('/api/upSusUsu', {Id_Suscripcion: 4, Email: descUsuario.Email});
        await axios.put('/api/upUsuTarj', {N_Tarjeta: null, Email: descUsuario.Email});
        const sus = await axios.post('/api/suscripcion', {ID: 4});
        const susData = await sus.data;
        dispatch(datosUsuario({...descUsuario, Id_Suscripcion: 4, N_Tarjeta: null}));
        dispatch(delTarjeta());
        dispatch(datosSuscripcion(susData[0]));
    }

    return (
        <>
            <div className="container">
                <div className="row">
                    <div className="col-4 menubar">
                        <SideMenu/>
                    </div>
                    <div className="col-8">
                        <div className="tituloresumen">
                            <h1 className="p-15px">Tus formas de pago</h1>
                            <div className="p-15px resumenbar">
                                <h5><span style={{fontWeight: 'bold'}}>Número de Tarjeta:</span> {descTarjeta.N_Tarjeta ? descTarjeta.N_Tarjeta : 'No posee tarjeta'}</h5>
                                <p><span style={{fontWeight: 'bold'}}>Fecha de Vencimiento:</span> {descTarjeta.Fecha_Ven ? descTarjeta.Fecha_Ven : 'No Aplica'}</p>
                            </div>
                        </div>
                        <div>
                            <Link className='btn btn-danger' to={'/registro/tarjeta'}>Nueva Tarjeta</Link>
                            <button type="button" className="btn btn-danger m-3" onClick={()=>delSusUsu()}>Eliminar Tarjeta</button>
                        </div>
                    </div>
                </div>   
            </div>  
        </>
    );
}

export {VistaPago};