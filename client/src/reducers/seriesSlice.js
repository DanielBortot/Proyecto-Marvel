import {createSlice} from "@reduxjs/toolkit";

const initialState = {
    descripcion: {},
    serieHist: {}
}

export const seriesSlice = createSlice({
    name: 'series',
    initialState: initialState,
    reducers: {
        descSerie: (state, action) =>{
            state.descripcion = action.payload;
        },
        descSerieHist: (state, action) =>{
            state.serieHist = action.payload;
        },
        removeSerie: (state, action) => {
            const id = action.payload;
            state.descripcion = state.contenido.filter(serie => serie.id !== id);
        }
    }
});

export const {descSerie, removeSerie, descSerieHist} = seriesSlice.actions;
export default seriesSlice.reducer;