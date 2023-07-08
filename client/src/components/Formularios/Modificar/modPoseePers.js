import React, { useEffect, useState } from "react";
import { Formik, Form, Field, ErrorMessage } from "formik";
import axios from "axios";
import { useNavigate } from "react-router-dom";
import { useSelector } from "react-redux";

function ModPoseePers() {

    const {descReporte} = useSelector(state => state.reporte);
    const {N_Personaje, N_Poder, Obtencion} = descReporte;
    const navigate = useNavigate();

    return (
        <>
            <div className="tituloContReg">
                <h2 className="titulo">Modificar Poder en un Personaje</h2>
            </div>
            <div className="formContReg">
                <Formik
                    initialValues={{
                        obtencion: Obtencion
                    }}
                    validate={(val)=>{
                        let errores = {};

                        if (!val.obtencion || val.obtencion === -1){
                            errores.obtencion = 'Seleccione la obtencion del poder';
                        }
                        return errores;
                    }}
                    onSubmit={ async (val)=> {
                            await axios.put('../api/upPodPers', {...val, nombrePers: N_Personaje, nombrePod: N_Poder});
                            navigate('/');
                    }}
                >
                    {({errors})=>(
                        <Form>
                            <ErrorMessage name="obtencion" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.obtencion}</div>)}/>
                            <Field type="text" name="obtencion" as="select">
                                <option hidden selected value={-1}>Selecciona la forma de obtencion del poder</option>
                                <option value={'Hereditario'}>Heredado</option>
                                <option value={'Natural'}>Natural</option>
                                <option value={'Artificial'}>Artificial</option>
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

export {ModPoseePers};