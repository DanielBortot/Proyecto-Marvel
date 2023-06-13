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
                                <h5>Tipo de Suscripcion{descSuscripcion.Tipo}</h5>
                                <p> Descripcion de la Suscripcion{descSuscripcion.Descripcion}</p>
                                <h4>Costo de la Suscripcion: {descSuscripcion.Tarifa}$</h4>
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