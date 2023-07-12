import React, { useEffect, useState } from "react";
import '../../assets/personajes.css'
import Carousel from 'react-multi-carousel';
import 'react-multi-carousel/lib/styles.css';
import axios from "axios";
import { imagenes } from "../../assets/img/imgdb";
import { CuadroJuegos } from "./cuadroJuego";
import { useSelector } from "react-redux";
import { Link } from "react-router-dom";

function VistaJuegos () {

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
    const [juegos, setJuegos] = useState([]);
    const [juegosFil, setJuegosFil] = useState([]);

    useEffect(()=> {
        const traerInfo = async () => {
            const juegos = await (await axios.get('/api/juegos')).data;
            for (let i=0; i<juegos.length;i++){
                const img = imagenes.find(img => img.pos == juegos[i].Imagen);
                if (img){
                    juegos[i].Imagen = img.img;
                }
            }
            setJuegos(juegos);
            setJuegosFil(juegos);
        }
        traerInfo();
    },[]);
    
    const admin = () => {
        if (descUsuario.Email === 'admin@gmail.com'){
            return (
            <>
                <Link className='btn btn-danger' style={{margin: '15px 0 15px 10px'}} to={'AgJuego'}>Agregar Juego</Link>
                <Link className='btn btn-danger' style={{margin: '15px 0 15px 10px'}} to={'AgPersJuego'}>Agregar Personaje a Juego</Link>
                <Link className='btn btn-danger' style={{margin: '15px 0 15px 10px'}} to={'AgOrgJuego'}>Agregar Organizacion a Juego</Link>
            </>
            );
        }
        return (<></>);
    }

    const handleChange = e => {
        if (!e.target.value){
            setJuegosFil(juegos);
        }
        else {
            const filtro = juegos.filter(juego => juego.T_Juego.toLowerCase().includes(e.target.value.toLowerCase()));
            setJuegosFil(filtro);
        }
    }

    return (
        <>
            {admin()}
            <div className="formContRegIn">
                <input type="text" placeholder="Buscar Juego" onChange={handleChange}/>
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
                
                    {juegosFil.map(juego => {
                            return <CuadroJuegos prop={juego} key={juego.T_Juego}/>
                        })}     
            </Carousel>
            </div>
            <div className="tituloCont">
                <h2>Lista de juegos de marvel</h2>
            </div>
            <div className="vistaPers">
                {juegosFil.map(juego => {
                    return <CuadroJuegos prop={juego} key={juego.T_Juego}/>
                })}
            </div>
        </>
    );
}

export {VistaJuegos};