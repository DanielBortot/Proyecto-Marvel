import React from "react";
import { useNavigate } from "react-router-dom";
import '../../assets/VistaRep.css';

function VistaRep () {
    const navigate = useNavigate()
    return (
        <>
            <div style={{width: '100%', margin: '30px auto'}}>
                <div className="botonRep" style={{marginTop: '30px'}}>
                    <button type="submit" onClick={()=>navigate('/Rep2')}>Promedio de episodios de series</button>
                    <button type="submit" onClick={()=>navigate('/Rep5')}>Películas solicitadas segun duración, ganancia y tipo</button>
                    <button type="submit" onClick={()=>navigate('/Rep6')}>Poderes segun obtención, nombre y villanos</button>
                    <button type="submit" onClick={()=>navigate('/RepReg')}>Usuarios que tengan suscripción Vip y vivan en Venezuela</button>
                </div>
            </div>
        </>
    );
}

export {VistaRep}