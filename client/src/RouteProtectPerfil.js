import React from "react";
import { useSelector } from "react-redux";
import { Navigate, Outlet } from "react-router-dom";

function RouteProtectPerfil ({redirectionTo='/inicioSesion'}) {
    const {perfilUso} = useSelector(state => state.perfiles);
    if (!perfilUso.Nombre){
        return <Navigate to={redirectionTo}/>
    }
    return <Outlet/>
}

export {RouteProtectPerfil};