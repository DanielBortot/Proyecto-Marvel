import React, { useEffect, useState } from "react";
import { Formik, Form, Field, ErrorMessage } from "formik";
import axios from "axios";
import { useNavigate } from "react-router-dom";

function AgEsta() {

    const [errorDB, setErrorDB] = useState({});
    const [medios, setMedios] = useState([]);
    const [personajes, setPersonajes] = useState([]);
    const [selec, setSelec] = useState('');
    const navigate = useNavigate();

    useEffect(()=> {
        const getPersonajes = async () => {
            const pers = await (await axios.get('../api/personajes')).data;
            setPersonajes(pers);
        }
        getPersonajes();
    },[])

    const getMedios = async (nombre) => {
        const meds = await (await axios.post('../api/buscPersMedio',{nombrePers: nombre})).data;
        setMedios(meds);
        setSelec(nombre);
    }

    return (
        <>
            <div className="tituloContReg">
                <h2 className="titulo">Agregar un Personaje a un Medio</h2>
            </div>
            <div className="formContReg">
                <Formik
                    initialValues={{
                        nombrePers: '',
                        titulo: '',
                        tipoAct: '',
                        rol: '',
                        nombreAct: ''
                    }}
                    validate={(val)=>{
                        let errores = {};

                        if (!val.nombrePers || val.nombrePers === -1){
                            errores.nombrePers = 'Seleccione el personaje';
                        } else if (selec !== val.nombrePers){
                            getMedios(val.nombrePers);
                        }
                        if (!val.titulo || val.titulo === -1){
                            errores.titulo = 'Seleccione el titulo del medio';
                        }
                        if (!val.rol || val.rol === -1){
                            errores.rol = 'Seleccione el rol del personaje en el medio';
                        }
                        if (!val.tipoAct || val.tipoAct === -1){
                            errores.tipoAct = 'Seleccione el tipo de actor del personaje';
                        }
                        if (!val.nombreAct){
                            errores.nombreAct = 'Ingrese el nombre del actor';
                        }
                        return errores;
                    }}
                    onSubmit={ async (val)=> {
                        const error = await (await axios.post('../api/compPersMedio', {nombrePers: val.nombrePers, titulo: val.titulo})).data;
                        setErrorDB(error);
                        if (!error.esta){
                            await axios.post('../api/addPersMedio', {...val});
                            navigate('/');
                        }
                    }}
                >
                    {({errors})=>(
                        <Form>
                            {errorDB.esta && <div style={{fontSize: "15px", color: "red"}}>{errorDB.esta}</div>}
                            <ErrorMessage name="nombrePers" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.nombrePers}</div>)}/>
                            <Field type="text" name="nombrePers" as="select">
                                <option hidden selected value={-1}>Selecciona el personaje que desea relacionar</option>
                                {personajes.map(org => (
                                    <option key={org.Nombre} value={org.Nombre}>{org.Nombre}</option>
                                ))}
                            </Field>

                            <ErrorMessage name="titulo" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.titulo}</div>)}/>
                            <Field type="text" name="titulo" as="select">
                                <option hidden selected value={-1}>Selecciona el medio que desea relacionar</option>
                                {medios.map(med => (
                                    <option key={med.Titulo} value={med.Titulo}>{med.Titulo}</option>
                                ))}
                            </Field>

                            <ErrorMessage name="rol" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.rol}</div>)}/>
                            <Field type="text" name="rol" as="select">
                                <option hidden selected value={-1}>Selecciona el rol del personaje en el medio</option>
                                <option value={'Protagonista'}>Protagonista</option>
                                <option value={'Antagonista'}>Antagonista</option>
                                <option value={'Secundario'}>Secundario</option>
                            </Field>

                            <ErrorMessage name="nombreAct" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.nombreAct}</div>)}/>
                            <Field 
                                type="text" 
                                placeholder="Nombre del actor que interpreta al personaje"
                                name="nombreAct"
                            />

                            <ErrorMessage name="tipoAct" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.tipoAct}</div>)}/>
                            <Field type="text" name="tipoAct" as="select">
                                <option hidden selected value={-1}>Selecciona el tipo de actor</option>
                                <option value={'Interpretado'}>Interpretado</option>
                                <option value={'Presta su voz'}>Presta su voz</option>
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

export {AgEsta};