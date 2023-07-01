import React, { useState } from "react";
import { Formik, Form, Field, ErrorMessage } from "formik";
import axios from "axios";
import { useNavigate } from "react-router-dom";
import Switch from '@mui/material/Switch';

function AgSerie() {

    const [errorDB, setErrorDB] = useState({});
    const [checked, setChecked] = useState(false);
    const navigate = useNavigate();

    const handleChange = e => {
        setChecked(e.target.checked);
    }

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
                            errores.titulo = 'Introduzca el titulo de la serie';
                        }
                        if (!val.fecha && !checked){
                            errores.fecha = 'Seleccione una fecha de creacion';
                        }
                        if (!val.compania && !checked){
                            errores.compania = 'Ingrese la compañia';
                        }
                        if ((!val.rating || isNaN(val.rating) || parseInt(val.rating) > 5 || parseInt(val.rating) < 1) && !checked ){
                            errores.rating = 'Ingrese un rating valido del 1 al 5';
                        }
                        if (!val.sinopsis && !checked){
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
                        const error = await (await axios.post('../api/buscSeries', {T_Serie: val.titulo, op: checked})).data;
                        setErrorDB(error);
                        if (!error.titulo){
                            await axios.post('../api/addRep2', {titulo: val.titulo, fecha: val.fecha, compania: val.compania, rating: val.rating, sinopsis: val.sinopsis, imagen: '1', episodios: val.episodios, creador: val.creador, canal: val.canal, tipo: val.tipo, op: checked});
                            navigate('/Rep2');
                        }
                    }}
                >
                    {({errors})=>(
                        <Form>
                            <div style={{display: 'flex', alignItems: 'center'}}>
                                <Switch checked={checked} onChange={handleChange} inputProps={{'aria-label': 'controlled'}}/>
                                <label>{checked ? 'Cambiar a modo Agregar Medio y Serie' : 'Cambiar a modo Agregar Solo Serie'}</label>
                            </div>
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
                                disabled={checked}
                            />
                            <ErrorMessage name="compania" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.compania}</div>)}/>
                            <Field 
                                type="text" 
                                placeholder="Compañia"
                                name="compania"
                                disabled={checked}
                            />
                            <ErrorMessage name="rating" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.rating}</div>)}/>
                            <Field 
                                type="text" 
                                placeholder="Rating de 1-5"
                                name="rating"
                                disabled={checked}
                            />
                            <ErrorMessage name="sinopsis" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.sinopsis}</div>)}/>
                            <Field 
                                type="textarea" 
                                placeholder="Sinopsis"
                                name="sinopsis"
                                disabled={checked}
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

export {AgSerie};