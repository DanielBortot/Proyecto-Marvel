import React, { useEffect, useState } from "react";
import '../../assets/personajes.css'
import Carousel from 'react-multi-carousel';
import 'react-multi-carousel/lib/styles.css';
import axios from "axios";
import { imagenes } from "../../assets/img/imgdb";
import { CuadroSeries } from "./cuadroSeries";
import { useSelector } from "react-redux";
import { Link } from "react-router-dom";
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faMagnifyingGlass } from '@fortawesome/free-solid-svg-icons'

function VistaSeries () {

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
    const [series, setSeries] = useState([]);
    const [seriesFil, setSeriesFil] = useState([]);

    useEffect(()=> {
        const traerInfo = async () => {
            const series = await (await axios.get('/api/series')).data;
            for (let i=0; i<series.length;i++){
                const img = imagenes.find(img => img.pos == series[i].Imagen);
                if (img){
                    series[i].Imagen = img.img;
                }
            }
            setSeries(series);
            setSeriesFil(series);
        }
        traerInfo();
    },[]);

    const admin = () => {
        if (descUsuario.Email === 'admin@gmail.com'){
            return (
            <>
                <Link className='btn btn-danger' style={{margin: '15px 0 15px 10px'}} to={'AgSerie'}>Agregar Serie</Link>
                <Link className='btn btn-danger' style={{margin: '15px 0 15px 10px'}} to={'AgPersSerie'}>Agregar Personaje a Serie</Link>
                <Link className='btn btn-danger' style={{margin: '15px 0 15px 10px'}} to={'AgOrgSerie'}>Agregar Organizacion a Serie</Link>
            </>
            );
        }
        return (<></>);
    }

    const handleChange = e => {
        if (!e.target.value){
            setSeriesFil(series);
        }
        else {
            const filtro = series.filter(ser => ser.T_Serie.toLowerCase().includes(e.target.value.toLowerCase()));
            setSeriesFil(filtro);
        }
    }
    
    return (
        <>
            <div className="row">
                <div className="col-9">{admin()}</div>   
                <div className="col-3 formContRegIn">
                    <FontAwesomeIcon icon={faMagnifyingGlass} size="2x" style={{padding:'10px'}}/>
                    <input type="text" placeholder="Buscar Serie" onChange={handleChange}/>
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
                
                    {seriesFil.map(serie => {
                            return <CuadroSeries prop={serie} key={serie.T_Serie}/>
                        })}     
            </Carousel>
            </div>
            <div className="tituloCont">
                <h2>Lista de series de marvel</h2>
            </div>
            <div className="vistaPers">
                {seriesFil.map(serie => {
                    return <CuadroSeries prop={serie} key={serie.T_Serie}/>
                })}
            </div>
        </>
    );
}

export {VistaSeries};