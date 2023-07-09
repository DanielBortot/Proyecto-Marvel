import React, { useEffect, useState } from "react";
import { Formik, Form, Field, ErrorMessage } from "formik";
import axios from "axios";
import { useNavigate } from "react-router-dom";
import { Autocomplete, TextField } from "@mui/material";
import { useSelector } from "react-redux";

function ModJuego() {

    const [errorDB, setErrorDB] = useState({});
    const {descReporte} = useSelector(state => state.reporte);
    const {Fecha_Estreno, Compania, Rating, Sinopsis, T_Juego, plataformas, Distribuidor, Tipo, Imagen} = descReporte;
    const [listPlataformas, setListPlataformas] = useState([]);
    const [valPlat, setValPlat] = useState([]);
    const navigate = useNavigate();

    useEffect(()=> {
        const getPlataformas = async () => {
            const plat = await (await axios.get('../api/plataformas')).data;
            setListPlataformas(plat);
        }
        getPlataformas();
    },[]);

    const handleChangePlat = (e, newValue) => {
        setValPlat(newValue);
    }

    return (
        <>
            <div className="tituloContReg">
                <h2 className="titulo">Modificar Juego</h2>
            </div>
            <div className="formContReg">
                <Formik
                    initialValues={{
                        titulo: T_Juego,
                        fecha: Fecha_Estreno.slice(0,10),
                        compania: Compania,
                        rating: Rating,
                        sinopsis: Sinopsis,
                        imagen: Imagen,
                        distribuidor: Distribuidor,
                        tipo: Tipo
                    }}
                    validate={(val)=>{
                        let errores = {};

                        if (!val.titulo){
                            errores.titulo = 'Introduzca el titulo de la pelicula';
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
                            errores.sinopsis = 'Ingrese la sinopsis de la pelicula';
                        }
                        if (!val.distribuidor){
                            errores.distribuidor = 'Ingrese el nombre del distribuidor de la pelicula';
                        }
                        if (!val.tipo || val.tipo === -1){
                            errores.tipo = 'Ingrese el tipo de la pelicula';
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
                            await axios.post('../api/upMedioJuego', {...val, plataformas: valPlat, tituloVie: T_Juego});
                            navigate('/juegos');
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
                            
                            <ErrorMessage name="tipo" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.tipo}</div>)}/>

                            <Field type="text" name="tipo" as="select">
                                <option hidden selected value={-1}>Selecciona el tipo de la pelicula</option>
                                <option value={'Animacion'}>Animada</option>
                                <option value={'Live Action'}>Live Action</option>
                            </Field>

                            <ErrorMessage name="plataforma" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.plataforma}</div>)}/>

                            <Autocomplete
                                multiple
                                limitTags={2}
                                id="plataforma"
                                options={listPlataformas}
                                defaultValue={[...plataformas]}
                                getOptionLabel={(option) => option.nombre}
                                onChange={handleChangePlat}
                                onBlur={handleBlur}
                                renderInput={(params) => (
                                    <TextField {...params} label="" placeholder="Creadores" />
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

export {ModJuego};