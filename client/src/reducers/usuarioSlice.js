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
            if (action.payload.Fecha_Nac){
                state.descUsuario = {...state.descUsuario, Fecha_Nac: action.payload.Fecha_Nac.slice(0,10)};
            }
            if (!state.descUsuario.Fecha_Creacion){
                state.descUsuario = {...state.descUsuario, Fecha_Creacion: action.payload.Fecha_Creacion.slice(0,10)};
            }
        },
        delUsuario: (state, action) => {
            state.descUsuario = {};
        }
    }
});

export const {datosUsuario, delUsuario} = usuarioSlice.actions;
export default usuarioSlice.reducer;