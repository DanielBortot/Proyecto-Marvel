import { configureStore } from "@reduxjs/toolkit";
import personajesReducer from "./reducers/personajesSlice";
import peliculasReducer from "./reducers/peliculasSlice";
import seriesReducer from "./reducers/seriesSlice";
import juegosReducer from "./reducers/juegosSlice";
import comicsReducer from "./reducers/comicsSlice";
import usuarioReducer from  "./reducers/usuarioSlice";
import tarjetaReducer from "./reducers/tarjetaSlice";
import perfilesReducer from "./reducers/perfilesSlice";
import direccionReducer from "./reducers/direccionSlice";
import suscripcionReducer from "./reducers/suscripcionSlice";
import reporteReducer from "./reducers/reportesSlice";

export default configureStore({
    reducer: {
        personajes: personajesReducer,
        peliculas: peliculasReducer,
        series: seriesReducer,
        juegos: juegosReducer,
        comics: comicsReducer,
        usuario: usuarioReducer,
        tarjeta: tarjetaReducer,
        perfiles: perfilesReducer,
        direccion: direccionReducer,
        suscripcion: suscripcionReducer,
        reporte: reporteReducer
    }  
})