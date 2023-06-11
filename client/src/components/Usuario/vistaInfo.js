import React from "react";
import { SideMenu } from "./sideMenu";
import '../../assets/usuario.css';

function VistaInfo () {
    return (
        <>
            <div class="container">
                <div class="row">
                    <div class="col-4 ">
                        <SideMenu/>
                    </div>
                    <div class="col-8 tituloresumen">
                        <div>
                            <h1 class="p-15px">Informacion personal</h1>
                            <div class="p-15px resumenbar">
                                <h5>Nombre Apellido</h5>
                                <h5>Pais</h5>
                            </div>
                        </div>
                        <div>
                            <h1 class="p-15px">email</h1>
                            <div class="p-15px resumenbar">
                                <h5>email@ejemplo.com</h5>
                            </div>
                        </div>
                        <div>
                            <h1 class="p-15px">direccion</h1>
                            <div class="p-15px resumenbar">
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