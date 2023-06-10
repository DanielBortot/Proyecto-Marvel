import React from "react";
import { useState } from "react";
import '../assets/registro.css';
import axios from 'axios';
import { createRef } from "react";
import { useDispatch } from "react-redux";
import { datosUsuario } from "../reducers/usuarioSlice";
import Selector from "./Selector";
import { Country } from "country-state-city";

function Register() {
    const [colores, setColores] = useState(['nselec','nselec','nselec','nselec']);
    const [datos, setDatos] = useState({nombre: null, apellido: null, email: null, contrasena: null, fechaNac: null, fechaCrea: null, idSus: null, direccion: null})
    const dispatch = useDispatch();

    const nombreRef = createRef();
    const apellidoRef = createRef();
    const emailRef = createRef();
    const contrasenaRef = createRef();
    const repContrasenaRef = createRef();
    const fechaNacRef = createRef();
    const direccionRef = createRef();

    const changeState = (idSus) => {
        setDatos({
            nombre: nombreRef.current.value,
            apellido: nombreRef.current.value,
            email: nombreRef.current.value,
            contrasena: nombreRef.current.value,
            fechaNac: fechaNacRef.current.value,
            fechaCrea: Date(),
            idSus: idSus,
            direccion: direccionRef.current.value
        })
    }

    const enviar = e=> {
        e.preventDefault();
        if (colores[3] === 'selec' || colores.find(col => col === 'selec') === undefined){

            changeState(3);
            
            axios.post('/register',{...datos, direccion: null, nTarjeta: null}).then(res => {
                console.log(res.data);
                dispatch(datosUsuario(datos))
            }).catch(err => {
                console.log(err);
            })
        }   
    }

    let countryData = Country.getAllCountries();

    const [country,setCountry] = useState(countryData[0]);



    return (
        <>
            <div className="tituloContReg">
                <h2 className="titulo">Registrarse</h2>
            </div>

            <div className="formContReg">

                <form>

                    <input type="text" placeholder="Nombre" ref={nombreRef}/>
                    <input type="text" placeholder="Apellido" ref={apellidoRef}/>
                    <input type="email" placeholder="Email" ref={emailRef}/>
                    <input type="password" placeholder="Contraseña" ref={contrasenaRef}/>
                    <input type="password" placeholder="Repetir Contraseña" ref={repContrasenaRef}/>
                    <input type="date" placeholder="Fecha de nacimiento" ref={fechaNacRef}/>
                    <div>
                        <Selector data={countryData} selected={country} setSelected={setCountry} />
                    </div>

                    <p>Selecciona el servicio</p>

                    <div className="suscripcionReg">

                        <div className={`Reg${colores[0]}`} onClick={()=>setColores(['selec','nselec','nselec','nselec'])}>
                            <p>GOLD</p>
                            <p>5.99$</p>
                        </div>

                        <div className={`Reg${colores[1]}`} onClick={()=>setColores(['nselec','selec','nselec','nselec'])}>
                            <p>PREMIUM</p>
                            <p>9.99$</p>
                        </div>

                        <div className={`Reg${colores[2]}`} onClick={()=>setColores(['nselec','nselec','selec','nselec'])}>
                            <p>VIP</p>
                            <p>14.99$</p>
                        </div>

                        <div className={`Reg${colores[3]}`} onClick={()=>setColores(['nselec','nselec','nselec','selec'])}>
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