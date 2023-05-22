import React from "react";
import '../../assets/personajes.css'
import { CuadroPers } from "./cuadroPers";

function VistaPersonajes () {

    const prueba = [
        {
            img: 'https://upload.wikimedia.org/wikipedia/en/1/19/Marvel_Universe_%28Civil_War%29.jpg',
            nombre: 'HULK1',
            tipo: 'SERIE',
            genero: 'masculino',
            color_ojos: 'verdes',
            ocupacion: 'golpear',
            nacionalidad: 'Estados Unidos',
            estado_marital: 'no se'
        },
        {
            img: 'https://upload.wikimedia.org/wikipedia/en/1/19/Marvel_Universe_%28Civil_War%29.jpg',
            nombre: 'HULK2',
            tipo: 'SERIE',
            genero: 'masculino',
            color_ojos: 'verdes',
            ocupacion: 'golpear',
            nacionalidad: 'Estados Unidos',
            estado_marital: 'no se'
        },
        {
            img: 'https://upload.wikimedia.org/wikipedia/en/1/19/Marvel_Universe_%28Civil_War%29.jpg',
            nombre: 'HULK3',
            tipo: 'SERIE',
            genero: 'masculino',
            color_ojos: 'verdes',
            ocupacion: 'golpear',
            nacionalidad: 'Estados Unidos',
            estado_marital: 'no se'
        },
        {
            img: 'https://upload.wikimedia.org/wikipedia/en/1/19/Marvel_Universe_%28Civil_War%29.jpg',
            nombre: 'HULK4',
            tipo: 'SERIE',
            genero: 'masculino',
            color_ojos: 'verdes',
            ocupacion: 'golpear',
            nacionalidad: 'Estados Unidos',
            estado_marital: 'no se'
        },
        {
            img: 'https://upload.wikimedia.org/wikipedia/en/1/19/Marvel_Universe_%28Civil_War%29.jpg',
            nombre: 'HULK5',
            tipo: 'SERIE',
            genero: 'masculino',
            color_ojos: 'verdes',
            ocupacion: 'golpear',
            nacionalidad: 'Estados Unidos',
            estado_marital: 'no se'
        },
        {
            img: 'https://upload.wikimedia.org/wikipedia/en/1/19/Marvel_Universe_%28Civil_War%29.jpg',
            nombre: 'HULK6',
            tipo: 'SERIE',
            genero: 'masculino',
            color_ojos: 'verdes',
            ocupacion: 'golpear',
            nacionalidad: 'Estados Unidos',
            estado_marital: 'no se'
        },
        {
            img: 'https://upload.wikimedia.org/wikipedia/en/1/19/Marvel_Universe_%28Civil_War%29.jpg',
            nombre: 'HULK7',
            tipo: 'SERIE',
            genero: 'masculino',
            color_ojos: 'verdes',
            ocupacion: 'golpear',
            nacionalidad: 'Estados Unidos',
            estado_marital: 'no se'
        },
    ];

    return (
        <>
            <div className="tituloCont">
                <h2>Personajes</h2>
            </div>
            <div className="vistaPers">
                {prueba.map(personaje => {
                    return <CuadroPers img={personaje.img} tipo={personaje.tipo} nombre={personaje.nombre} genero={personaje.genero} ojos={personaje.color_ojos} ocupacion={personaje.ocupacion} nacionalidad={personaje.nacionalidad} marital={personaje.estado_marital} key={personaje.nombre}/>
                })}
            </div>
        </>
    );
}

export {VistaPersonajes};