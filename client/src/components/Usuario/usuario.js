import React from "react";
import { Route, Routes } from 'react-router-dom';
import { SideMenu } from './sideMenu';
import { VistaResumen } from "./vistaResumen";
import { VistaInfo } from "./vistaInfo";
import { VistaSuscr } from "./vistasuscr";
import { VistaPago } from "./vistaPago";
import { VistaHistorial } from "./vistaHistorial";

function DescUsuario () {
   
    return (
        <>
          <SideMenu/>
          <div className='mx-3 my-2'>
            <Routes>
              <Route path='usuario/resumen' element={<VistaResumen/>}/>
              <Route path='/info' element={<VistaInfo/>}/>
              <Route path='/suscr' element={<VistaSuscr/>}/>
              <Route path='/pago' element={<VistaPago/>}/>
              <Route path='/historial' element={<VistaHistorial/>}/>
            </Routes>
          </div>
        </>
      );
}

export {DescUsuario};