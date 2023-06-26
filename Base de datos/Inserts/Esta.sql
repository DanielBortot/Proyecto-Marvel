--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2023-06-26 19:02:46

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
-- TOC entry 223 (class 1259 OID 24697)
-- Name: Esta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Esta" (
    "N_Personaje" text NOT NULL,
    "N_Titulo" text NOT NULL,
    "Tipo_Actor" text NOT NULL,
    "Rol" text NOT NULL,
    "Actor" text NOT NULL,
    CONSTRAINT "Esta_Rol_check" CHECK ((("Rol" = 'Antagonista'::text) OR ("Rol" = 'Protagonista'::text) OR ("Rol" = 'Secundario'::text))),
    CONSTRAINT "Esta_Tipo_Actor_check" CHECK ((("Tipo_Actor" = 'Interpretado'::text) OR ("Tipo_Actor" = 'Presta su voz'::text)))
);


ALTER TABLE public."Esta" OWNER TO postgres;

--
-- TOC entry 3448 (class 0 OID 24697)
-- Dependencies: 223
-- Data for Name: Esta; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Tony Stark', 'Iron Man', 'Interpretado', 'Protagonista', 'Robert Downey Jr');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Tony Stark', 'Iron Man 2', 'Interpretado', 'Protagonista', 'Robert Downey Jr');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Tony Stark', 'Los Vengadores', 'Interpretado', 'Protagonista', 'Robert Downey Jr');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Bruce Banner', 'The Incredible Hulk', 'Interpretado', 'Protagonista', 'Edward Norton');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Bruce Banner', 'Los Vengadores', 'Interpretado', 'Protagonista', 'Mark Ruffalo');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Thor Odinson', 'Thor', 'Interpretado', 'Protagonista', 'Chris Hemsworth');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Steve Rogers', 'Capitán América: el primer vengador', 'Interpretado', 'Protagonista', 'Chris Evans');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Steve Rogers', 'Los Vengadores', 'Interpretado', 'Protagonista', 'Chris Evans');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Thor Odinson', 'Los Vengadores', 'Interpretado', 'Protagonista', 'Chris Evans');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Natasha Romanoff', 'Iron Man 2', 'Interpretado', 'Secundario', 'Scarlett Johansson');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Natasha Romanoff', 'Los Vengadores', 'Interpretado', 'Protagonista', 'Scarlett Johansson');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Clint Barton', 'Los Vengadores', 'Interpretado', 'Protagonista', 'Jeremy Renner');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Nicholas Fury', 'Iron Man 2', 'Interpretado', 'Secundario', 'Samuel L Jackson');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Nicholas Fury', 'Los Vengadores', 'Interpretado', 'Secundario', 'Samuel L Jackson');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Maria Hill', 'Los Vengadores', 'Interpretado', 'Secundario', 'Cobie Smulders');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Emil Blonsky', 'The Incredible Hulk', 'Interpretado', 'Antagonista', 'Tim Roth');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Johann Schmidt', 'Capitán América: el primer vengador', 'Interpretado', 'Antagonista', 'Hugo Weaving');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Loki Laufeyson', 'Thor', 'Interpretado', 'Secundario', 'Tom Hiddleston');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Loki Laufeyson', 'Los Vengadores', 'Interpretado', 'Antagonista', 'Tom Hiddleston');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Obadiah Stane', 'Iron Man', 'Interpretado', 'Antagonista', 'Jeff Bridges');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Matt Murdock', 'Marvels The Defenders', 'Interpretado', 'Protagonista', 'Charlie Cox');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Jessica Jones', 'Marvels The Defenders', 'Interpretado', 'Protagonista', 'Krysten Ritter');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Jessica Jones', 'Marvels Jessica Jones', 'Interpretado', 'Protagonista', 'Krysten Ritter');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Luke Cage', 'Marvels The Defenders', 'Interpretado', 'Protagonista', 'Mike Colter');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Luke Cage', 'Marvels Luke Cage', 'Interpretado', 'Protagonista', 'Mike Colter');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Daniel Rand', 'Marvels The Defenders', 'Interpretado', 'Protagonista', 'Finn Jones');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Daniel Rand', 'Marvels Iron Fist', 'Interpretado', 'Protagonista', 'Finn Jones');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Frank Castle', 'Marvels The Punisher', 'Interpretado', 'Protagonista', 'Jon Bernthal');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Matt Murdock', 'Marvels Daredevil', 'Interpretado', 'Protagonista', 'Charlie Cox');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Frank Castle', 'Marvels Daredevil', 'Interpretado', 'Secundario', 'Jon Bernthal');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Wilson Fisk', 'Marvels Daredevil', 'Interpretado', 'Antagonista', 'Vincent Donofrio');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Tony Stark', 'Iron Man 3', 'Interpretado', 'Protagonista', 'Robert Downey Jr');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Thor Odinson', 'Thor: Un mundo oscuro', 'Interpretado', 'Protagonista', 'Chris Hemsworth');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Steve Rogers', 'Capitán América: El soldado del invierno', 'Interpretado', 'Protagonista', 'Chris Evans');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Natasha Romanoff', 'Capitán América: El soldado del invierno', 'Interpretado', 'Secundario', 'Scarlett Johansson');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Natasha Romanoff', 'Los Vengadores 2: La era de ultron', 'Interpretado', 'Protagonista', 'Scarlett Johansson');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Steve Rogers', 'Los Vengadores 2: La era de ultron', 'Interpretado', 'Protagonista', 'Chris Evans');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Tony Stark', 'Los Vengadores 2: La era de ultron', 'Interpretado', 'Protagonista', 'Robert Downey Jr');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Thor Odinson', 'Los Vengadores 2: La era de ultron', 'Interpretado', 'Protagonista', 'Chris Hemsworth');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Clint Barton', 'Los Vengadores 2: La era de ultron', 'Interpretado', 'Protagonista', 'Jeremy Renner');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Bruce Banner', 'Los Vengadores 2: La era de ultron', 'Interpretado', 'Protagonista', 'Mark Ruffalo');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Peter Quill', 'Guardianes de la Galaxia', 'Interpretado', 'Protagonista', 'Chris Pratt');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Gamora', 'Guardianes de la Galaxia', 'Interpretado', 'Protagonista', 'Zoe Seldaña');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Drax', 'Guardianes de la Galaxia', 'Interpretado', 'Protagonista', 'Dave Bautista');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Groot', 'Guardianes de la Galaxia', 'Presta su voz', 'Protagonista', 'Vin Diesel');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Ratchet', 'Guardianes de la Galaxia', 'Presta su voz', 'Protagonista', 'Bradley Cooper');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Ronan', 'Guardianes de la Galaxia', 'Interpretado', 'Antagonista', 'Lee Pace');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Nebula', 'Guardianes de la Galaxia', 'Interpretado', 'Secundario', 'Karen Gillan');


