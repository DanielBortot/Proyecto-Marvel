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
        </>
      );
}

export {DescUsuario};