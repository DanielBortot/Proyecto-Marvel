import React, { useEffect, useState } from "react";
import { Formik, Form, Field, ErrorMessage } from "formik";
import axios from "axios";
import { useNavigate } from "react-router-dom";
import { Autocomplete, TextField } from "@mui/material";

function AgJuego() {

    const [errorDB, setErrorDB] = useState({});
    const [plataformas, setPlataformas] = useState([]);
    const [valPlat, setValPlat] = useState([]);
    const navigate = useNavigate();

    useEffect(()=> {
        const getPlataformas = async () => {
            const plat = await (await axios.get('../api/plataformas')).data;
            setPlataformas(plat);
        }
        getPlataformas();
    },[]);

    const handleChangePlat = (e, newValue) => {
        setValPlat(newValue);
    }

    return (
        <>
            <div className="tituloContReg">
                <h2 className="titulo">Agregar Juego</h2>
            </div>
            <div className="formContReg">
                <Formik
                    initialValues={{
                        titulo: '',
                        fecha: '',
                        compania: '',
                        rating: '',
                        sinopsis: '',
                        imagen: '73',
                        duracion: '',
                        suscripcion: ''
                    }}
                    validate={(val)=>{
                        let errores = {};

                        if (!val.titulo){
                            errores.titulo = 'Introduzca el titulo del juego';
                        }
                        if (!val.fecha){
                            errores.fecha = 'Seleccione una fecha de creacion';
                        }
                        if (!val.compania){
                            errores.compania = 'Ingrese la compañia';
                        }
                        if ((!val.rating || isNaN(val.rating) || parseInt(val.rating) > 5 || parseInt(val.rating) < 1)){
                            errores.rating = 'Ingrese un rating valido del 1 al 5';
                        }
                        if (!val.sinopsis){
                            errores.sinopsis = 'Ingrese la sinopsis del juego';
                        }
                        if (!val.distribuidor){
                            errores.distribuidor = 'Ingrese el nombre del distribuidor del juego';
                        }
                        if (!val.duracion || val.duracion === -1){
                            errores.duracion = 'Ingrese la duración del juego en minutos';
                        }
                        
                        if ((!val.suscripcion || isNaN(val.suscripcion) || parseInt(val.suscripcion) > 4 || parseInt(val.suscripcion) < 0)){
                            errores.suscripcion = 'Ingrese un rating valido del 0 al 4';
                        }

                        if (valPlat.length === 0){
                            errores.plataforma = 'Ingrese la plataforma del juego'
                        }
                        return errores;
                    }}
                    onSubmit={ async (val)=> {
                        const error = await (await axios.post('../api/buscJuegos', {T_Juego: val.titulo})).data;
                        setErrorDB(error);
                        if (!error.titulo){
                            await axios.post('../api/addMedioJuego', {...val, plataformas: valPlat});
                            navigate('/');
                        }
                    }}
                >
                    {({errors, handleBlur})=>(
                        <Form>
                            {errorDB.titulo && <div style={{fontSize: "15px", color: "red"}}>{errorDB.titulo}</div>}
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
                            <ErrorMessage name="distribuidor" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.distribuidor}</div>)}/>
                            <Field 
                                type="text" 
                                placeholder="Nombre del Distribuidor"
                                name="distribuidor"
                            />
                            
                            <ErrorMessage name="duracion" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.rating}</div>)}/>
                            <Field 
                                type="integer" 
                                placeholder="Duración"
                                name="duracion"
                            />

                            <ErrorMessage name="suscripcion" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.rating}</div>)}/>
                            <Field 
                                type="integer" 
                                placeholder="Suscripción del 0 - 4"
                                name="suscripcion"
                            />

                            <ErrorMessage name="plataforma" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.plataforma}</div>)}/>

                            <Autocomplete
                                multiple
                                limitTags={2}
                                id="plataforma"
                                options={plataformas}
                                getOptionLabel={(option) => option.nombre}
                                onChange={handleChangePlat}
                                onBlur={handleBlur}
                                renderInput={(params) => (
                                    <TextField {...params} label="" placeholder="Plataforma" />
                                )}
                                sx={{ width: '500px' }}
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

export {AgJuego};