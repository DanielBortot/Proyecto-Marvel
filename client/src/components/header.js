import React from "react";
import { Link } from "react-router-dom";
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faUser } from '@fortawesome/free-solid-svg-icons'
import '../assets/estilo.css';
import { useDispatch, useSelector } from "react-redux";
import { delUsuario } from "../reducers/usuarioSlice";
import { delPerfiles } from "../reducers/perfilesSlice";
import { delDireccion } from "../reducers/direccionSlice";
import { delSuscripcion } from "../reducers/suscripcionSlice";
import { delTarjeta } from "../reducers/tarjetaSlice";
import axios from "axios";

function Header (){
    const {descUsuario} = useSelector(state => state.usuario);
    const {perfilUso} = useSelector(state => state.perfiles);
    const dispatch = useDispatch();

    const delDatos = async () => {
        dispatch(delDireccion());
        dispatch(delUsuario());
        dispatch(delPerfiles());
        dispatch(delSuscripcion());
        dispatch(delTarjeta());
        await axios.get('/api/delSesion');
    }

    const otros = () => {
        if (descUsuario.Email === 'admin@gmail.com'){
            return (<Link className='custom-button btn btn-secondary px-4 py-4' to={'/otros'}>Otros</Link>);
        }
        else {
            return (<></>);
        }
    }

    const info = () => {
        if (descUsuario.Email === 'admin@gmail.com'){
            return (<></>);
        }
        else {
            return (<Link className='custom-button2 btn btn-secondary px-4 py-4' to={'/usuario/resumen'}><FontAwesomeIcon icon={faUser} style={{color: "#ffffff",width: 40,}} /></Link>);
        }
    }

    return (
        <div className="header" style={{height: '84px'}}>
            <div className="logo hed">FANATIC DB</div>
            <div className="botones hed">
                <li style={{listStyle: 'none'}}>
                    <Link className='custom-button btn btn-secondary px-4 py-4' to={'/'}>Inicio</Link>
                    <Link className='custom-button btn btn-secondary px-4 py-4' to={'/personajes'}>Personajes</Link>
                    <Link className='custom-button btn btn-secondary px-4 py-4' to={'/peliculas'}>Películas</Link>
                    <Link className='custom-button btn btn-secondary px-4 py-4' to={'/series'}>Series</Link>
                    <Link className='custom-button btn btn-secondary px-4 py-4' to={'/juegos'}>Juegos</Link>
                    {otros()}             
                </li>
            </div>
            <div className="inisesion hed">
                {(descUsuario.Nombre && perfilUso.Nombre) ? <Link className='custom-button2 btn btn-secondary px-4 py-4' to={'/inicioSesion'} onClick={()=>delDatos()}>Logout</Link> : <Link className='custom-button2 btn btn-secondary px-4 py-4' to={'/inicioSesion'}>Iniciar Sesión</Link>}
                {info()}
            </div>
        </div>
    );
}

export {Header};