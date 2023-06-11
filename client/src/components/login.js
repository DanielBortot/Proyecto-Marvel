import React from "react";
import '../assets/registro.css';
import { Link } from "react-router-dom";
import { useState } from "react";
import { Formik, Form, Field, ErrorMessage } from "formik";
import axios from "axios";
import { useDispatch } from "react-redux";
import { datosUsuario } from "../reducers/usuarioSlice";
import { datosTarjeta } from "../reducers/tarjetaSlice";
import { useNavigate } from "react-router-dom";

function Login() {

    const [errorDB, setErrorDB] = useState({});
    const dispatch = useDispatch();
    const navigate = useNavigate();

    return (
        <>
            <div className="tituloContReg">
                <h2 className="titulo">Iniciar Sesión</h2>
            </div>
            <div className="formContReg">
                <Formik
                    initialValues={{
                        email: '',
                        contra: ''
                    }}
                    validate={(val)=>{
                        let errores = {};

                        if (!val.email || !/^[-\w.%+]{1,64}@(?:[A-Z0-9-]{1,63}\.){1,125}[A-Z]{2,63}$/i.test(val.email)){
                            errores.email = 'Introduzca un email valido';
                        }
                        if (!val.contra){
                            errores.contra = 'Introduzca una contraseña valido';
                        }
                    }}
                    onSubmit={ async (val)=> {
                        const usuario = await axios.post('/login',{email: val.email, contrasena: val.contrasena});
                        if (usuario.length === 0){
                            setErrorDB({error: "Email o Contraseña incorrecto"});
                        }
                        else {
                            usuario.map(u => dispatch(datosUsuario({...u})));
                            if (usuario[0].N_Tarjeta != null){
                                const tarjeta = await axios.post('/selecTarjeta',{nTarjeta: usuario[0].N_Tarjeta});
                                tarjeta.map(t => dispatch(datosTarjeta(...t)));
                            }
                            navigate('/');
                        }
                    }}
                >
                    {({errors})=>(
                        <Form>
                            {errorDB.error && <div style={{fontSize: "15px", color: "red"}}>{errorDB.error}</div>}
                            <ErrorMessage name="email" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.email}</div>)}/>
                            <Field 
                                type="text" 
                                placeholder="Email"
                                name="email"
                            />
                            <ErrorMessage name="nombre" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.contra}</div>)}/>
                            <Field 
                                type="password" 
                                placeholder="Contraseña"
                                name="contra"
                            />
                            <div className="botonReg" style={{marginTop: '30px'}}>
                                <button type="submit">Iniciar Sesión</button>
                            </div>
                            <Link className="register" to={'/registro'}>Crear una cuenta en FanaticBD</Link>
                        </Form>
                    )}
                </Formik>
            </div>
            
        </>
    );
}

export {Login};