import React, { useEffect, useState } from "react";
import '../../assets/personajes.css'
import { CuadroPers } from "./cuadroPers";
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

function VistaPersonajes () {


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
    const [personajes, setPersonajes] = useState([]);
    const [persFil, setPersFil] = useState([]);

    useEffect(()=> {
        const traerInfo = async () => {
            setLoading(true)
            const personajes = await (await axios.get('/api/personajes')).data;
            for (let i=0; i<personajes.length;i++){
                const img = imagenes.find(img => img.pos == personajes[i].imagen);
                if (img){
                    personajes[i].imagen = img.img;
                }
                const dato = await (await axios.post('/api/villHer',{Nombre: personajes[i].Nombre})).data;
                personajes[i] = {...personajes[i], ...dato}
            }
            setPersonajes(personajes);
            setPersFil(personajes);
            setLoading(false);
        }
        traerInfo();
    },[]);

    const admin = () => {
        if (descUsuario.Email === 'admin@gmail.com'){
            return (
            <>
                <Link className='btn btn-danger' style={{margin: '15px 0 15px 10px'}} to={'AgHeroe'}>Agregar Heroe</Link>
                <Link className='btn btn-danger' style={{margin: '15px 0 15px 10px'}} to={'AgVillano'}>Agregar Villano</Link>
                <Link className='btn btn-danger' style={{margin: '15px 0 15px 10px'}} to={'AgCivil'}>Agregar Civil</Link>
                <Link className='btn btn-danger' style={{margin: '15px 0 15px 10px'}} to={'AgRelacion'}>Agregar Relacion</Link>
                <Link className='btn btn-danger' style={{margin: '15px 0 15px 10px'}} to={'AgEnfrentamiento'}>Agregar Enfrentamiento</Link>
                <Link className='btn btn-danger' style={{margin: '15px 0 15px 10px'}} to={'AgCombate'}>Agregar Combate</Link>
            </>
            );
        }
        return (<></>);
    }
    
    const handleChange = e => {
        if (!e.target.value){
            setPersFil(personajes);
        }
        else {
            const filtro = personajes.filter(pers => pers.Nombre.toLowerCase().includes(e.target.value.toLowerCase()));
            setPersFil(filtro);
        }
    }

    return (
        <>
            <HeaderPers/>
            {loading ?
                <ClipLoader
                    color={'#ec1d24'}
                    loading={loading}
                    size={100}
                    aria-label="Loading Spinner"
                    data-testid="loader" 
                    speedMultiplier={.5}
                />  
            :
            <div>
                <div className="row">
                    <div className="col-9">{admin()}</div>   
                    <div className="col-3 formContRegIn">
                        <FontAwesomeIcon icon={faMagnifyingGlass} size="2x" style={{padding:'10px'}}/>
                        <input type="text" placeholder="Buscar Personaje" onChange={handleChange}/>
                    </div>
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
                        {persFil.map(personaje => {
                                return <CuadroPers prop={personaje} key={personaje.Nombre}/>
                            })}     
                </Carousel>
                </div>
                <div className="tituloCont">
                    <h2>Lista de personajes de marvel</h2>
                </div>
                <div className="vistaPers">
                    {persFil.map(personaje => {
                        return <CuadroPers prop={personaje} key={personaje.Nombre}/>
                    })}
                </div>
            </div>
            }
        </>
    );
}

export {VistaPersonajes};