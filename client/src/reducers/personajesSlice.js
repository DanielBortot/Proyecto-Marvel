import {createSlice} from "@reduxjs/toolkit";

const initialState = {
    contenido: [],
    descripcion: {}
}

export const personajesSlice = createSlice({
    name: 'personajes',
    initialState: initialState,
    reducers: {
        addPersonaje: (state, action) =>{
            state.contenido = action.payload;
        },
        removePersonaje: (state, action) => {
            const id = action.payload;
            state.contenido = state.contenido.filter(personaje => personaje.id !== id);
        },
        descPersonaje: (state, action) =>{
            state.descripcion = action.payload;
        }
    }
});

export const {addPersonaje, removePersonaje, descPersonaje} = personajesSlice.actions;
export default personajesSlice.reducer;