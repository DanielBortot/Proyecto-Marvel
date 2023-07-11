import React from "react";
import '../../assets/personajesMed.css';
import { useNavigate } from "react-router-dom";
import {useDispatch} from "react-redux";
import { descOrganizacion } from "../../reducers/orgsSlice";
import { Link } from "react-router-dom";
import { datosReporte } from "../../reducers/reportesSlice";
import axios from "axios";

function CuadroOrgMedio ({prop, email, op, orgs, setOrgs}) {
    const dispatch = useDispatch();
    const navigate = useNavigate()
    const {Imagen, Nombre, N_Titulo} = prop
    const enviar = ()=> {
        dispatch(descOrganizacion(prop));
        navigate(`/organizaciones/${Nombre}`);
    }

    const delDatos = async ()=> {
        await axios.post('/api/delOrgMedio',{nombreOrg: Nombre, titulo: N_Titulo});
        const organizaciones = orgs.filter(org => org.Nombre !== Nombre);;
        setOrgs(organizaciones);
    }

    const admin = ()=> {
        if (email && email === 'admin@gmail.com'){
            return (
                <>
                    <button className='btn btn-danger' onClick={delDatos} style={{margin: '15px 0 15px 10px'}}>Eliminar Organizacion</button>
                    <Link className='btn btn-danger' onClick={()=>{dispatch(datosReporte(prop))}} style={{margin: '15px 0 15px 10px'}} to={'/medios/ModOrgMedio'}>Modificar Organizacion</Link>
                </>
            );
        }
        else {
            return (<></>);
        }
    }

    return (
        <>
            <div>
                <div onClick={enviar} style={{textDecoration: 'none', cursor: "pointer"}}>
                    <div className="cajaPersM" onClick={enviar}>
                        <div className="contPersM1">
                            <div className="bordeImg">
                                <img src={Imagen} alt="..." className="imagen"/>
                            </div>

                            <div className="tituloPers">
                                <h3>{Nombre}</h3>
                            </div>
                        </div>
                        <div className="contPersM2">
                            <p><span style={{fontWeight: 'bolder'}}>ROL</span>:</p>
                            <p><span style={{fontWeight: 'bolder'}}>Estado</span>:</p>
                        </div>
                        <div className="contPersM3">
                            <p>{prop.Rol}</p>
                            <p>{prop.Estado}</p>
                        </div>
                    </div>
                </div>
                {admin()}
            </div>
        </>
    )
}

export {CuadroOrgMedio};