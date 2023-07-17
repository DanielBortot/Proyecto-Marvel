import React, { useEffect, useState } from "react";
import { Formik, Form, Field, ErrorMessage } from "formik";
import axios from "axios";
import { useNavigate } from "react-router-dom";

function AgPoseePers() {

    const [errorDB, setErrorDB] = useState({});
    const [poderes, setPoderes] = useState([]);
    const [personajes, setPersonajes] = useState([]);
    const [selec, setSelec] = useState('');
    const navigate = useNavigate();

    useEffect(()=> {
        const getPers = async () => {
            const pers = await (await axios.get('../api/personajes')).data;
            setPersonajes(pers);
        }
        getPers();
    })

    const getPoderes = async (nombre) => {
        const pod = await (await axios.post('../api/buscPodPers',{nombrePers: nombre})).data;
        setPoderes(pod);
        setSelec(nombre);
    }

    return (
        <>
            <div className="tituloContReg">
                <h2 className="titulo">Agregar Poder a Personaje</h2>
            </div>
            <div className="formContReg">
                <Formik
                    initialValues={{
                        nombrePers: '',
                        nombrePod: '',
                        obtencion: ''
                    }}
                    validate={(val)=>{
                        let errores = {};

                        if (!val.nombrePers || val.nombrePers === -1){
                            errores.nombrePers = 'Seleccione al personaje';
                        } else if (selec !== val.nombrePers){
                            getPoderes(val.nombrePers);
                        }
                        if (!val.nombrePod || val.nombrePod === -1){
                            errores.nombrePod = 'Seleccione el poder';
                        }
                        if (!val.obtencion || val.obtencion === -1){
                            errores.obtencion = 'Seleccione la obtención del poder';
                        }
                        
                        return errores;
                    }}
                    onSubmit={ async (val)=> {
                        const error = await (await axios.post('../api/compPodPers', {nombrePers: val.nombrePers, nombrePod: val.nombrePod})).data;
                        setErrorDB(error);
                        if (!error.posee){
                            await axios.post('../api/addPodPers', {...val});
                            if (window.location.pathname === '/poderes/AgPosee'){
                                navigate('/poderes')
                            } else {
                                navigate('/Rep6');
                            }
                        }
                    }}
                >
                    {({errors})=>(
                        <Form>
                            {errorDB.posee && <div style={{fontSize: "15px", color: "red"}}>{errorDB.posee}</div>}
                            <ErrorMessage name="nombrePers" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.nombrePers}</div>)}/>
                            <Field type="text" name="nombrePers" as="select">
                                <option hidden selected value={-1}>Selecciona al personaje que desea relacionar</option>
                                {personajes.map(pers => (
                                    <option key={pers.Nombre} value={pers.Nombre}>{pers.Nombre}</option>
                                ))}
                            </Field>
                            <ErrorMessage name="nombrePod" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.nombrePod}</div>)}/>
                            <Field type="text" name="nombrePod" as="select">
                                <option hidden selected value={-1}>Selecciona el poder que desea relacionar</option>
                                {poderes.map(pod => (
                                    <option key={pod.Nombre} value={pod.Nombre}>{pod.Nombre}</option>
                                ))}
                            </Field>
                            <ErrorMessage name="obtencion" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.obtencion}</div>)}/>
                            <Field type="text" name="obtencion" as="select">
                                <option hidden selected value={-1}>Selecciona la forma de obtención del poder</option>
                                <option value={'Hereditario'}>Heredado</option>
                                <option value={'Natural'}>Natural</option>
                                <option value={'Artificial'}>Artificial</option>
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

export {AgPoseePers};