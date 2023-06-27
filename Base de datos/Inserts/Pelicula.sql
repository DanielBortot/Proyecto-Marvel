--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2023-06-27 15:01:44

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
-- TOC entry 236 (class 1259 OID 24759)
-- Name: Pelicula; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Pelicula" (
    "T_Pelicula" text NOT NULL,
    "Director" text NOT NULL,
    "Duracion" integer NOT NULL,
    "Coste" integer NOT NULL,
    "Ganancia" integer NOT NULL,
    "Distribuidor" text,
    "Tipo" text,
    CONSTRAINT "Pelicula_Coste_check" CHECK (("Coste" > 0)),
    CONSTRAINT "Pelicula_Duracion_check" CHECK (("Duracion" > 0)),
    CONSTRAINT "Pelicula_Ganancia_check" CHECK (("Ganancia" > 0))
);


ALTER TABLE public."Pelicula" OWNER TO postgres;

--
-- TOC entry 3448 (class 0 OID 24759)
-- Dependencies: 236
-- Data for Name: Pelicula; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Pelicula" ("T_Pelicula", "Director", "Duracion", "Coste", "Ganancia", "Distribuidor", "Tipo") VALUES ('Capitán América: el primer vengador', 'Joe Johnston', 124, 140, 371, 'Paramount Pictures', 'Live Action');
INSERT INTO public."Pelicula" ("T_Pelicula", "Director", "Duracion", "Coste", "Ganancia", "Distribuidor", "Tipo") VALUES ('Iron Man 2', 'Jon Favreau', 124, 200, 624, 'Paramount Pictures', 'Live Action');
INSERT INTO public."Pelicula" ("T_Pelicula", "Director", "Duracion", "Coste", "Ganancia", "Distribuidor", "Tipo") VALUES ('The Incredible Hulk', 'Louis Leterrier', 112, 150, 264, 'Universal Pictures', 'Live Action');
INSERT INTO public."Pelicula" ("T_Pelicula", "Director", "Duracion", "Coste", "Ganancia", "Distribuidor", "Tipo") VALUES ('Thor', 'Kenneth Branargh', 115, 150, 450, 'Paramount Pictures', 'Live Action');
INSERT INTO public."Pelicula" ("T_Pelicula", "Director", "Duracion", "Coste", "Ganancia", "Distribuidor", "Tipo") VALUES ('Spiderman: Un nuevo universo', 'Peter Ramsey', 160, 90, 375, 'Sony Pictues Releasing', 'Animacion');
INSERT INTO public."Pelicula" ("T_Pelicula", "Director", "Duracion", "Coste", "Ganancia", "Distribuidor", "Tipo") VALUES ('Iron Man', 'Jon Favreau', 160, 140, 585, 'Paramount Pictures', 'Live Action');
INSERT INTO public."Pelicula" ("T_Pelicula", "Director", "Duracion", "Coste", "Ganancia", "Distribuidor", "Tipo") VALUES ('Iron Man: Surge el tecnivoro', 'Hiroshi Hamasaki', 88, 25, 60, 'Sony Pictues Releasing', 'Animacion');
INSERT INTO public."Pelicula" ("T_Pelicula", "Director", "Duracion", "Coste", "Ganancia", "Distribuidor", "Tipo") VALUES ('Ultimate Avengers 2: Rise of the Panther', 'Will Meugniot', 170, 10, 400, 'Lion Gate Entertainmnet', 'Animacion');
INSERT INTO public."Pelicula" ("T_Pelicula", "Director", "Duracion", "Coste", "Ganancia", "Distribuidor", "Tipo") VALUES ('Iron Man 3', 'Jon Favreau', 131, 200, 1215, 'Walt Disney Studios', 'Live Action');
INSERT INTO public."Pelicula" ("T_Pelicula", "Director", "Duracion", "Coste", "Ganancia", "Distribuidor", "Tipo") VALUES ('Thor: Un mundo oscuro', 'Alan Taylor', 112, 250, 645, 'Walt Disney Studios', 'Live Action');
INSERT INTO public."Pelicula" ("T_Pelicula", "Director", "Duracion", "Coste", "Ganancia", "Distribuidor", "Tipo") VALUES ('Capitán América: El soldado del invierno', 'Anthony Russo', 136, 170, 714, 'Walt Disney Studios', 'Live Action');
INSERT INTO public."Pelicula" ("T_Pelicula", "Director", "Duracion", "Coste", "Ganancia", "Distribuidor", "Tipo") VALUES ('Guardianes de la Galaxia', 'James Gunn', 122, 200, 773, 'Walt Disney Studios', 'Live Action');
INSERT INTO public."Pelicula" ("T_Pelicula", "Director", "Duracion", "Coste", "Ganancia", "Distribuidor", "Tipo") VALUES ('Antman', 'Peyton reed', 117, 169, 519, 'Walt Disney Studios', 'Live Action');
INSERT INTO public."Pelicula" ("T_Pelicula", "Director", "Duracion", "Coste", "Ganancia", "Distribuidor", "Tipo") VALUES ('Black Widow', 'Cate Shrotland', 134, 200, 380, 'Walt Disney Studios', 'Live Action');
INSERT INTO public."Pelicula" ("T_Pelicula", "Director", "Duracion", "Coste", "Ganancia", "Distribuidor", "Tipo") VALUES ('X-Men', 'Bryan Singer', 104, 75, 296, '20th Century Fox', 'Live Action');
INSERT INTO public."Pelicula" ("T_Pelicula", "Director", "Duracion", "Coste", "Ganancia", "Distribuidor", "Tipo") VALUES ('Spiderman 2', 'Sam Raimi', 127, 200, 790, 'Columbia Pictures', 'Live Action');
INSERT INTO public."Pelicula" ("T_Pelicula", "Director", "Duracion", "Coste", "Ganancia", "Distribuidor", "Tipo") VALUES ('Thor: Ragnarok', 'Taika Waititi', 130, 180, 854, 'Walt Disney Studios', 'Live Action');
INSERT INTO public."Pelicula" ("T_Pelicula", "Director", "Duracion", "Coste", "Ganancia", "Distribuidor", "Tipo") VALUES ('Avengers: Endgame', 'Anthony Ruso', 181, 365, 2780, 'Walt Disney Studios', 'Live Action');
INSERT INTO public."Pelicula" ("T_Pelicula", "Director", "Duracion", "Coste", "Ganancia", "Distribuidor", "Tipo") VALUES ('Avengers', 'Joss Whedon', 143, 220, 1520, 'Walt Disney Studios', 'Live Action');
INSERT INTO public."Pelicula" ("T_Pelicula", "Director", "Duracion", "Coste", "Ganancia", "Distribuidor", "Tipo") VALUES ('Avengers: La era de ultron', 'Joss Whedon', 141, 316, 1405, 'Walt Disney Studios', 'Live Action');
INSERT INTO public."Pelicula" ("T_Pelicula", "Director", "Duracion", "Coste", "Ganancia", "Distribuidor", "Tipo") VALUES ('Capitán América: Civil War', 'Anthony Ruso', 147, 230, 1153, 'Walt Disney Studios', 'Live Action');
INSERT INTO public."Pelicula" ("T_Pelicula", "Director", "Duracion", "Coste", "Ganancia", "Distribuidor", "Tipo") VALUES ('Black Panther: Wakanda Forever', 'Ryan Coogler', 161, 250, 860, 'Walt Disney Studios', 'Live Action');


