--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2023-06-26 19:06:07

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
-- TOC entry 239 (class 1259 OID 24774)
-- Name: Pers_Creador; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Pers_Creador" (
    "N_Personaje" text NOT NULL,
    "N_Creador" text NOT NULL
);


ALTER TABLE public."Pers_Creador" OWNER TO postgres;

--
-- TOC entry 3444 (class 0 OID 24774)
-- Dependencies: 239
-- Data for Name: Pers_Creador; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Tony Stark', 'Stan Lee');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Tony Stark', 'Larry Lieber');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Tony Stark', 'Joe Simon');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Tony Stark', 'Jack Kirby');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Thor Odinson', 'Larry Lieber');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Thor Odinson', 'Jack Kirby');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Thor Odinson', 'Stan Lee');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Bruce Banner', 'Jack Kirby');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Bruce Banner', 'Stan Lee');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Natasha Romanoff', 'Don Rico');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Natasha Romanoff', 'Stan Lee');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Natasha Romanoff', 'Don Heck');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Nicholas Fury', 'Jack Kirby');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Nicholas Fury', 'Stan Lee');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Maria Hill', 'David Finch');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Maria Hill', 'Brian Michael Bendis');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Sharon Carter', 'Stan Lee');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Sharon Carter', 'Jack Kirby');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Charles Xavier', 'Stan Lee');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Charles Xavier', 'Jack Kirby');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Logan Howlett', 'Len Wein');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Logan Howlett', 'John Romita');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Ororo Munroe', 'Len Wein');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Ororo Munroe', 'Dave Cockrum');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Peter Parker', 'Stan Lee');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Peter Parker', 'Steve Ditko');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Emil Blonsky', 'Gil Kane');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Johann Schmidt', 'Joe Simon');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Johann Schmidt', 'Jack Kirby');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Helmut Zemo', 'Stan Lee');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Helmut Zemo', 'Jack Kirby');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Loki Laufeyson', 'Stan Lee');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Loki Laufeyson', 'Jack Kirby');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Loki Laufeyson', 'Larry Lieber');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Obadiah Stane', 'Dennis O Niel');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Hela Odinson', 'Stan Lee');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Hela Odinson', 'Jack Kirby');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Matt Murdock', 'Stan Lee');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Jessica Jones', 'Brian Michael Bendis');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Luke Cage', 'Archie Goodwin');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Luke Cage', 'John Romita');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Daniel Rand', 'Gil Kane');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Frank Castle', 'John Romita');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Wilson Fisk', 'John Romita');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Wilson Fisk', 'Stan Lee');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Antonia Dreykov', 'David Michelinie');


--
-- TOC entry 3299 (class 2606 OID 24931)
-- Name: Pers_Creador Pers_Creador_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pers_Creador"
    ADD CONSTRAINT "Pers_Creador_pkey" PRIMARY KEY ("N_Personaje", "N_Creador");


--
-- TOC entry 3300 (class 2606 OID 25407)
-- Name: Pers_Creador Pers_Creador_N_Creador_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pers_Creador"
    ADD CONSTRAINT "Pers_Creador_N_Creador_fkey" FOREIGN KEY ("N_Creador") REFERENCES public."Creador"("Nom_Creador") ON UPDATE CASCADE NOT VALID;


--
-- TOC entry 3301 (class 2606 OID 25412)
-- Name: Pers_Creador Pers_Creador_N_Personaje_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pers_Creador"
    ADD CONSTRAINT "Pers_Creador_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE NOT VALID;


-- Completed on 2023-06-26 19:06:07

--
-- PostgreSQL database dump complete
--

