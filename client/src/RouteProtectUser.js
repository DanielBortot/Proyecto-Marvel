import React from "react";
import { Navigate, Outlet } from "react-router-dom";
import { useSelector } from "react-redux";

function RouteProtectUser ({redirectionTo='/inicioSesion'}) { 
    const {descUsuario} = useSelector(state => state.usuario);
    
    if (!descUsuario.Nombre){
        return <Navigate to={redirectionTo}/>
    }
    return <Outlet/>;
}

export {RouteProtectUser};