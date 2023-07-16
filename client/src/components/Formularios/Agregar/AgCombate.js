import React, { useEffect, useState } from "react";
import { Formik, Form, Field, ErrorMessage } from "formik";
import axios from "axios";
import { useNavigate } from "react-router-dom";

function AgCombate() {

    const [errorDB, setErrorDB] = useState({});
    const [personajes, setPersonajes] = useState([]);
    const [poderes, setPoderes] = useState([]);
    const [objetos, setObjetos] = useState([]);
    const [selec, setSelec] = useState('');
    const navigate = useNavigate();

    useEffect(()=> {
        const getHer = async () => {
            const pers = await (await axios.get('../api/personajes')).data;
            setPersonajes(pers);
        }
        getHer();
    })

    const getObjPod = async (nombre) => {
        const pods = await (await axios.post('../api/getPodPerso',{nombrePers: nombre})).data;
        const objs = await (await axios.post('../api/getObjPers',{nombrePers: nombre})).data;
        setPoderes(pods);
        setObjetos(objs);
        setSelec(nombre);
    }

    return (
        <>
            <div className="tituloContReg">
                <h2 className="titulo">Agregar Enfrentamiento</h2>
            </div>
            <div className="formContReg">
                <Formik
                    initialValues={{
                        nombrePers: '',
                        nombrePod: '',
                        nombreObj: '',
                        lugar: '',
                        fecha: ''
                    }}
                    validate={(val)=>{
                        let errores = {};

                        if (!val.nombrePers || val.nombrePers === -1){
                            errores.nombrePers = 'Seleccione al personaje';
                        } else if (selec !== val.nombrePers){
                            getObjPod(val.nombrePers);
                        }
                        if (!val.nombrePod || val.nombrePod === -1){
                            errores.nombrePod = 'Seleccione el poder ';
                        }
                        if (!val.nombreObj || val.nombreObj === -1){
                            errores.nombreObj = 'Seleccione el objeto';
                        }
                        if (!val.lugar){
                            errores.lugar = 'Escriba el lugar del combate';
                        }
                        if (!val.fecha){
                            errores.fecha = 'Seleccione la fecha del combate';
                        }
                        return errores;
                    }}
                    onSubmit={ async (val)=> {
                        const error = await (await axios.post('../api/compComb', {nombrePers: val.nombrePers, nombrePod: val.nombrePod, nombreObj: val.nombreObj, fecha: val.fecha})).data;
                        setErrorDB(error);
                        if (!error.combate){
                            await axios.post('../api/addComb', {...val});
                            navigate('/personajes');
                        }
                    }}
                >
                    {({errors})=>(
                        <Form>
                            {errorDB.combate && <div style={{fontSize: "15px", color: "red"}}>{errorDB.combate}</div>}

                            <ErrorMessage name="nombrePers" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.nombrePers}</div>)}/>
                            <Field type="text" name="nombrePers" as="select">
                                <option hidden selected value={-1}>Selecciona al personaje que desea relacionar</option>
                                {personajes.map(per => (
                                    <option key={per.Nombre} value={per.Nombre}>{per.Nombre}</option>
                                ))}
                            </Field>

                            <ErrorMessage name="nombrePod" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.nombrePod}</div>)}/>
                            <Field type="text" name="nombrePod" as="select">
                                <option hidden selected value={-1}>Selecciona el poder que desea relacionar</option>
                                {poderes.map(pod => (
                                    <option key={pod.N_Poder} value={pod.N_Poder}>{pod.N_Poder}</option>
                                ))}
                            </Field>

                            <ErrorMessage name="nombreObj" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.nombreObj}</div>)}/>
                            <Field type="text" name="nombreObj" as="select">
                                <option hidden selected value={-1}>Selecciona el objeto que desea relacionar</option>
                                {objetos.map(obj => (
                                    <option key={obj.Nombre} value={obj.Nombre}>{obj.Nombre}</option>
                                ))}
                            </Field>

                            <ErrorMessage name="lugar" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.lugar}</div>)}/>
                            <Field 
                                type="text" 
                                placeholder="Lugar del Combate"
                                name="lugar"
                            />

                            <ErrorMessage name="fecha" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.fecha}</div>)}/>
                            <Field 
                                type="date" 
                                placeholder="Fecha del Combate"
                                name="fecha"
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

export {AgCombate};