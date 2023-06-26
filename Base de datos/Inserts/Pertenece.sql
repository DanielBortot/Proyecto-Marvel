--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2023-06-26 19:07:21

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
-- TOC entry 243 (class 1259 OID 24798)
-- Name: Pertenece; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Pertenece" (
    "N_Personaje" text NOT NULL,
    "N_Organizacion" text NOT NULL,
    "Cod_Cargo" integer NOT NULL
);


ALTER TABLE public."Pertenece" OWNER TO postgres;

--
-- TOC entry 3445 (class 0 OID 24798)
-- Dependencies: 243
-- Data for Name: Pertenece; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Pertenece" ("N_Personaje", "N_Organizacion", "Cod_Cargo") VALUES ('Tony Stark', 'Vengadores', 100);
INSERT INTO public."Pertenece" ("N_Personaje", "N_Organizacion", "Cod_Cargo") VALUES ('Thor Odinson', 'Vengadores', 101);
INSERT INTO public."Pertenece" ("N_Personaje", "N_Organizacion", "Cod_Cargo") VALUES ('Bruce Banner', 'Vengadores', 101);
INSERT INTO public."Pertenece" ("N_Personaje", "N_Organizacion", "Cod_Cargo") VALUES ('Natasha Romanoff', 'Vengadores', 101);
INSERT INTO public."Pertenece" ("N_Personaje", "N_Organizacion", "Cod_Cargo") VALUES ('Clint Barton', 'Vengadores', 101);
INSERT INTO public."Pertenece" ("N_Personaje", "N_Organizacion", "Cod_Cargo") VALUES ('Nicholas Fury', 'SHIELD', 100);
INSERT INTO public."Pertenece" ("N_Personaje", "N_Organizacion", "Cod_Cargo") VALUES ('Maria Hill', 'SHIELD', 102);
INSERT INTO public."Pertenece" ("N_Personaje", "N_Organizacion", "Cod_Cargo") VALUES ('Sharon Carter', 'SHIELD', 102);
INSERT INTO public."Pertenece" ("N_Personaje", "N_Organizacion", "Cod_Cargo") VALUES ('Charles Xavier', 'X-Men', 100);
INSERT INTO public."Pertenece" ("N_Personaje", "N_Organizacion", "Cod_Cargo") VALUES ('Logan Howlett', 'X-Men', 103);
INSERT INTO public."Pertenece" ("N_Personaje", "N_Organizacion", "Cod_Cargo") VALUES ('Johann Schmidt', 'Hydra', 100);
INSERT INTO public."Pertenece" ("N_Personaje", "N_Organizacion", "Cod_Cargo") VALUES ('Helmut Zemo', 'Hydra', 102);
INSERT INTO public."Pertenece" ("N_Personaje", "N_Organizacion", "Cod_Cargo") VALUES ('Steve Rogers', 'Vengadores', 100);
INSERT INTO public."Pertenece" ("N_Personaje", "N_Organizacion", "Cod_Cargo") VALUES ('Peter Quill', 'Guardianes de la Galaxia', 100);
INSERT INTO public."Pertenece" ("N_Personaje", "N_Organizacion", "Cod_Cargo") VALUES ('Gamora', 'Guardianes de la Galaxia', 101);
INSERT INTO public."Pertenece" ("N_Personaje", "N_Organizacion", "Cod_Cargo") VALUES ('Drax', 'Guardianes de la Galaxia', 101);
INSERT INTO public."Pertenece" ("N_Personaje", "N_Organizacion", "Cod_Cargo") VALUES ('Groot', 'Guardianes de la Galaxia', 101);
INSERT INTO public."Pertenece" ("N_Personaje", "N_Organizacion", "Cod_Cargo") VALUES ('Ratchet', 'Guardianes de la Galaxia', 101);


--
-- TOC entry 3299 (class 2606 OID 24941)
-- Name: Pertenece Pertenece_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pertenece"
    ADD CONSTRAINT "Pertenece_pkey" PRIMARY KEY ("N_Personaje", "N_Organizacion", "Cod_Cargo");


--
-- TOC entry 3300 (class 2606 OID 25437)
-- Name: Pertenece Pertenece_Cod_Cargo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pertenece"
    ADD CONSTRAINT "Pertenece_Cod_Cargo_fkey" FOREIGN KEY ("Cod_Cargo") REFERENCES public."Cargo"("Cod_Cargo") ON UPDATE CASCADE NOT VALID;


--
-- TOC entry 3301 (class 2606 OID 25442)
-- Name: Pertenece Pertenece_N_Organizacion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pertenece"
    ADD CONSTRAINT "Pertenece_N_Organizacion_fkey" FOREIGN KEY ("N_Organizacion") REFERENCES public."Organizacion"("Nombre") ON UPDATE CASCADE NOT VALID;


--
-- TOC entry 3302 (class 2606 OID 25447)
-- Name: Pertenece Pertenece_N_Personaje_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pertenece"
    ADD CONSTRAINT "Pertenece_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE NOT VALID;


-- Completed on 2023-06-26 19:07:21

--
-- PostgreSQL database dump complete
--

