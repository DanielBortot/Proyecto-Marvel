import {createSlice} from "@reduxjs/toolkit";

const initialState = {
    descripcion: []
}

export const objetosSlice = createSlice({
    name: 'objetos',
    initialState: initialState,
    reducers: {
        descObjeto: (state, action) =>{
            state.descripcion = action.payload;
        },
        removeObjeto: (state, action) => {
            const id = action.payload;
            state.descripcion = state.descripcion.filter(juego => juego.id !== id);
        }
    }
});

export const {descObjeto, removeObjeto} = objetosSlice.actions;
export default objetosSlice.reducer;