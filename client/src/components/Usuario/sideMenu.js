import React from "react";
import { Link } from "react-router-dom";
import '../../assets/usuario.css';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faHome } from '@fortawesome/free-solid-svg-icons'
import { faUser } from '@fortawesome/free-solid-svg-icons'
import { faList } from '@fortawesome/free-solid-svg-icons'
import { faCreditCard } from '@fortawesome/free-solid-svg-icons'
import { faClockRotateLeft } from '@fortawesome/free-solid-svg-icons'

function SideMenu (){
    
    return (
        <div className="sidebart">
                <ul class=" sidebar nav flex-column -sm-6 m-4">               
                    <Link className='custom-button btn btn-secondary px-4 py-4 d-flex justify-content-left' to={'/usuario/resumen'}> <FontAwesomeIcon icon={faHome} style={{color: "#ffffff",width: 40,}}/> Resumen de cuenta</Link>
                    <Link className='custom-button btn btn-secondary px-4 py-4 d-flex justify-content-left' to={'/info'}> <FontAwesomeIcon icon={faUser} style={{color: "#ffffff",width: 40,}}/> Información de usuario</Link>
                    <Link className='custom-button btn btn-secondary px-4 py-4 d-flex justify-content-left' to={'/suscr'}> <FontAwesomeIcon icon={faList} style={{color: "#ffffff",width: 40,}}/> Suscripción</Link>                        
                    <Link className='custom-button btn btn-secondary px-4 py-4 d-flex justify-content-left' to={'/pago'}> <FontAwesomeIcon icon={faCreditCard} style={{color: "#ffffff",width: 40,}}/> Formas de pago</Link>
                    <Link className='custom-button btn btn-secondary px-4 py-4 d-flex justify-content-left' to={'/historial'}> <FontAwesomeIcon icon={faClockRotateLeft} style={{color: "#ffffff",width: 40,}}/> Historial</Link>
                </ul>
        </div>
    );
}

export {SideMenu};