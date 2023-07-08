import React, { useEffect, useState } from "react";
import { Formik, Form, Field, ErrorMessage } from "formik";
import axios from "axios";
import { useNavigate } from "react-router-dom";
import { useSelector } from "react-redux";

function ModOrganizacion() {

    const [errorDB, setErrorDB] = useState({});
    const {descReporte} = useSelector(state => state.reporte);
    const {Eslogan, Fundador, Lider, Lugar_Creacion, Nom_Comic, Nombre, Objetivo, Tipo, Imagen} = descReporte;
    const [personajes, setPersonajes] = useState([]);
    const navigate = useNavigate();

    useEffect(()=> {
        const getDatos = async () => {
            const pers = await (await axios.get('../api/personajes')).data;
            setPersonajes(pers);
        }
        getDatos();
    },[])

    return (
        <>
            <div className="tituloContReg">
                <h2 className="titulo">Modificar Organizacion</h2>
            </div>
            <div className="formContReg">
                <Formik
                    initialValues={{
                        nombreOrg: Nombre,
                        eslogan: Eslogan,
                        lider: Lider,
                        fundador: Fundador,
                        tipo: Tipo,
                        lugarCrea: Lugar_Creacion,
                        comic: Nom_Comic,
                        objetivo: Objetivo,
                        imagen: Imagen
                    }}
                    validate={(val)=>{
                        let errores = {};

                        if (!val.nombreOrg){
                            errores.nombreOrg = 'Introduzca el nombre de la organizacion';
                        }
                        if (!val.eslogan){
                            errores.eslogan = 'Escriba el eslogan de la organizacion';
                        }
                        if (!val.lider || val.lider === -1){
                            errores.lider = 'Seleccione al lider de la organizacion';
                        }
                        if (!val.fundador || val.fundador === -1){
                            errores.fundador = 'Seleccione al fundador de la organizacion';
                        }
                        if (!val.lugarCrea){
                            errores.lugarCrea = 'Ingrese el lugar de creacion de la organizacion';
                        }
                        if (!val.tipo){
                            errores.tipo = 'Ingrese el tipo de organizacion';
                        }
                        if (!val.comic){
                            errores.comic = 'Ingrese el comic de su primera aparicion';
                        }
                        if (!val.objetivo){
                            errores.objetivo = 'Ingrese el objetivo de la organizacion';
                        }
                        
                        return errores;
                    }}
                    onSubmit={ async (val)=> {
                        let error = {};
                        if (val.nombreOrg !== Nombre){
                            error = await (await axios.post('../api/buscOrg', {nombreOrg: val.nombreOrg})).data;
                        }
                        setErrorDB(error);
                        if (!error.nombreOrg){
                            await axios.put('../api/upOrg', {...val, nombreOrgVie: Nombre});
                            navigate('/');
                        }
                    }}
                >
                    {({errors})=>(
                        <Form>
                            {errorDB.nombreObj && <div style={{fontSize: "15px", color: "red"}}>{errorDB.nombreObj}</div>}
                            <ErrorMessage name="nombreOrg" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.nombreOrg}</div>)}/>
                            <Field 
                                type="text" 
                                placeholder="Nombre de la Organizacion"
                                name="nombreOrg"
                            />
                            <ErrorMessage name="eslogan" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.eslogan}</div>)}/>
                            <Field 
                                type="text" 
                                placeholder="Eslogan de la Organizacion"
                                name="eslogan"
                            />
                            <ErrorMessage name="tipo" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.tipo}</div>)}/>
                            <Field 
                                type="text" 
                                placeholder="Tipo de Organizacion"
                                name="tipo"
                            />
                            
                            <ErrorMessage name="lugarCrea" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.lugarCrea}</div>)}/>

                            <Field 
                                type="text" 
                                placeholder="Lugar de Creacion de la Organizacion"
                                name="lugarCrea"
                            />

                            <ErrorMessage name="comic" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.comic}</div>)}/>

                            <Field 
                                type="text" 
                                placeholder="Nombre del Comic de la Primera Aparicion"
                                name="comic"
                            />

                            <ErrorMessage name="objetivo" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.objetivo}</div>)}/>

                            <Field 
                                type="text" 
                                placeholder="Objetivo de la Organizacion"
                                name="objetivo"
                            />

                            <ErrorMessage name="lider" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.lider}</div>)}/>

                            <Field type="text" name="lider" as="select">
                                <option hidden selected value={-1}>Selecciona al lider de la organizacion</option>
                                {personajes.map(personaje => (
                                    <option key={personaje.Nombre} value={personaje.Nombre}>{personaje.Nombre}</option>
                                ))}
                            </Field>
                            
                            <ErrorMessage name="fundador" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.fundador}</div>)}/>

                            <Field type="text" name="fundador" as="select">
                                <option hidden selected value={-1}>Selecciona al fundador de la organizacion</option>
                                {personajes.map(personaje => (
                                    <option key={personaje.Nombre} value={personaje.Nombre}>{personaje.Nombre}</option>
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

export {ModOrganizacion};