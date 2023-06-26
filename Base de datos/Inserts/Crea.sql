--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2023-06-26 19:01:45

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
-- TOC entry 220 (class 1259 OID 24682)
-- Name: Crea; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Crea" (
    "N_Personaje" text NOT NULL,
    "N_Objeto" text NOT NULL
);


ALTER TABLE public."Crea" OWNER TO postgres;

--
-- TOC entry 3444 (class 0 OID 24682)
-- Dependencies: 220
-- Data for Name: Crea; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Crea" ("N_Personaje", "N_Objeto") VALUES ('Tony Stark', 'Mark III');
INSERT INTO public."Crea" ("N_Personaje", "N_Objeto") VALUES ('Eitri', 'Mjolnir');
INSERT INTO public."Crea" ("N_Personaje", "N_Objeto") VALUES ('Howard Stark', 'Escudo del Capitán América');
INSERT INTO public."Crea" ("N_Personaje", "N_Objeto") VALUES ('Obadiah Stane', 'IM Mark Uno');
INSERT INTO public."Crea" ("N_Personaje", "N_Objeto") VALUES ('Otto Octavius', 'Arnes de pulpo');


--
-- TOC entry 3299 (class 2606 OID 24885)
-- Name: Crea Crea_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Crea"
    ADD CONSTRAINT "Crea_pkey" PRIMARY KEY ("N_Personaje", "N_Objeto");


--
-- TOC entry 3300 (class 2606 OID 25327)
-- Name: Crea Crea_N_Objeto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Crea"
    ADD CONSTRAINT "Crea_N_Objeto_fkey" FOREIGN KEY ("N_Objeto") REFERENCES public."Objeto"("Nombre") ON UPDATE CASCADE NOT VALID;


--
-- TOC entry 3301 (class 2606 OID 25332)
-- Name: Crea Crea_N_Personaje_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Crea"
    ADD CONSTRAINT "Crea_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE NOT VALID;


-- Completed on 2023-06-26 19:01:45

--
-- PostgreSQL database dump complete
--

