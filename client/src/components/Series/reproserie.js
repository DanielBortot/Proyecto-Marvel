import React, { useState, useEffect } from 'react';
import ReactPlayer from 'react-player';
import Rating from '@mui/material/Rating';
import Slider from '@mui/material/Slider';
import axios from 'axios';
import { useSelector } from 'react-redux';

function ReproSerie () {
    const [value, setValue] = useState(1);
    const [barra, setBarra] = useState(0);
    const [idHist, setIdHist] = useState('');
    const {serieHist} = useSelector(state => state.series);
    const {Titulo, Id_Perfil, Calificacion, Tiempo_Reproduccion, Duracion, op, Id_Hist, N_Episodios} = serieHist;

    useEffect(()=>{
        const datos = async () => {
            if (op === 1){
                const calc = Math.round(Tiempo_Reproduccion/Duracion);
                setBarra(calc);
                setValue(Calificacion);
                setIdHist(Id_Hist);
            } else {
                const hist = await (await axios.post('/api/addHist',{calificacion: value, tVista: 0, perfil: Id_Perfil, titulo: Titulo})).data;
                setIdHist(hist[0].idhist);
            }
        }
        datos();
        
    },[])

    const updateBarra = async (e, newValue) => {
        setBarra(newValue)
        const calc = Math.round((newValue*Duracion));
        await axios.put('/api/upHist',{calificacion: value, tVista: calc, perfil: Id_Perfil, titulo: Titulo, idHist: idHist})
    }
    
    const updateCali = async (e, newValue) => {
        setValue(newValue)
        const calc = Math.round((barra*Duracion));
        await axios.put('/api/upHist',{calificacion: newValue, tVista: calc, perfil: Id_Perfil, titulo: Titulo, idHist: idHist})
        await axios.put('/api/upRating',{titulo: Titulo});
    }

    return(
        <>
            
            <div style={{width: '55%', height: '55%', position: 'absolute', margin: '40px', marginLeft: '20%'}}>
                <h3>{Titulo}</h3>
                <ReactPlayer 
                    url='https://www.youtube.com/watch?v=dQw4w9WgXcQ'
                    width= '100%'
                    height= '100%'
                    controls
                    />
                 <h4>Número de episodios</h4>                  
                <Slider
                    defaultValue={0}
                    value={barra}
                    onChange={updateBarra}
                    valueLabelDisplay="auto"
                    step={1}
                    marks
                    min={0}
                    max={N_Episodios}
                />
                <h4>Calificación</h4>
                <Rating name="simple-controlled" value={value} onChange={updateCali}/>   
            </div>

        </>
    );
};

export {ReproSerie};