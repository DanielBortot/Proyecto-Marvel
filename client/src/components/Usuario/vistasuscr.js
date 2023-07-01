import React from "react";
import { SideMenu } from "./sideMenu";
import { useSelector } from "react-redux";
import { Link } from "react-router-dom";

function VistaSuscr () {
    const {descSuscripcion} = useSelector(state => state.suscripcion);
    return (
        <>
            <div className="container">
                <div className="row">
                    <div className="col-4 menubar">
                        <SideMenu/>
                    </div>
                    <div className="col-8">
                        <div className="tituloresumen">
                            <h1 className="p-15px">Suscripción actual</h1>
                            <div className="p-15px resumenbar">
                                <h5><span style={{fontWeight: 'bold'}}>Tipo de Suscripción:</span> {descSuscripcion.Tipo}</h5>
                                <p><span style={{fontWeight: 'bold'}}>Descripcion de la Suscripción:</span> {descSuscripcion.Descripcion}</p>
                                <h4><span style={{fontWeight: 'bold'}}>Tarifa de la Suscripción:</span> {descSuscripcion.Tarifa}$</h4>
                            </div>
                        </div>
                        <Link to={'modSus'} className="btn btn-danger mt-5">Cambiar de suscripción</Link>
                    </div> 
                </div>   
            </div>   
        </>
    );
}

export {VistaSuscr};