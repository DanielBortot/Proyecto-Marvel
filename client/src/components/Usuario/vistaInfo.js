import React from "react";
import { SideMenu } from "./sideMenu";
import '../../assets/usuario.css';
import { useSelector } from "react-redux";
import { Link } from "react-router-dom";

function VistaInfo () {
    const {descUsuario} = useSelector(state => state.usuario);
    const {Pais, Estado, Ciudad} = useSelector(state => state.direccion);
    return (
        <>
            <div className="container">
                <div className="row">
                    <div className="col-4 menubar">
                        <SideMenu/>
                    </div>
                    <div className="col-8">
                        <div className="tituloresumen">
                            <h1 className="p-15px">Informacion personal</h1>
                            <div className="p-15px resumenbar">
                                <h5><span style={{fontWeight: 'bold'}}>Nombre:</span> {descUsuario.Nombre} {descUsuario.Apellido}</h5>
                                <h5><span style={{fontWeight: 'bold'}}>Pais de Origen:</span> {Pais.Nombre}</h5>
                            </div>
                        </div>
                        <div className="tituloresumen">
                            <h1 className="p-15px">email</h1>
                            <div className="p-15px resumenbar">
                                <h5><span style={{fontWeight: 'bold'}}>Email:</span> {descUsuario.Email}</h5>
                            </div>
                        </div>
                        <div className="tituloresumen">
                            <h1 className="p-15px">direccion</h1>
                            <div className="p-15px resumenbar">
                                <h5><span style={{fontWeight: 'bold'}}>Pais:</span> {Pais.Nombre}</h5>
                                <h5><span style={{fontWeight: 'bold'}}>Estado:</span> {Estado.Nombre}</h5>
                                <h5><span style={{fontWeight: 'bold'}}>Ciudad:</span> {Ciudad.Nombre}</h5>
                            </div>
                        </div>
                        <Link className='btn btn-danger' style={{marginTop: '15px'}} to={'/usuario/info/modi'}>Actualizar Informacion</Link> 
                    </div>
                </div>  
            </div>     
        </>
    );
}

export {VistaInfo};