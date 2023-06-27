import React, { useEffect, useState } from "react";
import { Formik, Form, Field, ErrorMessage } from "formik";
import axios from "axios";
import { useNavigate } from "react-router-dom";
import Switch from '@mui/material/Switch';
import { Autocomplete, TextField } from "@mui/material";

function AgPosee() {

    const [errorDB, setErrorDB] = useState({});
    const [checked, setChecked] = useState(false);
    const [checked2, setChecked2] = useState(false);
    const [checked3, setChecked3] = useState(false);
    const [villanos, setVillanos] = useState([]);
    const [poderes, setPoderes] = useState([]);
    const [nacionalidades, setNacionalidades] = useState([]);
    const [valNac, setValNac] = useState([]);
    const [creadores, setCreadores] = useState([]);
    const [valCrea, setValCrea] = useState([]);
    const [ocupaciones, setOcupaciones] = useState([]);
    const [valOcu, setValOcu] = useState([]);
    const navigate = useNavigate();

    const handleChange1 = e => {
        setChecked(e.target.checked);
    }

    const handleChange2 = e => {
        setChecked2(e.target.checked);
    }

    const handleChange3 = e => {
        setChecked3(e.target.checked);
    }

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
            const pod = await (await axios.get('../api/poderes')).data;
            const vill = await (await axios.get('../api/villanos')).data;
            const nac = await (await axios.get('../api/nacionalidades')).data;
            const crea = await (await axios.get('../api/creadores')).data;
            const ocu = await (await axios.get('../api/ocupaciones')).data;
            setNacionalidades(nac);
            setPoderes(pod);
            setVillanos(vill);
            setCreadores(crea);
            setOcupaciones(ocu);
        }
        datos();
    },[]);

    return (
        <>
            <div className="tituloContReg">
                <h2 className="titulo">Agregar Relacion entre Villano y Poder</h2>
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
                        imagenPers: 'aaaa',
                        alias: '',
                        objetivo: '',
                        nombrePod: '',
                        imagenPod: 'aaaa',
                        descripcion: '',
                        obtencion: ''
                    }}
                    validate={(val)=>{
                        let errores = {};

                        if (!val.nombrePers && !checked && !checked2){
                            errores.nombrePers = 'Ingresa un nombre de personaje';
                        }
                        if (!val.genero && !checked && !checked2){
                            errores.genero = 'Selecciona un genero';
                        }
                        if (!val.ojos && !checked && !checked2){
                            errores.ojos = 'Ingresa un color de ojos valido';
                        }
                        if (!val.pelo && !checked && !checked2){
                            errores.pelo = 'Ingresa un color de pelo valido';
                        }
                        if (!val.comic && !checked && !checked2){
                            errores.comic = 'Ingresa un nombre de comic';
                        }
                        if (!val.eMarital && !checked && !checked2){
                            errores.eMarital = 'Selecciona el estado marital';
                        }
                        if (!val.alias){
                            errores.alias = 'Ingresa o selecciona el alias del villano';
                        }
                        if (!val.objetivo && !checked){
                            errores.objetivo = 'Ingresa el objetivo del villano';
                        }
                        if (!val.nombrePod){
                            errores.nombrePod = 'Ingresa o selecciona el nombre del poder';
                        }
                        if (!val.descripcion && !checked3){
                            errores.descripcion = 'Ingresa la descripcion del poder';
                        }
                        if (!val.obtencion){
                            errores.obtencion = 'Selecciona la forma de obtencion del poder';
                        }
                        if (valNac.length === 0 && !checked && !checked2){
                            errores.nacionalidad = 'Selecciona las nacionalidades del personaje';
                        }
                        if (valCrea.length === 0 && !checked && !checked2){
                            errores.creador = 'Selecciona los creadores del personaje';
                        }
                        if (valOcu.length === 0 && !checked && !checked2){
                            errores.ocupacion = 'Selecciona las ocupaciones del personaje';
                        }
                        return errores;
                    }}
                    onSubmit={ async (val)=> {
                        const error = await (await axios.post('../api/buscPodPersVill', {nombrePers: val.nombrePers, nombrePod: val.nombrePod, aliasVill: val.alias, opPers: checked2, opVill: checked, opPod: checked3})).data;
                        setErrorDB(error);
                        if (!error.personaje && !error.alias && !error.poder && !error.posee){
                            await axios.post('../api/addRep6', {...val, nacionalidades: valNac, ocupaciones: valOcu, creadores: valCrea, opPers: checked2, opVill: checked, opPod: checked3});
                            navigate('/Rep6');
                        }
                    }}
                >
                    {({errors, handleBlur})=>(
                        <Form>
                            <div style={{display: 'flex', alignItems: 'center'}}>
                                <Switch checked={checked} onChange={handleChange1} inputProps={{'aria-label': 'controlled'}}/>
                                <label>{checked ? 'Crear un Nuevo Villano' : 'Seleccionar un Villano Existente'}</label>
                            </div>
                            {errorDB.personaje && <div style={{fontSize: "15px", color: "red"}}>{errorDB.personaje}</div>}
                            {errorDB.posee && <div style={{fontSize: "15px", color: "red"}}>{errorDB.posee}</div>}
                            <ErrorMessage name="alias" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.alias}</div>)}/>

                            <Field type="text" name="alias" as="select" hidden={!checked}>
                                <option hidden selected value={-1}>Selecciona el Villano</option>
                                {villanos.map(villano => (
                                <option key={villano.Alias} value={villano.Alias}>{villano.Alias}</option>
                            ))}
                            </Field>
                            <ErrorMessage name="nombrePers" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.nombrePers}</div>)}/>
                            <Field 
                                type="text" 
                                placeholder="Nombre del Personaje"
                                name="nombrePers"
                                hidden={checked}
                            />
                            <ErrorMessage name="ojos" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.ojos}</div>)}/>
                            <Field 
                                type="text" 
                                placeholder="Color de Ojos"
                                name="ojos"
                                hidden={checked}
                                disabled={checked2}
                            />
                            <ErrorMessage name="pelo" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.pelo}</div>)}/>
                            <Field 
                                type="text" 
                                placeholder="Color de Pelo"
                                name="pelo"
                                hidden={checked}
                                disabled={checked2}
                            />
                            <ErrorMessage name="comic" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.comic}</div>)}/>
                            <Field 
                                type="text" 
                                placeholder="Nombre del Comic en su Primera Aparicion"
                                name="comic"
                                hidden={checked}
                                disabled={checked2}
                            />
                            <div style={{display: 'flex', alignItems: 'center'}} hidden={checked}>
                                <Switch checked={checked2} onChange={handleChange2} inputProps={{'aria-label': 'controlled'}}/>
                                <label>{checked2 ? 'Crear un Personaje y un Villano' : 'Crear Solo un Villano'}</label>
                            </div>
                            {errorDB.alias && <div style={{fontSize: "15px", color: "red"}}>{errorDB.alias}</div>}
                            <ErrorMessage name="alias" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.alias}</div>)}/>
                            <Field 
                                type="text" 
                                placeholder="Alias del Villano"
                                name="alias"
                                hidden={checked}
                            />
                            <ErrorMessage name="objetivo" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.objetivo}</div>)}/>
                            <Field 
                                type="text" 
                                placeholder="Objetivo del Villano"
                                name="objetivo"
                                hidden={checked}
                            />
                            <ErrorMessage name="genero" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.genero}</div>)}/>
                            <Field type="text" name="genero" as="select" hidden={checked} disabled={checked2}>
                                <option hidden selected value={-1}>Selecciona el genero del personaje</option>
                                <option value={'F'}>Femenino</option>
                                <option value={'M'}>Masculino</option>
                                <option value={'Desc'}>Desconocido</option>
                                <option value={'Otro'}>Otro</option>
                            </Field>
                            <ErrorMessage name="eMarital" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.eMarital}</div>)}/>
                            <Field type="text" name="eMarital" as="select" hidden={checked} disabled={checked2}>
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
                                hidden={checked}
                                disabled={checked2}
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
                                hidden={checked}
                                disabled={checked2}
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
                                hidden={checked}
                                disabled={checked2}
                            />

                            <hr/>
                            <hr/>

                            <div style={{display: 'flex', alignItems: 'center'}}>
                                <Switch checked={checked3} onChange={handleChange3} inputProps={{'aria-label': 'controlled'}}/>
                                <label>{checked3 ? 'Crear un Nuevo Poder' : 'Seleccionar un Poder Existente'}</label>
                            </div>
                            <ErrorMessage name="nombrePod" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.nombrePod}</div>)}/>

                            <Field type="text" name="nombrePod" as="select" hidden={!checked3}>
                                <option hidden selected value={-1}>Selecciona el Poder</option>
                                {poderes.map(poder => (
                                <option key={poder.Nombre} value={poder.Nombre}>{poder.Nombre}</option>
                            ))}
                            </Field>
                            {errorDB.poder && <div style={{fontSize: "15px", color: "red"}}>{errorDB.poder}</div>}
                            <Field 
                                type="text" 
                                placeholder="Nombre del Poder"
                                name="nombrePod"
                                hidden={checked3}
                            />
                            <ErrorMessage name="descripcion" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.descripcion}</div>)}/>
                            <Field 
                                type="text" 
                                placeholder="Descripcion del Poder"
                                name="descripcion"
                                hidden={checked3}
                            />
                            <ErrorMessage name="obtencion" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.obtencion}</div>)}/>
                            <Field type="text" name="obtencion" as="select">
                                <option hidden selected value={-1}>Selecciona la forma de obtencion del poder</option>
                                <option value={'Heredado'}>Heredado</option>
                                <option value={'Natural'}>Natural</option>
                                <option value={'Artificial'}>Artificial</option>
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

export {AgPosee};