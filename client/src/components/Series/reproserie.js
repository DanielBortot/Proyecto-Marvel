import React from 'react';
import ReactPlayer from 'react-player';
import Rating from '@mui/material/Rating';
import Slider from '@mui/material/Slider';

function ReproSerie () {
    const [value, setValue] = React.useState(1);
    return(
        <>
            
            <div style={{width: '55%', height: '55%', position: 'absolute', margin: '40px', marginLeft: '20%'}}>
                <h3>Nombre de la Serie</h3>
                <ReactPlayer 
                    url='https://www.youtube.com/watch?v=dQw4w9WgXcQ'
                    width= '100%'
                    height= '100%'
                    controls
                    />
                 <h4>Número de episodios</h4>                  
                <Slider
                    defaultValue={0}
                    valueLabelDisplay="auto"
                    step={1}
                    marks
                    min={1}
                    max={10}
                />
                <h4>Calificación</h4>
                <Rating name="simple-controlled" value={value} onChange={(event, newValue) => { setValue(newValue); }}/>   
            </div>

        </>
    );
};

export {ReproSerie};