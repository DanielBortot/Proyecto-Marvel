import {createSlice} from "@reduxjs/toolkit";

const initialState = {
    descUsuario: {
        Nombre: null, 
        Apellido: null, 
        Email: null, 
        Contrasena: null, 
        Fecha_Nac: null,
        Fecha_Creacion: null,
        Id_Suscripcion: null,
        Direccion: null
    }
}


export const usuarioSlice = createSlice({
    name: 'usuario',
    initialState: initialState,
    reducers: {
        datosUsuario: (state, action) =>{
            state.descUsuario = {...action.payload};
        }
    }
});

export const {datosUsuario} = usuarioSlice.actions;
export default usuarioSlice.reducer;