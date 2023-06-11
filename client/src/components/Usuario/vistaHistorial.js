import React from "react";
import '../../assets/usuario.css';
import { SideMenu } from "./sideMenu";

function VistaHistorial () {
    return (
        <>
            <div class="container">
                <div class="row">
                    <div class="col-4 ">
                        <SideMenu/>
                    </div>
                    <div class="col-8 tituloresumen">
                        <div>
                            <h1 class="p-15px">Historial</h1>
                            <div class="p-15px resumenbar">
                                <h5>Historial</h5>
                            </div>
                        </div>
                    </div>
                </div>   
            </div>  
        </>    
    );
}

export {VistaHistorial};