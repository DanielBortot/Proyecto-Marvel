import React from "react";
import { useState } from "react";
import '../assets/registro.css';

function Register() {
    const [colores, setColores] = useState({p:'nselec',s:'nselec',t:'nselec',c:'nselec'});

    const enviar = e=> {
        e.preventDefault();
    }

    return (
        <>
            <div className="tituloContReg">
                <h2 className="titulo">Registrarse</h2>
            </div>
            <div className="formContReg">
                <form>
                    <input type="text" placeholder="Nombre"/>
                    <input type="text" placeholder="Apellido"/>
                    <input type="email" placeholder="Email"/>
                    <input type="password" placeholder="Contraseña"/>
                    <input type="password" placeholder="Repetir Contraseña"/>
                    <input type="date" placeholder="Fecha de nacimiento"/>
                    <p>Selecciona el servicio</p>
                    <div className="suscripcionReg">
                        <div className={`Reg${colores.p}`} onClick={()=>setColores({p:'selec',s:'nselec',t:'nselec',c:'nselec'})}>
                            <p>GOLD</p>
                            <p>5.99$</p>
                        </div>
                        <div className={`Reg${colores.s}`} onClick={()=>setColores({p:'nselec',s:'selec',t:'nselec',c:'nselec'})}>
                            <p>PREMIUM</p>
                            <p>9.99$</p>
                        </div>
                        <div className={`Reg${colores.t}`} onClick={()=>setColores({p:'nselec',s:'nselec',t:'selec',c:'nselec'})}>
                            <p>VIP</p>
                            <p>14.99$</p>
                        </div>
                        <div className={`Reg${colores.c}`} onClick={()=>setColores({p:'nselec',s:'nselec',t:'nselec',c:'selec'})}>
                            <p>GRATIS</p>
                            <p>0$</p>
                        </div>
                    </div>
                    <div className="botonReg">
                        <button type="submit" onClick={enviar}>Aceptar</button>
                    </div>
                </form>
            </div>
            
        </>
    );
}

export {Register};