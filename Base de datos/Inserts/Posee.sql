--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2023-06-26 19:07:49

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
-- TOC entry 247 (class 1259 OID 24818)
-- Name: Posee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Posee" (
    "N_Personaje" text NOT NULL,
    "N_Poder" text NOT NULL,
    "Obtencion" text NOT NULL,
    CONSTRAINT "Posee_Obtencion_check" CHECK ((("Obtencion" = 'Natural'::text) OR ("Obtencion" = 'Artificial'::text) OR ("Obtencion" = 'Hereditario'::text)))
);


ALTER TABLE public."Posee" OWNER TO postgres;

--
-- TOC entry 3445 (class 0 OID 24818)
-- Dependencies: 247
-- Data for Name: Posee; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Thor Odinson', 'Super Fuerza', 'Hereditario');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Thor Odinson', 'Super Velocidad', 'Hereditario');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Thor Odinson', 'Regeneración', 'Hereditario');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Thor Odinson', 'Manipulación de la electricidad', 'Hereditario');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Thor Odinson', 'Volar', 'Artificial');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Bruce Banner', 'Super Fuerza', 'Artificial');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Bruce Banner', 'Regeneración', 'Artificial');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Bruce Banner', 'Super Velocidad', 'Artificial');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Steve Rogers', 'Super Velocidad', 'Artificial');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Steve Rogers', 'Super Fuerza', 'Artificial');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Steve Rogers', 'Regeneración', 'Artificial');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Charles Xavier', 'Telepatía', 'Natural');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Logan Howlett', 'Regeneración', 'Natural');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Logan Howlett', 'Garras Retráctiles', 'Natural');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Logan Howlett', 'Esqueleto metálico', 'Artificial');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Ororo Munroe', 'Manipulación del clima', 'Natural');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Ororo Munroe', 'Volar', 'Natural');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Peter Parker', 'Super Fuerza', 'Artificial');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Emil Blonsky', 'Super Fuerza', 'Artificial');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Emil Blonsky', 'Super Velocidad', 'Artificial');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Emil Blonsky', 'Regeneración', 'Artificial');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Emil Blonsky', 'Respiración subacuatica', 'Artificial');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Johann Schmidt', 'Super Fuerza', 'Artificial');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Loki Laufeyson', 'Super Fuerza', 'Hereditario');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Loki Laufeyson', 'Ilusionista', 'Hereditario');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Hela Odinson', 'Super Fuerza', 'Hereditario');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Hela Odinson', 'Ilusionista', 'Hereditario');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Hela Odinson', 'Magia Negra', 'Natural');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Johann Schmidt', 'Super Velocidad', 'Artificial');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Johann Schmidt', 'Regeneración', 'Artificial');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Matt Murdock', 'Visión de sonar', 'Natural');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Jessica Jones', 'Fuerza Sobrehumana', 'Artificial');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Jessica Jones', 'Resistencia Sobrehumana', 'Artificial');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Jessica Jones', 'Volar', 'Artificial');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Luke Cage', 'Fuerza Sobrehumana', 'Artificial');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Jessica Jones', 'Super Resistencia', 'Artificial');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Luke Cage', 'Regeneración', 'Artificial');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Daniel Rand', 'Puño de Hierro', 'Natural');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Daniel Rand', 'Chi', 'Natural');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Namor', 'Super Fuerza', 'Hereditario');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Namor', 'Volar', 'Natural');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Namor', 'Respiración subacuatica', 'Hereditario');


--
-- TOC entry 3300 (class 2606 OID 24951)
-- Name: Posee Posee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Posee"
    ADD CONSTRAINT "Posee_pkey" PRIMARY KEY ("N_Personaje", "N_Poder");


--
-- TOC entry 3301 (class 2606 OID 25462)
-- Name: Posee Posee_N_Personaje_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Posee"
    ADD CONSTRAINT "Posee_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE NOT VALID;


--
-- TOC entry 3302 (class 2606 OID 25467)
-- Name: Posee Posee_N_Poder_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Posee"
    ADD CONSTRAINT "Posee_N_Poder_fkey" FOREIGN KEY ("N_Poder") REFERENCES public."Poder"("Nombre") ON UPDATE CASCADE NOT VALID;


-- Completed on 2023-06-26 19:07:49

--
-- PostgreSQL database dump complete
--

