import {createSlice} from "@reduxjs/toolkit";

const initialState = {
    descTarjeta: {
        N_Tarjeta: null, 
        Cod_Seguridad: null, 
        Fecha_Ven: null
    }
}

export const tarjetaSlice = createSlice({
    name: 'tarjeta',
    initialState: initialState,
    reducers: {
        datosTarjeta: (state, action) =>{
            state.descTarjeta = {...action.payload};
        },
        delTarjeta: (state, action) => {
            state.descTarjeta = {};
        }
    }
});

export const {datosTarjeta, delTarjeta} = tarjetaSlice.actions;
export default tarjetaSlice.reducer;