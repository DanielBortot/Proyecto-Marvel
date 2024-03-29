import React, { useEffect, useState } from "react";
import { Formik, Form, Field, ErrorMessage } from "formik";
import axios from "axios";
import { useNavigate } from "react-router-dom";

function AgSede() {

    const [errorDB, setErrorDB] = useState({});
    const [organizaciones, setOrganizaciones] = useState([]);
    const navigate = useNavigate();

    useEffect(()=> {
        const getDatos = async () => {
            const org = await (await axios.get('../api/organizaciones')).data;
            setOrganizaciones(org);
        }
        getDatos();
    },[])

    return (
        <>
            <div className="tituloContReg">
                <h2 className="titulo">Agregar Sede</h2>
            </div>
            <div className="formContReg">
                <Formik
                    initialValues={{
                        nombreSede: '',
                        tipoEdif: '',
                        ubicacion: '',
                        imagen: '73',
                        nombreOrg: ''
                    }}
                    validate={(val)=>{
                        let errores = {};

                        if (!val.nombreOrg || val.nombreOrg == -1){
                            errores.nombreOrg = 'Seleccione la organización a la que pertenece la sede';
                        }
                        if (!val.nombreSede){
                            errores.nombreSede = 'Escriba el nombre de la sede';
                        }
                        if (!val.ubicacion){
                            errores.ubicacion = 'Ingrese la ubicación de la sede';
                        }
                        if (!val.tipoEdif){
                            errores.tipoEdif = 'Ingrese el tipo de edificacion de la sede';
                        }
                        return errores;
                    }}
                    onSubmit={ async (val)=> {
                        const error = await (await axios.post('../api/buscSedes', {nombreSede: val.nombreSede, nombreOrg: val.nombreOrg})).data;
                        setErrorDB(error);
                        if (!error.nombreSede){
                            await axios.post('../api/addSede', {...val});
                            navigate('/organizaciones');
                        }
                    }}
                >
                    {({errors})=>(
                        <Form>
                            {errorDB.nombreSede && <div style={{fontSize: "15px", color: "red"}}>{errorDB.nombreSede}</div>}
                            <ErrorMessage name="nombreSede" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.nombreSede}</div>)}/>
                            <Field 
                                type="text" 
                                placeholder="Nombre de la Sede"
                                name="nombreSede"
                            />
                            <ErrorMessage name="tipoEdif" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.tipoEdif}</div>)}/>
                            <Field 
                                type="text" 
                                placeholder="Tipo de Edificación de la Sede"
                                name="tipoEdif"
                            />
                            <ErrorMessage name="ubicacion" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.ubicacion}</div>)}/>
                            <Field 
                                type="text" 
                                placeholder="Ubicación de la Sede"
                                name="ubicacion"
                            />

                            <ErrorMessage name="nombreOrg" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.nombreOrg}</div>)}/>

                            <Field type="text" name="nombreOrg" as="select">
                                <option hidden selected value={-1}>Selecciona la organización</option>
                                {organizaciones.map(org => (
                                    <option key={org.Nombre} value={org.Nombre}>{org.Nombre}</option>
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

export {AgSede};