import React, { useEffect, useState } from "react";
import { Formik, Form, Field, ErrorMessage } from "formik";
import axios from "axios";
import { useNavigate } from "react-router-dom";

function AgOrganizacion() {

    const [errorDB, setErrorDB] = useState({});
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
                <h2 className="titulo">Agregar Organización</h2>
            </div>
            <div className="formContReg">
                <Formik
                    initialValues={{
                        nombreOrg: '',
                        eslogan: '',
                        lider: '',
                        fundador: '',
                        tipo: '',
                        lugarCrea: '',
                        comic: '',
                        objetivo: '',
                        imagen: '73'
                    }}
                    validate={(val)=>{
                        let errores = {};

                        if (!val.nombreOrg){
                            errores.nombreOrg = 'Introduzca el nombre de la organización';
                        }
                        if (!val.eslogan){
                            errores.eslogan = 'Escriba el eslogan de la organización';
                        }
                        if (!val.lider || val.lider === -1){
                            errores.lider = 'Seleccione al lider de la organización';
                        }
                        if (!val.fundador || val.fundador === -1){
                            errores.fundador = 'Seleccione al fundador de la organización';
                        }
                        if (!val.lugarCrea){
                            errores.lugarCrea = 'Ingrese el lugar de creación de la organización';
                        }
                        if (!val.tipo){
                            errores.tipo = 'Ingrese el tipo de organización';
                        }
                        if (!val.comic){
                            errores.comic = 'Ingrese el comic de su primera aparición';
                        }
                        if (!val.objetivo){
                            errores.objetivo = 'Ingrese el objetivo de la organización';
                        }
                        
                        return errores;
                    }}
                    onSubmit={ async (val)=> {
                        const error = await (await axios.post('../api/buscOrg', {nombreOrg: val.nombreOrg})).data;
                        setErrorDB(error);
                        if (!error.nombreOrg){
                            await axios.post('../api/addOrg', {...val});
                            navigate('/organizaciones');
                        }
                    }}
                >
                    {({errors})=>(
                        <Form>
                            {errorDB.nombreObj && <div style={{fontSize: "15px", color: "red"}}>{errorDB.nombreObj}</div>}
                            <ErrorMessage name="nombreOrg" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.nombreOrg}</div>)}/>
                            <Field 
                                type="text" 
                                placeholder="Nombre de la Organización"
                                name="nombreOrg"
                            />
                            <ErrorMessage name="eslogan" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.eslogan}</div>)}/>
                            <Field 
                                type="text" 
                                placeholder="Eslogan de la Organización"
                                name="eslogan"
                            />
                            <ErrorMessage name="tipo" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.tipo}</div>)}/>
                            <Field 
                                type="text" 
                                placeholder="Tipo de Organización"
                                name="tipo"
                            />
                            
                            <ErrorMessage name="lugarCrea" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.lugarCrea}</div>)}/>

                            <Field 
                                type="text" 
                                placeholder="Lugar de Creación de la Organización"
                                name="lugarCrea"
                            />

                            <ErrorMessage name="comic" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.comic}</div>)}/>

                            <Field 
                                type="text" 
                                placeholder="Nombre del Comic de la Primera Aparición"
                                name="comic"
                            />

                            <ErrorMessage name="objetivo" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.objetivo}</div>)}/>

                            <Field 
                                type="text" 
                                placeholder="Objetivo de la Organización"
                                name="objetivo"
                            />

                            <ErrorMessage name="lider" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.lider}</div>)}/>

                            <Field type="text" name="lider" as="select">
                                <option hidden selected value={-1}>Selecciona al lider de la organización</option>
                                {personajes.map(personaje => (
                                    <option key={personaje.Nombre} value={personaje.Nombre}>{personaje.Nombre}</option>
                                ))}
                            </Field>
                            
                            <ErrorMessage name="fundador" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.fundador}</div>)}/>

                            <Field type="text" name="fundador" as="select">
                                <option hidden selected value={-1}>Selecciona al fundador de la organización</option>
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

export {AgOrganizacion};