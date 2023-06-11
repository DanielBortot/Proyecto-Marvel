import React from "react";
import { useEffect, useState } from "react";
import '../assets/registro.css';
import axios from 'axios';
import { useDispatch } from "react-redux";
import { datosUsuario } from "../reducers/usuarioSlice";
import { Formik, Form, ErrorMessage, Field } from "formik";
import { useNavigate } from "react-router-dom";

function Register() {
    const [colores, setColores] = useState(['nselec','nselec','nselec','nselec']);
    const [erroresBD, setErroresBD] = useState({});
    const dispatch = useDispatch();
    const navigate = useNavigate();


    return (
        <>
            <div className="tituloContReg">
                <h2 className="titulo">Registrarse</h2>
            </div>

            <div className="formContReg">
                <Formik
                    initialValues={{
                        nombre: '',
                        apellido: '',
                        email: '',
                        contra: '',
                        repContra: '',
                        fecha: ''
                    }}
                    validate={(val)=> {
                        let errores = {};
                        if (!val.nombre || !/^[a-zA-Z]{1,50}$/.test(val.nombre)){
                            errores.nombre = 'Introduzca un nombre valido';
                        }
                        if (!val.apellido || !/^[a-zA-Z]{1,50}$/.test(val.apellido)){
                            errores.apellido = 'Introduzca un apellido valido';
                        }
                        if (!val.email || !/^[-\w.%+]{1,64}@(?:[A-Z0-9-]{1,63}\.){1,125}[A-Z]{2,63}$/i.test(val.email)){
                            errores.email = 'Introduzca un email valido';
                        }
                        if (!val.contra){
                            errores.contra = 'Introduzca una contraseña valido';
                        }
                        if (!val.repContra){
                            errores.repContra = 'Repita la contraseña';
                        } else if (val.contra !== val.repContra) {
                            errores.repContra = 'La contraseña no es la misma';
                        }
                        if (!val.fecha){
                            errores.fecha = 'Introduzca la fecha de nacimiento';
                        }
                        return errores;
                    }}
                    onSubmit={async (val)=>{
                        setErroresBD(await axios.post('/buscTarjeta',{email: val.email, nombre: val.nombre, apellido: val.apellido}));
                        const date = new Date();
                        if (!erroresBD.nombre && !erroresBD.apellido && !erroresBD.email){
                            const col = colores.findIndex(c => c ==='selec');
                            if (col === -1 || col === 0){
                                await axios.post('/register',{nombre: val.nombre, apellido: val.apellido, email: val.email, contrasena: val.contra, direccion: null, nTarjeta: null, idSus: 1, fechaCrea: date.toLocaleDateString()});

                                dispatch(datosUsuario({nombre: val.nombre, apellido: val.apellido, email: val.email, contrasena: val.contra, direccion: null, nTarjeta: null, idSus: 1, fechaCrea: date.toLocaleDateString()}));
                                navigate('/');

                            } else {
                                dispatch(datosUsuario({nombre: val.nombre, apellido: val.apellido, email: val.email, contrasena: val.contra, direccion: null, nTarjeta: null, idSus: col+1, fechaCrea: date.toLocaleDateString()}));
                                navigate('/registro/tarjeta');
                            }
                        }
                    }}
                >
                    {({errors})=>(
                        <Form>
                            {erroresBD.nombre && <div style={{fontSize: "15px", color: "red"}}>{erroresBD.nombre}</div>}
                            <ErrorMessage name="nombre" id="nombre" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.nombre}</div>)}/>

                            <Field type="text" placeholder="Nombre" name="nombre"/>

                            {erroresBD.apellido && <div style={{fontSize: "15px", color: "red"}}>{erroresBD.apellido}</div>}
                            <ErrorMessage name="apellido" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.apellido}</div>)}/>

                            <Field type="text" placeholder="Apellido" name="apellido"/>

                            {erroresBD.email && <div style={{fontSize: "15px", color: "red"}}>{erroresBD.email}</div>}
                            <ErrorMessage name="email" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.email}</div>)}/>
                            
                            <Field type="email" placeholder="Email" name="email"/>

                            <ErrorMessage name="contra" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.contra}</div>)}/>

                            <Field type="password" placeholder="Contraseña" name="contra"/>

                            <ErrorMessage name="repContra" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.repContra}</div>)}/>

                            <Field type="password" placeholder="Repetir Contraseña" name="repContra"/>

                            <ErrorMessage name="fecha" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.fecha}</div>)}/>

                            <Field type="date" placeholder="Fecha de nacimiento" name="fecha"/>
                            
                            <Field type="text" placeholder="Pais" name="pais" as="select">
                            <option value='0'>Selecciona el pais</option>
                            </Field>
                            <Field type="text" placeholder="Estado" name="estado" as="select">
                            <option value='0'>Selecciona el estado</option>
                            </Field>   
                            <Field type="text" placeholder="Ciudad" name="ciudad" as="select">
                            <option value='0'>Selecciona la ciudad</option>
                            </Field>      
                                
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
                                <button type="submit">Aceptar</button>
                            </div>
                        </Form>
                    )} 
                </Formik>
            </div>
            
        </>
    );
}

export {Register};