--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2023-06-27 14:58:02

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
-- TOC entry 215 (class 1259 OID 24660)
-- Name: Cargo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Cargo" (
    "Cod_Cargo" integer NOT NULL,
    "Descripcion" text NOT NULL
);


ALTER TABLE public."Cargo" OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 24665)
-- Name: Cargo_Cod_Cargo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Cargo_Cod_Cargo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Cargo_Cod_Cargo_seq" OWNER TO postgres;

--
-- TOC entry 3450 (class 0 OID 0)
-- Dependencies: 216
-- Name: Cargo_Cod_Cargo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Cargo_Cod_Cargo_seq" OWNED BY public."Cargo"."Cod_Cargo";


--
-- TOC entry 3298 (class 2604 OID 24869)
-- Name: Cargo Cod_Cargo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Cargo" ALTER COLUMN "Cod_Cargo" SET DEFAULT nextval('public."Cargo_Cod_Cargo_seq"'::regclass);


--
-- TOC entry 3443 (class 0 OID 24660)
-- Dependencies: 215
-- Data for Name: Cargo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Cargo" ("Cod_Cargo", "Descripcion") VALUES (100, 'Lider');
INSERT INTO public."Cargo" ("Cod_Cargo", "Descripcion") VALUES (101, 'Cofundador');
INSERT INTO public."Cargo" ("Cod_Cargo", "Descripcion") VALUES (102, 'Agente');
INSERT INTO public."Cargo" ("Cod_Cargo", "Descripcion") VALUES (103, 'Profesor');


--
-- TOC entry 3451 (class 0 OID 0)
-- Dependencies: 216
-- Name: Cargo_Cod_Cargo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Cargo_Cod_Cargo_seq"', 1, false);


--
-- TOC entry 3300 (class 2606 OID 24877)
-- Name: Cargo Cargo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Cargo"
    ADD CONSTRAINT "Cargo_pkey" PRIMARY KEY ("Cod_Cargo");


-- Completed on 2023-06-27 14:58:03

--
-- PostgreSQL database dump complete
--

