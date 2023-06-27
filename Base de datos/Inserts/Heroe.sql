--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2023-06-27 14:59:52

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
-- TOC entry 226 (class 1259 OID 24710)
-- Name: Heroe; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Heroe" (
    "N_Heroe" text NOT NULL,
    "Alias" text NOT NULL,
    "Logotipo" text,
    "Color_Traje" text,
    "Archienemigo" text,
    CONSTRAINT "Heroe_Color_Traje_check" CHECK ((("Color_Traje" !~~ '%0%'::text) AND ("Color_Traje" !~~ '%1%'::text) AND ("Color_Traje" !~~ '%2%'::text) AND ("Color_Traje" !~~ '%3%'::text) AND ("Color_Traje" !~~ '%4%'::text) AND ("Color_Traje" !~~ '%5%'::text) AND ("Color_Traje" !~~ '%6%'::text) AND ("Color_Traje" !~~ '%7%'::text) AND ("Color_Traje" !~~ '%8%'::text) AND ("Color_Traje" !~~ '%9%'::text)))
);


ALTER TABLE public."Heroe" OWNER TO postgres;

--
-- TOC entry 3450 (class 0 OID 24710)
-- Dependencies: 226
-- Data for Name: Heroe; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Heroe" ("N_Heroe", "Alias", "Logotipo", "Color_Traje", "Archienemigo") VALUES ('Tony Stark', 'Iron Man', NULL, 'Rojo y Dorado', NULL);
INSERT INTO public."Heroe" ("N_Heroe", "Alias", "Logotipo", "Color_Traje", "Archienemigo") VALUES ('Clint Barton', 'Ojo de Halcón', NULL, 'Morado y Negro', NULL);
INSERT INTO public."Heroe" ("N_Heroe", "Alias", "Logotipo", "Color_Traje", "Archienemigo") VALUES ('Nicholas Fury', 'Nick Fury', NULL, 'Negro', NULL);
INSERT INTO public."Heroe" ("N_Heroe", "Alias", "Logotipo", "Color_Traje", "Archienemigo") VALUES ('Maria Hill', 'Comandante Maria Hill', NULL, 'Negro', NULL);
INSERT INTO public."Heroe" ("N_Heroe", "Alias", "Logotipo", "Color_Traje", "Archienemigo") VALUES ('Sharon Carter', 'Agente 13', NULL, 'Blanco', NULL);
INSERT INTO public."Heroe" ("N_Heroe", "Alias", "Logotipo", "Color_Traje", "Archienemigo") VALUES ('Charles Xavier', 'Profesor X', NULL, 'Negro', NULL);
INSERT INTO public."Heroe" ("N_Heroe", "Alias", "Logotipo", "Color_Traje", "Archienemigo") VALUES ('Logan Howlett', 'Wolverine', NULL, 'Amarillo y Negro', NULL);
INSERT INTO public."Heroe" ("N_Heroe", "Alias", "Logotipo", "Color_Traje", "Archienemigo") VALUES ('Ororo Munroe', 'Tormenta', NULL, 'Negro', NULL);
INSERT INTO public."Heroe" ("N_Heroe", "Alias", "Logotipo", "Color_Traje", "Archienemigo") VALUES ('Jessica Jones', 'Jessica Jones', 'imagen jessica', 'Negro', NULL);
INSERT INTO public."Heroe" ("N_Heroe", "Alias", "Logotipo", "Color_Traje", "Archienemigo") VALUES ('Luke Cage', 'Luke Cage', 'imagen luke', 'amarillo', NULL);
INSERT INTO public."Heroe" ("N_Heroe", "Alias", "Logotipo", "Color_Traje", "Archienemigo") VALUES ('Daniel Rand', 'Iron Fist', 'imagen fist', 'Amarillo y Verde', NULL);
INSERT INTO public."Heroe" ("N_Heroe", "Alias", "Logotipo", "Color_Traje", "Archienemigo") VALUES ('Frank Castle', 'Punisher', 'imagen punisher', 'Negro y Blanco', NULL);
INSERT INTO public."Heroe" ("N_Heroe", "Alias", "Logotipo", "Color_Traje", "Archienemigo") VALUES ('Steve Rogers', 'Capitan America', NULL, 'Azul, Blanco y Rojo', 'Johann Schmidt');
INSERT INTO public."Heroe" ("N_Heroe", "Alias", "Logotipo", "Color_Traje", "Archienemigo") VALUES ('Matt Murdock', 'Daredevil', 'imagen daredevil', 'Rojo', 'Wilson Fisk');
INSERT INTO public."Heroe" ("N_Heroe", "Alias", "Logotipo", "Color_Traje", "Archienemigo") VALUES ('Bruce Banner', 'Hulk', NULL, 'Morado', 'Emil Blonsky');
INSERT INTO public."Heroe" ("N_Heroe", "Alias", "Logotipo", "Color_Traje", "Archienemigo") VALUES ('Thor Odinson', 'Thor', NULL, 'Azul, Negro y Rojo', 'Loki Laufeyson');
INSERT INTO public."Heroe" ("N_Heroe", "Alias", "Logotipo", "Color_Traje", "Archienemigo") VALUES ('Natasha Romanoff', 'Viuda Negra', NULL, 'Negro', 'Antonia Dreykov');
INSERT INTO public."Heroe" ("N_Heroe", "Alias", "Logotipo", "Color_Traje", "Archienemigo") VALUES ('Peter Parker', 'Spiderman', NULL, 'Rojo y Azul', 'Otto Octavius');
INSERT INTO public."Heroe" ("N_Heroe", "Alias", "Logotipo", "Color_Traje", "Archienemigo") VALUES ('Peter Quill', 'Star Lord', 'imagen sl', 'Rojo', NULL);
INSERT INTO public."Heroe" ("N_Heroe", "Alias", "Logotipo", "Color_Traje", "Archienemigo") VALUES ('Gamora', 'Gamora', 'imagen ga', 'Morado', NULL);
INSERT INTO public."Heroe" ("N_Heroe", "Alias", "Logotipo", "Color_Traje", "Archienemigo") VALUES ('Drax', 'Drax el Destructor', 'imagen da', 'Negro', NULL);
INSERT INTO public."Heroe" ("N_Heroe", "Alias", "Logotipo", "Color_Traje", "Archienemigo") VALUES ('Groot', 'Groot', 'imagen g', 'Marron', NULL);
INSERT INTO public."Heroe" ("N_Heroe", "Alias", "Logotipo", "Color_Traje", "Archienemigo") VALUES ('Rocket', 'Ratchet ', 'imagen ra', 'Naranja', NULL);


