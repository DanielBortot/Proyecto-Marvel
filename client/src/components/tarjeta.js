import React from "react";
import { useSelector } from "react-redux";
import axios from "axios";
import {ErrorMessage, Field, Form, Formik} from "formik";
import { useDispatch } from "react-redux";
import { datosTarjeta } from "../reducers/tarjetaSlice"; 
import { datosUsuario } from "../reducers/usuarioSlice";
import { useNavigate } from "react-router-dom";

function Tarjeta () {
    const {descUsuario} = useSelector(state => state.usuario);
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
                        let tarjeta = await axios.post('/buscTarjeta',val);
                        if (!tarjeta){
                            await axios.post('/addTarjeta',{nTarjeta: val.tarjeta, codSeguridad: val.codigo, fechaVen: val.fecha}); 
                        }
                        dispatch(datosTarjeta({nTarjeta: val.tarjeta, codSeguridad: val.codigo, fechaVen: val.fecha}));
                        await axios.post('/register',{...descUsuario, nTarjeta: val.tarjeta});
                        dispatch(datosUsuario({...descUsuario, nTarjeta: val.tarjeta}));
                        navigate('/')
                    }}>
                        {({errors}) => (

                            <Form>

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