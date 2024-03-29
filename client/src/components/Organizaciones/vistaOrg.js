import React, { useEffect, useState } from "react";
import '../../assets/personajes.css'
import { CuadroOrganizaciones } from "./cuadroOrg";
import Carousel from 'react-multi-carousel';
import 'react-multi-carousel/lib/styles.css';
import axios from "axios";
import { imagenes } from "../../assets/img/imgdb";
import { useSelector } from "react-redux";
import { HeaderPers } from "../headerpers";
import { Link } from "react-router-dom";
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faMagnifyingGlass } from '@fortawesome/free-solid-svg-icons'
import ClipLoader from "react-spinners/ClipLoader";

function VistaOrgs () {

    const [loading, setLoading] = useState(false);

    const responsive = {
        superLargeDesktop: {
          // the naming can be any, depends on you.
          breakpoint: { max: 2000, min: 1024 },
          items: 4
        },
        desktop: {
          breakpoint: { max: 1024, min: 800 },
          items: 4
        },
        tablet: {
          breakpoint: { max: 1024, min: 464 },
          items: 2
        },
        mobile: {
          breakpoint: { max: 464, min: 0 },
          items: 1
        }
    };
    const {descUsuario} = useSelector(state => state.usuario);
    const [organizaciones, setOrganizaciones] = useState([]);
    const [orgsFil, setOrgsFil] = useState([]);

    useEffect(()=> {
        const traerInfo = async () => {
            setLoading(true)
            const orgs = await (await axios.get('/api/organizaciones')).data;
            for (let i=0; i<orgs.length;i++){
                const img = imagenes.find(img => img.pos == orgs[i].Imagen);
                if (img){
                    orgs[i].Imagen = img.img;
                }
            }
            setOrganizaciones(orgs);
            setOrgsFil(orgs);
            setLoading(false);
        }
        traerInfo();
    },[]);
    
    const admin = () => {
        if (descUsuario.Email === 'admin@gmail.com'){
            return (
            <>
                <Link className='btn btn-danger' style={{margin: '15px 0 15px 10px'}} to={'AgOrganizacion'}>Agregar Organización</Link>
                <Link className='btn btn-danger' style={{margin: '15px 0 15px 10px'}} to={'AgPersOrg'}>Agregar Personaje a la Organización</Link>
                <Link className='btn btn-danger' style={{margin: '15px 0 15px 10px'}} to={'AgSede'}>Agregar Sede</Link>
            </>
            );
        }
        return (<></>);
    }

    const handleChange = e => {
        if (!e.target.value){
            setOrgsFil(organizaciones);
        }
        else {
            const filtro = organizaciones.filter(org => org.Nombre.toLowerCase().includes(e.target.value.toLowerCase()));
            setOrgsFil(filtro);
        }
    }

    return (
        <>
            <HeaderPers/>
            {loading ?
                <div className="loading">
                    <ClipLoader
                        color={'#ec1d24'}
                        loading={loading}
                        size={100}
                        aria-label="Loading Spinner"
                        data-testid="loader" 
                        speedMultiplier={.5}
                    /> 
                </div> 
            :
                <div>
                    <div className="row">
                        <div className="col-9">{admin()}</div>   
                        <div className="col-3 formContRegIn">
                            <FontAwesomeIcon icon={faMagnifyingGlass} size="2x" style={{padding:'10px'}}/>
                            <input type="text" placeholder="Buscar Organización" onChange={handleChange}/>
                        </div>
                    </div>
                    
                    <div className="tituloCont">
                        <h2>Lista de organizaciones de marvel</h2>
                    </div>
                    <div className="vistaPers">
                        {orgsFil.map(org => {
                            return <CuadroOrganizaciones prop={org} key={org.Nombre}/>
                        })}
                    </div>
                </div>
            }
        </>
    );
}

export {VistaOrgs};