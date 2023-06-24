import React from "react";
import { useEffect, useState } from "react";
import '../../assets/registro.css';
import axios from 'axios';
import { useDispatch } from "react-redux";
import { datosUsuario } from "../../reducers/usuarioSlice";
import { Formik, Form, ErrorMessage, Field } from "formik";
import { useNavigate } from "react-router-dom";
import { setPais, setEstado, setCiudad } from "../../reducers/direccionSlice";

function Register() {
    const [colores, setColores] = useState(['nselec','nselec','nselec','nselec']);
    const [erroresBD, setErroresBD] = useState({});
    const [paises, setPaises] = useState([]);
    const [estados, setEstados] = useState([]);
    const [ciudades, setCiudades] = useState([]);
    const [op, setOp] = useState([]);
    const dispatch = useDispatch();
    const navigate = useNavigate();

    useEffect(()=>{
        const cargarPaises = async () => {
            const ps = await (await axios.get('/api/paises')).data;
            setPaises(ps);
        }
        cargarPaises();
    },[]);

    const paisRed = async (id) => {
        paises.map(pais => {
            if (pais.Id_Pais === id){
                dispatch(setPais(pais));
            }
            return 0;
        });
        const list = op;
        list[0] = id;
        setOp(list);
        const estados = await (await axios.post('/api/estados',{Id_Pais: id})).data;
        setEstados(estados);
    }

    const estadoRed = async (id) => {
        estados.map(estado => {
            if (estado.Id_Estado === id){
                dispatch(setEstado(estado));
            }
            return 0;
        });
        const list = op;
        list[1] = id;
        setOp(list);
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
                        fecha: '',
                        pais: '',
                        estado: '',
                        ciudad: ''
                    }}
                    validate={(val)=> {
                        let errores = {};
                        if (!val.nombre || !/^[a-zA-Z]{1,50}$/.test(val.nombre)){
                            errores.nombre = 'Introduzca un nombre valido';
                        }
                        if (!val.apellido || !/^[a-zA-Z]{1,50}$/.test(val.apellido)){
                            errores.apellido = 'Introduzca un apellido valido';
                        }
                        if (!val.email || !/^[-\w.%+]{1,64}@(?:[A-Z0-9-]{1,63}\.){1,125}[A-Z]{2,63}$/i.test(val.email)){
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
                        if (!val.pais || val.pais === -1){
                            errores.pais = 'Seleccione un pais';
                        } else {
                            if (op[0] !== val.pais){
                                val.estado = -1;
                                val.ciudad = -1;
                            }
                            paisRed(val.pais);
                        }
                        if (!val.estado || val.estado === -1){
                            errores.estado = 'Seleccione un estado';
                        } else {
                            if (op[1] !== val.estado){
                                val.ciudad = -1;
                            }
                            estadoRed(val.estado);
                        }
                        if (!val.ciudad || val.ciudad === -1){
                            errores.ciudad = 'Seleccione una ciudad';
                        } else {
                            ciudadRed(val.ciudad);
                        }
                        return errores;
                    }}
                    onSubmit={async (val)=>{
                        const erroresBD = await (await axios.post('api/buscUsuario',{Email: val.email, Nombre: val.nombre, Apellido: val.apellido})).data;
                        setErroresBD(erroresBD);
                        const date = new Date();

                        if (!erroresBD.nombre && !erroresBD.apellido && !erroresBD.email){

                            const col = colores.findIndex(c => c ==='selec');

                            if (col === -1 || col === 3){
                                await axios.post('api/register',{Nombre: val.nombre, Apellido: val.apellido, Email: val.email, Contrasena: val.contra, Direccion: val.ciudad, N_Tarjeta: null, Id_Suscripcion: 4, Fecha_Creacion: date.toLocaleDateString(), Fecha_Nac: val.fecha});

                                dispatch(datosUsuario({Nombre: val.nombre, Apellido: val.apellido, Email: val.email, Contrasena: val.contra, Direccion: val.ciudad, N_Tarjeta: null, Id_Suscripcion: 4, Fecha_Creacion: date.toLocaleDateString(), Fecha_Nac: val.fecha}));
                                navigate('/perfil');

                            } else {
                                dispatch(datosUsuario({Nombre: val.nombre, Apellido: val.apellido, Email: val.email, Contrasena: val.contra, Direccion: val.ciudad, N_Tarjeta: null, Id_Suscripcion: col+1, Fecha_Creacion: date.toLocaleDateString(), Fecha_Nac: val.fecha}));
                                navigate('/registro/tarjeta');
                            }
                        }
                    }}
                >
                    {({errors})=>(
                        <Form>
                            {erroresBD.nombre && <div style={{fontSize: "15px", color: "red"}}>{erroresBD.nombre}</div>}
                            <ErrorMessage name="nombre" id="nombre" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.nombre}</div>)}/>

                            <Field type="text" placeholder="Nombre" name="nombre"/>

                            {erroresBD.apellido && <div style={{fontSize: "15px", color: "red"}}>{erroresBD.apellido}</div>}
                            <ErrorMessage name="apellido" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.apellido}</div>)}/>

                            <Field type="text" placeholder="Apellido" name="apellido"/>

                            {erroresBD.email && <div style={{fontSize: "15px", color: "red"}}>{erroresBD.email}</div>}
                            <ErrorMessage name="email" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.email}</div>)}/>
                            
                            <Field type="email" placeholder="Email" name="email"/>

                            <ErrorMessage name="contra" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.contra}</div>)}/>

                            <Field type="password" placeholder="Contraseña" name="contra"/>

                            <ErrorMessage name="repContra" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.repContra}</div>)}/>

                            <Field type="password" placeholder="Repetir Contraseña" name="repContra"/>

                            <ErrorMessage name="fecha" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.fecha}</div>)}/>

                            <Field type="date" placeholder="Fecha de nacimiento" name="fecha"/>
                            
                            <ErrorMessage name="pais" id="pais" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.pais}</div>)}/>

                            <Field type="text" placeholder="Pais" name="pais" as="select">
                            <option hidden selected value={-1}>Selecciona el pais</option>
                            {paises.map(pais => (
                                <option key={pais.Id_Pais} value={pais.Id_Pais}>{pais.Nombre}</option>
                            ))}
                            </Field>

                            <ErrorMessage name="estado" id="estado" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.estado}</div>)}/>

                            <Field type="text" placeholder="Estado" name="estado" as="select">
                            <option hidden selected value={-1}>Selecciona el estado</option>
                            {estados.map(estado => (
                                <option key={estado.Id_Estado} value={estado.Id_Estado} onClick={()=>estadoRed(estado.Id_Estado)}>{estado.Nombre}</option>
                            ))}
                            </Field>

                            <ErrorMessage name="ciudad" id="ciudad" component={()=> (<div style={{fontSize: "15px", color: "red"}}>{errors.ciudad}</div>)}/>

                            <Field type="text" placeholder="Ciudad" name="ciudad" as="select">
                            <option hidden selected value={-1}>Selecciona la ciudad</option>
                            {ciudades.map(ciudad => (
                                <option key={ciudad.Id_Ciudad} value={ciudad.Id_Ciudad}>{ciudad.Nombre}</option>
                            ))}
                            </Field>      
                                
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