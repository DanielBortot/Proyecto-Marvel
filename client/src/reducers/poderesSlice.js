import {createSlice} from "@reduxjs/toolkit";

const initialState = {
    descripcion: []
}

export const poderesSlice = createSlice({
    name: 'poderes',
    initialState: initialState,
    reducers: {
        descPoder: (state, action) =>{
            state.descripcion = action.payload;
        },
        removePoder: (state, action) => {
            const id = action.payload;
            state.descripcion = state.descripcion.filter(poder => poder.id !== id);
        }
    }
});

export const {descPoder, removePoder} = poderesSlice.actions;
export default poderesSlice.reducer;