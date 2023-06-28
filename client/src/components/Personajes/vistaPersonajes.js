import React, { useEffect, useState } from "react";
import '../../assets/personajes.css'
import { CuadroPers } from "./cuadroPers";
import Carousel from 'react-multi-carousel';
import 'react-multi-carousel/lib/styles.css';
import axios from "axios";
import { useDispatch} from "react-redux";
import { addPersonaje } from "../../reducers/personajesSlice";
import { imagenes } from "../../assets/img/imgdb";

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

    const prueba = [
        {
            img: 'https://upload.wikimedia.org/wikipedia/en/a/aa/Hulk_%28circa_2019%29.png',
            nombre: 'HULK1',
            tipo: 'SERIE',
            genero: 'masculino',
            color_ojos: 'verdes',
            ocupacion: 'golpear',
            nacionalidad: 'Estados Unidos',
            estado_marital: 'no se'
        },
        {
            img: 'https://upload.wikimedia.org/wikipedia/en/1/19/Marvel_Universe_%28Civil_War%29.jpg',
            nombre: 'HULK2',
            tipo: 'SERIE',
            genero: 'masculino',
            color_ojos: 'verdes',
            ocupacion: 'golpear',
            nacionalidad: 'Estados Unidos',
            estado_marital: 'no se'
        },
        {
            img: 'https://upload.wikimedia.org/wikipedia/en/1/19/Marvel_Universe_%28Civil_War%29.jpg',
            nombre: 'HULK3',
            tipo: 'SERIE',
            genero: 'masculino',
            color_ojos: 'verdes',
            ocupacion: 'golpear',
            nacionalidad: 'Estados Unidos',
            estado_marital: 'no se'
        },
        {
            img: 'https://upload.wikimedia.org/wikipedia/en/1/19/Marvel_Universe_%28Civil_War%29.jpg',
            nombre: 'HULK4',
            tipo: 'SERIE',
            genero: 'masculino',
            color_ojos: 'verdes',
            ocupacion: 'golpear',
            nacionalidad: 'Estados Unidos',
            estado_marital: 'no se'
        },
        {
            img: 'https://upload.wikimedia.org/wikipedia/en/1/19/Marvel_Universe_%28Civil_War%29.jpg',
            nombre: 'HULK5',
            tipo: 'SERIE',
            genero: 'masculino',
            color_ojos: 'verdes',
            ocupacion: 'golpear',
            nacionalidad: 'Estados Unidos',
            estado_marital: 'no se'
        },
        {
            img: 'https://upload.wikimedia.org/wikipedia/en/1/19/Marvel_Universe_%28Civil_War%29.jpg',
            nombre: 'HULK6',
            tipo: 'SERIE',
            genero: 'masculino',
            color_ojos: 'verdes',
            ocupacion: 'golpear',
            nacionalidad: 'Estados Unidos',
            estado_marital: 'no se'
        },
        {
            img: 'https://upload.wikimedia.org/wikipedia/en/1/19/Marvel_Universe_%28Civil_War%29.jpg',
            nombre: 'HULK7',
            tipo: 'SERIE',
            genero: 'masculino',
            color_ojos: 'verdes',
            ocupacion: 'golpear',
            nacionalidad: 'Estados Unidos',
            estado_marital: 'no se'
        },
    ];
    const [personajes, setPersonajes] = useState([]);
    const dispatch = useDispatch();

    useEffect(()=> {
        const traerInfo = async () => {
            const personajes = await (await axios.get('/api/personajes')).data;
            for (let i=0; i<personajes.length;i++){
                const img = imagenes.find(img => img.pos == personajes[i].imagen);
                personajes[i].imagen = img.img;
            }
            setPersonajes(personajes);
            dispatch(addPersonaje(personajes));
        }
        traerInfo();
    },[]);
    
    return (
        <>
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
                            return <CuadroPers prop={personaje} key={personaje.nombre}/>
                        })}     
            </Carousel>
            </div>
            <div className="tituloCont">
                <h2>Lista de personajes de marvel</h2>
            </div>
            <div className="vistaPers">
                {personajes.map(personaje => {
                    return <CuadroPers prop={personaje}/>
                })}
            </div>
        </>
    );
}

export {VistaPersonajes};