--
-- TOC entry 3300 (class 2606 OID 24895)
-- Name: Heroe Heroe_Alias_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Heroe"
    ADD CONSTRAINT "Heroe_Alias_key" UNIQUE ("Alias");


--
-- TOC entry 3302 (class 2606 OID 24897)
-- Name: Heroe Heroe_Logotipo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Heroe"
    ADD CONSTRAINT "Heroe_Logotipo_key" UNIQUE ("Logotipo");


--
-- TOC entry 3304 (class 2606 OID 24899)
-- Name: Heroe Heroe_N_Heroe_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Heroe"
    ADD CONSTRAINT "Heroe_N_Heroe_key" UNIQUE ("N_Heroe");


--
-- TOC entry 3307 (class 2620 OID 24982)
-- Name: Heroe archienemigo_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER archienemigo_trigger BEFORE INSERT OR UPDATE ON public."Heroe" FOR EACH ROW EXECUTE FUNCTION public.archienemigo();


--
-- TOC entry 3305 (class 2606 OID 25633)
-- Name: Heroe Heroe_Archienemigo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Heroe"
    ADD CONSTRAINT "Heroe_Archienemigo_fkey" FOREIGN KEY ("Archienemigo") REFERENCES public."Villano"("N_Villano") ON UPDATE CASCADE NOT VALID;


--
-- TOC entry 3306 (class 2606 OID 25638)
-- Name: Heroe Heroe_N_Heroe_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Heroe"
    ADD CONSTRAINT "Heroe_N_Heroe_fkey" FOREIGN KEY ("N_Heroe") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


-- Completed on 2023-06-27 14:59:52

--
-- PostgreSQL database dump complete
--

