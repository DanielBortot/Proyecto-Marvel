import axios from "axios";
import React, { useEffect } from "react";
import { useSelector } from "react-redux";

function VistaInicio () {
    const {descUsuario} = useSelector(state => state.usuario);
    const {perfilUso, descPerfil} = useSelector(state => state.perfiles);
    const {descTarjeta} = useSelector(state => state.tarjeta);
    const {Pais, Estado, Ciudad} = useSelector(state => state.direccion);
    
    useEffect(()=> {
        const sesion = async () => {
            const {perfiles} = await (await axios.get('/api/getSesion')).data;
            if (!perfiles || perfiles.length === 0){
                await axios.post('/api/sesion',{descUsuario: descUsuario, descPerfil: descPerfil, perfilUso: perfilUso, descTarjeta: descTarjeta, ciudad: Ciudad, estado: Estado, pais: Pais});
            }
        }
        sesion();
    }, []);

    return (
        <h1>Inicio</h1>
    );
}

export {VistaInicio};