import {createSlice} from "@reduxjs/toolkit";

const initialState = {
    descTarjeta: {
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
            state.descTarjeta = {...action.payload};
        }
    }
});

export const {datosTarjeta} = tarjetaSlice.actions;
export default tarjetaSlice.reducer;