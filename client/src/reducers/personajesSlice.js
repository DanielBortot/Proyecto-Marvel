import {createSlice} from "@reduxjs/toolkit";

const initialState = {
    contenido: []
}

export const personajesSlice = createSlice({
    name: 'personajes',
    initialState: initialState,
    reducers: {
        addPersonaje: (state, action) =>{
            state.contenido = [...state.contenido, action.payload];
        },
        removePersonaje: (state, action) => {
            const id = action.payload;
            state.contenido = state.contenido.filter(personaje => personaje.id !== id);
        }
    }
});

export const {addPersonaje, removePersonaje} = personajesSlice.actions;
export default personajesSlice.reducer;