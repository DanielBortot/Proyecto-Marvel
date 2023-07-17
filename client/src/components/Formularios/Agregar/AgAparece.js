import React, { useEffect, useState } from "react";
import { Formik, Form, Field, ErrorMessage } from "formik";
import axios from "axios";
import { useNavigate } from "react-router-dom";

function AgAparece() {

    const [errorDB, setErrorDB] = useState({});
    const [medios, setMedios] = useState([]);
    const [organizaciones, setOrganizaciones] = useState([]);
    const [selec, setSelec] = useState('');
    const navigate = useNavigate();

    useEffect(()=> {
        const getOrganizaciones = async () => {
            const orgs = await (await axios.get('../api/organizaciones')).data;
            setOrganizaciones(orgs);
        }
        getOrganizaciones();
    },[])

    const getMedios = async (nombre) => {
        let op = 0;
        if (window.location.pathname === '/peliculas/AgOrgPeli'){
            op=1;
        }
        else if (window.location.pathname === '/series/AgOrgSerie'){
            op=2;
        }
        else {
            op=3;
        }
        const meds = await (await axios.post('../api/buscOrgMedio',{nombreOrg: nombre, op: op})).data;
        setMedios(meds);
        setSelec(nombre);
    }

    return (
        <>
            <div className="tituloContReg">
                <h2 className="titulo">Agregar una Organización a un Medio</h2>
            </div>
            <div className="formContReg">
                <Formik
                    initialValues={{
                        nombreOrg: '',
                        titulo: '',
                        rol: '',
                        estado: ''
                    }}
                    validate={(val)=>{
                        let errores = {};

                        if (!val.nombreOrg || val.nombreOrg === -1){
                            errores.nombreOrg = 'Seleccione la organización';
                        } else if (selec !== val.nombreOrg){
                            getMedios(val.nombreOrg);
                        }
                        if (!val.titulo || val.titulo === -1){
                            errores.titulo = 'Seleccione el título del medio';
                        }
                        if (!val.rol || val.rol === -1){
                            errores.rol = 'Seleccione el rol de la organización en el medio';
                        }
                        if (!val.estado){
                            errores.estado = 'Seleccione el estado de la organización en el medio'
                        }
                        return errores;
                    }}
                    onSubmit={ async (val)=> {
                        const error = await (await axios.post('../api/compOrgMedio', {nombreOrg: val.nombreOrg, titulo: val.titulo})).data;
                        setErrorDB(error);
                        if (!error.aparece){
                            await axios.post('../api/addOrgMedio', {...val});
                            navigate('/');
                        }
                    }}
                >
                    {({errors})=>(
                        <Form>
                            {errorDB.aparece && <div style={{fontSize: "15px", color: "red"}}>{errorDB.aparece}</div>}
                            <ErrorMessage name="nombreOrg" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.nombreOrg}</div>)}/>
                            <Field type="text" name="nombreOrg" as="select">
                                <option hidden selected value={-1}>Selecciona la organización que desea relacionar</option>
                                {organizaciones.map(org => (
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
                            
                            <ErrorMessage name="estado" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.estado}</div>)}/>
                            <Field 
                                type="text" 
                                placeholder="Estado de la Organizacion en el Medio"
                                name="estado"
                            />

                            <ErrorMessage name="rol" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.rol}</div>)}/>
                            <Field type="text" name="rol" as="select">
                                <option hidden selected value={-1}>Selecciona el rol de la organización en el medio</option>
                                <option value={'Protagonista'}>Protagonista</option>
                                <option value={'Antagonista'}>Antagonista</option>
                                <option value={'Secundario'}>Secundario</option>
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

export {AgAparece};