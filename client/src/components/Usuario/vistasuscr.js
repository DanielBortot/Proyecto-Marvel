import React from "react";
import { SideMenu } from "./sideMenu";
import { useSelector } from "react-redux";

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
                            <h1 className="p-15px">Suscripcion actual</h1>
                            <div className="p-15px resumenbar">
                                <h5><span style={{fontWeight: 'bold'}}>Tipo de Suscripcion:</span> {descSuscripcion.Tipo}</h5>
                                <p><span style={{fontWeight: 'bold'}}>Descripcion de la Suscripcion:</span> {descSuscripcion.Descripcion}</p>
                                <h4><span style={{fontWeight: 'bold'}}>Tarifa de la Suscripcion:</span> {descSuscripcion.Tarifa}$</h4>
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