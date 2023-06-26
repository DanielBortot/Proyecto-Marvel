--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2023-06-26 19:08:52

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
-- TOC entry 253 (class 1259 OID 24851)
-- Name: Tarjeta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Tarjeta" (
    "N_Tarjeta" text NOT NULL,
    "Cod_Seguridad" integer NOT NULL,
    "Fecha_Ven" date NOT NULL,
    CONSTRAINT "Tarjeta_Cod_Seguridad_check" CHECK ((("Cod_Seguridad" >= 100) AND ("Cod_Seguridad" <= 999))),
    CONSTRAINT "Tarjeta_N_Tarjeta_check" CHECK ((char_length("N_Tarjeta") = 16))
);


ALTER TABLE public."Tarjeta" OWNER TO postgres;

--
-- TOC entry 3446 (class 0 OID 24851)
-- Dependencies: 253
-- Data for Name: Tarjeta; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Tarjeta" ("N_Tarjeta", "Cod_Seguridad", "Fecha_Ven") VALUES ('9876543211001111', 434, '2023-06-15');
INSERT INTO public."Tarjeta" ("N_Tarjeta", "Cod_Seguridad", "Fecha_Ven") VALUES ('3343423434324243', 434, '2023-06-29');
INSERT INTO public."Tarjeta" ("N_Tarjeta", "Cod_Seguridad", "Fecha_Ven") VALUES ('1234456789101111', 232, '2023-06-30');
INSERT INTO public."Tarjeta" ("N_Tarjeta", "Cod_Seguridad", "Fecha_Ven") VALUES ('1000100010001000', 100, '2024-01-01');
INSERT INTO public."Tarjeta" ("N_Tarjeta", "Cod_Seguridad", "Fecha_Ven") VALUES ('2000200020002000', 200, '2024-01-01');
INSERT INTO public."Tarjeta" ("N_Tarjeta", "Cod_Seguridad", "Fecha_Ven") VALUES ('3000300030003000', 300, '2024-01-01');


--
-- TOC entry 3301 (class 2606 OID 24969)
-- Name: Tarjeta Tarjeta_N_Tarjeta_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tarjeta"
    ADD CONSTRAINT "Tarjeta_N_Tarjeta_key" UNIQUE ("N_Tarjeta");


--
-- TOC entry 3303 (class 2606 OID 24971)
-- Name: Tarjeta Tarjeta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tarjeta"
    ADD CONSTRAINT "Tarjeta_pkey" PRIMARY KEY ("N_Tarjeta");


-- Completed on 2023-06-26 19:08:52

--
-- PostgreSQL database dump complete
--

