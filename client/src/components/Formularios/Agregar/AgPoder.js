import React, { useEffect, useState } from "react";
import { Formik, Form, Field, ErrorMessage } from "formik";
import axios from "axios";
import { useNavigate } from "react-router-dom";

function AgPoder() {

    const navigate = useNavigate();

    return (
        <>
            <div className="tituloContReg">
                <h2 className="titulo">Agregar Poder</h2>
            </div>
            <div className="formContReg">
                <Formik
                    initialValues={{
                        nombrePod: '',
                        imagenPod: '1',
                        descripcion: ''
                        
                    }}
                    validate={(val)=>{
                        let errores = {};

                        if (!val.nombrePod){
                            errores.nombrePod = 'Ingresa un nombre de poder';
                        }
                        if (!val.descripcion){
                            errores.descripcion = 'Ingresa la descripcion del poder';
                        }
                        return errores;
                    }}
                    onSubmit={ async (val)=> {
                        const error = await (await axios.post('../api/compPod', {nombrePod: val.nombrePod})).data;
                        setErrorDB(error);
                        if (!error.poder){
                            await axios.post('../api/addPoder', {...val});
                            navigate('/');
                        }
                    }}
                >
                    {({errors})=>(
                        <Form>
                            
                            {errorDB.poder && <div style={{fontSize: "15px", color: "red"}}>{errorDB.poder}</div>}
                            <ErrorMessage name="nombrePod" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.nombrePod}</div>)}/>

                            <Field 
                                type="text" 
                                placeholder="Nombre del Poder"
                                name="nombrePod"
                            />
                            <ErrorMessage name="descripcion" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.descripcion}</div>)}/>
                            <Field 
                                type="text" 
                                placeholder="Descripcion del Poder"
                                name="descripcion"
                            />

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

export {AgPoder};