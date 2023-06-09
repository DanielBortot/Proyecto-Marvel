import React from "react";
import '../assets/registro.css';
import { Link } from "react-router-dom";
import { useState } from "react";

function Login() {

    const [email, setEmail] = useState("")
    const [password, setPassword] = useState("")

    return (
        <>
            <div className="tituloContReg">
                <h2 className="titulo">Iniciar Sesión</h2>
            </div>
            <div className="formContReg">
                <form>
                    <input 
                        type="text" 
                        placeholder="Email"
                        value={email}
                        onChange={e => setEmail(e.target.value)}
                    />
                    <input 
                        type="password" 
                        placeholder="Contraseña"
                        value={password}
                        onChange={e => setPassword(e.target.value)}
                    />
                    <div className="botonReg" style={{marginTop: '30px'}}>
                        <button type="submit">Iniciar Sesión</button>
                    </div>
                    <Link className="register" to={'/registro'}>Crear una cuenta en FanaticBD</Link>
                </form>
            </div>
            
        </>
    );
}

export {Login};