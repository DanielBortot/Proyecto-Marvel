import React, { useState } from "react";
import { Formik, Form, Field, ErrorMessage } from "formik";
import axios from "axios";
import { useNavigate } from "react-router-dom";

function AgSerie() {

    const [errorDB, setErrorDB] = useState({})
    const navigate = useNavigate();

    return (
        <>
            <div className="tituloContReg">
                <h2 className="titulo">Agregar Serie</h2>
            </div>
            <div className="formContReg">
                <Formik
                    initialValues={{
                        titulo: '',
                        fecha: '',
                        compania: '',
                        rating: '',
                        sinopsis: '',
                        imagen: '',
                        episodios: '',
                        creador: '',
                        canal: '',
                        tipo: ''
                    }}
                    validate={(val)=>{
                        let errores = {};

                        if (!val.titulo){
                            errores.titulo = 'Introduzca un titulo de la serie';
                        }
                        if (!val.fecha){
                            errores.fecha = 'Seleccione una fecha de creacion';
                        }
                        if (!val.compa){
                            errores.compania = 'Ingrese la compañia';
                        }
                        if (!val.rating || isNaN(val.rating) || parseInt(val.rating) > 5 || parseInt(val.rating) < 1){
                            errores.rating = 'Ingrese un rating valido del 1 al 5';
                        }
                        if (!val.sinopsis){
                            errores.sinopsis = 'Ingrese la sinopsis de la serie';
                        }
                        if (!val.creador){
                            errores.creador = 'Ingrese el nombre del creador de la serie';
                        }
                        if (!val.canal){
                            errores.canal = 'Ingrese el nombre del canal donde se transmite la serie';
                        }
                        if (!val.tipo || val.tipo === -1){
                            errores.tipo = 'Ingrese el tipo de la serie';
                        }
                        if (!val.episodios || isNaN(val.episodios) || parseInt(val.episodios) < 1){
                            errores.episodios = 'Ingrese un numero de episodios valido';
                        }
                        return errores;
                    }}
                    onSubmit={ async (val)=> {
                        const error = await (await axios.post('../api/buscSeries', {T_Serie: val.titulo})).data;
                        setErrorDB(error);
                        if (!error.titulo){
                            await axios.post('../api/addRep2', {titulo: val.titulo, fecha: val.fecha, compania: val.compania, rating: val.rating, sinopsis: val.sinopsis, imagen: 'aaaaa', episodios: val.episodios, creador: val.creador, canal: val.canal, tipo: val.tipo});
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
                            <ErrorMessage name="fecha" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.fecha}</div>)}/>
                            <Field 
                                type="date" 
                                placeholder="Fecha Estreno"
                                name="fecha"
                            />
                            <ErrorMessage name="compania" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.compania}</div>)}/>
                            <Field 
                                type="text" 
                                placeholder="Compañia"
                                name="compania"
                            />
                            <ErrorMessage name="rating" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.rating}</div>)}/>
                            <Field 
                                type="text" 
                                placeholder="Rating de 1-5"
                                name="rating"
                            />
                            <ErrorMessage name="sinopsis" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.sinopsis}</div>)}/>
                            <Field 
                                type="textarea" 
                                placeholder="Sinopsis"
                                name="sinopsis"
                            />
                            <ErrorMessage name="episodios" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.episodios}</div>)}/>
                            <Field 
                                type="text" 
                                placeholder="Numero de Episodios"
                                name="episodios"
                            />
                            <ErrorMessage name="creador" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.creador}</div>)}/>
                            <Field 
                                type="text" 
                                placeholder="Nombre del Creador"
                                name="creador"
                            />
                            <ErrorMessage name="canal" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.canal}</div>)}/>
                            <Field 
                                type="text" 
                                placeholder="Nombre del Canal"
                                name="canal"
                            />
                            <ErrorMessage name="tipo" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.tipo}</div>)}/>

                            <Field type="text" name="tipo" as="select">
                                <option hidden selected value={-1}>Selecciona el tipo de la serie</option>
                                <option value={'Animada'}>Animada</option>
                                <option value={'Live Action'}>Live Action</option>
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

export {AgSerie};