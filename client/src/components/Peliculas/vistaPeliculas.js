import React, { useEffect, useState } from "react";
import '../../assets/personajes.css'
import Carousel from 'react-multi-carousel';
import 'react-multi-carousel/lib/styles.css';
import axios from "axios";
import { imagenes } from "../../assets/img/imgdb";
import { CuadroPeliculas } from "./cuadroPelicula";
import { useSelector } from "react-redux";
import { Link } from "react-router-dom";
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faMagnifyingGlass } from '@fortawesome/free-solid-svg-icons'
import ClipLoader from "react-spinners/ClipLoader";

function VistaPeliculas () {

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
    const [peliculas, setPeliculas] = useState([]);
    const [peliPopu, setPeliPopu] = useState([]);
    const [pelisFil, setPelisFil] = useState([]);

    useEffect(()=> {
        const traerInfo = async () => {
            setLoading(true)
            const peliculas = await (await axios.post('/api/peliculas',{suscrip: descUsuario.Id_Suscripcion})).data;
            for (let i=0; i<peliculas.length;i++){
                const img = imagenes.find(img => img.pos == peliculas[i].Imagen);
                if (img){
                    peliculas[i].Imagen = img.img;
                }
            }
            const popu = await (await axios.post('/api/peliPopulares',{suscrip: descUsuario.Id_Suscripcion})).data;
            for (let i=0; i<popu.length;i++){
                const img = imagenes.find(img => img.pos == popu[i].Imagen);
                if (img){
                    popu[i].Imagen = img.img;
                }
            }
            
            setPeliculas(peliculas);
            setPeliPopu(popu);
            setPelisFil(peliculas);
            setLoading(false);
        }
        traerInfo();
    },[]);

    const admin = () => {
        if (descUsuario.Email === 'admin@gmail.com'){
            return (
            <>
                <Link className='btn btn-danger' style={{margin: '15px 0 15px 10px'}} to={'AgPelicula'}>Agregar Pelicula</Link>
                <Link className='btn btn-danger' style={{margin: '15px 0 15px 10px'}} to={'AgPersPeli'}>Agregar Personaje a Pelicula</Link>
                <Link className='btn btn-danger' style={{margin: '15px 0 15px 10px'}} to={'AgOrgPeli'}>Agregar Organizacion a Pelicula</Link>
            </>
            );
        }
        return (<></>);
    }

    const handleChange = e => {
        if (!e.target.value){
            setPelisFil(peliculas);
        }
        else {
            const filtro = peliculas.filter(peli => peli.T_Pelicula.toLowerCase().includes(e.target.value.toLowerCase()));
            setPelisFil(filtro);
        }
    }
    
    return (
        <>
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
                        <input type="text" placeholder="Buscar Película" onChange={handleChange}/>
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
                    
                        {peliPopu.map(pelicula => {
                                return <CuadroPeliculas prop={pelicula} key={pelicula.T_Pelicula}/>
                            })}     
                </Carousel>
                </div>
                <div className="tituloCont">
                    <h2>Lista de peliculas de marvel</h2>
                </div>
                <div className="vistaPers">
                    {pelisFil.map(pelicula => {
                        return <CuadroPeliculas prop={pelicula} key={pelicula.T_Pelicula}/>
                    })}
                </div>
            </div>
        }
        </>
    );
}

export {VistaPeliculas};