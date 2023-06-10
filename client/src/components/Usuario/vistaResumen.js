import React from "react";
import { SideMenu } from "./sideMenu";
import '../../assets/usuario.css';

function VistaResumen () {
    return (
        <>               
                <SideMenu/>
            
            <div className="resumenbar">
                <div className="tituloresumen">
                    <h1>Perfiles</h1>
                </div>
            </div>
        </>
    );
}

export {VistaResumen};