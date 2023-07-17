import React from "react";
import { useState } from "react";
import '../../assets/registro.css';
import axios from 'axios';
import { useDispatch } from "react-redux";
import { useSelector } from "react-redux";
import { datosPerfil, setPerfil } from "../../reducers/perfilesSlice";
import { Formik, Form, ErrorMessage, Field } from "formik";
import { useNavigate } from "react-router-dom";
import { imagenPerfil } from "../../assets/img/imgSelect";
import "../../assets/perfil.css"

function Perfil (){
    const dispatch = useDispatch();
    const navigate = useNavigate();
    const {descUsuario} = useSelector(state => state.usuario);
    const {descPerfil} = useSelector(state => state.perfiles);
    const [imagen, setImagen] = useState(imagenPerfil[0]);
    const numPerf = descPerfil.length === 5;
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
                        if (numPerf){
                            errores.nombre = 'Ya posee el máximo numero de usuarios posibles';
                            return errores;
                        }
                        if (!val.nombre || !/^[a-zA-Z]{1,50}$/.test(val.nombre)){
                            errores.nombre = 'Introduzca un nombre válido';
                        } else {
                            descPerfil.map(perfil => {
                                if (perfil.Nombre === val.nombre){
                                    errores.nombre = 'Ya posee un perfil con ese nombre';
                                }
                            })
                        }
                        if (!val.idioma){
                            errores.idioma = 'Seleccione un idioma';
                        }
                        if (!val.dispositivo){
                            errores.dispositivo = 'Seleccione un dispositivo';
                        }
                        return errores;
                    }}
                    onSubmit={ async (val)=> {
                        
                        await axios.post('/api/addPerfil',{Dispositivo: val.dispositivo, Nombre: val.nombre, Idioma: val.idioma, Email: descUsuario.Email, Imagen: imagen.pos});
                        dispatch(datosPerfil({Dispositivo: val.dispositivo, Nombre: val.nombre, Idioma: val.idioma, Email: descUsuario.Email, Imagen: imagen.pos}));
                        dispatch(setPerfil({Dispositivo: val.dispositivo, Nombre: val.nombre, Idioma: val.idioma, Email: descUsuario.Email, Imagen: imagen.pos}));
                        navigate('/');
                    }}
                >
                    {({errors})=>(
                        <Form>

                            <div className="perfilCont">

                                {imagenPerfil.map(i => (
                                    <div key={i.pos} className="imgPerfil">
                                        <textarea style={{opacity: '0', cursor: 'default', resize: 'none'}} onClick={()=>setImagen(i)} maxLength={0}></textarea>
                                        <img src={i.img} alt="" key={i.pos}></img>
                                    </div>
                                ))}

                            </div>
                            
                            <ErrorMessage name="nombre" id="nombre" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.nombre}</div>)}/>

                            <Field type="text" placeholder="Nombre" name="nombre"/>
                            
                            <ErrorMessage name="idioma" id="idioma" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.idioma}</div>)}/>

                            <Field type="text" placeholder="Idioma" name="idioma" as="select">
                            <option hidden selected>Selecciona tu idioma</option>
                            <option value='Espanol'>Español</option>
                            <option value='Ingles'>Ingles</option>
                            <option value='Chino'>Chino</option>
                            <option value='Frances'>Frances</option>
                            <option value='Portugues'>Portugues</option>
                            </Field>

                            <ErrorMessage name="dispositivo" id="dispositivo" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.dispositivo}</div>)}/>

                            <Field type="text" placeholder="Dispositivo" name="dispositivo" as="select">
                            <option hidden selected>Selecciona tu dispositivo</option>
                            <option value='Telefono'>Teléfono</option>
                            <option value='Tablet'>Tablet</option>
                            <option value='Televisor'>Televisor</option>
                            <option value='Computadora'>Computadora</option>
                            </Field>
                            <img src={imagen.img} alt=""></img>            
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