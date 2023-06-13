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
        },
        delSuscripcion: (state, action) => {
            state.descSuscripcion = {}
        }
    }
});

export const {datosSuscripcion, delSuscripcion} = suscripcionSlice.actions;
export default suscripcionSlice.reducer;