import React, { useState, useEffect } from "react";
import { Formik, Form, Field, ErrorMessage } from "formik";
import axios from "axios";
import { useNavigate } from "react-router-dom";
import { useSelector } from "react-redux";


function ModRep6() {
    const [errorDB, setErrorDB] = useState({});
    const {descReporte} = useSelector(state => state.reporte);
    const {nombrePod,imagenPod,descripcion} = descReporte;
    const navigate = useNavigate();

    return (
        <>
            <div className="tituloContReg">
                <h2 className="titulo">Agregar Relacion entre Villano y Poder</h2>
            </div>
            <div className="formContReg">
                <Formik
                    initialValues={{
                        nombrePodNew: nombrePod,
                        imagenPod: imagenPod,
                        descripcion: descripcion,
                    }}
                    validate={(val)=>{
                        let errores = {};

                        if (!val.nombrePodNew){
                            errores.nombrePodNew = 'Ingresa o selecciona el nombre del poder';
                        }
                        if (!val.descripcion){
                            errores.descripcion = 'Ingresa la descripcion del poder';
                        }
                        return errores;
                    }}
                    onSubmit={ async (val)=> {
                        let error ={};
                        if (val.nombrePodNew !== nombrePod){
                            const e = await (await axios.post('../api/compPod',{nombrePod: val.nombrePodNew})).data;
                            error = {...error,...e};
                            setErrorDB(error);
                        }
                        if (!error.poder){
                            await axios.post('../api/upRep6', {...val});
                            navigate('/Rep6');
                        }
                    }}
                >
                    {({errors})=>(
                        <Form>
                            <ErrorMessage name="nombrePodNew" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.nombrePodNew}</div>)}/>

                            {errorDB.poder && <div style={{fontSize: "15px", color: "red"}}>{errorDB.poder}</div>}
                            <Field 
                                type="text" 
                                placeholder="Nombre del Poder"
                                name="nombrePodNew"
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

export {ModRep6};