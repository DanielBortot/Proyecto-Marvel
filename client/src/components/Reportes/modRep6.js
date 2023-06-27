import React, { useState } from "react";
import { Formik, Form, Field, ErrorMessage } from "formik";
import axios from "axios";
import { useNavigate } from "react-router-dom";
import { useSelector } from "react-redux";
import ue from "underscore";

function modRep6() {
    const [errorDB, setErrorDB] = useState({});
    const {descReporte} = useSelector(state => state.reporte);
    const {nombrePers,genero,ojos,pelo,comic,eMarital,nacionalidades,ocupaciones,creadores,imagenPers,alias,objetivo,nombrePod,imagenPod,descripcion,obtencion} = descReporte;
    const [listNac, setListNac] = useState([]);
    const [valNac, setValNac] = useState(nacionalidades);
    const [listCrea, setListCrea] = useState([]);
    const [valCrea, setValCrea] = useState(creadores);
    const [listOcu, setListOcu] = useState([]);
    const [valOcu, setValOcu] = useState(ocupaciones);
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
            const nac = await (await axios.get('../api/nacionalidades')).data;
            const crea = await (await axios.get('../api/creadores')).data;
            const ocu = await (await axios.get('../api/ocupaciones')).data;
            setListNac(nac);
            setListCrea(crea);
            setListOcu(ocu);
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
                        nombrePers: nombrePers,
                        genero: genero,
                        ojos: ojos,
                        pelo: pelo,
                        comic: comic,
                        eMarital: eMarital,
                        imagenPers: imagenPers,
                        alias: alias,
                        objetivo: objetivo,
                        nombrePod: nombrePod,
                        imagenPod: imagenPod,
                        descripcion: descripcion,
                        obtencion: obtencion
                    }}
                    validate={(val)=>{
                        let errores = {};

                        if (!val.nombrePers){
                            errores.nombrePers = 'Ingresa un nombre de personaje';
                        }
                        if (!val.genero){
                            errores.genero = 'Selecciona un genero';
                        }
                        if (!val.ojos){
                            errores.ojos = 'Ingresa un color de ojos valido';
                        }
                        if (!val.pelo){
                            errores.pelo = 'Ingresa un color de pelo valido';
                        }
                        if (!val.comic){
                            errores.comic = 'Ingresa un nombre de comic';
                        }
                        if (!val.eMarital){
                            errores.eMarital = 'Selecciona el estado marital';
                        }
                        if (!val.alias){
                            errores.alias = 'Ingresa o selecciona el alias del villano';
                        }
                        if (!val.objetivo){
                            errores.objetivo = 'Ingresa el objetivo del villano';
                        }
                        if (!val.nombrePod){
                            errores.nombrePod = 'Ingresa o selecciona el nombre del poder';
                        }
                        if (!val.descripcion){
                            errores.descripcion = 'Ingresa la descripcion del poder';
                        }
                        if (!val.obtencion){
                            errores.obtencion = 'Selecciona la forma de obtencion del poder';
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
                            {errorDB.personaje && <div style={{fontSize: "15px", color: "red"}}>{errorDB.personaje}</div>}
                            {errorDB.posee && <div style={{fontSize: "15px", color: "red"}}>{errorDB.posee}</div>}
                            
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
                                placeholder="Alias del Villano"
                                name="alias"
                            />
                            <ErrorMessage name="objetivo" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.objetivo}</div>)}/>
                            <Field 
                                type="text" 
                                placeholder="Objetivo del Villano"
                                name="objetivo"
                            />
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
                                options={listCrea}
                                defaultValue={[...creadores]}
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
                                options={listOcu}
                                defaultValue={[...ocupaciones]}
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
                                options={listNac}
                                defaultValue={[...nacionalidades]}
                                getOptionLabel={(option) => option.Nac}
                                onChange={handleChangeNac}
                                onBlur={handleBlur}
                                renderInput={(params) => (
                                    <TextField {...params} label="" placeholder="Nacionalidades" />
                                )}
                                sx={{ width: '500px' }}
                            />

                            <hr/>
                            <hr/>

                            <ErrorMessage name="nombrePod" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.nombrePod}</div>)}/>

                            <Field type="text" name="nombrePod" as="select">
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
                            />
                            <ErrorMessage name="descripcion" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.descripcion}</div>)}/>
                            <Field 
                                type="text" 
                                placeholder="Descripcion del Poder"
                                name="descripcion"
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