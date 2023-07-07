import React, { useEffect, useState } from "react";
import '../../assets/personajes.css'
import { CuadroPers } from "./cuadroPers";
import Carousel from 'react-multi-carousel';
import 'react-multi-carousel/lib/styles.css';
import axios from "axios";
import { imagenes } from "../../assets/img/imgdb";
import { useSelector } from "react-redux";

function VistaPersonajes () {

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

    useEffect(()=> {
        const traerInfo = async () => {
            const personajes = await (await axios.get('/api/personajes')).data;
            for (let i=0; i<personajes.length;i++){
                const img = imagenes.find(img => img.pos == personajes[i].imagen);
                if (img){
                    personajes[i].imagen = img.img;
                }
            }
            setPersonajes(personajes);
        }
        traerInfo();
    },[]);

    const admin = () => {
        if (descUsuario.Email === 'admin@gmail.com'){
            return (
            <>
                <button className='btn btn-danger' style={{margin: '15px 0 15px 10px'}}>Agregar Heroe</button>
                <button className='btn btn-danger' style={{margin: '15px 0 15px 10px'}}>Agregar Villano</button>
                <button className='btn btn-danger' style={{margin: '15px 0 15px 10px'}}>Agregar Civil</button>
                <button className='btn btn-danger' style={{margin: '15px 0 15px 10px'}}>Agregar Relacion</button>
                <button className='btn btn-danger' style={{margin: '15px 0 15px 10px'}}>Agregar Enfrentamiento</button>
                <button className='btn btn-danger' style={{margin: '15px 0 15px 10px'}}>Agregar Combate</button>
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
                    {personajes.map(personaje => {
                            return <CuadroPers prop={personaje} key={personaje.Nombre}/>
                        })}     
            </Carousel>
            </div>
            <div className="tituloCont">
                <h2>Lista de personajes de marvel</h2>
            </div>
            <div className="vistaPers">
                {personajes.map(personaje => {
                    return <CuadroPers prop={personaje} key={personaje.Nombre}/>
                })}
            </div>
        </>
    );
}

export {VistaPersonajes};