--
-- TOC entry 3301 (class 2606 OID 24891)
-- Name: Esta Esta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Esta"
    ADD CONSTRAINT "Esta_pkey" PRIMARY KEY ("N_Personaje", "N_Titulo");


--
-- TOC entry 3304 (class 2620 OID 24989)
-- Name: Esta rolpersonaje_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER rolpersonaje_trigger BEFORE INSERT OR UPDATE ON public."Esta" FOR EACH ROW EXECUTE FUNCTION public.rolpersonaje();


--
-- TOC entry 3305 (class 2620 OID 24990)
-- Name: Esta tipoactor_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER tipoactor_trigger BEFORE INSERT OR UPDATE ON public."Esta" FOR EACH ROW EXECUTE FUNCTION public.tipoactor();


--
-- TOC entry 3302 (class 2606 OID 25347)
-- Name: Esta Esta_N_Personaje_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Esta"
    ADD CONSTRAINT "Esta_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE NOT VALID;


--
-- TOC entry 3303 (class 2606 OID 25352)
-- Name: Esta Esta_N_Titulo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Esta"
    ADD CONSTRAINT "Esta_N_Titulo_fkey" FOREIGN KEY ("N_Titulo") REFERENCES public."Medio"("Titulo") ON UPDATE CASCADE NOT VALID;


-- Completed on 2023-06-26 19:02:46

--
-- PostgreSQL database dump complete
--

