--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2023-06-26 19:09:14

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 254 (class 1259 OID 24858)
-- Name: Usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Usuario" (
    "Email" text NOT NULL,
    "Contrasena" text NOT NULL,
    "Nombre" text NOT NULL,
    "Apellido" text NOT NULL,
    "Fecha_Nac" date NOT NULL,
    "Fecha_Creacion" date NOT NULL,
    "Id_Suscripcion" integer NOT NULL,
    "N_Tarjeta" text,
    "Direccion" integer NOT NULL,
    CONSTRAINT "Usuario_Email_check" CHECK ((("Email" ~~ '%@%'::text) AND ("Email" ~~ '%.%'::text)))
);


ALTER TABLE public."Usuario" OWNER TO postgres;

--
-- TOC entry 3451 (class 0 OID 24858)
-- Dependencies: 254
-- Data for Name: Usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Usuario" ("Email", "Contrasena", "Nombre", "Apellido", "Fecha_Nac", "Fecha_Creacion", "Id_Suscripcion", "N_Tarjeta", "Direccion") VALUES ('bortotdaniel@gmail.com', '300902', 'Daniel', 'Bortot', '2023-06-15', '2023-06-14', 1, '9876543211001111', 111);
INSERT INTO public."Usuario" ("Email", "Contrasena", "Nombre", "Apellido", "Fecha_Nac", "Fecha_Creacion", "Id_Suscripcion", "N_Tarjeta", "Direccion") VALUES ('usu2@ejemplo.com', '5678', 'nombre_usu2', 'apellido_usu2', '1990-01-01', '2023-01-01', 4, NULL, 111);
INSERT INTO public."Usuario" ("Email", "Contrasena", "Nombre", "Apellido", "Fecha_Nac", "Fecha_Creacion", "Id_Suscripcion", "N_Tarjeta", "Direccion") VALUES ('dabortot.21@est.ucab.edu.ve', '180370', 'Marco', 'Agrusa', '2023-06-21', '2023-06-14', 2, '1234456789101111', 111);
INSERT INTO public."Usuario" ("Email", "Contrasena", "Nombre", "Apellido", "Fecha_Nac", "Fecha_Creacion", "Id_Suscripcion", "N_Tarjeta", "Direccion") VALUES ('usu1@ejemplo.com', '1234', 'nombre_usu1', 'apellido_usu1', '1990-01-01', '2023-01-01', 3, NULL, 111);
INSERT INTO public."Usuario" ("Email", "Contrasena", "Nombre", "Apellido", "Fecha_Nac", "Fecha_Creacion", "Id_Suscripcion", "N_Tarjeta", "Direccion") VALUES ('usu7@ejemplo.com', '5678', 'nombre_usu7', 'apellido_usu7', '1990-01-01', '2023-01-01', 4, NULL, 111);
INSERT INTO public."Usuario" ("Email", "Contrasena", "Nombre", "Apellido", "Fecha_Nac", "Fecha_Creacion", "Id_Suscripcion", "N_Tarjeta", "Direccion") VALUES ('usu3@ejemplo.com', '8765', 'nombre_usu3', 'apellido_usu3', '1990-01-01', '2023-01-01', 3, NULL, 111);
INSERT INTO public."Usuario" ("Email", "Contrasena", "Nombre", "Apellido", "Fecha_Nac", "Fecha_Creacion", "Id_Suscripcion", "N_Tarjeta", "Direccion") VALUES ('usu4@ejemplo.com', '4321', 'nombre_usu4', 'apellido_usu4', '1990-01-01', '2023-01-01', 3, NULL, 112);
INSERT INTO public."Usuario" ("Email", "Contrasena", "Nombre", "Apellido", "Fecha_Nac", "Fecha_Creacion", "Id_Suscripcion", "N_Tarjeta", "Direccion") VALUES ('usu5@ejemplo.com', '1010', 'nombre_usu5', 'apellido_usu5', '1990-01-01', '2023-01-01', 2, NULL, 112);
INSERT INTO public."Usuario" ("Email", "Contrasena", "Nombre", "Apellido", "Fecha_Nac", "Fecha_Creacion", "Id_Suscripcion", "N_Tarjeta", "Direccion") VALUES ('usu6@ejemplo.com', '1020', 'nombre_usu6', 'apellido_usu6', '1990-01-01', '2023-01-01', 3, NULL, 111);


--
-- TOC entry 3300 (class 2606 OID 24973)
-- Name: Usuario Usuario_Apellido_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_Apellido_key" UNIQUE ("Apellido");


--
-- TOC entry 3302 (class 2606 OID 24975)
-- Name: Usuario Usuario_Nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_Nombre_key" UNIQUE ("Nombre");


--
-- TOC entry 3304 (class 2606 OID 24977)
-- Name: Usuario Usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_pkey" PRIMARY KEY ("Email");


--
-- TOC entry 3308 (class 2620 OID 24987)
-- Name: Usuario numusuarios_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER numusuarios_trigger BEFORE INSERT OR UPDATE ON public."Usuario" FOR EACH ROW EXECUTE FUNCTION public.numusuarios();


--
-- TOC entry 3305 (class 2606 OID 25502)
-- Name: Usuario Usuario_Direccion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_Direccion_fkey" FOREIGN KEY ("Direccion") REFERENCES public."Ciudad"("Id_Ciudad") ON UPDATE CASCADE NOT VALID;


--
-- TOC entry 3306 (class 2606 OID 25512)
-- Name: Usuario Usuario_Id_Suscripcion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_Id_Suscripcion_fkey" FOREIGN KEY ("Id_Suscripcion") REFERENCES public."Suscripcion"("ID") ON UPDATE CASCADE NOT VALID;


--
-- TOC entry 3307 (class 2606 OID 25507)
-- Name: Usuario Usuario_N_Tarjeta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_N_Tarjeta_fkey" FOREIGN KEY ("N_Tarjeta") REFERENCES public."Tarjeta"("N_Tarjeta") ON UPDATE CASCADE NOT VALID;


-- Completed on 2023-06-26 19:09:14

--
-- PostgreSQL database dump complete
--

