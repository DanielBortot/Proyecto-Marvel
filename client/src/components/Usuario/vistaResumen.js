import React from "react";
import { SideMenu } from "./sideMenu";
import '../../assets/usuario.css';

function VistaResumen () {
    return (
        <> 
            <div class="container">
                <div class="row">
                    <div class="col-4 ">
                        <SideMenu/>
                    </div>
                    <div class="col-8 tituloresumen">
                        <div>
                            <h1 class="p-15px">Perfiles</h1>
                            <div class="p-15px resumenbar">
                                <div class="row">
                                    <div class="col">
                                        <img src="http://ximg.es/600x400/000/fff" alt="Perfil 1" width={150} height={150}/>
                                        <div class="card-body">      
                                            <h5 class="card-title">NombrePerfil</h5>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <img src="http://ximg.es/600x400/000/fff" alt="Perfil 1" width={150} height={150}/>
                                        <div class="card-body">      
                                            <h5 class="card-title">NombrePerfil</h5>
                                        </div>
                                    </div>
                                </div>
                            </div>                               
                        </div>                       
                     
                        <div>
                            <h1 class="p-15px">Resumen de usuario</h1>
                            <div class="p-15px resumenbar">
                                <h5>Nombre Apellido</h5>
                                <h5>email@ejemplo.com</h5>
                            </div>
                        </div>
                        <div>
                            <h1 class="p-15px">Resumen forma de pago</h1>
                            <div class="p-15px resumenbar">
                                <h5>Banco</h5>
                                <h5>Numero de tarjeta</h5>
                            </div>
                            <div>
                            <h1 class="p-15px">Resumen de suscripcion</h1>
                            <div class="p-15px resumenbar">
                                <h5>Suscripcion</h5>
                                <h5>Coste mensual</h5>
                            </div>
                        </div>
                        </div>
                     </div>   
                </div>   
            </div>     
        </>
    );
}

export {VistaResumen};