import React, { useEffect, useState } from "react";
import '../../assets/personajes.css'
import { CuadroOrganizaciones } from "./cuadroOrg";
import Carousel from 'react-multi-carousel';
import 'react-multi-carousel/lib/styles.css';
import axios from "axios";
import { imagenes } from "../../assets/img/imgdb";
import { useSelector } from "react-redux";

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

    useEffect(()=> {
        const traerInfo = async () => {
            const orgs = await (await axios.get('/api/organizaciones')).data;
            for (let i=0; i<orgs.length;i++){
                const img = imagenes.find(img => img.pos == orgs[i].imagen);
                if (img){
                    orgs[i].imagen = img.img;
                }
            }
            setOrganizaciones(orgs);
        }
        traerInfo();
    },[]);
    
    const admin = () => {
        if (descUsuario.Email === 'admin@gmail.com'){
            return (
            <>
                <button className='btn btn-danger' style={{margin: '15px 0 15px 10px'}}>Agregar Organizacion</button>
                <button className='btn btn-danger' style={{margin: '15px 0 15px 10px'}}>Agregar Relacion Personaje/Organizacion</button>
            </>
            );
        }
        return (<></>);
    }

    return (
        <>
            {admin()}
            <div className="tituloCont">
                <h2>Populares</h2>
            </div>
            <div className="carrusel">
            <Carousel 
                responsive={responsive}
                infinite={true}
                centerMode={true}       
            >
                    {organizaciones.map(org => {
                            return <CuadroOrganizaciones prop={org} key={org.Nombre}/>
                        })}     
            </Carousel>
            </div>
            <div className="tituloCont">
                <h2>Lista de personajes de marvel</h2>
            </div>
            <div className="vistaPers">
                {organizaciones.map(org => {
                    return <CuadroOrganizaciones prop={org} key={org.Nombre}/>
                })}
            </div>
        </>
    );
}

export {VistaOrgs};