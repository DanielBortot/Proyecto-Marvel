import React, { useEffect, useState } from 'react';
import ReactPlayer from 'react-player';
import Slider from '@mui/material/Slider';
import Rating from '@mui/material/Rating';
import { useSelector } from 'react-redux';
import axios from 'axios';

function ReproPeli () {
    const [value, setValue] = useState(1);
    const [barra, setBarra] = useState(0);
    const [hora, setHora] = useState('');
    const {peliHist} = useSelector(state => state.peliculas)
    const {Titulo, Id_Perfil, Calificacion, Tiempo_Reproduccion, Duracion, op} = peliHist;

    useEffect(()=>{
        const datos = async () => {
            if (op === 1){
                const calc = Math.round((Tiempo_Reproduccion*100)/Duracion);
                setBarra(calc);
                setValue(Calificacion);
            } else {
                const hist = await (await axios.post('/api/addHist',{calificacion: value, tVista: 0, perfil: Id_Perfil, titulo: Titulo})).data;
                setHora(hist[0].tiempo);
            }
        }
        datos();
        
    },[])

    const updateBarra = async (e, newValue) => {
        setBarra(newValue)
        const calc = Math.round((newValue*Duracion)/100);
        await axios.put('/api/upHist',{calificacion: value, tVista: calc, perfil: Id_Perfil, titulo: Titulo, inicio: hora})
    }
    
    const updateCali = async (e, newValue) => {
        setValue(newValue)
        console.log(newValue)
        const calc = Math.round((barra*Duracion)/100);
        await axios.put('/api/upHist',{calificacion: newValue, tVista: calc, perfil: Id_Perfil, titulo: Titulo, inicio: hora})
    }

    return(
        <>
            
            <div style={{width: '55%', height: '55%', position: 'absolute', margin: '40px', marginLeft: '20%'}}>
                <h3>Nombre de la pelicula</h3>
                <ReactPlayer 
                    url='https://www.youtube.com/watch?v=dQw4w9WgXcQ'
                    width= '100%'
                    height= '100%'
                    controls
                    />
                <h4>Tiempo de reproducción</h4>                   
                <Slider defaultValue={0} value={barra} onChange={updateBarra} aria-label="Default" valueLabelDisplay="auto" color= "secondary" /> 
                <h4>Calificación</h4>
                <Rating name="simple-controlled" value={value} onChange={updateCali}/>   
            </div>

        </>
    );
};

export {ReproPeli};