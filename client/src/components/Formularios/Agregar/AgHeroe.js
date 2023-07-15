import React, { useEffect, useState } from "react";
import { Formik, Form, Field, ErrorMessage } from "formik";
import axios from "axios";
import { useNavigate } from "react-router-dom";
import { Autocomplete, TextField } from "@mui/material";

function AgHeroe() {

    const [errorDB, setErrorDB] = useState({});
    const [villanos, setVillanos] = useState([]);
    const [nacionalidades, setNacionalidades] = useState([]);
    const [valNac, setValNac] = useState([]);
    const [creadores, setCreadores] = useState([]);
    const [valCrea, setValCrea] = useState([]);
    const [ocupaciones, setOcupaciones] = useState([]);
    const [valOcu, setValOcu] = useState([]);
    const navigate = useNavigate();

    const handleChangeNac = (e, newValue) => {
        setValNac(newValue);
    }

    const handleChangeCrea = (e, newValue) => {
        setValCrea(newValue);
    }

    const handleChangeOcu = (e, newValue) => {
        setValOcu(newValue);
    }

    useEffect(()=> {
        const datos = async () => {
            const vill = await (await axios.get('../api/villanos')).data;
            const nac = await (await axios.get('../api/nacionalidades')).data;
            const crea = await (await axios.get('../api/creadores')).data;
            const ocu = await (await axios.get('../api/ocupaciones')).data;
            
            setVillanos(vill);
            setNacionalidades(nac);
            setCreadores(crea);
            setOcupaciones(ocu);
        }
        datos();
    },[]);


    return (
        <>
            <div className="tituloContReg">
                <h2 className="titulo">Agregar Heroe</h2>
            </div>
            <div className="formContReg">
                <Formik
                    initialValues={{
                        nombrePers: '',
                        genero: '',
                        ojos: '',
                        pelo: '',
                        comic: '',
                        eMarital: '',
                        imagenPers: '73',
                        alias: '',
                        logotipo: '73',
                        traje: '',
                        archienemigo: ''
                    }}
                    validate={(val)=>{
                        let errores = {};

                        if (!val.nombrePers || !/^[a-zA-Z\s]{1,50}$/.test(val.nombrePers)){
                            errores.nombrePers = 'Ingresa un nombre de personaje';
                        }
                        if (!val.genero || val.genero === -1){
                            errores.genero = 'Selecciona un genero';
                        }
                        if (!val.ojos || !/^[a-zA-Z]{1,50}$/.test(val.ojos)){
                            errores.ojos = 'Ingresa un color de ojos valido';
                        }
                        if (!val.pelo || !/^[a-zA-Z]{1,50}$/.test(val.pelo)){
                            errores.pelo = 'Ingresa un color de pelo valido';
                        }
                        if (!val.comic){
                            errores.comic = 'Ingresa un nombre de comic';
                        }
                        if (!val.eMarital || val.eMarital === -1){
                            errores.eMarital = 'Selecciona el estado marital';
                        }
                        if (!val.archienemigo || val.archienemigo === -1){
                            errores.archienemigo = 'Selecciona un archienemigo para el heroe';
                        }
                        if (!val.alias){
                            errores.alias = 'Ingresa o selecciona el alias del villano';
                        }
                        if (!val.traje || !/^[a-zA-Z]{1,50}$/.test(val.ojos)){
                            errores.traje = 'Ingrese un color de traje valido';
                        }
                        if (valNac.length === 0){
                            errores.nacionalidad = 'Selecciona las nacionalidades del personaje';
                        }
                        if (valCrea.length === 0){
                            errores.creador = 'Selecciona los creadores del personaje';
                        }
                        if (valOcu.length === 0){
                            errores.ocupacion = 'Selecciona las ocupaciones del personaje';
                        }
                        return errores;
                    }}
                    onSubmit={ async (val)=> {
                        const error = await (await axios.post('../api/compPers', {nombrePers: val.nombrePers})).data;
                        const error2 = await (await axios.post('../api/compAlias', {alias: val.alias, op: false})).data;
                        setErrorDB({...error,...error2});
                        if (!error.personaje && !error2.alias){
                            await axios.post('../api/addPersHeroe', {...val, nacionalidades: valNac, ocupaciones: valOcu, creadores: valCrea});
                            if (window.location.pathname === '/personajes/AgHeroe'){
                                navigate('/personajes')
                            } else {
                                navigate('/Rep6');
                            }
                        }
                    }}
                >
                    {({errors, handleBlur})=>(
                        <Form>
                            {errorDB.personaje && <div style={{fontSize: "15px", color: "red"}}>{errorDB.personaje}</div>}

                            <ErrorMessage name="nombrePers" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.nombrePers}</div>)}/>
                            <Field 
                                type="text" 
                                placeholder="Nombre del Personaje"
                                name="nombrePers"
                            />
                            <ErrorMessage name="ojos" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.ojos}</div>)}/>
                            <Field 
                                type="text" 
                                placeholder="Color de Ojos"
                                name="ojos"
                            />
                            <ErrorMessage name="pelo" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.pelo}</div>)}/>
                            <Field 
                                type="text" 
                                placeholder="Color de Pelo"
                                name="pelo"
                            />
                            <ErrorMessage name="comic" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.comic}</div>)}/>
                            <Field 
                                type="text" 
                                placeholder="Nombre del Comic en su Primera Aparicion"
                                name="comic"
                            />
                            
                            {errorDB.alias && <div style={{fontSize: "15px", color: "red"}}>{errorDB.alias}</div>}
                            <ErrorMessage name="alias" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.alias}</div>)}/>
                            <Field 
                                type="text" 
                                placeholder="Alias del Heroe"
                                name="alias"
                            />
                            <ErrorMessage name="traje" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.traje}</div>)}/>
                            <Field 
                                type="text" 
                                placeholder="Colores del traje del heroe"
                                name="traje"
                            />
                            <ErrorMessage name="archienemigo" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.archienemigo}</div>)}/>
                            <Field type="text" name="archienemigo" as="select">
                                <option hidden selected value={-1}>Selecciona el archienegimo del heroe</option>
                                {villanos.map(villano => (
                                    <option key={villano.N_Villano} value={villano.N_Villano}>{villano.N_Villano}</option>
                                ))}
                            </Field>
                            <ErrorMessage name="genero" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.genero}</div>)}/>
                            <Field type="text" name="genero" as="select">
                                <option hidden selected value={-1}>Selecciona el genero del personaje</option>
                                <option value={'F'}>Femenino</option>
                                <option value={'M'}>Masculino</option>
                                <option value={'Desc'}>Desconocido</option>
                                <option value={'Otro'}>Otro</option>
                            </Field>
                            <ErrorMessage name="eMarital" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.eMarital}</div>)}/>
                            <Field type="text" name="eMarital" as="select">
                                <option hidden selected value={-1}>Selecciona el estado marital del personaje</option>
                                <option value={'Casado'}>Casado</option>
                                <option value={'Viudo'}>Viudo</option>
                                <option value={'Soltero'}>Soltero</option>
                                <option value={'Divorciado'}>Divorciado</option>
                            </Field>
                            <ErrorMessage name="creador" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.creador}</div>)}/>
                            <Autocomplete
                                multiple
                                limitTags={2}
                                id="creador"
                                options={creadores}
                                getOptionLabel={(option) => option.Nom_Creador}
                                onChange={handleChangeCrea}
                                onBlur={handleBlur}
                                renderInput={(params) => (
                                    <TextField {...params} label="" placeholder="Creadores" />
                                )}
                                sx={{ width: '500px' }}
                            />
                            <ErrorMessage name="ocupacion" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.ocupacion}</div>)}/>
                            <Autocomplete
                                multiple
                                limitTags={2}
                                id="ocupacion"
                                options={ocupaciones}
                                getOptionLabel={(option) => option.Ocup}
                                onChange={handleChangeOcu}
                                onBlur={handleBlur}
                                renderInput={(params) => (
                                    <TextField {...params} label="" placeholder="Ocupaciones" />
                                )}
                                sx={{ width: '500px' }}
                            />
                            <ErrorMessage name="nacionalidad" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.nacionalidad}</div>)}/>
                            <Autocomplete
                                multiple
                                limitTags={2}
                                id="nacionalidad"
                                options={nacionalidades}
                                getOptionLabel={(option) => option.Nac}
                                onChange={handleChangeNac}
                                onBlur={handleBlur}
                                renderInput={(params) => (
                                    <TextField {...params} label="" placeholder="Nacionalidades" />
                                )}
                                sx={{ width: '500px' }}
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

export {AgHeroe};