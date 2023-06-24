import React, { useState } from "react";
import { useNavigate, useParams } from "react-router-dom";
import { Formik, Form, Field, ErrorMessage } from "formik";
import axios from "axios";

function ModRep2 () {
    const [errorDB, setErrorDB] = useState({});
    const {tituloP, episodiosP} = useParams();
    const navigate = useNavigate();

    return (
        <>
            <div className="tituloContReg">
                <h2 className="titulo">Cambiar informacion</h2>
            </div>
            <div className="formContReg">
                <Formik
                    initialValues={{
                        titulo: tituloP,
                        episodios: episodiosP
                    }}
                    validate={(val)=>{
                        let errores = {};

                        if (!val.titulo){
                            errores.titulo = 'Introduzca un titulo';
                        }
                        if (!val.episodios || isNaN(val.episodios) || parseInt(val.episodios) < 1){
                            errores.episodios = 'Ingrese un numero de episodios valido';
                        }
                    }}
                    onSubmit={ async (val)=> {
                        let error = {}
                        if (val.titulo !== tituloP){
                            error = await (await axios.post('../api/buscSeries', {T_Serie: val.titulo})).data;
                            setErrorDB(error);
                        }
                        if (val.titulo === tituloP && val.episodios === episodiosP){
                            navigate('/Rep2');
                        }
                        else if (!error.titulo){
                            await axios.put('../api/upSerie', {T_SerieNew: val.titulo, T_Serie: tituloP, Episodios: val.episodios});
                            navigate('/Rep2');
                        }
                    }}
                >
                    {({errors})=>(
                        <Form>
                            {errorDB.error && <div style={{fontSize: "15px", color: "red"}}>{errorDB.error}</div>}
                            <ErrorMessage name="titulo" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.titulo}</div>)}/>
                            <Field 
                                type="text" 
                                placeholder="Titulo"
                                name="titulo"
                            />
                            <ErrorMessage name="episodios" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.episodios}</div>)}/>
                            <Field 
                                type="text" 
                                placeholder="Numero de Episodios"
                                name="episodios"
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

export {ModRep2};