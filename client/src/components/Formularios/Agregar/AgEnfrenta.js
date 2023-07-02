import React, { useEffect, useState } from "react";
import { Formik, Form, Field, ErrorMessage } from "formik";
import axios from "axios";
import { useNavigate } from "react-router-dom";

function AgEnfrenta() {

    const [errorDB, setErrorDB] = useState({});
    const [villanos, setVillanos] = useState([]);
    const [heroes, setHeroes] = useState([]);
    const [selec, setSelec] = useState('');
    const navigate = useNavigate();

    useEffect(()=> {
        const getHer = async () => {
            const hers = await (await axios.get('../api/heroes')).data;
            setHeroes(hers);
        }
        getHer();
    })

    const getObjetos = async (nombre) => {
        const vills = await (await axios.post('../api/buscHerVill',{nombreHer: nombre})).data;
        setVillanos(vills);
        setSelec(nombre);
    }

    return (
        <>
            <div className="tituloContReg">
                <h2 className="titulo">Agregar Enfrentamiento</h2>
            </div>
            <div className="formContReg">
                <Formik
                    initialValues={{
                        nombreHer: '',
                        nombreVill: ''
                    }}
                    validate={(val)=>{
                        let errores = {};

                        if (!val.nombreHer || val.nombreHer === -1){
                            errores.nombreHer = 'Seleccione al heroe';
                        } else if (selec !== val.nombreHer){
                            getObjetos(val.nombreHer);
                        }
                        if (!val.nombreVill || val.nombreVill === -1){
                            errores.nombreVill = 'Seleccione al villano';
                        }
                        return errores;
                    }}
                    onSubmit={ async (val)=> {
                        const error = await (await axios.post('../api/compHerVill', {nombreHer: val.nombreHer, nombreVill: val.nombreVill})).data;
                        setErrorDB(error);
                        if (!error.enfrenta){
                            await axios.post('../api/addHerVill', {...val});
                            navigate('/');
                        }
                    }}
                >
                    {({errors})=>(
                        <Form>
                            {errorDB.enfrenta && <div style={{fontSize: "15px", color: "red"}}>{errorDB.enfrenta}</div>}
                            <ErrorMessage name="nombreHer" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.nombreHer}</div>)}/>
                            <Field type="text" name="nombreHer" as="select">
                                <option hidden selected value={-1}>Selecciona al heroe que desea relacionar</option>
                                {heroes.map(her => (
                                    <option key={her.Alias} value={her.N_Heroe}>{her.Alias}</option>
                                ))}
                            </Field>
                            <ErrorMessage name="nombreVill" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.nombreVill}</div>)}/>
                            <Field type="text" name="nombreVill" as="select">
                                <option hidden selected value={-1}>Selecciona al villano que desea relacionar</option>
                                {villanos.map(vill => (
                                    <option key={vill.Alias} value={vill.N_Villano}>{vill.Alias}</option>
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

export {AgEnfrenta};