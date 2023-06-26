--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2023-06-26 19:08:15

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
-- TOC entry 251 (class 1259 OID 24839)
-- Name: Serie; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Serie" (
    "T_Serie" text NOT NULL,
    "N_Episodios" integer NOT NULL,
    "Creador" text NOT NULL,
    "Canal" text NOT NULL
);


ALTER TABLE public."Serie" OWNER TO postgres;

--
-- TOC entry 3443 (class 0 OID 24839)
-- Dependencies: 251
-- Data for Name: Serie; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Serie" ("T_Serie", "N_Episodios", "Creador", "Canal") VALUES ('Marvels The Punisher', 26, 'Steve Lightfoot', 'Netflix');
INSERT INTO public."Serie" ("T_Serie", "N_Episodios", "Creador", "Canal") VALUES ('Marvels Iron Fist', 23, 'Scott Buck', 'Netflix');
INSERT INTO public."Serie" ("T_Serie", "N_Episodios", "Creador", "Canal") VALUES ('Marvels Luke Cage', 26, 'Cheo Hodari Coker', 'Netflix');
INSERT INTO public."Serie" ("T_Serie", "N_Episodios", "Creador", "Canal") VALUES ('Marvels Jessica Jones', 39, 'Melissa Rosenberg', 'Netflix');
INSERT INTO public."Serie" ("T_Serie", "N_Episodios", "Creador", "Canal") VALUES ('Marvels The Defenders', 8, 'Marco Ramirez', 'Netflix');
INSERT INTO public."Serie" ("T_Serie", "N_Episodios", "Creador", "Canal") VALUES ('Marvels Daredevil', 39, 'Drew Goddard', 'Netflix');


--
-- TOC entry 3299 (class 2606 OID 24963)
-- Name: Serie Serie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Serie"
    ADD CONSTRAINT "Serie_pkey" PRIMARY KEY ("T_Serie");


--
-- TOC entry 3300 (class 2606 OID 25497)
-- Name: Serie Medio_T_Serie_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Serie"
    ADD CONSTRAINT "Medio_T_Serie_fkey" FOREIGN KEY ("T_Serie") REFERENCES public."Medio"("Titulo") ON UPDATE CASCADE NOT VALID;


-- Completed on 2023-06-26 19:08:16

--
-- PostgreSQL database dump complete
--

