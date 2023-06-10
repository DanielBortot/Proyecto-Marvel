import {createSlice} from "@reduxjs/toolkit";

const initialState = {
    descripcion: {
        nTarjeta: null, 
        codSeguridad: null, 
        fechaVen: null
    }
}

export const tarjetaSlice = createSlice({
    name: 'tarjeta',
    initialState: initialState,
    reducers: {
        datosTarjeta: (state, action) =>{
            state.descripcion = {...action.payload};
        }
    }
});

export const {datosTarjeta} = tarjetaSlice.actions;
export default tarjetaSlice.reducer;