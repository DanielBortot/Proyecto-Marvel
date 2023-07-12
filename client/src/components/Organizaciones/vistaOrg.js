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

function VistaOrgs () {

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
            const orgs = await (await axios.get('/api/organizaciones')).data;
            for (let i=0; i<orgs.length;i++){
                const img = imagenes.find(img => img.pos == orgs[i].Imagen);
                if (img){
                    orgs[i].Imagen = img.img;
                }
            }
            setOrganizaciones(orgs);
            setOrgsFil(orgs);
        }
        traerInfo();
    },[]);
    
    const admin = () => {
        if (descUsuario.Email === 'admin@gmail.com'){
            return (
            <>
                <Link className='btn btn-danger' style={{margin: '15px 0 15px 10px'}} to={'AgOrganizacion'}>Agregar Organizacion</Link>
                <Link className='btn btn-danger' style={{margin: '15px 0 15px 10px'}} to={'AgPersOrg'}>Agregar Personaje a la Organizacion</Link>
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
            {admin()}
            <div className="formContRegIn">
                <input type="text" placeholder="Buscar Organizacion" onChange={handleChange}/>
            </div>
            <div className="tituloCont">
                <h2>Populares</h2>
            </div>
            <div className="carrusel">
            <Carousel 
                responsive={responsive}
                infinite={true}
                centerMode={true}       
            >
                    {orgsFil.map(org => {
                            return <CuadroOrganizaciones prop={org} key={org.Nombre}/>
                        })}     
            </Carousel>
            </div>
            <div className="tituloCont">
                <h2>Lista de organizaciones de marvel</h2>
            </div>
            <div className="vistaPers">
                {orgsFil.map(org => {
                    return <CuadroOrganizaciones prop={org} key={org.Nombre}/>
                })}
            </div>
        </>
    );
}

export {VistaOrgs};