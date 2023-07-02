import {createSlice} from "@reduxjs/toolkit";

const initialState = {
    descripcion: []
}

export const juegosSlice = createSlice({
    name: 'juegos',
    initialState: initialState,
    reducers: {
        descJuego: (state, action) =>{
            state.descripcion = action.payload;
        },
        removeJuego: (state, action) => {
            const id = action.payload;
            state.descripcion = state.descripcion.filter(juego => juego.id !== id);
        }
    }
});

export const {descJuego, removeJuego} = juegosSlice.actions;
export default juegosSlice.reducer;