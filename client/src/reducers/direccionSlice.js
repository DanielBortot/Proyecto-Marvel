import {createSlice} from "@reduxjs/toolkit";

const initialState = {
    Pais: {},
    Estado: {},
    Ciudad: {}
}

export const direccionSlice = createSlice({
    name: 'direccion',
    initialState: initialState,
    reducers: {
        setPais: (state, action) =>{
            state.Pais = action.payload;
        },
        setEstado: (state, action) => {
            state.Estado = action.payload;
        },
        setCiudad: (state, action) => {
            state.Ciudad = action.payload;
        },
        delDireccion: (state, action) => {
            state.Pais = {};
            state.Estado = {};
            state.Ciudad = {};
        }
    }
});

export const {setCiudad, setEstado, setPais, delDireccion} = direccionSlice.actions;
export default direccionSlice.reducer;