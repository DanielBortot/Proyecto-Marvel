import React from "react";
import { Link } from "react-router-dom";
import { SideMenu } from "./sideMenu";
import '../../assets/usuario.css';

function VistaResumen () {
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
                                    <div className="col">
                                        <img src="http://ximg.es/600x400/000/fff" alt="NombrePerfil" width={150} height={150}/>
                                        <div className="card-body">      
                                            <h5 className="card-title">NombrePerfil</h5>
                                        </div>
                                    </div>
                                    <div className="col">
                                        <img src="http://ximg.es/600x400/000/fff" alt="NombrePerfil" width={150} height={150}/>
                                        <div className="card-body">      
                                            <h5 className="card-title">NombrePerfil</h5>
                                        </div>
                                    </div>
                                </div>
                            </div>                               
                        </div>                   
                        
                        <div className="tituloresumen">
                            <h1 className="p-15px">Resumen de usuario</h1>
                            <div className="p-15px resumenbar">
                                <h5>Nombre Apellido</h5>
                                <h5>email@ejemplo.com</h5>
                            </div>
                        </div>
                        <div className="tituloresumen">
                            <h1 className="p-15px">Resumen forma de pago</h1>
                            <div className="p-15px resumenbar">
                                <h5>Banco</h5>
                                <h5>Numero de tarjeta</h5>
                            </div>
                        </div>
                        <div className="tituloresumen">
                            <h1 className="p-15px">Resumen de suscripcion</h1>
                            <div className="p-15px resumenbar">
                                <h5>Suscripcion</h5>
                                <h5>Coste mensual</h5>
                            </div>
                        </div>
                     </div>   
                </div>   
            </div>     
        </>
    );
}

export {VistaResumen};