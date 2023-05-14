import {createSlice} from "@reduxjs/toolkit";

const initialState = {
    contenido: []
}

export const seriesSlice = createSlice({
    name: 'series',
    initialState: initialState,
    reducers: {
        addSerie: (state, action) =>{
            state.contenido = [...state.contenido, action.payload];
        },
        removeSerie: (state, action) => {
            const id = action.payload;
            state.contenido = state.contenido.filter(serie => serie.id !== id);
        }
    }
});

export const {addSerie, removeSerie} = seriesSlice.actions;
export default seriesSlice.reducer;