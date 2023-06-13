import React from "react";
import { SideMenu } from "./sideMenu";
import { Link } from "react-router-dom";
import { useSelector } from "react-redux";

function VistaPago () {
    const {descTarjeta} = useSelector(state => state.tarjeta);
    return (
        <>
            <div className="container">
                <div className="row">
                    <div className="col-4 menubar">
                        <SideMenu/>
                    </div>
                    <div className="col-8">
                        <div className="tituloresumen">
                            <h1 className="p-15px">Tus formas de pago</h1>
                            <div className="p-15px resumenbar">
                                <h5>Numero de Tarjeta: {descTarjeta.N_Tarjeta ? descTarjeta.N_Tarjeta : 'No posee tarjeta'}</h5>
                                <p>Fecha de vencimiento: {descTarjeta.Fecha_Ven ? descTarjeta.Fecha_Ven : ''}</p>
                            </div>
                        </div>
                        <div>
                            <Link className='btn btn-danger' to={'/registro/tarjeta'}>Nueva Tarjeta</Link>
                            <button type="button" className="btn btn-danger m-3">Eliminar Tarjeta</button>
                        </div>
                    </div>
                </div>   
            </div>  
        </>
    );
}

export {VistaPago};