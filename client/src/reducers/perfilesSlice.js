import {createSlice} from "@reduxjs/toolkit";

const initialState = {
    descPerfil: [],
    perfilUso: {}
}

export const perfilSlice = createSlice({
    name: 'perfiles',
    initialState: initialState,
    reducers: {
        datosPerfil: (state, action) =>{
            state.descPerfil = [...state.descPerfil, action.payload];
        },
        setPerfil: (state, action) => {
            state.perfilUso = action.payload;
        },
        delPerfiles: (state, action) => {
            state.descPerfil = [];
            state.perfilUso = {};
        }
    }
});

export const {datosPerfil, setPerfil, delPerfiles} = perfilSlice.actions;
export default perfilSlice.reducer;