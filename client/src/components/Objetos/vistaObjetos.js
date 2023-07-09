import React, { useEffect, useState } from "react";
import '../../assets/personajes.css'
import Carousel from 'react-multi-carousel';
import 'react-multi-carousel/lib/styles.css';
import axios from "axios";
import { imagenes } from "../../assets/img/imgdb";
import { CuadroObjeto } from "./cuadroObjeto";
import { HeaderPers } from "../headerpers";
import { useSelector } from "react-redux";

function VistaObjetos () {

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

    useEffect(()=> {
        const traerInfo = async () => {
            const objs = await (await axios.get('/api/getObjetos')).data;
            for (let i=0; i<objs.length;i++){
                const img = imagenes.find(img => img.pos == objs[i].Imagen);
                if (img){
                    objs[i].Imagen = img.img;
                }
            }
            setObjetos(objs);
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
    
    return (
        <>
            <HeaderPers/>
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
                    {objetos.map(obj => {
                            return <CuadroObjeto prop={obj} key={obj.Nombre}/>
                        })}     
            </Carousel>
            </div>
            <div className="tituloCont">
                <h2>Lista de objetos de marvel</h2>
            </div>
            <div className="vistaPers">
                {objetos.map(obj => {
                    return <CuadroObjeto prop={obj} key={obj.Nombre}/>
                })}
            </div>
        </>
    );
}

export {VistaObjetos};