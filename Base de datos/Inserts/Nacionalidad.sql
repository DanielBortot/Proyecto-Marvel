--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2023-06-26 19:03:52

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
-- TOC entry 230 (class 1259 OID 24733)
-- Name: Nacionalidad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Nacionalidad" (
    "Nac" text NOT NULL
);


ALTER TABLE public."Nacionalidad" OWNER TO postgres;

--
-- TOC entry 3442 (class 0 OID 24733)
-- Dependencies: 230
-- Data for Name: Nacionalidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Nacionalidad" ("Nac") VALUES ('Estadounidense');
INSERT INTO public."Nacionalidad" ("Nac") VALUES ('Asgardiano');
INSERT INTO public."Nacionalidad" ("Nac") VALUES ('Ruso');
INSERT INTO public."Nacionalidad" ("Nac") VALUES ('Británico');
INSERT INTO public."Nacionalidad" ("Nac") VALUES ('Canadiense');
INSERT INTO public."Nacionalidad" ("Nac") VALUES ('Wakanda');
INSERT INTO public."Nacionalidad" ("Nac") VALUES ('Croata');
INSERT INTO public."Nacionalidad" ("Nac") VALUES ('Aleman');
INSERT INTO public."Nacionalidad" ("Nac") VALUES ('Jotunheim');


--
-- TOC entry 3299 (class 2606 OID 24909)
-- Name: Nacionalidad Nacionalidad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Nacionalidad"
    ADD CONSTRAINT "Nacionalidad_pkey" PRIMARY KEY ("Nac");


-- Completed on 2023-06-26 19:03:52

--
-- PostgreSQL database dump complete
--

