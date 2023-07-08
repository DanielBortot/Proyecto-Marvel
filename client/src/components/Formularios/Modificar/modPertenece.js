import React, { useEffect, useState } from "react";
import { Formik, Form, Field, ErrorMessage } from "formik";
import axios from "axios";
import { useNavigate } from "react-router-dom";
import { useSelector } from "react-redux";

function ModPertenece() {

    const {descReporte} = useSelector(state => state.reporte);
    const {N_Personaje, N_Organizacion, Cod_Cargo} = descReporte;
    const [cargos, setCargos] = useState([]);
    const navigate = useNavigate();

    useEffect(()=> {
        const getPers = async () => {
            const cargs = await (await axios.get('../api/getCargo')).data;
    
            setCargos(cargs);
        }
        getPers();
    })

    return (
        <>
            <div className="tituloContReg">
                <h2 className="titulo">Modificar Personaje en Organizacion</h2>
            </div>
            <div className="formContReg">
                <Formik
                    initialValues={{
                        cargo: Cod_Cargo
                    }}
                    validate={(val)=>{
                        let errores = {};

                        if (!val.cargo || val.cargo === -1){
                            errores.cargo = 'Seleccione el cargo del personaje en la organizacion';
                        }
                        
                        return errores;
                    }}
                    onSubmit={ async (val)=> {
                        await axios.put('../api/modOrgPers', {...val, nombrePers: N_Personaje, nombreOrg: N_Organizacion});
                        navigate('/');
                    }}
                >
                    {({errors})=>(
                        <Form>
                            
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

export {ModPertenece};