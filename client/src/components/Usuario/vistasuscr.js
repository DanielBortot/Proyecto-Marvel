import React from "react";
import { SideMenu } from "./sideMenu";

function VistaSuscr () {
    return (
        <>
           <div class="container">
                <div class="row">
                    <div class="col-4 ">
                        <SideMenu/>
                    </div>
                    <div class="col-8">
                        <div class="tituloresumen">
                            <h1 class="p-15px">Suscripcion actual</h1>
                            <div class="p-15px resumenbar">
                                <h5>Titulo</h5>
                                <p>Detalles de la suscripcion</p>
                                <h4>Coste</h4>
                            </div>
                        </div>
                        <button type="button" class="btn btn-danger mt-5">Cambiar de suscripcion</button>
                    </div>
                </div>   
            </div>   
        </>
    );
}

export {VistaSuscr};