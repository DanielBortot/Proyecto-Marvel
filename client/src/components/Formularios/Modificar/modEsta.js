import React, { useEffect, useState } from "react";
import { Formik, Form, Field, ErrorMessage } from "formik";
import axios from "axios";
import { useNavigate } from "react-router-dom";
import { useSelector } from "react-redux";

function ModEsta() {

    const {descReporte} = useSelector(state => state.reporte);
    const {N_Titulo, N_Personaje, Tipo_Actor, Actor, Rol} = descReporte
    const navigate = useNavigate();
    return (
        <>
            <div className="tituloContReg">
                <h2 className="titulo">Modificar un Personaje en un Medio</h2>
            </div>
            <div className="formContReg">
                <Formik
                    initialValues={{
                        tipoAct: Tipo_Actor,
                        rol: Rol,
                        nombreAct: Actor
                    }}
                    validate={(val)=>{
                        let errores = {};

                        if (!val.rol || val.rol === -1){
                            errores.rol = 'Seleccione el rol del personaje en el medio';
                        }
                        if (!val.tipoAct || val.tipoAct === -1){
                            errores.tipoAct = 'Seleccione el tipo de actor del personaje';
                        }
                        if (!val.nombreAct){
                            errores.nombreAct = 'Ingrese el nombre del actor';
                        }
                        return errores;
                    }}
                    onSubmit={ async (val)=> {
                        
                        await axios.put('../api/upPersMedio', {...val, nombrePers: N_Personaje, titulo: N_Titulo});
                        navigate('/');
                    }}
                >
                    {({errors})=>(
                        <Form>
                            <ErrorMessage name="rol" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.rol}</div>)}/>
                            <Field type="text" name="rol" as="select">
                                <option hidden selected value={-1}>Selecciona el rol del personaje en el medio</option>
                                <option value={'Protagonista'}>Protagonista</option>
                                <option value={'Antagonista'}>Antagonista</option>
                                <option value={'Secundario'}>Secundario</option>
                            </Field>

                            <ErrorMessage name="nombreAct" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.nombreAct}</div>)}/>
                            <Field 
                                type="text" 
                                placeholder="Nombre del actor que interpreta al personaje"
                                name="nombreAct"
                            />

                            <ErrorMessage name="tipoAct" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.tipoAct}</div>)}/>
                            <Field type="text" name="tipoAct" as="select">
                                <option hidden selected value={-1}>Selecciona el tipo de actor</option>
                                <option value={'Interpretado'}>Interpretado</option>
                                <option value={'Presta su voz'}>Presta su voz</option>
                            </Field>

                            <div className="botonReg" style={{marginTop: '30px'}}>
                                <button type="submit">Guardar</button>
                            </div>
                        </Form>
                    )}
                </Formik>
            </div>
        </>
    );
}

export {ModEsta};