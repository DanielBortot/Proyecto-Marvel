import {createSlice} from "@reduxjs/toolkit";

const initialState = {
    descReporte: {}
}


export const reporteSlice = createSlice({
    name: 'reporte',
    initialState: initialState,
    reducers: {
        datosReporte: (state, action) =>{
            state.descReporte = {...action.payload};
        } 
    }
});

export const {datosReporte} = reporteSlice.actions;
export default reporteSlice.reducer;