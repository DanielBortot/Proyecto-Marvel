import React from "react";
import '../assets/registro.css';

function Login() {

    const enviar = e=> {
        e.preventDefault();
    }

    return (
        <>
            <div className="tituloContReg">
                <h2 className="titulo">Loguearse</h2>
            </div>
            <div className="formContReg">
                <form>
                    <input type="email" placeholder="Email"/>
                    <input type="password" placeholder="Contraseña"/>
                    <div className="botonReg" style={{marginTop: '30px'}}>
                        <button type="submit" onClick={enviar}>Aceptar</button>
                    </div>
                </form>
            </div>
            
        </>
    );
}

export {Login};