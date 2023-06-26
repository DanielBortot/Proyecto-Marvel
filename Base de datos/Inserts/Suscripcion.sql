--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2023-06-26 19:08:35

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
-- TOC entry 252 (class 1259 OID 24844)
-- Name: Suscripcion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Suscripcion" (
    "ID" integer NOT NULL,
    "Tarifa" real NOT NULL,
    "Descripcion" text NOT NULL,
    "Tipo" text NOT NULL,
    CONSTRAINT "Suscripcion_Tarifa_check" CHECK (("Tarifa" >= (0)::double precision)),
    CONSTRAINT "Suscripcion_Tipo_check" CHECK ((("Tipo" = 'Gold'::text) OR ("Tipo" = 'Vip'::text) OR ("Tipo" = 'Premium'::text) OR ("Tipo" = 'Free'::text)))
);


ALTER TABLE public."Suscripcion" OWNER TO postgres;

--
-- TOC entry 3447 (class 0 OID 24844)
-- Dependencies: 252
-- Data for Name: Suscripcion; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Suscripcion" ("ID", "Tarifa", "Descripcion", "Tipo") VALUES (1, 5.99, 'Gold', 'Gold');
INSERT INTO public."Suscripcion" ("ID", "Tarifa", "Descripcion", "Tipo") VALUES (2, 9.99, 'Premium', 'Premium');
INSERT INTO public."Suscripcion" ("ID", "Tarifa", "Descripcion", "Tipo") VALUES (3, 14.99, 'Vip', 'Vip');
INSERT INTO public."Suscripcion" ("ID", "Tarifa", "Descripcion", "Tipo") VALUES (4, 0, 'Free', 'Free');


--
-- TOC entry 3301 (class 2606 OID 24965)
-- Name: Suscripcion Suscripcion_Tipo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Suscripcion"
    ADD CONSTRAINT "Suscripcion_Tipo_key" UNIQUE ("Tipo");


--
-- TOC entry 3303 (class 2606 OID 24967)
-- Name: Suscripcion Suscripcion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Suscripcion"
    ADD CONSTRAINT "Suscripcion_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 3304 (class 2620 OID 24991)
-- Name: Suscripcion tiposuscripciones_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER tiposuscripciones_trigger BEFORE INSERT OR UPDATE ON public."Suscripcion" FOR EACH ROW EXECUTE FUNCTION public.tiposuscripciones();


-- Completed on 2023-06-26 19:08:35

--
-- PostgreSQL database dump complete
--

