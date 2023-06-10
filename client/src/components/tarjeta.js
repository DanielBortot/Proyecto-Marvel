import React from "react";
import { createRef, useState } from "react";
import { useSelector } from "react-redux";
import axios from "axios"

function Tarjeta () {
    const [datosT, setDatos] = useState({nTarjeta: null, codSeguridad: null, fechaVen: null});
    const {descripcion} = useSelector(state => state.usuario);

    const nTarjetaRef = createRef();
    const codSeguridadRef = createRef();
    const fechaVenRef = createRef();

    const enviar = async () => {
        try {
            await axios.post('/addTarjeta',datosT);
            await axios.post('/register',{...descripcion, nTarjeta: datosT.nTarjeta})
        } catch (err) {
            console.log(err);
        }
    }

    return (
        <>
            <div className="tituloContReg">
                <h2 className="titulo">Ageregar Tarjeta</h2>
            </div>

            <div className="formContReg">

                <form>

                    <input type="text" placeholder="Numero de Tarjeta" ref={nTarjetaRef}/>
                    <input type="text" placeholder="Codigo de Seguridad" ref={codSeguridadRef}/>
                    <input type="date" placeholder="Fecha de Vencimiento" ref={fechaVenRef}/>
                    <div className="botonReg">
                        <button type="submit" onClick={enviar}>Aceptar</button>
                    </div>

                </form>
            </div>
            
        </>
    );
}

export {Tarjeta};