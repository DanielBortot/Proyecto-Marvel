import React, { useEffect, useState } from "react";
import { Formik, Form, Field, ErrorMessage } from "formik";
import axios from "axios";
import { useNavigate } from "react-router-dom";
import { useSelector } from "react-redux";

function ModSede() {

    const [errorDB, setErrorDB] = useState({});
    const {descReporte} = useSelector(state => state.reporte);
    const {Nombre, N_Org, Tipo_Edif, Ubicacion, Imagen} = descReporte;
    const navigate = useNavigate();

    return (
        <>
            <div className="tituloContReg">
                <h2 className="titulo">Modificar Sede</h2>
            </div>
            <div className="formContReg">
                <Formik
                    initialValues={{
                        nombreSede: Nombre,
                        tipoEdif: Tipo_Edif,
                        ubicacion: Ubicacion,
                        imagen: Imagen
                    }}
                    validate={(val)=>{
                        let errores = {};

                        if (!val.nombreSede){
                            errores.nombreSede = 'Escriba el nombre de la sede';
                        }
                        if (!val.ubicacion){
                            errores.ubicacion = 'Ingrese la ubicación de la sede';
                        }
                        if (!val.tipoEdif){
                            errores.tipoEdif = 'Ingrese el tipo de edificación de la sede';
                        }
                        return errores;
                    }}
                    onSubmit={ async (val)=> {
                        let error = {};
                        if (val.nombreSede !== Nombre){
                            error = await (await axios.post('../api/buscSedes', {nombreSede: val.nombreSede, nombreOrg: N_Org})).data;
                        }
                        setErrorDB(error);
                        if (!error.nombreSede){
                            await axios.put('../api/upSede', {...val, nombreOrg: N_Org, nombreSedeVie: Nombre});
                            navigate('/');
                        }
                    }}
                >
                    {({errors})=>(
                        <Form>
                            {errorDB.nombreSede && <div style={{fontSize: "15px", color: "red"}}>{errorDB.nombreSede}</div>}
                            <ErrorMessage name="nombreSede" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.nombreSede}</div>)}/>
                            <Field 
                                type="text" 
                                placeholder="Nombre de la Sede"
                                name="nombreSede"
                            />
                            <ErrorMessage name="tipoEdif" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.tipoEdif}</div>)}/>
                            <Field 
                                type="text" 
                                placeholder="Tipo de Edificación de la Sede"
                                name="tipoEdif"
                            />
                            <ErrorMessage name="ubicacion" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.ubicacion}</div>)}/>
                            <Field 
                                type="text" 
                                placeholder="Ubicación de la Sede"
                                name="ubicacion"
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

export {ModSede};