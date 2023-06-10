import {createSlice} from "@reduxjs/toolkit";

const initialState = {
    descripcion: {
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
            state.descripcion = {...action.payload};
        }
    }
});

export const {datosUsuario} = usuarioSlice.actions;
export default usuarioSlice.reducer;