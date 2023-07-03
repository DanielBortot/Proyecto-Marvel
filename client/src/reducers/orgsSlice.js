import {createSlice} from "@reduxjs/toolkit";

const initialState = {
    descripcion: [],
    datosSede: []
}

export const orgsSlice = createSlice({
    name: 'organizaciones',
    initialState: initialState,
    reducers: {
        descOrganizacion: (state, action) => {
            state.descripcion = action.payload;
        },
        descSede: (state, action) => {
            state.datosSede = action.payload;
        },
        removeOrganizacion: (state, action) => {
            const id = action.payload;
            state.descripcion = state.descripcion.filter(comic => comic.id !== id);
        }
    }
});

export const {descOrganizacion, descSede, removeOrganizacion} = orgsSlice.actions;
export default orgsSlice.reducer;