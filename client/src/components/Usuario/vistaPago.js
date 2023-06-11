import React from "react";
import { SideMenu } from "./sideMenu";

function VistaPago () {
    return (
        <>
            <div class="container">
                <div class="row">
                    <div class="col-4 ">
                        <SideMenu/>
                    </div>
                    <div class="col-8 tituloresumen">
                        <div>
                            <h1 class="p-15px">Tus formas de pago</h1>
                            <div class="p-15px resumenbar">
                                <h5>Numero de tarjeta</h5>
                                <p>Fecha Vencimiento</p>
                            </div>
                        </div>
                        <div>
                            <button type="button" class="btn btn-danger m-3">Agregar tarjeta</button>
                            <button type="button" class="btn btn-danger m-3">Eliminar Tarjeta</button>
                        </div>
                    </div>
                </div>   
            </div>  
        </>
    );
}

export {VistaPago};