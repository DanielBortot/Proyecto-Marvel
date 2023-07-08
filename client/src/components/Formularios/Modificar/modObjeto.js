import React, { useEffect, useState } from "react";
import { Formik, Form, Field, ErrorMessage } from "formik";
import axios from "axios";
import { useNavigate } from "react-router-dom";
import { useSelector } from "react-redux";

function ModObjeto() {

    const [errorDB, setErrorDB] = useState({});
    const {descReporte} = useSelector(state => state.reporte);
    const {Nombre, Descripcion, Imagen, Material, Tipo, N_Personaje} = descReporte;
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
                <h2 className="titulo">Modificar Objeto</h2>
            </div>
            <div className="formContReg">
                <Formik
                    initialValues={{
                        nombreObj: Nombre,
                        descripcion: Descripcion,
                        material: Material,
                        tipo: Tipo,
                        imagen: Imagen,
                        nombrePers: N_Personaje
                    }}
                    validate={(val)=>{
                        let errores = {};

                        if (!val.nombreObj){
                            errores.nombreObj = 'Introduzca el nombre del objeto';
                        }
                        if (!val.descripcion){
                            errores.descripcion = 'Introduzca la descripcion del objeto';
                        }
                        if (!val.material){
                            errores.material = 'Introduzca los materiales del objeto';
                        }
                        if (!val.tipo){
                            errores.tipo = 'Ingrese el tipo de objeto';
                        }
                        if (!val.nombrePers || val.nombrePers === -1){
                            errores.nombrePers = 'Ingrese el personaje que posee el objeto';
                        }
                        return errores;
                    }}
                    onSubmit={ async (val)=> {
                        let error = {};
                        if (val.nombreObj !== Nombre){
                            error = await (await axios.post('../api/buscObjetos', {nombreObj: val.nombreObj})).data;
                        }
                        setErrorDB(error);
                        if (!error.nombreObj){
                            await axios.put('../api/upObjeto', {...val, nombreObjVie: Nombre});
                            navigate('/');
                        }
                    }}
                >
                    {({errors})=>(
                        <Form>
                            {errorDB.nombreObj && <div style={{fontSize: "15px", color: "red"}}>{errorDB.nombreObj}</div>}
                            <ErrorMessage name="nombreObj" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.nombreObj}</div>)}/>
                            <Field 
                                type="text" 
                                placeholder="Nombre del Objeto"
                                name="nombreObj"
                            />
                            <ErrorMessage name="descripcion" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.descripcion}</div>)}/>
                            <Field 
                                type="text" 
                                placeholder="Descripcion del Objeto"
                                name="descripcion"
                            />
                            <ErrorMessage name="material" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.material}</div>)}/>
                            <Field 
                                type="text" 
                                placeholder="Material del que Esta Hecho el Objeto"
                                name="material"
                            />
                            
                            <ErrorMessage name="tipo" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.tipo}</div>)}/>

                            <Field 
                                type="text" 
                                placeholder="Tipo de Objeto"
                                name="tipo"
                            />

                            <ErrorMessage name="nombrePers" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.nombrePers}</div>)}/>

                            <Field type="text" name="nombrePers" as="select">
                                <option hidden selected value={-1}>Selecciona al poseedor del objeto</option>
                                <option value={'no'}>No lo posee nadie</option>
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

export {ModObjeto};