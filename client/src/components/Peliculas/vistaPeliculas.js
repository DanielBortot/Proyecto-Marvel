import React, { useEffect, useState } from "react";
import '../../assets/personajes.css'
import Carousel from 'react-multi-carousel';
import 'react-multi-carousel/lib/styles.css';
import axios from "axios";
import { imagenes } from "../../assets/img/imgdb";
import { CuadroPeliculas } from "./cuadroPelicula";
import { useSelector } from "react-redux";
import { Link } from "react-router-dom";

function VistaPeliculas () {

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
    const [pelisFil, setPelisFil] = useState([]);

    useEffect(()=> {
        const traerInfo = async () => {
            const peliculas = await (await axios.get('/api/peliculas')).data;
            for (let i=0; i<peliculas.length;i++){
                const img = imagenes.find(img => img.pos == peliculas[i].Imagen);
                if (img){
                    peliculas[i].Imagen = img.img;
                }
            }
            setPeliculas(peliculas);
            setPelisFil(peliculas);
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
            {admin()}
            <div className="formContRegIn">
                <input type="text" placeholder="Buscar Pelicula" onChange={handleChange}/>
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
                
                    {pelisFil.map(pelicula => {
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
        </>
    );
}

export {VistaPeliculas};