import React, { useState } from "react";
import { useNavigate } from "react-router-dom";
import { Formik, Form, Field, ErrorMessage } from "formik";
import axios from "axios";
import { useSelector } from "react-redux";

function ModSerie () {
    const [errorDB, setErrorDB] = useState({});
    const {descReporte} = useSelector(state => state.reporte);
    const {T_Serie, Fecha_Estreno, Compania, Rating, Sinopsis, Imagen, N_Episodios, Creador, Canal, Tipo, Duracion, Suscripcion} = descReporte;
    const navigate = useNavigate();

    return (
        <>
            <div className="tituloContReg">
                <h2 className="titulo">Modificar Serie</h2>
            </div>
            <div className="formContReg">
                <Formik
                    initialValues={{
                        tituloNew: T_Serie,
                        fecha: Fecha_Estreno.slice(0,10),
                        compania: Compania,
                        rating: Rating,
                        sinopsis: Sinopsis,
                        imagen: Imagen,
                        episodios: N_Episodios,
                        creador: Creador,
                        canal: Canal,
                        tipo: Tipo,
                        duracion: Duracion,
                        suscripcion: Suscripcion
                    }}
                    validate={(val)=>{
                        let errores = {};

                        if (!val.tituloNew){
                            errores.tituloNew = 'Introduzca el título de la serie';
                        }
                        if (!val.fecha){
                            errores.fecha = 'Seleccione una fecha de creación';
                        }
                        if (!val.compania){
                            errores.compania = 'Ingrese la compañía';
                        }
                        if (!val.rating || isNaN(val.rating) || parseInt(val.rating) > 5 || parseInt(val.rating) < 1){
                            errores.rating = 'Ingrese un rating válido del 1 al 5';
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
                            errores.episodios = 'Ingrese un número de episodios válido';
                        }
                        if (!val.duracion || isNaN(val.duracion) || parseInt(val.duracion) < 1){
                            errores.duracion = 'Ingrese una duración válida en minutos';
                        }
                        if (!val.suscripcion || val.suscripcion === -1){
                            errores.suscripcion = 'Seleccione el tipo de suscripcion';
                        }
                        return errores;
                    }}
                    onSubmit={ async (val)=> {
                        let error = {}
                        if (val.tituloNew !== T_Serie){
                            error = await (await axios.post('../api/buscSeries', {T_Serie: val.tituloNew})).data;
                            setErrorDB(error);
                        }
                        if (!error.titulo){
                            await axios.put('../api/upRep2', {...val,titulo: T_Serie});
                            if (window.location.pathname === '/series/ModSerie'){
                                navigate('/series');
                            }
                            else {
                                navigate('/Rep2');
                            }
                        }
                    }}
                >
                    {({errors})=>(
                        <Form>
                            {errorDB.error && <div style={{fontSize: "15px", color: "red"}}>{errorDB.error}</div>}
                            <ErrorMessage name="tituloNew" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.tituloNew}</div>)}/>
                            <Field 
                                type="text" 
                                placeholder="Título"
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
                                placeholder="Compañía"
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
                            <ErrorMessage name="episodios" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.episodios}</div>)}/>
                            <Field 
                                type="text" 
                                placeholder="Número de Episodios"
                                name="episodios"
                            />
                            <ErrorMessage name="duracion" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.duracion}</div>)}/>
                            <Field 
                                type="text" 
                                placeholder="Duración de la Serie en Minutos"
                                name="duracion"
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

                            <ErrorMessage name="suscripcion" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.suscripcion}</div>)}/>
                            <Field type="text" name="suscripcion" as="select">
                                <option hidden selected value={-1}>Selecciona el tipo de suscripción de la serie</option>
                                <option value={1}>Gold</option>
                                <option value={2}>Premium</option>
                                <option value={3}>Vip</option>
                                <option value={4}>Free</option>
                            </Field>
                            
                            <ErrorMessage name="tipo" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.tipo}</div>)}/>

                            <Field type="text" name="tipo" as="select">
                                <option hidden selected value={-1}>Selecciona el tipo de la serie</option>
                                <option value={'Animacion'}>Animada</option>
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

export {ModSerie};