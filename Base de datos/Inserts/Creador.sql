--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2023-06-26 19:02:16

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
-- TOC entry 221 (class 1259 OID 24687)
-- Name: Creador; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Creador" (
    "Nom_Creador" text NOT NULL
);


ALTER TABLE public."Creador" OWNER TO postgres;

--
-- TOC entry 3442 (class 0 OID 24687)
-- Dependencies: 221
-- Data for Name: Creador; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Creador" ("Nom_Creador") VALUES ('Stan Lee');
INSERT INTO public."Creador" ("Nom_Creador") VALUES ('Larry Lieber');
INSERT INTO public."Creador" ("Nom_Creador") VALUES ('Joe Simon');
INSERT INTO public."Creador" ("Nom_Creador") VALUES ('Jack Kirby');
INSERT INTO public."Creador" ("Nom_Creador") VALUES ('Don Rico');
INSERT INTO public."Creador" ("Nom_Creador") VALUES ('Don Heck');
INSERT INTO public."Creador" ("Nom_Creador") VALUES ('Brian Michael Bendis');
INSERT INTO public."Creador" ("Nom_Creador") VALUES ('David Finch');
INSERT INTO public."Creador" ("Nom_Creador") VALUES ('Len Wein');
INSERT INTO public."Creador" ("Nom_Creador") VALUES ('John Romita');
INSERT INTO public."Creador" ("Nom_Creador") VALUES ('Tony Stark');
INSERT INTO public."Creador" ("Nom_Creador") VALUES ('Eitri');
INSERT INTO public."Creador" ("Nom_Creador") VALUES ('Dave Cockrum');
INSERT INTO public."Creador" ("Nom_Creador") VALUES ('Steve Ditko');
INSERT INTO public."Creador" ("Nom_Creador") VALUES ('Gil Kane');
INSERT INTO public."Creador" ("Nom_Creador") VALUES ('Dennis O Niel');
INSERT INTO public."Creador" ("Nom_Creador") VALUES ('Archie Goodwin');
INSERT INTO public."Creador" ("Nom_Creador") VALUES ('David Michelinie');


--
-- TOC entry 3299 (class 2606 OID 24887)
-- Name: Creador Creador_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Creador"
    ADD CONSTRAINT "Creador_pkey" PRIMARY KEY ("Nom_Creador");


-- Completed on 2023-06-26 19:02:16

--
-- PostgreSQL database dump complete
--

