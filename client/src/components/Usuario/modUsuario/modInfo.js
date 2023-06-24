import React from "react";
import { useState, useEffect } from "react";
import { Formik, Form, Field, ErrorMessage } from "formik";
import { useDispatch, useSelector } from "react-redux";
import { useNavigate } from "react-router-dom";
import { datosUsuario } from "../../../reducers/usuarioSlice";
import { setPais, setEstado, setCiudad } from "../../../reducers/direccionSlice";
import axios from "axios";

function ModInfo () {

    const [erroresBD, setErroresBD] = useState({});
    const [paises, setPaises] = useState([]);
    const [estados, setEstados] = useState([]);
    const [ciudades, setCiudades] = useState([]);
    const dispatch = useDispatch();
    const navigate = useNavigate();
    const {descUsuario} = useSelector(state => state.usuario);
    const {Pais,Estado,Ciudad} = useSelector(state => state.direccion);

    useEffect(()=>{
        const cargarDirec = async () => {
            const ps = await (await axios.get('/api/paises')).data;
            const es = await (await axios.post('/api/estados', {Id_Pais: Pais.Id_Pais})).data;
            const cs = await (await axios.post('/api/ciudades', {Id_Estado: Estado.Id_Estado})).data;
            return {ps, es, cs};
        }
        cargarDirec().then(dat => {
            setPaises(dat.ps);
            setEstados(dat.es);
            setCiudades(dat.cs);
        });
    },[]);

    const paisRed = async (id) => {
        paises.map(pais => {
            if (pais.Id_Pais === id){
                dispatch(setPais(pais));
            }
            return 0;
        });
        const estados = await (await axios.post('/api/estados',{Id_Pais: id})).data;
        setEstados(estados);
    };

    const estadoRed = async (id) => {
        estados.map(estado => {
            if (estado.Id_Estado === id){
                dispatch(setEstado(estado));
            }
            return 0;
        });
        const ciudades = await (await axios.post('/api/ciudades', {Id_Estado: id})).data;
        setCiudades(ciudades);
    }

    const ciudadRed = (id) => {
        ciudades.map(ciudad => {
            if (ciudad.Id_Ciudad === id){
                dispatch(setCiudad(ciudad));
            }
            return 0;
        });
    }

    return(
        <>
            <div className="tituloContReg">
                <h2 className="titulo">Cambiar Datos</h2>
            </div>

            <div className="formContReg">
                <Formik
                    initialValues={{
                        nombre: '',
                        apellido: '',
                        email: '',
                        contra: '',
                        repContra: '',
                        fecha: '',
                        estado: '',
                        pais: '',
                        ciudad: ''
                    }}
                    validate={(val)=> {
                        let errores = {};
                        if (!/^[a-zA-Z]{1,50}$/.test(val.nombre) && val.nombre){
                            errores.nombre = 'Introduzca un nombre valido';
                        }
                        if (!/^[a-zA-Z]{1,50}$/.test(val.apellido) && val.apellido){
                            errores.apellido = 'Introduzca un apellido valido';
                        }
                        if (!/^[-\w.%+]{1,64}@(?:[A-Z0-9-]{1,63}\.){1,125}[A-Z]{2,63}$/i.test(val.email) && val.email){
                            errores.email = 'Introduzca un email valido';
                        }
                        if (val.contra && val.contra !== val.repContra) {
                            errores.repContra = 'La contraseña no es la misma';
                        }
                        if (val.pais === -1){
                            errores.pais = 'Seleccione un pais';
                        } else {
                            paisRed(val.pais);
                        }
                        if (val.estado === -1){
                            errores.estado = 'Seleccione un estado';
                        } else {
                            estadoRed(val.estado);
                        }
                        if (val.ciudad === -1){
                            errores.ciudad = 'Seleccione una ciudad';
                        } else {
                            ciudadRed(val.ciudad);
                        }
                        return errores;
                    }}
                    onSubmit={async (val)=>{
                        const erroresBD = await (await axios.post('../../api/buscUsuario',{Email: val.email, Nombre: val.nombre, Apellido: val.apellido})).data;
                        setErroresBD(erroresBD);

                        if (!erroresBD.nombre && !erroresBD.apellido && !erroresBD.email){
                            
                            await axios.put('../../api/upInfoUsu',{Email: val.email || descUsuario.Email, Nombre: val.nombre || descUsuario.Nombre, Apellido: val.apellido || descUsuario.Apellido, Fecha_Nac: val.fecha || descUsuario.Fecha_Nac, Contrasena: val.Contrasena || descUsuario.Contrasena, Direccion: val.ciudad || descUsuario.Direccion, EmailAnt: descUsuario.Email});

                            dispatch(datosUsuario({Email: val.email || descUsuario.Email, Nombre: val.nombre || descUsuario.Nombre, Apellido: val.apellido || descUsuario.Apellido, Fecha_Nac: val.fecha || descUsuario.Fecha_Nac, Contrasena: val.Contrasena || descUsuario.Contrasena, Direccion: val.ciudad || descUsuario.Direccion, EmailAnt: descUsuario.Email}));

                            navigate('/usuario/info');
                        }
                    }}
                >
                    {({errors})=>(
                        <Form>
                            {erroresBD.nombre && <div style={{fontSize: "15px", color: "red"}}>{erroresBD.nombre}</div>}
                            <ErrorMessage name="nombre" id="nombre" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.nombre}</div>)}/>

                            <Field type="text" placeholder={descUsuario.Nombre} name="nombre"/>

                            {erroresBD.apellido && <div style={{fontSize: "15px", color: "red"}}>{erroresBD.apellido}</div>}
                            <ErrorMessage name="apellido" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.apellido}</div>)}/>

                            <Field type="text" placeholder={descUsuario.Apellido} name="apellido"/>

                            {erroresBD.email && <div style={{fontSize: "15px", color: "red"}}>{erroresBD.email}</div>}
                            <ErrorMessage name="email" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.email}</div>)}/>
                            
                            <Field type="email" placeholder={descUsuario.Email} name="email"/>

                            <ErrorMessage name="contra" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.contra}</div>)}/>

                            <Field type="password" placeholder={descUsuario.Contrasena} name="contra"/>

                            <ErrorMessage name="repContra" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.repContra}</div>)}/>

                            <Field type="password" placeholder={descUsuario.Contrasena} name="repContra"/>

                            <ErrorMessage name="fecha" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.fecha}</div>)}/>

                            <Field type="date" placeholder={descUsuario.Fecha_Nac} name="fecha"/>
                            
                            <ErrorMessage name="pais" id="pais" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.pais}</div>)}/>

                            <Field type="text" placeholder="Pais" name="pais" as="select">
                            <option hidden value={-1}>Selecciona el pais</option>
                            {paises.map(pais => {
                                if (pais.Id_Pais === Pais.Id_Pais){
                                    return <option selected key={pais.Id_Pais} value={pais.Id_Pais}>{pais.Nombre}</option>
                                }
                                else {
                                    return <option key={pais.Id_Pais} value={pais.Id_Pais}>{pais.Nombre}</option>
                                }
                            })}
                            </Field>

                            <ErrorMessage name="estado" id="estado" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.estado}</div>)}/>

                            <Field type="text" placeholder="Estado" name="estado" as="select">
                            <option hidden value={-1}>Selecciona el estado</option>
                            {estados.map(estado => {
                                if (estado.Id_Estado === Estado.Id_Estado){
                                    return <option selected key={estado.Id_Estado} value={estado.Id_Estado} onClick={()=>estadoRed(estado.Id_Estado)}>{estado.Nombre}</option>
                                }
                                else {
                                    return <option key={estado.Id_Estado} value={estado.Id_Estado} onClick={()=>estadoRed(estado.Id_Estado)}>{estado.Nombre}</option>
                                }
                            })}
                            </Field>

                            <ErrorMessage name="ciudad" id="ciudad" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.ciudad}</div>)}/>

                            <Field type="text" placeholder="Ciudad" name="ciudad" as="select">
                            <option hidden value={-1}>Selecciona la ciudad</option>
                            {ciudades.map(ciudad => {
                                if (ciudad.Id_Ciudad === Ciudad.Id_Ciudad){
                                    return <option selected key={ciudad.Id_Ciudad} value={ciudad.Id_Ciudad}>{ciudad.Nombre}</option>
                                }
                                else {
                                    return <option key={ciudad.Id_Ciudad} value={ciudad.Id_Ciudad}>{ciudad.Nombre}</option>
                                }
                            })}
                            </Field>      

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

export {ModInfo};