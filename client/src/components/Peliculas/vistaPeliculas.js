import React, { useEffect, useState } from "react";
import '../../assets/personajes.css'
import Carousel from 'react-multi-carousel';
import 'react-multi-carousel/lib/styles.css';
import axios from "axios";
import { imagenes } from "../../assets/img/imgdb";
import { CuadroPeliculas } from "./cuadroPelicula";
import { useSelector } from "react-redux";

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
        }
        traerInfo();
    },[]);

    const admin = () => {
        if (descUsuario.Email === 'admin@gmail.com'){
            return (
            <>
                <button className='btn btn-danger' style={{margin: '15px 0 15px 10px'}}>Agregar Pelicula</button>
                <button className='btn btn-danger' style={{margin: '15px 0 15px 10px'}}>Agregar Relacion Personaje/Pelicula</button>
                <button className='btn btn-danger' style={{margin: '15px 0 15px 10px'}}>Agregar Relacion Organizacion/Pelicula</button>
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
                
                    {peliculas.map(pelicula => {
                            return <CuadroPeliculas prop={pelicula} key={pelicula.T_Pelicula}/>
                        })}     
            </Carousel>
            </div>
            <div className="tituloCont">
                <h2>Lista de peliculas de marvel</h2>
            </div>
            <div className="vistaPers">
                {peliculas.map(pelicula => {
                    return <CuadroPeliculas prop={pelicula} key={pelicula.T_Pelicula}/>
                })}
            </div>
        </>
    );
}

export {VistaPeliculas};