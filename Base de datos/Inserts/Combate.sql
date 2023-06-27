--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2023-06-27 14:59:23

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
-- TOC entry 256 (class 1259 OID 25538)
-- Name: Combate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Combate" (
    "N_Personaje" text NOT NULL,
    "N_Poder" text NOT NULL,
    "N_Objeto" text DEFAULT 'No Objeto'::text NOT NULL,
    "Fecha" date NOT NULL,
    "Lugar" text NOT NULL
);


ALTER TABLE public."Combate" OWNER TO postgres;

--
-- TOC entry 3446 (class 0 OID 25538)
-- Dependencies: 256
-- Data for Name: Combate; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Combate" ("N_Personaje", "N_Poder", "N_Objeto", "Fecha", "Lugar") VALUES ('Thor Odinson', 'Manipulación de la electricidad', 'Mjolnir', '2011-04-17', 'Nuevo México');
INSERT INTO public."Combate" ("N_Personaje", "N_Poder", "N_Objeto", "Fecha", "Lugar") VALUES ('Thor Odinson', 'Super Fuerza', 'Mjolnir', '2011-04-17', 'Nuevo México');
INSERT INTO public."Combate" ("N_Personaje", "N_Poder", "N_Objeto", "Fecha", "Lugar") VALUES ('Thor Odinson', 'Manipulación de la electricidad', 'Mjolnir', '2012-05-04', 'Nueva York');
INSERT INTO public."Combate" ("N_Personaje", "N_Poder", "N_Objeto", "Fecha", "Lugar") VALUES ('Thor Odinson', 'Super Fuerza', 'Mjolnir', '2012-05-04', 'Nueva York');
INSERT INTO public."Combate" ("N_Personaje", "N_Poder", "N_Objeto", "Fecha", "Lugar") VALUES ('Thor Odinson', 'Volar', 'Mjolnir', '2012-05-04', 'Nueva York');
INSERT INTO public."Combate" ("N_Personaje", "N_Poder", "N_Objeto", "Fecha", "Lugar") VALUES ('Tony Stark', 'No Poder', 'Mark III', '2012-05-04', 'Nueva York');
INSERT INTO public."Combate" ("N_Personaje", "N_Poder", "N_Objeto", "Fecha", "Lugar") VALUES ('Tony Stark', 'No Poder', 'Mark III', '2010-04-28', 'Nueva York');
INSERT INTO public."Combate" ("N_Personaje", "N_Poder", "N_Objeto", "Fecha", "Lugar") VALUES ('Tony Stark', 'No Poder', 'Mark III', '2008-02-05', 'Los Angeles');
INSERT INTO public."Combate" ("N_Personaje", "N_Poder", "N_Objeto", "Fecha", "Lugar") VALUES ('Loki Laufeyson', 'Super Fuerza', 'Cetro de Loki', '2012-05-04', 'Nueva York');
INSERT INTO public."Combate" ("N_Personaje", "N_Poder", "N_Objeto", "Fecha", "Lugar") VALUES ('Loki Laufeyson', 'Ilusionista', 'Cetro de Loki', '2012-05-04', 'Nueva York');
INSERT INTO public."Combate" ("N_Personaje", "N_Poder", "N_Objeto", "Fecha", "Lugar") VALUES ('Steve Rogers', 'Super Fuerza', 'Escudo del Capitán América', '2012-05-04', 'Nueva York');
INSERT INTO public."Combate" ("N_Personaje", "N_Poder", "N_Objeto", "Fecha", "Lugar") VALUES ('Steve Rogers', 'Super Fuerza', 'Escudo del Capitán América', '1945-04-22', 'Alemania');
INSERT INTO public."Combate" ("N_Personaje", "N_Poder", "N_Objeto", "Fecha", "Lugar") VALUES ('Johann Schmidt', 'Super Fuerza', 'No Objeto', '1945-04-22', 'Alemania');
INSERT INTO public."Combate" ("N_Personaje", "N_Poder", "N_Objeto", "Fecha", "Lugar") VALUES ('Clint Barton', 'No Poder', 'Arco Compuesto', '2012-05-04', 'Nueva York');
INSERT INTO public."Combate" ("N_Personaje", "N_Poder", "N_Objeto", "Fecha", "Lugar") VALUES ('Peter Quill', 'No Poder', 'Gema del Poder', '2014-07-21', 'Xandar');
INSERT INTO public."Combate" ("N_Personaje", "N_Poder", "N_Objeto", "Fecha", "Lugar") VALUES ('Tony Stark', 'No Poder', 'Mark III', '2013-05-03', 'Los Angeles');
INSERT INTO public."Combate" ("N_Personaje", "N_Poder", "N_Objeto", "Fecha", "Lugar") VALUES ('Tony Stark', 'No Poder', 'Mark III', '2015-05-01', 'Sokovia');
INSERT INTO public."Combate" ("N_Personaje", "N_Poder", "N_Objeto", "Fecha", "Lugar") VALUES ('Thor Odinson', 'Super Fuerza', 'Mjolnir', '2013-11-08', 'Londres');
INSERT INTO public."Combate" ("N_Personaje", "N_Poder", "N_Objeto", "Fecha", "Lugar") VALUES ('Thor Odinson', 'Volar', 'Mjolnir', '2013-11-08', 'Londres');
INSERT INTO public."Combate" ("N_Personaje", "N_Poder", "N_Objeto", "Fecha", "Lugar") VALUES ('Thor Odinson', 'Manipulación de la electricidad', 'Mjolnir', '2013-11-08', 'Londres');
INSERT INTO public."Combate" ("N_Personaje", "N_Poder", "N_Objeto", "Fecha", "Lugar") VALUES ('Thor Odinson', 'Super Fuerza', 'Mjolnir', '2015-05-01', 'Sokovia');
INSERT INTO public."Combate" ("N_Personaje", "N_Poder", "N_Objeto", "Fecha", "Lugar") VALUES ('Thor Odinson', 'Volar', 'Mjolnir', '2015-05-01', 'Sokovia');
INSERT INTO public."Combate" ("N_Personaje", "N_Poder", "N_Objeto", "Fecha", "Lugar") VALUES ('Thor Odinson', 'Manipulación de la electricidad', 'Mjolnir', '2015-05-01', 'Sokovia');
INSERT INTO public."Combate" ("N_Personaje", "N_Poder", "N_Objeto", "Fecha", "Lugar") VALUES ('Steve Rogers', 'Super Fuerza', 'Escudo del Capitán América', '2014-04-04', 'Washinton');
INSERT INTO public."Combate" ("N_Personaje", "N_Poder", "N_Objeto", "Fecha", "Lugar") VALUES ('Steve Rogers', 'Super Fuerza', 'Escudo del Capitán América', '2015-05-01', 'Sokovia');
INSERT INTO public."Combate" ("N_Personaje", "N_Poder", "N_Objeto", "Fecha", "Lugar") VALUES ('Clint Barton', 'No Poder', 'Arco Compuesto', '2015-05-01', 'Sokovia');


--
-- TOC entry 3300 (class 2606 OID 25544)
-- Name: Combate Combate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Combate"
    ADD CONSTRAINT "Combate_pkey" PRIMARY KEY ("N_Personaje", "N_Poder", "N_Objeto", "Fecha");


--
-- TOC entry 3301 (class 2606 OID 25588)
-- Name: Combate Combate_N_Objeto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Combate"
    ADD CONSTRAINT "Combate_N_Objeto_fkey" FOREIGN KEY ("N_Objeto") REFERENCES public."Objeto"("Nombre") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3302 (class 2606 OID 25593)
-- Name: Combate Combate_N_Personaje_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Combate"
    ADD CONSTRAINT "Combate_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3303 (class 2606 OID 25598)
-- Name: Combate Combate_N_Poder_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Combate"
    ADD CONSTRAINT "Combate_N_Poder_fkey" FOREIGN KEY ("N_Poder") REFERENCES public."Poder"("Nombre") ON UPDATE CASCADE ON DELETE SET DEFAULT NOT VALID;


-- Completed on 2023-06-27 14:59:23

--
-- PostgreSQL database dump complete
--

