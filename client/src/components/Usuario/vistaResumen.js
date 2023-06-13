import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import { SideMenu } from "./sideMenu";
import { useDispatch, useSelector } from "react-redux";
import { datosSuscripcion } from "../../reducers/suscripcionSlice";
import '../../assets/usuario.css';
import axios from "axios";

function VistaResumen () {
    const {descPerfil} = useSelector(state => state.perfiles);
    const {descUsuario} = useSelector(state => state.usuario);
    const {descTarjeta} = useSelector(state => state.tarjeta);
    const [sus, setSuscri] = useState({})
    const dispatch = useDispatch();

    useEffect(()=> {
        const setSus = async () => {
            const suscripcion = await axios.post('/api/suscripcion',{ID: descUsuario.Id_Suscripcion});
            const sus = await suscripcion.data;
            setSuscri(sus[0]);
            dispatch(datosSuscripcion(sus[0]));
        };
        setSus();
    }, []);

    return (
        <> 
            <div className="container">
                <div className="row">
                    <div className="col-4 ">
                        <SideMenu/>
                    </div>
                    <div className="col-8">
                        <div className="tituloresumen">
                            <div className="row">
                                <h1 className=" col ">Perfiles</h1>
                                <div className="col justify-content-right"><Link className='btn btn-danger' to={'/perfil'}>Agregar nuevo perfil</Link></div>
                            </div>
                            <div className="p-15px resumenbar">
                                <div className="row">
                                    {descPerfil.map(perfil => (
                                        <div className="col" key={perfil.Id_Perfil}>
                                            <img src={perfil.Imagen} alt={perfil.Nombre} width={150} height={150}/>
                                            <div className="card-body" key={perfil.Id_Perfil}>      
                                                <h5 className="card-title">{perfil.Nombre}</h5>
                                            </div>
                                        </div>
                                    ))}
                                </div>
                            </div>                               
                        </div>                   
                        
                        <div className="tituloresumen">
                            <h1 className="p-15px">Resumen de usuario</h1>
                            <div className="p-15px resumenbar">
                                <h5><span style={{fontWeight: 'bold'}}>Nombre:</span> {descUsuario.Nombre} {descUsuario.Apellido}</h5>
                                <h5><span style={{fontWeight: 'bold'}}>Fecha de Nacimiento:</span> {descUsuario.Fecha_Nac}</h5>
                                <h5><span style={{fontWeight: 'bold'}}>Email:</span> {descUsuario.Email}</h5>
                                <h5><span style={{fontWeight: 'bold'}}>Fecha de Creacion:</span> {descUsuario.Fecha_Creacion}</h5>
                            </div>
                        </div>
                        <div className="tituloresumen">
                            <h1 className="p-15px">Resumen forma de pago</h1>
                            <div className="p-15px resumenbar">
                                <h5>Banco</h5>
                                <h5><span style={{fontWeight: 'bold'}}>Numero de Tarjeta:</span> {descTarjeta.N_Tarjeta ? descTarjeta.N_Tarjeta : 'No posee tarjeta'}</h5>
                            </div>
                        </div>
                        <div className="tituloresumen">
                            <h1 className="p-15px">Resumen de suscripcion</h1>
                            <div className="p-15px resumenbar">
                                <h5><span style={{fontWeight: 'bold'}}>Tipo de Suscripcion:</span> {sus.Tipo}</h5>
                                <h5><span style={{fontWeight: 'bold'}}>Tarifa de la Suscripcion:</span> {sus.Tarifa}$</h5>
                            </div>
                        </div>
                    </div>   
                </div>   
            </div>     
        </>
    );
}

export {VistaResumen};