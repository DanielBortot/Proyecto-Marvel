import React, { useEffect, useState } from "react";
import { Formik, Form, Field, ErrorMessage } from "formik";
import axios from "axios";
import { useNavigate } from "react-router-dom";

function AgPertenece() {

    const [errorDB, setErrorDB] = useState({});
    const [organizaciones, setOrganizaciones] = useState([]);
    const [personajes, setPersonajes] = useState([]);
    const [cargos, setCargos] = useState([]);
    const [selec, setSelec] = useState('');
    const navigate = useNavigate();

    useEffect(()=> {
        const getPers = async () => {
            const pers = await (await axios.get('../api/personajes')).data;
            const cargs = await (await axios.get('../api/getCargo')).data;
    
            setPersonajes(pers);
            setCargos(cargs);
        }
        getPers();
    })

    const getOrganizaciones = async (nombre) => {
        const orgs = await (await axios.post('../api/buscOrgPers',{nombrePers: nombre})).data;
        setOrganizaciones(orgs);
        setSelec(nombre);
    }

    return (
        <>
            <div className="tituloContReg">
                <h2 className="titulo">Agregar Personaje a Organizacion</h2>
            </div>
            <div className="formContReg">
                <Formik
                    initialValues={{
                        nombrePers: '',
                        nombreOrg: '',
                        cargo: ''
                    }}
                    validate={(val)=>{
                        let errores = {};

                        if (!val.nombrePers || val.nombrePers === -1){
                            errores.nombrePers = 'Seleccione al personaje';
                        } else if (selec !== val.nombrePers){
                            getOrganizaciones(val.nombrePers);
                        }
                        if (!val.nombreOrg || val.nombreOrg === -1){
                            errores.nombreOrg = 'Seleccione la organizacion';
                        }
                        if (!val.cargo || val.cargo === -1){
                            errores.cargo = 'Seleccione el cargo del personaje en la organizacion';
                        }
                        
                        return errores;
                    }}
                    onSubmit={ async (val)=> {
                        const error = await (await axios.post('../api/compOrgPers', {nombrePers: val.nombrePers, nombreOrg: val.nombreOrg})).data;
                        setErrorDB(error);
                        if (!error.pertenece){
                            await axios.post('../api/addOrgPers', {...val});
                            navigate('/');
                        }
                    }}
                >
                    {({errors})=>(
                        <Form>
                            {errorDB.pertenece && <div style={{fontSize: "15px", color: "red"}}>{errorDB.pertenece}</div>}
                            <ErrorMessage name="nombrePers" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.nombrePers}</div>)}/>
                            <Field type="text" name="nombrePers" as="select">
                                <option hidden selected value={-1}>Selecciona al personaje que desea relacionar</option>
                                {personajes.map(pers => (
                                    <option key={pers.Nombre} value={pers.Nombre}>{pers.Nombre}</option>
                                ))}
                            </Field>
                            <ErrorMessage name="nombreOrg" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.nombreOrg}</div>)}/>
                            <Field type="text" name="nombreOrg" as="select">
                                <option hidden selected value={-1}>Selecciona la organizacion que desea relacionar</option>
                                {organizaciones.map(pod => (
                                    <option key={pod.Nombre} value={pod.Nombre}>{pod.Nombre}</option>
                                ))}
                            </Field>
                            <ErrorMessage name="cargo" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.cargo}</div>)}/>
                            <Field type="text" name="cargo" as="select">
                                <option hidden selected value={-1}>Selecciona el cargo que posee el personaje</option>
                                {cargos.map(car => (
                                    <option key={car.Nombre} value={car.Cod_Cargo}>{car.Descripcion}</option>
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

export {AgPertenece};