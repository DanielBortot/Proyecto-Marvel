--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2023-06-26 19:06:42

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
-- TOC entry 241 (class 1259 OID 24784)
-- Name: Pers_Oc; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Pers_Oc" (
    "N_Personaje" text NOT NULL,
    "Ocupacion" text NOT NULL
);


ALTER TABLE public."Pers_Oc" OWNER TO postgres;

--
-- TOC entry 3444 (class 0 OID 24784)
-- Dependencies: 241
-- Data for Name: Pers_Oc; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Pers_Oc" ("N_Personaje", "Ocupacion") VALUES ('Tony Stark', 'Ingeniero');
INSERT INTO public."Pers_Oc" ("N_Personaje", "Ocupacion") VALUES ('Steve Rogers', 'Militar');
INSERT INTO public."Pers_Oc" ("N_Personaje", "Ocupacion") VALUES ('Thor Odinson', 'Dios');
INSERT INTO public."Pers_Oc" ("N_Personaje", "Ocupacion") VALUES ('Bruce Banner', 'Científico');
INSERT INTO public."Pers_Oc" ("N_Personaje", "Ocupacion") VALUES ('Natasha Romanoff', 'Espía');
INSERT INTO public."Pers_Oc" ("N_Personaje", "Ocupacion") VALUES ('Nicholas Fury', 'Espía');
INSERT INTO public."Pers_Oc" ("N_Personaje", "Ocupacion") VALUES ('Maria Hill', 'Agente');
INSERT INTO public."Pers_Oc" ("N_Personaje", "Ocupacion") VALUES ('Sharon Carter', 'Agente');
INSERT INTO public."Pers_Oc" ("N_Personaje", "Ocupacion") VALUES ('Charles Xavier', 'Profesor');
INSERT INTO public."Pers_Oc" ("N_Personaje", "Ocupacion") VALUES ('Logan Howlett', 'Militar');
INSERT INTO public."Pers_Oc" ("N_Personaje", "Ocupacion") VALUES ('Peter Parker', 'Fotógrafo');
INSERT INTO public."Pers_Oc" ("N_Personaje", "Ocupacion") VALUES ('Emil Blonsky', 'Espía');
INSERT INTO public."Pers_Oc" ("N_Personaje", "Ocupacion") VALUES ('Emil Blonsky', 'Criminal');
INSERT INTO public."Pers_Oc" ("N_Personaje", "Ocupacion") VALUES ('Johann Schmidt', 'Terrorista');
INSERT INTO public."Pers_Oc" ("N_Personaje", "Ocupacion") VALUES ('Johann Schmidt', 'Criminal');
INSERT INTO public."Pers_Oc" ("N_Personaje", "Ocupacion") VALUES ('Johann Schmidt', 'Militar');
INSERT INTO public."Pers_Oc" ("N_Personaje", "Ocupacion") VALUES ('Helmut Zemo', 'Espía');
INSERT INTO public."Pers_Oc" ("N_Personaje", "Ocupacion") VALUES ('Obadiah Stane', 'Empresario');
INSERT INTO public."Pers_Oc" ("N_Personaje", "Ocupacion") VALUES ('Hela Odinson', 'Dios');
INSERT INTO public."Pers_Oc" ("N_Personaje", "Ocupacion") VALUES ('Loki Laufeyson', 'Dios');
INSERT INTO public."Pers_Oc" ("N_Personaje", "Ocupacion") VALUES ('Matt Murdock', 'Abogado');
INSERT INTO public."Pers_Oc" ("N_Personaje", "Ocupacion") VALUES ('Matt Murdock', 'Vigilante');
INSERT INTO public."Pers_Oc" ("N_Personaje", "Ocupacion") VALUES ('Jessica Jones', 'Investigador Privado');
INSERT INTO public."Pers_Oc" ("N_Personaje", "Ocupacion") VALUES ('Luke Cage', 'Investigador Privado');
INSERT INTO public."Pers_Oc" ("N_Personaje", "Ocupacion") VALUES ('Luke Cage', 'Mercenario');
INSERT INTO public."Pers_Oc" ("N_Personaje", "Ocupacion") VALUES ('Daniel Rand', 'Vigilante');
INSERT INTO public."Pers_Oc" ("N_Personaje", "Ocupacion") VALUES ('Frank Castle', 'Vigilante');
INSERT INTO public."Pers_Oc" ("N_Personaje", "Ocupacion") VALUES ('Frank Castle', 'Militar');
INSERT INTO public."Pers_Oc" ("N_Personaje", "Ocupacion") VALUES ('Frank Castle', 'Mercenario');
INSERT INTO public."Pers_Oc" ("N_Personaje", "Ocupacion") VALUES ('Wilson Fisk', 'Empresario');
INSERT INTO public."Pers_Oc" ("N_Personaje", "Ocupacion") VALUES ('Wilson Fisk', 'Mafioso');
INSERT INTO public."Pers_Oc" ("N_Personaje", "Ocupacion") VALUES ('Daniel Rand', 'Empresario');
INSERT INTO public."Pers_Oc" ("N_Personaje", "Ocupacion") VALUES ('Antonia Dreykov', 'Militar');
INSERT INTO public."Pers_Oc" ("N_Personaje", "Ocupacion") VALUES ('Antonia Dreykov', 'Mercenario');


--
-- TOC entry 3299 (class 2606 OID 24935)
-- Name: Pers_Oc Pers_Oc_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pers_Oc"
    ADD CONSTRAINT "Pers_Oc_pkey" PRIMARY KEY ("N_Personaje", "Ocupacion");


--
-- TOC entry 3300 (class 2606 OID 25427)
-- Name: Pers_Oc Pers_Oc_N_Personaje_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pers_Oc"
    ADD CONSTRAINT "Pers_Oc_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE NOT VALID;


--
-- TOC entry 3301 (class 2606 OID 25432)
-- Name: Pers_Oc Pers_Oc_Ocupacion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pers_Oc"
    ADD CONSTRAINT "Pers_Oc_Ocupacion_fkey" FOREIGN KEY ("Ocupacion") REFERENCES public."Ocupacion"("Ocup") ON UPDATE CASCADE NOT VALID;


-- Completed on 2023-06-26 19:06:43

--
-- PostgreSQL database dump complete
--

