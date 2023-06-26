--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2023-06-26 18:59:58

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
-- TOC entry 214 (class 1259 OID 24654)
-- Name: Aparece; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Aparece" (
    "N_Organizacion" text NOT NULL,
    "N_Titulo" text NOT NULL,
    "Estado" text NOT NULL,
    "Rol" text NOT NULL,
    CONSTRAINT "Aparece_Rol_check" CHECK ((("Rol" = 'Antagonista'::text) OR ("Rol" = 'Protagonista'::text) OR ("Rol" = 'Secundario'::text)))
);


ALTER TABLE public."Aparece" OWNER TO postgres;

--
-- TOC entry 3445 (class 0 OID 24654)
-- Dependencies: 214
-- Data for Name: Aparece; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Aparece" ("N_Organizacion", "N_Titulo", "Estado", "Rol") VALUES ('Vengadores', 'Los Vengadores', 'Activo', 'Protagonista');
INSERT INTO public."Aparece" ("N_Organizacion", "N_Titulo", "Estado", "Rol") VALUES ('SHIELD', 'Los Vengadores', 'Activo', 'Secundario');
INSERT INTO public."Aparece" ("N_Organizacion", "N_Titulo", "Estado", "Rol") VALUES ('SHIELD', 'Iron Man 2', 'Activo', 'Secundario');
INSERT INTO public."Aparece" ("N_Organizacion", "N_Titulo", "Estado", "Rol") VALUES ('Hydra', 'Capitán América: el primer vengador', 'Activo', 'Antagonista');
INSERT INTO public."Aparece" ("N_Organizacion", "N_Titulo", "Estado", "Rol") VALUES ('Vengadores', 'Los Vengadores 2: La era de ultron', 'Activo', 'Protagonista');
INSERT INTO public."Aparece" ("N_Organizacion", "N_Titulo", "Estado", "Rol") VALUES ('SHIELD', 'Capitán América: El soldado del invierno', 'Activo', 'Secundario');
INSERT INTO public."Aparece" ("N_Organizacion", "N_Titulo", "Estado", "Rol") VALUES ('Hydra', 'Capitán América: El soldado del invierno', 'Activo', 'Antagonista');
INSERT INTO public."Aparece" ("N_Organizacion", "N_Titulo", "Estado", "Rol") VALUES ('Guardianes de la Galaxia', 'Guardianes de la Galaxia', 'Activa', 'Protagonista');


--
-- TOC entry 3300 (class 2606 OID 24875)
-- Name: Aparece Aparece_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Aparece"
    ADD CONSTRAINT "Aparece_pkey" PRIMARY KEY ("N_Organizacion", "N_Titulo");


--
-- TOC entry 3301 (class 2606 OID 25297)
-- Name: Aparece Aparece_N_Organizacion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Aparece"
    ADD CONSTRAINT "Aparece_N_Organizacion_fkey" FOREIGN KEY ("N_Organizacion") REFERENCES public."Organizacion"("Nombre") ON UPDATE CASCADE NOT VALID;


--
-- TOC entry 3302 (class 2606 OID 25302)
-- Name: Aparece Aparece_N_Titulo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Aparece"
    ADD CONSTRAINT "Aparece_N_Titulo_fkey" FOREIGN KEY ("N_Titulo") REFERENCES public."Medio"("Titulo") ON UPDATE CASCADE NOT VALID;


-- Completed on 2023-06-26 18:59:58

--
-- PostgreSQL database dump complete
--

