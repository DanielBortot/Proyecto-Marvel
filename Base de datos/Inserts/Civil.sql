--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2023-06-26 19:01:09

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
-- TOC entry 219 (class 1259 OID 24672)
-- Name: Civil; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Civil" (
    "N_Civil" text NOT NULL
);


ALTER TABLE public."Civil" OWNER TO postgres;

--
-- TOC entry 3443 (class 0 OID 24672)
-- Dependencies: 219
-- Data for Name: Civil; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Civil" ("N_Civil") VALUES ('Eitri');
INSERT INTO public."Civil" ("N_Civil") VALUES ('Howard Stark');


--
-- TOC entry 3299 (class 2606 OID 24881)
-- Name: Civil Civil_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Civil"
    ADD CONSTRAINT "Civil_pkey" PRIMARY KEY ("N_Civil");


--
-- TOC entry 3300 (class 2606 OID 25307)
-- Name: Civil Civil_N_Civil_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Civil"
    ADD CONSTRAINT "Civil_N_Civil_fkey" FOREIGN KEY ("N_Civil") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE NOT VALID;


-- Completed on 2023-06-26 19:01:09

--
-- PostgreSQL database dump complete
--

