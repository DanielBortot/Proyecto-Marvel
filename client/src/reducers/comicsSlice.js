import {createSlice} from "@reduxjs/toolkit";

const initialState = {
    contenido: []
}

export const comicsSlice = createSlice({
    name: 'comics',
    initialState: initialState,
    reducers: {
        addComic: (state, action) =>{
            state.contenido = [...state.contenido, action.payload];
        },
        removeComic: (state, action) => {
            const id = action.payload;
            state.contenido = state.contenido.filter(comic => comic.id !== id);
        }
    }
});

export const {addComic, removeComic} = comicsSlice.actions;
export default comicsSlice.reducer;