import React from "react";
import { useState } from "react";
import '../assets/registro.css';
import axios from 'axios';
import { useDispatch } from "react-redux";
import { datosUsuario } from "../reducers/usuarioSlice";
import { Formik, Form, ErrorMessage, Field } from "formik";
import { useNavigate } from "react-router-dom";
import "../assets/img/imgSelect.js"

function Perfil (){
    const [erroresBD, setErroresBD] = useState({});
    const dispatch = useDispatch();
    const navigate = useNavigate();
    const imgPer = <imgSelect/>; 
    const [val, setVal] = useState(imgPer);
    return (
        <>
            <div className="tituloContReg"> {/* dispositivo, nombre, idioma, imagen*/}
                <h2 className="titulo">Crear nuevo perfil</h2>
            </div>

            <div className="formContReg">
                <Formik
                    initialValues={{
                        nombre: '',
                        idioma: '',
                        dispositivo: '',
                        imagen: ''
                    }}
                    validate={(val)=> {
                        let errores = {};
                        if (!val.nombre || !/^[a-zA-Z]{1,50}$/.test(val.nombre)){
                            errores.nombre = 'Introduzca un nombre valido';
                        }
                        return errores;
                    }}
                >
                    {({errors})=>(
                        <Form>
{/*
                            <Field type="text" placeholder="Imagen de perfil" name="imgperfil" as="select" value={val} onChange={e=>setVal(e.target.value)}>
                            {
                                imgPer.map(<option><img src={val}/></option>)
                            }
                            </Field>
*/}
                            {erroresBD.nombre && <div style={{fontSize: "15px", color: "red"}}>{erroresBD.nombre}</div>}
                            <ErrorMessage name="nombre" id="nombre" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.nombre}</div>)}/>

                            <Field type="text" placeholder="Nombre" name="nombre"/>

                            <Field type="text" placeholder="Idioma" name="idioma" as="select">
                            <option value='0'>Selecciona tu idioma</option>
                            </Field>
                            <Field type="text" placeholder="Dispositivo" name="dispositivo" as="select">
                            <option value='0'>Selecciona tu dispositivo</option>
                            </Field>             
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

export {Perfil}