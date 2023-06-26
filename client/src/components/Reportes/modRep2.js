import React, { useState } from "react";
import { useNavigate } from "react-router-dom";
import { Formik, Form, Field, ErrorMessage } from "formik";
import axios from "axios";
import { useSelector } from "react-redux";
import ue from "underscore";

function ModRep2 () {
    const [errorDB, setErrorDB] = useState({});
    const {descReporte} = useSelector(state => state.reporte);
    const {titulo, fecha, compania, rating, sinopsis, imagen, episodios, creador, canal, tipo} = descReporte;
    const navigate = useNavigate();

    return (
        <>
            <div className="tituloContReg">
                <h2 className="titulo">Agregar Serie</h2>
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
                        episodios: episodios,
                        creador: creador,
                        canal: canal,
                        tipo: tipo
                    }}
                    validate={(val)=>{
                        let errores = {};

                        if (!val.tituloNew){
                            errores.tituloNew = 'Introduzca el titulo de la serie';
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
                        let error = {}
                        if (val.tituloNew !== titulo){
                            error = await (await axios.post('../api/buscSeries', {T_Serie: val.tituloNew})).data;
                            setErrorDB(error);
                        }
                        if(ue.isEqual(val, descReporte)){
                            navigate('/Rep2');
                        }
                        else if (!error.titulo){
                            await axios.put('../api/upRep2', {...val,titulo: titulo});
                            navigate('/Rep2');
                        }
                    }}
                >
                    {({errors})=>(
                        <Form>
                            {errorDB.error && <div style={{fontSize: "15px", color: "red"}}>{errorDB.error}</div>}
                            <ErrorMessage name="tituloNew" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.tituloNew}</div>)}/>
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

export {ModRep2};