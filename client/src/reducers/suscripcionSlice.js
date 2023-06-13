import {createSlice} from "@reduxjs/toolkit";

const initialState = {
    descSuscripcion: {
        N_Tarjeta: null, 
        Cod_Seguridad: null, 
        Fecha_Ven: null
    }
}

export const suscripcionSlice = createSlice({
    name: 'suscripcion',
    initialState: initialState,
    reducers: {
        datosSuscripcion: (state, action) =>{
            state.descSuscripcion = {...action.payload};
        }
    }
});

export const {datosSuscripcion} = suscripcionSlice.actions;
export default suscripcionSlice.reducer;