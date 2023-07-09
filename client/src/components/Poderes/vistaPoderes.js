import React, { useEffect, useState } from "react";
import '../../assets/personajes.css'
import Carousel from 'react-multi-carousel';
import 'react-multi-carousel/lib/styles.css';
import axios from "axios";
import { imagenes } from "../../assets/img/imgdb";
import { CuadroPoder } from "./cuadroPoder";
import { HeaderPers } from "../headerpers";
import { useSelector } from "react-redux";
import { Link } from "react-router-dom";


function VistaPoderes () {

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
    const [poderes, setPoderes] = useState([]);

    useEffect(()=> {
        const traerInfo = async () => {
            const pods = await (await axios.get('/api/poderes')).data;
            for (let i=0; i<pods.length;i++){
                const img = imagenes.find(img => img.pos == pods[i].Imagen);
                if (img){
                    pods[i].Imagen = img.img;
                }
            }
            setPoderes(pods);
        }
        traerInfo();
    },[]);
    
    const admin = () => {
        if (descUsuario.Email === 'admin@gmail.com'){
            return (
            <>
                <Link className='btn btn-danger' style={{margin: '15px 0 15px 10px'}} to={'AgPoder'}>Agregar Poder</Link>
                <Link className='btn btn-danger' style={{margin: '15px 0 15px 10px'}} to={'AgPoseePers'}>Agregar Poseedor de un Poder</Link>
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
                    {poderes.map(pod => {
                            return <CuadroPoder prop={pod} key={pod.Nombre}/>
                        })}     
            </Carousel>
            </div>
            <div className="tituloCont">
                <h2>Lista de poderes de marvel</h2>
            </div>
            <div className="vistaPers">
                {poderes.map(pod => {
                    return <CuadroPoder prop={pod} key={pod.Nombre}/>
                })}
            </div>
        </>
    );
}

export {VistaPoderes};