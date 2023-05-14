import { configureStore } from "@reduxjs/toolkit";
import personajesReducer from "./reducers/personajesSlice";
import peliculasReducer from "./reducers/peliculasSlice";
import seriesReducer from "./reducers/seriesSlice";
import juegosReducer from "./reducers/juegosSlice";
import comicsReducer from "./reducers/comicsSlice";

export default configureStore({
    reducer: {
        personajes: personajesReducer,
        peliculas: peliculasReducer,
        series: seriesReducer,
        juegos: juegosReducer,
        comics: comicsReducer
    }
})