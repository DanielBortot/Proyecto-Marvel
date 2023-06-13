import {createSlice} from "@reduxjs/toolkit";

const initialState = {
    descPerfil: []
}

export const perfilSlice = createSlice({
    name: 'perfiles',
    initialState: initialState,
    reducers: {
        datosPerfil: (state, action) =>{
            state.descPerfil = [...state.descPerfil, action.payload];
        }
    }
});

export const {datosPerfil} = perfilSlice.actions;
export default perfilSlice.reducer;