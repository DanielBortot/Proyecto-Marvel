import React, { useEffect, useState } from "react";
import '../assets/personajes.css'
import Carousel from 'react-multi-carousel';
import 'react-multi-carousel/lib/styles.css';
import axios from "axios";
import { imagenes } from "../assets/img/imgdb";
import { CuadroPeliculas } from "./Peliculas/cuadroPelicula";
import { useSelector } from "react-redux";
import { CuadroSeries } from "./Series/cuadroSeries";
import { CuadroJuegos } from "./Juegos/cuadroJuego";
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faMagnifyingGlass } from '@fortawesome/free-solid-svg-icons'
import ClipLoader from "react-spinners/ClipLoader";


function VistaInicio () {

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
    const {perfilUso} = useSelector(state => state.perfiles);
    const {descUsuario} = useSelector(state => state.usuario);
    const [medios, setMedios] = useState([]);
    const [mediosRec, setMediosRec] = useState([]);
    const [mediosFil, setMediosFil] = useState([]);

    useEffect(()=> {
        const traerInfo = async () => {
            setLoading(true)
            const medios = await (await axios.post('/api/getHist',{perfil: perfilUso.Id_Perfil, suscrip: descUsuario.Id_Suscripcion})).data;
            for (let i=0; i<medios.length;i++){
                const img = imagenes.find(img => img.pos == medios[i].Imagen);
                if (img){
                    medios[i].Imagen = img.img;
                }
            }
            let medRec = await (await axios.post('/api/getRec',{perfil: perfilUso.Id_Perfil, suscrip: descUsuario.Id_Suscripcion})).data;

            if (medRec.length === 0){
                medRec = await (await axios.post('/api/getPopu',{suscrip: descUsuario.Id_Suscripcion})).data;
            }

            for (let i=0; i<medRec.length;i++){
                const img = imagenes.find(img => img.pos == medRec[i].Imagen);
                if (img){
                    medRec[i].Imagen = img.img;
                }
            }

            setMedios(medios);
            setMediosRec(medRec)
            setMediosFil(medios);
            setLoading(false);
        }
        traerInfo();
    },[]);

    const handleChange = e => {
        if (!e.target.value){
            setMediosFil(medios);
        }
        else {
            const filtro = medios.filter(med => med.Titulo.toLowerCase().includes(e.target.value.toLowerCase()));
            setMediosFil(filtro);
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
                        <div className="col-3 formContRegIn">
                            <FontAwesomeIcon icon={faMagnifyingGlass} size="2x" style={{padding:'10px'}}/>
                            <input type="text" placeholder="Buscar Medio" onChange={handleChange}/>
                        </div>
                    </div>
                    <div className="tituloCont">
                        <h2>Continuar viendo</h2>
                    </div>
                    <div className="carrusel">
                    <Carousel 
                        responsive={responsive}
                        infinite={true}
                        centerMode={true}       
                    >
                            {mediosFil.map(med => {
                                    if (med.T_Serie){
                                        return <CuadroSeries prop={med} key={med.T_Serie} op={5}/>
                                    }
                                    else if (med.T_Pelicula){
                                        return <CuadroPeliculas prop={med} key={med.T_Pelicula} op={5}/>
                                    }
                                    else if (med.T_Juego){
                                        return <CuadroJuegos prop={med} key={med.T_Juego} op={5}/>
                                    }
                                })}        
                    </Carousel>
                    </div>
                    <div className="tituloCont">
                        <h2>Recomendaciones</h2>
                    </div>
                    <div className="vistaPers">
                        {mediosRec.map(med => {
                            if (med.T_Serie){
                                return <CuadroSeries prop={med} key={med.T_Serie}/>
                            }
                            else if (med.T_Pelicula){
                                return <CuadroPeliculas prop={med} key={med.T_Pelicula}/>
                            }
                            else if (med.T_Juego){
                                return <CuadroJuegos prop={med} key={med.T_Juego}/>
                            }
                        })}
                    </div>   
                </div>
            }
        </>
    );
}

export {VistaInicio};