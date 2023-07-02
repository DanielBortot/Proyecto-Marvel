import React, { useEffect, useState } from "react";
import { Formik, Form, Field, ErrorMessage } from "formik";
import axios from "axios";
import { useNavigate } from "react-router-dom";

function AgCrea() {

    const [errorDB, setErrorDB] = useState({});
    const [objetos, setObjetos] = useState([]);
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

    const getObjetos = async (nombre) => {
        const obj = await (await axios.post('../api/buscObjPers',{nombrePers: nombre})).data;
        setObjetos(obj);
        setSelec(nombre);
    }

    return (
        <>
            <div className="tituloContReg">
                <h2 className="titulo">Agregar Creador de un Objeto</h2>
            </div>
            <div className="formContReg">
                <Formik
                    initialValues={{
                        nombrePers: '',
                        nombreObj: ''
                    }}
                    validate={(val)=>{
                        let errores = {};

                        if (!val.nombrePers || val.nombrePers === -1){
                            errores.nombrePers = 'Seleccione al personaje';
                        } else if (selec !== val.nombrePers){
                            getObjetos(val.nombrePers);
                        }
                        if (!val.nombreObj || val.nombreObj === -1){
                            errores.nombreObj = 'Seleccione el objeto';
                        }
                        return errores;
                    }}
                    onSubmit={ async (val)=> {
                        const error = await (await axios.post('../api/compObjPers', {nombrePers: val.nombrePers, nombreObj: val.nombreObj})).data;
                        setErrorDB(error);
                        if (!error.crea){
                            await axios.post('../api/addObjPers', {...val});
                            navigate('/');
                        }
                    }}
                >
                    {({errors})=>(
                        <Form>
                            {errorDB.crea && <div style={{fontSize: "15px", color: "red"}}>{errorDB.crea}</div>}
                            <ErrorMessage name="nombrePers" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.nombrePers}</div>)}/>
                            <Field type="text" name="nombrePers" as="select">
                                <option hidden selected value={-1}>Selecciona al personaje que desea relacionar</option>
                                {personajes.map(pers => (
                                    <option key={pers.Nombre} value={pers.Nombre}>{pers.Nombre}</option>
                                ))}
                            </Field>
                            <ErrorMessage name="nombreObj" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.nombreObj}</div>)}/>
                            <Field type="text" name="nombreObj" as="select">
                                <option hidden selected value={-1}>Selecciona el objeto que desea relacionar</option>
                                {objetos.map(obj => (
                                    <option key={obj.Nombre} value={obj.Nombre}>{obj.Nombre}</option>
                                ))}
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

export {AgCrea};