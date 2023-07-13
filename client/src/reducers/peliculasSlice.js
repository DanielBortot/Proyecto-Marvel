import {createSlice} from "@reduxjs/toolkit";

const initialState = {
    descripcion: [],
    peliHist: {}
}

export const peliculasSlice = createSlice({
    name: 'peliculas',
    initialState: initialState,
    reducers: {
        descPelicula: (state, action) =>{
            state.descripcion = action.payload;
        },
        descPeliHist: (state, action) => {
            state.peliHist = action.payload;
        },
        removePelicula: (state, action) => {
            const id = action.payload;
            state.descripcion = state.descripcion.filter(pelicula => pelicula.id !== id);
        }
    }
});

export const {descPelicula, descPeliHist, removePelicula} = peliculasSlice.actions;
export default peliculasSlice.reducer;