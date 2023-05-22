import React from "react";
import '../../assets/personajes.css'
import { CuadroPers } from "./cuadroPers";

function VistaPersonajes () {

    const prueba = [
        {
            img: 'https://upload.wikimedia.org/wikipedia/en/1/19/Marvel_Universe_%28Civil_War%29.jpg',
            nombre: 'HULK',
            tipo: 'SERIE',
        },
        {
            img: 'https://upload.wikimedia.org/wikipedia/en/1/19/Marvel_Universe_%28Civil_War%29.jpg',
            nombre: 'HULK',
            tipo: 'SERIE',
        },
        {
            img: 'https://upload.wikimedia.org/wikipedia/en/1/19/Marvel_Universe_%28Civil_War%29.jpg',
            nombre: 'HULK',
            tipo: 'SERIE',
        },
        {
            img: 'https://upload.wikimedia.org/wikipedia/en/1/19/Marvel_Universe_%28Civil_War%29.jpg',
            nombre: 'HULK',
            tipo: 'SERIE',
        },
        {
            img: 'https://upload.wikimedia.org/wikipedia/en/1/19/Marvel_Universe_%28Civil_War%29.jpg',
            nombre: 'HULK',
            tipo: 'SERIE',
        },
        {
            img: 'https://upload.wikimedia.org/wikipedia/en/1/19/Marvel_Universe_%28Civil_War%29.jpg',
            nombre: 'HULK',
            tipo: 'SERIE',
        },
        {
            img: 'https://upload.wikimedia.org/wikipedia/en/1/19/Marvel_Universe_%28Civil_War%29.jpg',
            nombre: 'HULK',
            tipo: 'SERIE',
        },
    ];

    return (
        <>
            <div className="tituloCont">
                <h2>Personajes</h2>
            </div>
            <div className="vistaPers">
                {prueba.map(personaje => {
                    return <CuadroPers img={personaje.img} tipo={personaje.tipo} nombre={personaje.nombre}/>
                })}
            </div>
        </>
    );
}

export {VistaPersonajes};