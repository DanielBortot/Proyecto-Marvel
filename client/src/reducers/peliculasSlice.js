import {createSlice} from "@reduxjs/toolkit";

const initialState = {
    descripcion: []
}

export const peliculasSlice = createSlice({
    name: 'peliculas',
    initialState: initialState,
    reducers: {
        descPelicula: (state, action) =>{
            state.descripcion = action.payload;
        },
        removePelicula: (state, action) => {
            const id = action.payload;
            state.descripcion = state.descripcion.filter(pelicula => pelicula.id !== id);
        }
    }
});

export const {descPelicula, removePelicula} = peliculasSlice.actions;
export default peliculasSlice.reducer;