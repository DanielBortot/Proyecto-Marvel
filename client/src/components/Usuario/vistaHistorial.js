import React from "react";
import '../../assets/usuario.css';
import { SideMenu } from "./sideMenu";

function VistaHistorial () {
    return (
        <>
            <div className="container">
                <div className="row">
                    <div className="col-4 menubar">
                        <SideMenu/>
                    </div>
                    <div className="col-8">
                        <div className="tituloresumen">
                            <h1 className="p-15px">Historial</h1>
                            <div className="p-15px resumenbar">
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