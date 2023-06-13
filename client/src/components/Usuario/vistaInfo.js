import React from "react";
import { SideMenu } from "./sideMenu";
import '../../assets/usuario.css';
import { useSelector } from "react-redux";

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
                                <h5>{descUsuario.Nombre} {descUsuario.Apellido}</h5>
                                <h5>{Pais.Nombre}</h5>
                            </div>
                        </div>
                        <div className="tituloresumen">
                            <h1 className="p-15px">email</h1>
                            <div className="p-15px resumenbar">
                                <h5>{descUsuario.Email}</h5>
                            </div>
                        </div>
                        <div className="tituloresumen">
                            <h1 className="p-15px">direccion</h1>
                            <div className="p-15px resumenbar">
                                <h5>{Pais.Nombre}</h5>
                                <h5>{Estado.Nombre}</h5>
                                <h5>{Ciudad.Nombre}</h5>
                            </div>
                        </div>
                    </div>
                </div>   
            </div>     
        </>
    );
}

export {VistaInfo};