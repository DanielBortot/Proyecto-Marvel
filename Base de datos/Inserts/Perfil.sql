--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2023-06-26 19:05:36

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
-- TOC entry 237 (class 1259 OID 24767)
-- Name: Perfil; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Perfil" (
    "Id_Perfil" integer NOT NULL,
    "Dispositivo" text NOT NULL,
    "Nombre" text NOT NULL,
    "Idioma" text NOT NULL,
    "Email" text NOT NULL,
    "Imagen" integer NOT NULL,
    CONSTRAINT "Perfil_Id_Perfil_check" CHECK (("Id_Perfil" >= 0))
);


ALTER TABLE public."Perfil" OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 24773)
-- Name: Perfil_Id_Perfil_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Perfil_Id_Perfil_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Perfil_Id_Perfil_seq" OWNER TO postgres;

--
-- TOC entry 3452 (class 0 OID 0)
-- Dependencies: 238
-- Name: Perfil_Id_Perfil_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Perfil_Id_Perfil_seq" OWNED BY public."Perfil"."Id_Perfil";


--
-- TOC entry 3298 (class 2604 OID 24873)
-- Name: Perfil Id_Perfil; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Perfil" ALTER COLUMN "Id_Perfil" SET DEFAULT nextval('public."Perfil_Id_Perfil_seq"'::regclass);


--
-- TOC entry 3445 (class 0 OID 24767)
-- Dependencies: 237
-- Data for Name: Perfil; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Perfil" ("Id_Perfil", "Dispositivo", "Nombre", "Idioma", "Email", "Imagen") VALUES (1, 'Televisor', 'Daniel', 'Chino', 'bortotdaniel@gmail.com', 8);
INSERT INTO public."Perfil" ("Id_Perfil", "Dispositivo", "Nombre", "Idioma", "Email", "Imagen") VALUES (2, 'Computadora', 'yuyuy', 'Frances', 'bortotdaniel@gmail.com', 9);
INSERT INTO public."Perfil" ("Id_Perfil", "Dispositivo", "Nombre", "Idioma", "Email", "Imagen") VALUES (3, 'Computadora', 'Marco', 'Espanol', 'usu1@ejemplo.com', 3);
INSERT INTO public."Perfil" ("Id_Perfil", "Dispositivo", "Nombre", "Idioma", "Email", "Imagen") VALUES (4, 'Telefono', 'PerfilUno', 'Espanol', 'usu2@ejemplo.com', 10);
INSERT INTO public."Perfil" ("Id_Perfil", "Dispositivo", "Nombre", "Idioma", "Email", "Imagen") VALUES (5, 'Tablet', 'Natalia', 'Ingles', 'usu2@ejemplo.com', 9);


--
-- TOC entry 3453 (class 0 OID 0)
-- Dependencies: 238
-- Name: Perfil_Id_Perfil_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Perfil_Id_Perfil_seq"', 5, true);


--
-- TOC entry 3301 (class 2606 OID 24929)
-- Name: Perfil Perfil_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Perfil"
    ADD CONSTRAINT "Perfil_pkey" PRIMARY KEY ("Id_Perfil");


--
-- TOC entry 3302 (class 2606 OID 25402)
-- Name: Perfil Perfil_Email_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Perfil"
    ADD CONSTRAINT "Perfil_Email_fkey" FOREIGN KEY ("Email") REFERENCES public."Usuario"("Email") ON UPDATE CASCADE NOT VALID;


-- Completed on 2023-06-26 19:05:36

--
-- PostgreSQL database dump complete
--

