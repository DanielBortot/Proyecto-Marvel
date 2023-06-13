import React from "react";
import { SideMenu } from "./sideMenu";
import '../../assets/usuario.css';

function VistaInfo () {
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
                                <h5>Nombre Apellido</h5>
                                <h5>Pais</h5>
                            </div>
                        </div>
                        <div className="tituloresumen">
                            <h1 className="p-15px">email</h1>
                            <div className="p-15px resumenbar">
                                <h5>email@ejemplo.com</h5>
                            </div>
                        </div>
                        <div className="tituloresumen">
                            <h1 className="p-15px">direccion</h1>
                            <div className="p-15px resumenbar">
                                <h5>Pais</h5>
                                <h5>Estado</h5>
                                <h5>Ciudad</h5>
                            </div>
                        </div>
                    </div>
                </div>   
            </div>     
        </>
    );
}

export {VistaInfo};