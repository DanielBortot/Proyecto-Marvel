import React from "react";
import { SideMenu } from "./sideMenu";
import { Link } from "react-router-dom";

function VistaPago () {
    return (
        <>
            <div class="container">
                <div class="row">
                    <div class="col-4 ">
                        <SideMenu/>
                    </div>
                    <div class="col-8">
                        <div class="tituloresumen">
                            <h1 class="p-15px">Tus formas de pago</h1>
                            <div class="p-15px resumenbar">
                                <h5>Numero de tarjeta</h5>
                                <p>Fecha Vencimiento</p>
                            </div>
                        </div>
                        <div>
                            <Link className='btn btn-danger' to={'/registro/tarjeta'}>Nueva Tarjeta</Link>
                            <button type="button" class="btn btn-danger m-3">Eliminar Tarjeta</button>
                        </div>
                    </div>
                </div>   
            </div>  
        </>
    );
}

export {VistaPago};