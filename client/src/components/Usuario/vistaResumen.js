import React, { useEffect, useState } from "react";
import { Link, useNavigate } from "react-router-dom";
import { SideMenu } from "./sideMenu";
import { useDispatch, useSelector } from "react-redux";
import { datosSuscripcion, delSuscripcion } from "../../reducers/suscripcionSlice";
import '../../assets/usuario.css';
import axios from "axios";
import { imagenPerfil } from "../../assets/img/imgSelect";
import { delUsuario } from "../../reducers/usuarioSlice";
import { delDireccion } from "../../reducers/direccionSlice";
import { delTarjeta } from "../../reducers/tarjetaSlice";
import { delPerfiles, setPerfil } from "../../reducers/perfilesSlice";

function VistaResumen () {
    const {descPerfil, perfilUso} = useSelector(state => state.perfiles);
    const {descUsuario} = useSelector(state => state.usuario);
    const {descTarjeta} = useSelector(state => state.tarjeta);
    const [sus, setSuscri] = useState({})
    const dispatch = useDispatch();
    const navigate = useNavigate();

    useEffect(()=> {
        const setSus = async () => {
            const suscripcion = await axios.post('/api/suscripcion',{ID: descUsuario.Id_Suscripcion});
            const sus = await suscripcion.data;
            setSuscri(sus[0]);
            dispatch(datosSuscripcion(sus[0]));
        };
        setSus();
    }, []);

    const eliminar = async () => {
        await axios.post('/api/delUsuario',{Email: descUsuario.Email});
        dispatch(delUsuario());
        dispatch(delPerfiles());
        dispatch(delDireccion());
        dispatch(delTarjeta());
        dispatch(delSuscripcion());
        navigate('/inicioSesion');
    }

    const elegir = (perfil) => {
        if (perfilUso.Id_Perfil !== perfil.Id_Perfil){
            return (
                <div>
                    <button className='btn btn-danger'onClick={()=>dispatch(setPerfil(perfil))}>Elegir Perfil</button>
                </div>
            );
        }
        return (<></>);
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
                            <div className="row">
                                <h1 className=" col ">Perfiles</h1>
                                <div className="col barperfil"><Link className='btn btn-danger' to={'/perfil'}>Agregar nuevo perfil</Link></div>
                            </div>
                            <div className="p-15px resumenbar">
                                <div className="row">
                                    {descPerfil.map(perfil => (
                                        <div className="col perfilbox" key={perfil.Id_Perfil}>
                                            <div>
                                                <img src={imagenPerfil.find(i => i.pos === perfil.Imagen).img} alt={perfil.Nombre} width={150} height={150}/>
                                            </div>
                                            <div className="card-body" key={perfil.Id_Perfil}>      
                                                <h5 className="card-title">{perfil.Nombre}</h5>
                                            </div>
                                            {elegir(perfil)}
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
                                <h5><span style={{fontWeight: 'bold'}}>Fecha de Creación:</span> {descUsuario.Fecha_Creacion}</h5>
                            </div>
                        </div>
                        <div className="tituloresumen">
                            <h1 className="p-15px">Resumen forma de pago</h1>
                            <div className="p-15px resumenbar">
                                <h5>Banco</h5>
                                <h5><span style={{fontWeight: 'bold'}}>Número de Tarjeta:</span> {descTarjeta.N_Tarjeta ? descTarjeta.N_Tarjeta : 'No posee tarjeta'}</h5>
                            </div>
                        </div>
                        <div className="tituloresumen">
                            <h1 className="p-15px">Resumen de suscripción</h1>
                            <div className="p-15px resumenbar">
                                <h5><span style={{fontWeight: 'bold'}}>Tipo de Suscripción:</span> {sus.Tipo}</h5>
                                <h5><span style={{fontWeight: 'bold'}}>Tarifa de la Suscripción:</span> {sus.Tarifa}$</h5>
                            </div>
                        </div>
                        <button className='btn btn-danger' style={{margin: '15px 0 10px 0'}} onClick={eliminar}>Eliminar Cuenta</button>
                    </div>   
                </div>   
            </div>     
        </>
    );
}

export {VistaResumen};