import React from "react";
import { useEffect, useState } from "react";
import '../assets/registro.css';
import axios from 'axios';
import { useDispatch } from "react-redux";
import { datosUsuario } from "../reducers/usuarioSlice";
import { City, Country, State } from "country-state-city";
import { Formik, Form, ErrorMessage, Field} from "formik";

function Register() {
    const [colores, setColores] = useState(['nselec','nselec','nselec','nselec']);
    const dispatch = useDispatch();

    let countryData = Country.getAllCountries(); //BUSCA LA LISTA DE TODOS LOS PAISES
    const [stateData, setStateData] = useState(); //CREA LA LISTA VACIA DONDE ESTARAN LOS DATOS DE LOS ESTADOS
    const [cityData, setCityData] = useState(); //CREA LA LISTA VACIA DONDE ESTARAN LOS DATOS DE LAS CIUDADES

    const [country, setCountry] = useState(countryData); //CREA UN ARRAY CON TODOS LOS PAISES
    const [state, setState] = useState();   
    const [city, setCity] = useState();

    useEffect(() => {
        setCountry(countryData);
    }, []);
    
    useEffect(() => {
        setStateData(State.getStatesOfCountry(country.countryCode));  //DEBERIA CREAR LA LISTA DE LOS DATOS DE LOS ESTADOS AL ESCOGER UN PAIS
    }, [country]);
    
    useEffect(() => {
        setCityData(City.getCitiesOfState(country.conuntry, state?.isoCode)); //DEBERIA CREAR LA LISTA DE LOS DATOS DE LAS CIUDADS AL ESCOGER UN ESTADO
    }, [country, state]);
    
    useEffect(() => {
        setState(stateData); // CREA EL ARRAY DE LOS ESTADOS DEL PAIS
    }, []);
    
    useEffect(() => {
        setCity(cityData); // CREA EL ARRAY DE LAS CIUDADES DEL
    }, []);

    return (
        <>
            <div className="tituloContReg">
                <h2 className="titulo">Registrarse</h2>
            </div>

            <div className="formContReg">
                <Formik
                    initialValues={{
                        nombre: '',
                        apellido: '',
                        email: '',
                        contra: '',
                        repContra: '',
                        fecha: ''
                    }}
                    validate={(val)=> {
                        let errores = {};
                        if (!val.nombre){
                            errores.nombre = 'Introduzca un nombre valido';
                        }
                        if (!val.apellido){
                            errores.apellido = 'Introduzca un apellido valido';
                        }
                        if (!val.email){
                            errores.email = 'Introduzca un email valido';
                        }
                        if (!val.contra){
                            errores.contra = 'Introduzca una contraseña valido';
                        }
                        if (!val.repContra){
                            errores.repContra = 'Repita la contraseña';
                        } else if (val.contra !== val.repContra) {
                            errores.repContra = 'La contraseña no es la misma';
                        }
                        if (!val.fecha){
                            errores.fecha = 'Introduzca la fecha de nacimiento';
                        }
                        return errores;
                    }}
                    onSubmit={(val)=>{
                        if (colores[3] === 'selec' || colores.find(col => col === 'selec') === undefined){
                            
                            axios.post('/register',{...val, direccion: null, nTarjeta: null}).then(res => {
                                console.log(res.data);
                                dispatch(datosUsuario(val))
                            }).catch(err => {
                                console.log(err);
                            })
                        }   
                    }}
                >
                    {({errors})=>(
                        <Form>
                            <ErrorMessage name="nombre" id="nombre" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.nombre}</div>)}/>

                            <Field type="text" placeholder="Nombre" name="nombre"/>

                            <ErrorMessage name="apellido" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.apellido}</div>)}/>

                            <Field type="text" placeholder="Apellido" name="apellido"/>

                            <ErrorMessage name="email" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.email}</div>)}/>
                            
                            <Field type="email" placeholder="Email" name="email"/>

                            <ErrorMessage name="contra" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.contra}</div>)}/>

                            <Field type="password" placeholder="Contraseña" name="contra"/>

                            <ErrorMessage name="repContra" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.repContra}</div>)}/>

                            <Field type="password" placeholder="Repetir Contraseña" name="repContra"/>

                            <ErrorMessage name="fecha" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.fecha}</div>)}/>

                            <Field type="date" placeholder="Fecha de nacimiento" name="fecha"/>
                            <div>
                                <p className="text-teal-800 font-semibold">País :</p>
                                <select className="form-control select-class">
                                    <option value='0'>Selecciona el pais</option>
                                    {
                                        country && 
                                        country !== undefined ?
                                        country.map((ctr,index) => {
                                            return (
                                                <option key = {index} value={ctr.countryCode}>{ctr.name}</option> // ESCOGE EL PAIS
                                            )
                                        })
                                        :"No country"
                                    }    
                                </select>
                                <p className="text-teal-800 font-semibold">Estado :</p>
                                <select className="form-control">
                                    <option value='0'>Selecciona el estado</option>
                                    {
                                        state && 
                                        state !== undefined ?
                                        state.map((ctr,index) => {
                                            return (
                                                <option key = {index} value={ctr.stateCode}>{ctr.name}</option> //ESCOGE EL ESTAOD
                                            )
                                        })
                                        :"No state"
                                    }    
                                </select>
                                <p className="text-teal-800 font-semibold">Ciudad :</p>
                                <select className="form-control">
                                    <option value='0'>Selecciona la ciudad</option>
                                    {
                                        city && 
                                        city !== undefined ?
                                        city.map((ctr,index) => {
                                            return (
                                                <option key = {index} value={ctr.id}>{ctr.name}</option> //ESCOGE LA CIUDAD
                                            )
                                        })
                                        :"No city"
                                    }    
                                </select>
                                </div> 
                                
                            <p>Selecciona el servicio</p>

                            <div className="suscripcionReg">

                                <div className={`Reg${colores[0]}`} onClick={()=>setColores(['selec','nselec','nselec','nselec'])}>
                                    <p>GOLD</p>
                                    <p>5.99$</p>
                                </div>

                                <div className={`Reg${colores[1]}`} onClick={()=>setColores(['nselec','selec','nselec','nselec'])}>
                                    <p>PREMIUM</p>
                                    <p>9.99$</p>
                                </div>

                                <div className={`Reg${colores[2]}`} onClick={()=>setColores(['nselec','nselec','selec','nselec'])}>
                                    <p>VIP</p>
                                    <p>14.99$</p>
                                </div>

                                <div className={`Reg${colores[3]}`} onClick={()=>setColores(['nselec','nselec','nselec','selec'])}>
                                    <p>GRATIS</p>
                                    <p>0$</p>
                                </div>

                            </div>

                            <div className="botonReg">
                                <button type="submit">Aceptar</button>
                            </div>
                        </Form>
                    )} 
                </Formik>
            </div>
            
        </>
    );
}

export {Register};