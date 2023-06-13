import React from "react";
import { SideMenu } from "./sideMenu";

function VistaSuscr () {
    return (
        <>
           <div className="container">
                <div className="row">
                    <div className="col-4 menubar">
                        <SideMenu/>
                    </div>
                    <div className="col-8">
                        <div className="tituloresumen">
                            <h1 className="p-15px">Suscripcion actual</h1>
                            <div className="p-15px resumenbar">
                                <h5>Titulo</h5>
                                <p>Detalles de la suscripcion</p>
                                <h4>Coste</h4>
                            </div>
                        </div>
                        <button type="button" className="btn btn-danger mt-5">Cambiar de suscripcion</button>
                    </div>
                </div>   
            </div>   
        </>
    );
}

export {VistaSuscr};