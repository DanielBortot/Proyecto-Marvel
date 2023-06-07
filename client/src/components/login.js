import React from "react";
import '../assets/registro.css';
import { Link } from "react-router-dom";

function Login() {

    const enviar = e=> {
        e.preventDefault();
    }

    return (
        <>
            <div className="tituloContReg">
                <h2 className="titulo">Iniciar Sesión</h2>
            </div>
            <div className="formContReg">
                <form>
                    <input type="email" placeholder="Email"/>
                    <input type="password" placeholder="Contraseña"/>
                    <div className="botonReg" style={{marginTop: '30px'}}>
                        <button type="submit" onClick={enviar}>Iniciar Sesión</button>
                    </div>
                    <Link className="register" to={'/registro'}>Crear una cuenta en FanaticBD</Link>
                </form>
            </div>
            
        </>
    );
}

export {Login};