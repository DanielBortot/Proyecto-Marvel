import {createSlice} from "@reduxjs/toolkit";

const initialState = {
    contenido: []
}

export const juegosSlice = createSlice({
    name: 'juegos',
    initialState: initialState,
    reducers: {
        addJuego: (state, action) =>{
            state.contenido = [...state.contenido, action.payload];
        },
        removeJuego: (state, action) => {
            const id = action.payload;
            state.contenido = state.contenido.filter(juego => juego.id !== id);
        }
    }
});

export const {addJuego, removeJuego} = juegosSlice.actions;
export default juegosSlice.reducer;