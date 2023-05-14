import {createSlice} from "@reduxjs/toolkit";

const initialState = {
    contenido: []
}

export const peliculasSlice = createSlice({
    name: 'peliculas',
    initialState: initialState,
    reducers: {
        addPelicula: (state, action) =>{
            state.contenido = [...state.contenido, action.payload];
        },
        removePelicula: (state, action) => {
            const id = action.payload;
            state.contenido = state.contenido.filter(pelicula => pelicula.id !== id);
        }
    }
});

export const {addPelicula, removePelicula} = peliculasSlice.actions;
export default peliculasSlice.reducer;