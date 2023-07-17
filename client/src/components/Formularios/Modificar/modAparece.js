import React, { useEffect, useState } from "react";
import { Formik, Form, Field, ErrorMessage } from "formik";
import axios from "axios";
import { useNavigate } from "react-router-dom";
import { useSelector } from "react-redux";

function ModAparece() {

    const {descReporte} = useSelector(state => state.reporte);
    const {N_Organizacion, N_Titulo, Estado, Rol} = descReporte;
    const navigate = useNavigate();

    return (
        <>
            <div className="tituloContReg">
                <h2 className="titulo">Modificar una Organización en un Medio</h2>
            </div>
            <div className="formContReg">
                <Formik
                    initialValues={{
                        rol: Rol,
                        estado: Estado
                    }}
                    validate={(val)=>{
                        let errores = {};

                        if (!val.rol || val.rol === -1){
                            errores.rol = 'Seleccione el rol de la organización en el medio';
                        }
                        if (!val.estado){
                            errores.estado = 'Seleccione el estado de la organización en el medio'
                        }
                        return errores;
                    }}
                    onSubmit={ async (val)=> {
                        await axios.put('../api/upOrgMedio', {...val, nombreOrg: N_Organizacion, titulo: N_Titulo});
                        navigate('/');
                    }}
                >
                    {({errors})=>(
                        <Form>
                            <ErrorMessage name="estado" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.estado}</div>)}/>
                            <Field 
                                type="text" 
                                placeholder="Estado de la Organización en el Medio"
                                name="estado"
                            />

                            <ErrorMessage name="rol" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.rol}</div>)}/>
                            <Field type="text" name="rol" as="select">
                                <option hidden selected value={-1}>Selecciona el rol de la organización en el medio</option>
                                <option value={'Protagonista'}>Protagonista</option>
                                <option value={'Antagonista'}>Antagonista</option>
                                <option value={'Secundario'}>Secundario</option>
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

export {ModAparece};