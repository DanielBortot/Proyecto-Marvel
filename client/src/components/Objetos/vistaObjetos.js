import React, { useEffect, useState } from "react";
import '../../assets/personajes.css'
import Carousel from 'react-multi-carousel';
import 'react-multi-carousel/lib/styles.css';
import axios from "axios";
import { imagenes } from "../../assets/img/imgdb";
import { CuadroObjeto } from "./cuadroObjeto";
import { HeaderPers } from "../headerpers";
import { useSelector } from "react-redux";
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faMagnifyingGlass } from '@fortawesome/free-solid-svg-icons'
import ClipLoader from "react-spinners/ClipLoader";

function VistaObjetos () {

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
    const [objetos, setObjetos] = useState([]);
    const [objsFil, setObjsFil] = useState([]);

    useEffect(()=> {
        const traerInfo = async () => {
            setLoading(true)
            const objs = await (await axios.get('/api/getObjetos')).data;
            for (let i=0; i<objs.length;i++){
                const img = imagenes.find(img => img.pos == objs[i].Imagen);
                if (img){
                    objs[i].Imagen = img.img;
                }
            }
            setObjetos(objs);
            setObjsFil(objs);
            setLoading(false);
        }
        traerInfo();
    },[]);

    const admin = () => {
        if (descUsuario.Email === 'admin@gmail.com'){
            return (
            <>
                <button className='btn btn-danger' style={{margin: '15px 0 15px 10px'}} to={'AgObjeto'}>Agregar Objeto</button>
                <button className='btn btn-danger' style={{margin: '15px 0 15px 10px'}} to={'AgCrea'}>Agregar Creador de un Objeto</button>
            </>
            );
        }
        return (<></>);
    }

    const handleChange = e => {
        if (!e.target.value){
            setObjsFil(objetos);
        }
        else {
            const filtro = objetos.filter(obj => obj.Nombre.toLowerCase().includes(e.target.value.toLowerCase()));
            setObjsFil(filtro);
        }
    }
    
    return (
        <>
            <HeaderPers/>
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
                            <input type="text" placeholder="Buscar Objeto" onChange={handleChange}/>
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
                            {objsFil.map(obj => {
                                    return <CuadroObjeto prop={obj} key={obj.Nombre}/>
                                })}     
                    </Carousel>
                    </div>
                    <div className="tituloCont">
                        <h2>Lista de objetos de marvel</h2>
                    </div>
                    <div className="vistaPers">
                        {objsFil.map(obj => {
                            return <CuadroObjeto prop={obj} key={obj.Nombre}/>
                        })}
                    </div>
                </div>
            }
        </>
    );
}

export {VistaObjetos};