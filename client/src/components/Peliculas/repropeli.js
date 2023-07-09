import React from 'react';
import ReactPlayer from 'react-player';
import Slider from '@mui/material/Slider';
import Rating from '@mui/material/Rating';

function ReproPeli () {
    const [value, setValue] = React.useState(1);
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
                <Slider defaultValue={50} aria-label="Default" valueLabelDisplay="auto" color= "secondary" /> 
                <h4>Calificación</h4>
                <Rating name="simple-controlled" value={value} onChange={(event, newValue) => { setValue(newValue); }}/>   
            </div>

        </>
    );
};

export {ReproPeli};