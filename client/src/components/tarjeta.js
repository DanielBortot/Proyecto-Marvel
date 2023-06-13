import React, { useState } from "react";
import { useSelector } from "react-redux";
import axios from "axios";
import { ErrorMessage, Field, Form, Formik } from "formik";
import { useDispatch } from "react-redux";
import { datosTarjeta } from "../reducers/tarjetaSlice"; 
import { datosUsuario } from "../reducers/usuarioSlice";
import { useNavigate } from "react-router-dom";

function Tarjeta () {
    const {descUsuario} = useSelector(state => state.usuario);
    const {perfilUso} = useSelector(state => state.perfiles);
    const [errorDB, setErrorDB] = useState({});
    const dispatch = useDispatch();
    const navigate = useNavigate();

    return (
        <>
            <div className="tituloContReg">
                <h2 className="titulo">Ageregar Tarjeta</h2>
            </div>

            <div className="formContReg">
                <Formik
                    initialValues={{
                        tarjeta: '',
                        codigo: '',
                        fecha: ''
                    }}
                    validate={({tarjeta,codigo,fecha}) => {
                        let errores = {};
                        if (!tarjeta || !/^[0-9]{12,12}$/.test(tarjeta)){
                            errores.tarjeta = 'Ingrese un numero de tarjeta';
                        }
                        if (!codigo || isNaN(codigo) || parseInt(codigo) < 100 || parseInt(codigo) > 999 ){
                            errores.codigo = 'Ingrese un codigo de tarjeta valido';
                        }
                        if (!fecha){
                            errores.fecha = 'Ingrese una fecha de vencimiento de la tarjeta';
                        }
                        return errores;
                    }}
                    onSubmit={async (val) => {
                        let tarjeta = await (await axios.post('../api/buscTarjeta',{N_Tarjeta: val.tarjeta, Cod_Seguridad: val.codigo, Fecha_Ven: val.fecha})).data;
                        
                        if (!tarjeta){
                            await axios.post('../api/addTarjeta',{N_Tarjeta: val.tarjeta, Cod_Seguridad: val.codigo, Fecha_Ven: val.fecha}); 
                            dispatch(datosTarjeta({N_Tarjeta: val.tarjeta, Cod_Seguridad: val.codigo, Fecha_Ven: val.fecha}));
                            dispatch(datosUsuario({...descUsuario, N_Tarjeta: val.tarjeta}));
                        }
                        if (!perfilUso.Nombre){
                            await axios.post('../api/register',{...descUsuario, N_Tarjeta: val.tarjeta});
                            dispatch(datosTarjeta({N_Tarjeta: val.tarjeta, Cod_Seguridad: val.codigo, Fecha_Ven: val.fecha}));
                            dispatch(datosUsuario({...descUsuario, N_Tarjeta: val.tarjeta}));
                            navigate('/perfil');
                        } 
                        else if (!tarjeta.errTarj){
                            await axios.put('../api/upUsuTarj', {N_Tarjeta: val.tarjeta, Email: descUsuario.Email});
                            dispatch(datosTarjeta({N_Tarjeta: val.tarjeta, Cod_Seguridad: val.codigo, Fecha_Ven: val.fecha}));
                            dispatch(datosUsuario({...descUsuario, N_Tarjeta: val.tarjeta}));
                            navigate('/')
                        }
                        setErrorDB(tarjeta);
                    }}>
                        {({errors}) => (

                            <Form>
                                {errorDB.errTarj && <div style={{fontSize: "15px", color: "red"}}>{errorDB.errTarj}</div>}
                                <ErrorMessage name="tarjeta" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.tarjeta}</div>)}/>

                                <Field type="text" id="tarjeta" name="tarjeta" placeholder="Numero de Tarjeta"/>

                                <ErrorMessage name="codigo" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.codigo}</div>)}/>

                                <Field type="text" id="codigo" name="codigo" placeholder="Codigo de Seguridad"/>

                                <ErrorMessage name="fecha" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.fecha}</div>)}/>

                                <Field type="date" id="fecha" name="fecha" placeholder="Fecha de Vencimiento"/>
                            
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

export {Tarjeta};