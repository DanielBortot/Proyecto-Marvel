import {createSlice} from "@reduxjs/toolkit";

const initialState = {
    descripcion: {}
}

export const seriesSlice = createSlice({
    name: 'series',
    initialState: initialState,
    reducers: {
        descSerie: (state, action) =>{
            state.descripcion = action.payload;
        },
        removeSerie: (state, action) => {
            const id = action.payload;
            state.descripcion = state.contenido.filter(serie => serie.id !== id);
        }
    }
});

export const {descSerie, removeSerie} = seriesSlice.actions;
export default seriesSlice.reducer;