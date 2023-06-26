import React, { useState } from "react";
import { Formik, Form, Field, ErrorMessage } from "formik";
import axios from "axios";
import { useNavigate } from "react-router-dom";
import { useSelector } from "react-redux";
import ue from "underscore";

function ModRep5() {

    const [errorDB, setErrorDB] = useState({});
    const {descReporte} = useSelector(state => state.reporte);
    const {titulo, fecha, compania, rating, sinopsis, imagen, director, distribuidor, duracion, tipo, ganancia, coste} = descReporte;
    const navigate = useNavigate();

    return (
        <>
            <div className="tituloContReg">
                <h2 className="titulo">Agregar Pelicula</h2>
            </div>
            <div className="formContReg">
                <Formik
                    initialValues={{
                        tituloNew: titulo,
                        fecha: fecha.slice(0,10),
                        compania: compania,
                        rating: rating,
                        sinopsis: sinopsis,
                        imagen: imagen,
                        director: director,
                        distribuidor: distribuidor,
                        duracion: duracion,
                        tipo: tipo,
                        coste: coste,
                        ganancia: ganancia
                    }}
                    validate={(val)=>{
                        let errores = {};

                        if (!val.tituloNew){
                            errores.tituloNew = 'Introduzca el titulo de la pelicula';
                        }
                        if (!val.fecha){
                            errores.fecha = 'Seleccione una fecha de creacion';
                        }
                        if (!val.compania){
                            errores.compania = 'Ingrese la compañia';
                        }
                        if (!val.rating || isNaN(val.rating) || parseInt(val.rating) > 5 || parseInt(val.rating) < 1){
                            errores.rating = 'Ingrese un rating valido del 1 al 5';
                        }
                        if (!val.sinopsis){
                            errores.sinopsis = 'Ingrese la sinopsis de la pelicula';
                        }
                        if (!val.director){
                            errores.director = 'Ingrese el nombre del director de la pelicula';
                        }
                        if (!val.distribuidor){
                            errores.distribuidor = 'Ingrese el nombre del distribuidor de la pelicula';
                        }
                        if (!val.duracion || isNaN(val.duracion) || parseInt(val.duracion) < 1){
                            errores.duracion = 'Ingrese una duracion valida en minutos';
                        }
                        if (!val.ganancia || isNaN(val.ganancia) || parseInt(val.ganancia) < 0){
                            errores.ganancia = 'Ingrese una ganacia valida';
                        }
                        if (!val.coste || isNaN(val.coste) || parseInt(val.coste) < 0){
                            errores.coste = 'Ingrese un coste valido';
                        }
                        if (!val.tipo || val.tipo === -1){
                            errores.tipo = 'Ingrese el tipo de la pelicula';
                        }
                        return errores;
                    }}
                    onSubmit={ async (val)=> {
                        let error = {}
                        if (val.tituloNew !== titulo){
                            error = await (await axios.post('../api/buscPeliculas', {T_Pelicula: val.tituloNew})).data;
                            setErrorDB(error);
                        }
                        if(ue.isEqual(val, descReporte)){
                            navigate('/Rep5');
                        }
                        else if (!error.titulo){
                            await axios.put('../api/upRep5', {...val,titulo: titulo});
                            navigate('/Rep5');
                        }
                    }}
                >
                    {({errors})=>(
                        <Form>
                            {errorDB.error && <div style={{fontSize: "15px", color: "red"}}>{errorDB.error}</div>}
                            <ErrorMessage name="titulo" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.tituloNew}</div>)}/>
                            <Field 
                                type="text" 
                                placeholder="Titulo"
                                name="tituloNew"
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
                                type="text" 
                                placeholder="Sinopsis"
                                name="sinopsis"
                            />
                            <ErrorMessage name="director" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.director}</div>)}/>
                            <Field 
                                type="text" 
                                placeholder="Nombre del Director"
                                name="director"
                            />
                            <ErrorMessage name="distribuidor" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.distribuidor}</div>)}/>
                            <Field 
                                type="text" 
                                placeholder="Nombre del Distribuidor"
                                name="distribuidor"
                            />
                            <ErrorMessage name="duracion" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.duracion}</div>)}/>
                            <Field 
                                type="text" 
                                placeholder="Duracion de la Pelicula en Minutos"
                                name="duracion"
                            />
                            <ErrorMessage name="ganancia" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.ganancia}</div>)}/>
                            <Field 
                                type="text" 
                                placeholder="Ganancia de la Pelicula"
                                name="ganancia"
                            />
                            <ErrorMessage name="coste" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.coste}</div>)}/>
                            <Field 
                                type="text" 
                                placeholder="Coste de la Pelicula"
                                name="coste"
                            />
                            <ErrorMessage name="tipo" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.tipo}</div>)}/>

                            <Field type="text" name="tipo" as="select">
                                <option hidden selected value={-1}>Selecciona el tipo de la pelicula</option>
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

export {ModRep5};