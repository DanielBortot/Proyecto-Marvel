import React, { useEffect } from "react";
import '../assets/registro.css';
import { Link } from "react-router-dom";
import { useState } from "react";
import { Formik, Form, Field, ErrorMessage } from "formik";
import axios from "axios";
import { useDispatch } from "react-redux";
import { datosUsuario, delUsuario } from "../reducers/usuarioSlice";
import { datosTarjeta, delTarjeta } from "../reducers/tarjetaSlice";
import { datosPerfil, delPerfiles } from "../reducers/perfilesSlice";
import { useNavigate } from "react-router-dom";
import { setCiudad, setEstado, setPais, delDireccion } from "../reducers/direccionSlice";
import { delSuscripcion } from "../reducers/suscripcionSlice";

function Login() {

    const [errorDB, setErrorDB] = useState({});
    const dispatch = useDispatch();
    const navigate = useNavigate();

    const addDireccion = async (Id_Ciudad) => {
        const ciudad = await (await axios.post('/api/setCiudad',{Id_Ciudad: Id_Ciudad})).data;
        const estado = await (await axios.post('/api/setEstado',{Id_Estado: ciudad[0].Id_Estado})).data;
        const pais = await (await axios.post('/api/setPais',{Id_Pais: estado[0].Id_Pais})).data;
        
        dispatch(setCiudad({Id_Ciudad: Id_Ciudad, Nombre: ciudad[0].Nombre}));
        dispatch(setEstado({Id_Estado: estado[0].Id_Estado, Nombre: estado[0].Nombre}));
        dispatch(setPais({Id_Pais: pais[0].Id_Pais, Nombre: pais[0].Nombre}));
    }
    useEffect(()=> {
        dispatch(delDireccion());
        dispatch(delUsuario());
        dispatch(delPerfiles());
        dispatch(delSuscripcion());
        dispatch(delTarjeta());
    },[]);

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
                        const usuario = await (await axios.post('/api/login',{Email: val.email, Contrasena: val.contra})).data;
                        if (usuario.length === 0){
                            setErrorDB({error: "Email o Contraseña incorrecto"});
                        }
                        else {
                            usuario.map(u => {
                                dispatch(datosUsuario({...u}));
                                addDireccion(u.Direccion);
                                return 0;
                            });
                            if (usuario[0].N_Tarjeta != null){
                                const tarjeta = await (await axios.post('/api/selecTarjeta',{N_Tarjeta: usuario[0].N_Tarjeta})).data;
                                tarjeta.map(t => dispatch(datosTarjeta({...t})));
                            }
                            
                            const perfiles = await (await axios.post('/api/perfiles',{Email: usuario[0].Email,op: false})).data;
                            if (perfiles.length !== 0){
                                perfiles.map(perfil => dispatch(datosPerfil({...perfil})));
                                navigate('/escogePerfil');
                            } else {
                                navigate('/perfil');
                            }
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