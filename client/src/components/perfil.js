import React from "react";
import { useState } from "react";
import '../assets/registro.css';
import axios from 'axios';
import { useDispatch } from "react-redux";
import { datosUsuario } from "../reducers/usuarioSlice";
import { Formik, Form, ErrorMessage, Field } from "formik";
import { useNavigate } from "react-router-dom";
import { imagenPerfil } from "../assets/img/imgSelect";
import "../assets/perfil.css"

function Perfil (){
    const dispatch = useDispatch();
    const navigate = useNavigate();
    const [val, setVal] = useState(imagenPerfil[0].img);
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

                            <div className="perfilCont">

                                {imagenPerfil.map(i => (
                                    <div key={i.pos} className="imgPerfil">
                                        <textarea style={{opacity: '0', cursor: 'default'}} onClick={()=>setVal(i.img)}></textarea>
                                        <img src={i.img} key={i.pos}></img>
                                    </div>
                                ))}

                            </div>

                            <ErrorMessage name="nombre" id="nombre" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.nombre}</div>)}/>

                            <Field type="text" placeholder="Nombre" name="nombre"/>

                            <Field type="text" placeholder="Idioma" name="idioma" as="select">
                            <option value='0'>Selecciona tu idioma</option>
                            </Field>
                            <Field type="text" placeholder="Dispositivo" name="dispositivo" as="select">
                            <option value='0'>Selecciona tu dispositivo</option>
                            </Field>
                            <img src={val}></img>            
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