--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2023-06-27 15:00:13

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
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Bruce Banner', 'The Incredible Hulk', 'Interpretado', 'Protagonista', 'Edward Norton');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Thor Odinson', 'Thor', 'Interpretado', 'Protagonista', 'Chris Hemsworth');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Steve Rogers', 'Capitán América: el primer vengador', 'Interpretado', 'Protagonista', 'Chris Evans');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Natasha Romanoff', 'Iron Man 2', 'Interpretado', 'Secundario', 'Scarlett Johansson');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Nicholas Fury', 'Iron Man 2', 'Interpretado', 'Secundario', 'Samuel L Jackson');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Emil Blonsky', 'The Incredible Hulk', 'Interpretado', 'Antagonista', 'Tim Roth');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Johann Schmidt', 'Capitán América: el primer vengador', 'Interpretado', 'Antagonista', 'Hugo Weaving');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Loki Laufeyson', 'Thor', 'Interpretado', 'Secundario', 'Tom Hiddleston');
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
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Peter Quill', 'Guardianes de la Galaxia', 'Interpretado', 'Protagonista', 'Chris Pratt');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Gamora', 'Guardianes de la Galaxia', 'Interpretado', 'Protagonista', 'Zoe Seldaña');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Drax', 'Guardianes de la Galaxia', 'Interpretado', 'Protagonista', 'Dave Bautista');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Groot', 'Guardianes de la Galaxia', 'Presta su voz', 'Protagonista', 'Vin Diesel');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Ronan', 'Guardianes de la Galaxia', 'Interpretado', 'Antagonista', 'Lee Pace');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Nebula', 'Guardianes de la Galaxia', 'Interpretado', 'Secundario', 'Karen Gillan');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Rocket', 'Guardianes de la Galaxia', 'Presta su voz', 'Protagonista', 'Bradley Cooper');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Natasha Romanoff', 'Black Widow', 'Interpretado', 'Protagonista', 'Scarlett Johansson');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Antonia Dreykov', 'Black Widow', 'Interpretado', 'Antagonista', 'Olga Kurylenko');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Charles Xavier', 'X-Men', 'Interpretado', 'Protagonista', 'Patrick Stewart');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Logan Howlett', 'X-Men', 'Interpretado', 'Protagonista', 'Hugh Jackman');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Ororo Munroe', 'X-Men', 'Interpretado', 'Protagonista', 'Halle Berry');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Sharon Carter', 'Capitán América: El soldado del invierno', 'Interpretado', 'Secundario', 'Emily VanCamp');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Maria Hill', 'Capitán América: El soldado del invierno', 'Interpretado', 'Secundario', 'Cobie Smulders');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Peter Parker', 'Spiderman 2', 'Interpretado', 'Protagonista', 'Tobey Maguire');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Otto Octavius', 'Spiderman 2', 'Interpretado', 'Antagonista', 'Alfred Molina');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Thor Odinson', 'Thor: Ragnarok', 'Interpretado', 'Protagonista', 'Chris Hemsworth');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Loki Laufeyson', 'Thor: Ragnarok', 'Interpretado', 'Protagonista', 'Tom Hiddleston');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Hela Odinson', 'Thor: Ragnarok', 'Interpretado', 'Antagonista', 'Cate Blanchett');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Tony Stark', 'Avengers', 'Interpretado', 'Protagonista', 'Robert Downey Jr');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Bruce Banner', 'Avengers', 'Interpretado', 'Protagonista', 'Mark Ruffalo');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Steve Rogers', 'Avengers', 'Interpretado', 'Protagonista', 'Chris Evans');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Thor Odinson', 'Avengers', 'Interpretado', 'Protagonista', 'Chris Evans');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Natasha Romanoff', 'Avengers', 'Interpretado', 'Protagonista', 'Scarlett Johansson');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Clint Barton', 'Avengers', 'Interpretado', 'Protagonista', 'Jeremy Renner');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Nicholas Fury', 'Avengers', 'Interpretado', 'Secundario', 'Samuel L Jackson');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Maria Hill', 'Avengers', 'Interpretado', 'Secundario', 'Cobie Smulders');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Loki Laufeyson', 'Avengers', 'Interpretado', 'Antagonista', 'Tom Hiddleston');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Natasha Romanoff', 'Avengers: La era de ultron', 'Interpretado', 'Protagonista', 'Scarlett Johansson');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Steve Rogers', 'Avengers: La era de ultron', 'Interpretado', 'Protagonista', 'Chris Evans');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Tony Stark', 'Avengers: La era de ultron', 'Interpretado', 'Protagonista', 'Robert Downey Jr');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Thor Odinson', 'Avengers: La era de ultron', 'Interpretado', 'Protagonista', 'Chris Hemsworth');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Clint Barton', 'Avengers: La era de ultron', 'Interpretado', 'Protagonista', 'Jeremy Renner');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Bruce Banner', 'Avengers: La era de ultron', 'Interpretado', 'Protagonista', 'Mark Ruffalo');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Thor Odinson', 'Avengers: Endgame', 'Interpretado', 'Protagonista', 'Chris Hemsworth');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Steve Rogers', 'Avengers: Endgame', 'Interpretado', 'Protagonista', 'Chris Evans');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Tony Stark', 'Avengers: Endgame', 'Interpretado', 'Protagonista', 'Robert Downey Jr');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Natasha Romanoff', 'Avengers: Endgame', 'Interpretado', 'Protagonista', 'Scarlett Johansson');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Clint Barton', 'Avengers: Endgame', 'Interpretado', 'Protagonista', 'Jeremy Renner');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Eitri', 'Avengers: Endgame', 'Interpretado', 'Secundario', 'Peter Dinklage');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Bruce Banner', 'Avengers: Endgame', 'Interpretado', 'Protagonista', 'Mark Ruffalo');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Howard Stark', 'Avengers: Endgame', 'Interpretado', 'Secundario', 'John Slattery');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Howard Stark', 'Capitán América: el primer vengador', 'Interpretado', 'Secundario', 'Dominic Cooper');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Tony Stark', 'Capitán América: Civil War', 'Interpretado', 'Protagonista', 'Robert Downey Jr');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Steve Rogers', 'Capitán América: Civil War', 'Interpretado', 'Protagonista', 'Chris Evans');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Clint Barton', 'Capitán América: Civil War', 'Interpretado', 'Secundario', 'Jeremy Renner');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Natasha Romanoff', 'Capitán América: Civil War', 'Interpretado', 'Secundario', 'Scarlett Johanson');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Helmut Zemo', 'Capitán América: Civil War', 'Interpretado', 'Antagonista', 'Daniel Bruhl');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Peter Parker', 'Capitán América: Civil War', 'Interpretado', 'Secundario', 'Tom Holland');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Sharon Carter', 'Capitán América: Civil War', 'Interpretado', 'Secundario', 'Emily VanCamp');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Namor', 'Black Panther: Wakanda Forever', 'Interpretado', 'Protagonista', 'Tenoch Huerta');


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
-- TOC entry 3302 (class 2606 OID 25623)
-- Name: Esta Esta_N_Personaje_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Esta"
    ADD CONSTRAINT "Esta_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3303 (class 2606 OID 25628)
-- Name: Esta Esta_N_Titulo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Esta"
    ADD CONSTRAINT "Esta_N_Titulo_fkey" FOREIGN KEY ("N_Titulo") REFERENCES public."Medio"("Titulo") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


-- Completed on 2023-06-27 15:00:14

--
-- PostgreSQL database dump complete
--

