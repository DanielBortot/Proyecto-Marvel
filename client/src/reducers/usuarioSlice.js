import {createSlice} from "@reduxjs/toolkit";

const initialState = {
    descUsuario: {
        nombre: null, 
        apellido: null, 
        email: null, 
        contrasena: null, 
        fechaNac: null,
        fechaCrea: null,
        idSus: null,
        direccion: null
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