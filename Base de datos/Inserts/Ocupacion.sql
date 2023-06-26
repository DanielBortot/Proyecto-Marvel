--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2023-06-26 19:04:34

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
-- TOC entry 232 (class 1259 OID 24743)
-- Name: Ocupacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Ocupacion" (
    "Ocup" text NOT NULL
);


ALTER TABLE public."Ocupacion" OWNER TO postgres;

--
-- TOC entry 3442 (class 0 OID 24743)
-- Dependencies: 232
-- Data for Name: Ocupacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Ocupacion" ("Ocup") VALUES ('Ingeniero');
INSERT INTO public."Ocupacion" ("Ocup") VALUES ('Militar');
INSERT INTO public."Ocupacion" ("Ocup") VALUES ('Dios');
INSERT INTO public."Ocupacion" ("Ocup") VALUES ('Científico');
INSERT INTO public."Ocupacion" ("Ocup") VALUES ('Espía');
INSERT INTO public."Ocupacion" ("Ocup") VALUES ('Agente');
INSERT INTO public."Ocupacion" ("Ocup") VALUES ('Profesor');
INSERT INTO public."Ocupacion" ("Ocup") VALUES ('Fotógrafo');
INSERT INTO public."Ocupacion" ("Ocup") VALUES ('Criminal');
INSERT INTO public."Ocupacion" ("Ocup") VALUES ('Terrorista');
INSERT INTO public."Ocupacion" ("Ocup") VALUES ('Empresario');
INSERT INTO public."Ocupacion" ("Ocup") VALUES ('Abogado');
INSERT INTO public."Ocupacion" ("Ocup") VALUES ('Vigilante');
INSERT INTO public."Ocupacion" ("Ocup") VALUES ('Investigador Privado');
INSERT INTO public."Ocupacion" ("Ocup") VALUES ('Mercenario');
INSERT INTO public."Ocupacion" ("Ocup") VALUES ('Mafioso');


--
-- TOC entry 3299 (class 2606 OID 24915)
-- Name: Ocupacion Ocupacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ocupacion"
    ADD CONSTRAINT "Ocupacion_pkey" PRIMARY KEY ("Ocup");


-- Completed on 2023-06-26 19:04:35

--
-- PostgreSQL database dump complete
--

