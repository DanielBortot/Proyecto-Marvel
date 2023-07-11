import React, { useEffect, useState } from "react";
import { Formik, Form, Field, ErrorMessage } from "formik";
import axios from "axios";
import { useNavigate } from "react-router-dom";
import Switch from '@mui/material/Switch';

function AgRelacion() {

    const [errorDB, setErrorDB] = useState({});
    const [civiles, setCiviles] = useState([]);
    const [villanos, setVillanos] = useState([]);
    const [heroes, setHeroes] = useState([]);
    const [checked, setChecked] = useState(false);
    const [selec, setSelec] = useState('');
    const navigate = useNavigate();

    useEffect(()=> {
        const getCiv = async () => {
            const civ = await (await axios.get('../api/civiles')).data;
            setCiviles(civ);
        }
        getCiv();
    })

    const handleChange = e => {
        setChecked(e.target.checked);
    }

    const getPers = async (nombre) => {
        const hers = await (await axios.post('../api/buscCivHer',{nombreCiv: nombre})).data;
        const vills = await (await axios.post('../api/buscCivVill',{nombreCiv: nombre})).data;
        setHeroes(hers);
        setVillanos(vills);
        setSelec(nombre);
    }

    return (
        <>
            <div className="tituloContReg">
                <h2 className="titulo">Agregar Creador de un Objeto</h2>
            </div>
            <div className="formContReg">
                <Formik
                    initialValues={{
                        nombreHer: '',
                        nombreVill: '',
                        nombreCiv: ''
                    }}
                    validate={(val)=>{
                        let errores = {};

                        if ((!val.nombreHer || val.nombreHer === -1) && !checked){
                            errores.nombreHer = 'Seleccione al heroe';
                        }
                        if ((!val.nombreVill || val.nombreVill === -1) && checked){
                            errores.nombreVill = 'Seleccione al villano';
                        }
                        if (!val.nombreCiv || val.nombreCiv === -1){
                            errores.nombreCiv = 'Seleccione al civil';
                        } else if (selec !== val.nombreCiv){
                            getPers(val.nombreCiv);
                        }
                        return errores;
                    }}
                    onSubmit={ async (val)=> {
                        let nombre = '';
                        if (checked){
                            nombre = val.nombreVill;
                        } else {
                            nombre = val.nombreHer;
                        }
                        const error = await (await axios.post('../api/compCivPers', {nombrePers: nombre, nombreCiv: val.nombreCiv, op: checked})).data;
                        setErrorDB(error);
                        if (!error.relacion){
                            await axios.post('../api/addCivPers', {nombrePers: nombre, nombreCiv: val.nombreCiv, op: checked});
                            navigate('/personajes');
                        }
                    }}
                >
                    {({errors})=>(
                        <Form>
                            {errorDB.relacion && <div style={{fontSize: "15px", color: "red"}}>{errorDB.relacion}</div>}
                            <ErrorMessage name="nombreCiv" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.nombreCiv}</div>)}/>
                            <Field type="text" name="nombreCiv" as="select">
                                <option hidden selected value={-1}>Selecciona al personaje que desea relacionar</option>
                                {civiles.map(civ => (
                                    <option key={civ.N_Civil} value={civ.N_Civil}>{civ.N_Civil}</option>
                                ))}
                            </Field>

                            <div style={{display: 'flex', alignItems: 'center'}}>
                                <Switch checked={checked} onChange={handleChange} inputProps={{'aria-label': 'controlled'}}/>
                                <label>{checked ? 'Relacionar Civil con un Villano' : 'Relacionar Civil con un Heore'}</label>
                            </div>
                            <ErrorMessage name="nombreVill" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.nombreVill}</div>)}/>
                            <Field type="text" name="nombreVill" as="select" hidden={!checked}>
                                <option hidden selected value={-1}>Selecciona el Villano que desea relacionar</option>
                                {villanos.map(vill => (
                                    <option key={vill.N_Villano} value={vill.N_Villano}>{vill.Alias}</option>
                                ))}
                            </Field>

                            <ErrorMessage name="nombreHer" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.nombreHer}</div>)}/>
                            <Field type="text" name="nombreHer" as="select" hidden={checked}>
                                <option hidden selected value={-1}>Selecciona el Heroe que desea relacionar</option>
                                {heroes.map(her => (
                                    <option key={her.N_Heroe} value={her.N_Heroe}>{her.Alias}</option>
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

export {AgRelacion};