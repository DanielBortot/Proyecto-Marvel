import React, { useEffect, useState } from "react";
import { Formik, Form, Field, ErrorMessage } from "formik";
import axios from "axios";
import { useNavigate } from "react-router-dom";
import { Autocomplete, TextField } from "@mui/material";
import { useSelector } from "react-redux";

function ModCivil() {

    const [errorDB, setErrorDB] = useState({});
    const {descReporte} = useSelector(state => state.reporte);
    const {Nombre, Genero, Color_Pelo, Color_Ojos, ocupaciones, nacionalidades, creadores, Nom_Comic, E_Marital, imagen} = descReporte;
    const [listNac, setListNac] = useState([]);
    const [valNac, setValNac] = useState(nacionalidades);
    const [listCrea, setListCrea] = useState([]);
    const [valCrea, setValCrea] = useState(creadores);
    const [listOcup, setListOcup] = useState([]);
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
            setListOcup(ocu);
        }
        datos();
    },[]);

    return (
        <>
            <div className="tituloContReg">
                <h2 className="titulo">Modificar Civil </h2>
            </div>
            <div className="formContReg">
                <Formik
                    initialValues={{
                        nombrePers: Nombre,
                        genero: Genero,
                        ojos: Color_Ojos,
                        pelo: Color_Pelo,
                        comic: Nom_Comic,
                        eMarital: E_Marital,
                        imagenPers: imagen
                    }}
                    validate={(val)=>{
                        let errores = {};

                        if (!val.nombrePers || !/^[a-zA-Z\s]{1,50}$/.test(val.nombrePers)){
                            errores.nombrePers = 'Ingresa un nombre de personaje';
                        }
                        if (!val.genero){
                            errores.genero = 'Selecciona un género';
                        }
                        if (!val.ojos || !/^[a-zA-Z]{1,50}$/.test(val.ojos)){
                            errores.ojos = 'Ingresa un color de ojos válido';
                        }
                        if (!val.pelo || !/^[a-zA-Z]{1,50}$/.test(val.pelo)){
                            errores.pelo = 'Ingresa un color de pelo válido';
                        }
                        if (!val.comic){
                            errores.comic = 'Ingresa un nombre de comic';
                        }
                        if (!val.eMarital){
                            errores.eMarital = 'Selecciona el estado marital';
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
                        let error = {};
                        if (val.nombrePers !== Nombre){
                            error = await (await axios.post('../api/compPers', {nombrePers: val.nombrePers})).data;
                        }
                        setErrorDB(error);
                        if (!error.personaje){
                            await axios.put('../api/upPersCiv', {...val, nacionalidades: valNac, ocupaciones: valOcu, creadores: valCrea, nombreVie: Nombre});
                            navigate('/personajes');
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
                            
                            <ErrorMessage name="genero" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.genero}</div>)}/>
                            <Field type="text" name="genero" as="select">
                                <option hidden selected value={-1}>Selecciona el género del personaje</option>
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
                                isOptionEqualToValue={(option, value) => option.Nom_Creador === value.Nom_Creador}
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
                                options={listOcup}
                                defaultValue={[...ocupaciones]}
                                getOptionLabel={(option) => option.Ocup}
                                isOptionEqualToValue={(option, value) => option.Ocup === value.Ocup}
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
                                isOptionEqualToValue={(option, value) => option.Nac === value.Nac}
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

export {ModCivil};