--
-- TOC entry 3301 (class 2606 OID 25537)
-- Name: Pelicula Pelicula_Tipo_check; Type: CHECK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE public."Pelicula"
    ADD CONSTRAINT "Pelicula_Tipo_check" CHECK ((("Tipo" = 'Animacion'::text) OR ("Tipo" = 'Live Action'::text))) NOT VALID;


--
-- TOC entry 3303 (class 2606 OID 24927)
-- Name: Pelicula Pelicula_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pelicula"
    ADD CONSTRAINT "Pelicula_pkey" PRIMARY KEY ("T_Pelicula");


--
-- TOC entry 3305 (class 2620 OID 24985)
-- Name: Pelicula ganancia_perdida_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER ganancia_perdida_trigger BEFORE INSERT OR UPDATE ON public."Pelicula" FOR EACH ROW EXECUTE FUNCTION public.ganancia_perdida();


--
-- TOC entry 3304 (class 2606 OID 25648)
-- Name: Pelicula Pelicula_T_Pelicula_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pelicula"
    ADD CONSTRAINT "Pelicula_T_Pelicula_fkey" FOREIGN KEY ("T_Pelicula") REFERENCES public."Medio"("Titulo") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


-- Completed on 2023-06-27 15:01:44

--
-- PostgreSQL database dump complete
--

