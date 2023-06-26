--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2023-06-26 19:06:27

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
-- TOC entry 240 (class 1259 OID 24779)
-- Name: Pers_Nac; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Pers_Nac" (
    "N_Personaje" text NOT NULL,
    "Nacionalidad" text NOT NULL
);


ALTER TABLE public."Pers_Nac" OWNER TO postgres;

--
-- TOC entry 3444 (class 0 OID 24779)
-- Dependencies: 240
-- Data for Name: Pers_Nac; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Pers_Nac" ("N_Personaje", "Nacionalidad") VALUES ('Tony Stark', 'Estadounidense');
INSERT INTO public."Pers_Nac" ("N_Personaje", "Nacionalidad") VALUES ('Steve Rogers', 'Estadounidense');
INSERT INTO public."Pers_Nac" ("N_Personaje", "Nacionalidad") VALUES ('Thor Odinson', 'Asgardiano');
INSERT INTO public."Pers_Nac" ("N_Personaje", "Nacionalidad") VALUES ('Bruce Banner', 'Estadounidense');
INSERT INTO public."Pers_Nac" ("N_Personaje", "Nacionalidad") VALUES ('Natasha Romanoff', 'Ruso');
INSERT INTO public."Pers_Nac" ("N_Personaje", "Nacionalidad") VALUES ('Nicholas Fury', 'Estadounidense');
INSERT INTO public."Pers_Nac" ("N_Personaje", "Nacionalidad") VALUES ('Maria Hill', 'Estadounidense');
INSERT INTO public."Pers_Nac" ("N_Personaje", "Nacionalidad") VALUES ('Sharon Carter', 'Estadounidense');
INSERT INTO public."Pers_Nac" ("N_Personaje", "Nacionalidad") VALUES ('Charles Xavier', 'Británico');
INSERT INTO public."Pers_Nac" ("N_Personaje", "Nacionalidad") VALUES ('Logan Howlett', 'Canadiense');
INSERT INTO public."Pers_Nac" ("N_Personaje", "Nacionalidad") VALUES ('Ororo Munroe', 'Estadounidense');
INSERT INTO public."Pers_Nac" ("N_Personaje", "Nacionalidad") VALUES ('Ororo Munroe', 'Wakanda');
INSERT INTO public."Pers_Nac" ("N_Personaje", "Nacionalidad") VALUES ('Peter Parker', 'Estadounidense');
INSERT INTO public."Pers_Nac" ("N_Personaje", "Nacionalidad") VALUES ('Emil Blonsky', 'Croata');
INSERT INTO public."Pers_Nac" ("N_Personaje", "Nacionalidad") VALUES ('Helmut Zemo', 'Aleman');
INSERT INTO public."Pers_Nac" ("N_Personaje", "Nacionalidad") VALUES ('Johann Schmidt', 'Aleman');
INSERT INTO public."Pers_Nac" ("N_Personaje", "Nacionalidad") VALUES ('Loki Laufeyson', 'Asgardiano');
INSERT INTO public."Pers_Nac" ("N_Personaje", "Nacionalidad") VALUES ('Loki Laufeyson', 'Jotunheim');
INSERT INTO public."Pers_Nac" ("N_Personaje", "Nacionalidad") VALUES ('Obadiah Stane', 'Estadounidense');
INSERT INTO public."Pers_Nac" ("N_Personaje", "Nacionalidad") VALUES ('Obadiah Stane', 'Asgardiano');
INSERT INTO public."Pers_Nac" ("N_Personaje", "Nacionalidad") VALUES ('Matt Murdock', 'Estadounidense');
INSERT INTO public."Pers_Nac" ("N_Personaje", "Nacionalidad") VALUES ('Jessica Jones', 'Estadounidense');
INSERT INTO public."Pers_Nac" ("N_Personaje", "Nacionalidad") VALUES ('Luke Cage', 'Estadounidense');
INSERT INTO public."Pers_Nac" ("N_Personaje", "Nacionalidad") VALUES ('Daniel Rand', 'Estadounidense');
INSERT INTO public."Pers_Nac" ("N_Personaje", "Nacionalidad") VALUES ('Frank Castle', 'Estadounidense');
INSERT INTO public."Pers_Nac" ("N_Personaje", "Nacionalidad") VALUES ('Wilson Fisk', 'Estadounidense');
INSERT INTO public."Pers_Nac" ("N_Personaje", "Nacionalidad") VALUES ('Antonia Dreykov', 'Ruso');


--
-- TOC entry 3299 (class 2606 OID 24933)
-- Name: Pers_Nac Pers_Nac_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pers_Nac"
    ADD CONSTRAINT "Pers_Nac_pkey" PRIMARY KEY ("N_Personaje", "Nacionalidad");


--
-- TOC entry 3300 (class 2606 OID 25417)
-- Name: Pers_Nac Pers_Nac_N_Personaje_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pers_Nac"
    ADD CONSTRAINT "Pers_Nac_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE NOT VALID;


--
-- TOC entry 3301 (class 2606 OID 25422)
-- Name: Pers_Nac Pers_Nac_Nacionalidad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pers_Nac"
    ADD CONSTRAINT "Pers_Nac_Nacionalidad_fkey" FOREIGN KEY ("Nacionalidad") REFERENCES public."Nacionalidad"("Nac") ON UPDATE CASCADE NOT VALID;


-- Completed on 2023-06-26 19:06:27

--
-- PostgreSQL database dump complete
--

