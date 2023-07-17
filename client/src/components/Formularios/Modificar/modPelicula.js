import React, { useState } from "react";
import { Formik, Form, Field, ErrorMessage } from "formik";
import axios from "axios";
import { useNavigate } from "react-router-dom";
import { useSelector } from "react-redux";

function ModPelicula() {

    const [errorDB, setErrorDB] = useState({});
    const {descReporte} = useSelector(state => state.reporte);
    const {T_Pelicula, Fecha_Estreno, Compania, Rating, Sinopsis, Imagen, Director, Distribuidor, Duracion, Tipo, Ganancia, Coste, Suscripcion} = descReporte;
    const navigate = useNavigate();

    return (
        <>
            <div className="tituloContReg">
                <h2 className="titulo">Modificar Película</h2>
            </div>
            <div className="formContReg">
                <Formik
                    initialValues={{
                        tituloNew: T_Pelicula,
                        fecha: Fecha_Estreno.slice(0,10),
                        compania: Compania,
                        rating: Rating,
                        sinopsis: Sinopsis,
                        imagen: Imagen,
                        director: Director,
                        distribuidor: Distribuidor,
                        duracion: Duracion,
                        tipo: Tipo,
                        coste: Coste,
                        ganancia: Ganancia,
                        suscripcion: Suscripcion
                    }}
                    validate={(val)=>{
                        let errores = {};

                        if (!val.tituloNew){
                            errores.tituloNew = 'Introduzca el título de la película';
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
                            errores.sinopsis = 'Ingrese la sinopsis de la película';
                        }
                        if (!val.director){
                            errores.director = 'Ingrese el nombre del director de la película';
                        }
                        if (!val.distribuidor){
                            errores.distribuidor = 'Ingrese el nombre del distribuidor de la película';
                        }
                        if (!val.duracion || isNaN(val.duracion) || parseInt(val.duracion) < 1){
                            errores.duracion = 'Ingrese una duración válida en minutos';
                        }
                        if (!val.ganancia || isNaN(val.ganancia) || parseInt(val.ganancia) < 0){
                            errores.ganancia = 'Ingrese una ganacia válida';
                        }
                        if (!val.coste || isNaN(val.coste) || parseInt(val.coste) < 0){
                            errores.coste = 'Ingrese un coste válido';
                        }
                        if (!val.tipo || val.tipo === -1){
                            errores.tipo = 'Ingrese el tipo de la película';
                        }
                        if (!val.suscripcion || val.suscripcion === -1){
                            errores.suscripcion = 'Seleccione el tipo de suscripción';
                        }
                        return errores;
                    }}
                    onSubmit={ async (val)=> {
                        let error = {}
                        if (val.tituloNew !== T_Pelicula){
                            error = await (await axios.post('../api/buscPeliculas', {T_Pelicula: val.tituloNew})).data;
                            setErrorDB(error);
                        }
                        if (!error.titulo){
                            await axios.put('../api/upRep5', {...val,titulo: T_Pelicula});
                            if (window.location.pathname === '/peliculas/ModPelicula'){
                                navigate('/peliculas');
                            }
                            else {
                                navigate('/Rep5');
                            }
                        }
                    }}
                >
                    {({errors})=>(
                        <Form>
                            {errorDB.error && <div style={{fontSize: "15px", color: "red"}}>{errorDB.error}</div>}
                            <ErrorMessage name="titulo" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.tituloNew}</div>)}/>
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
                                placeholder="Duracion de la Película en Minutos"
                                name="duracion"
                            />
                            <ErrorMessage name="ganancia" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.ganancia}</div>)}/>
                            <Field 
                                type="text" 
                                placeholder="Ganancia de la Película"
                                name="ganancia"
                            />
                            <ErrorMessage name="coste" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.coste}</div>)}/>
                            <Field 
                                type="text" 
                                placeholder="Coste de la Película"
                                name="coste"
                            />

                            <ErrorMessage name="suscripcion" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.suscripcion}</div>)}/>
                            <Field type="text" name="suscripcion" as="select">
                                <option hidden selected value={-1}>Selecciona el tipo de suscripción de la película</option>
                                <option value={1}>Gold</option>
                                <option value={2}>Premium</option>
                                <option value={3}>Vip</option>
                                <option value={4}>Free</option>
                            </Field>

                            <ErrorMessage name="tipo" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.tipo}</div>)}/>

                            <Field type="text" name="tipo" as="select">
                                <option hidden selected value={-1}>Selecciona el tipo de la película</option>
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

export {ModPelicula};