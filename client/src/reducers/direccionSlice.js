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
        }
    }
});

export const {setCiudad, setEstado, setPais} = direccionSlice.actions;
export default direccionSlice.reducer;