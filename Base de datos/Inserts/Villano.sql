--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2023-06-26 19:09:33

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
-- TOC entry 255 (class 1259 OID 24864)
-- Name: Villano; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Villano" (
    "N_Villano" text NOT NULL,
    "Alias" text NOT NULL,
    "Objetivo" text
);


ALTER TABLE public."Villano" OWNER TO postgres;

--
-- TOC entry 3445 (class 0 OID 24864)
-- Dependencies: 255
-- Data for Name: Villano; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Villano" ("N_Villano", "Alias", "Objetivo") VALUES ('Emil Blonsky', 'Abominación', 'Derrotar a Hulk');
INSERT INTO public."Villano" ("N_Villano", "Alias", "Objetivo") VALUES ('Johann Schmidt', 'Craneo Rojo', 'Dominar el mundo');
INSERT INTO public."Villano" ("N_Villano", "Alias", "Objetivo") VALUES ('Helmut Zemo', 'Baron Zemo', 'Vengarse de los vengadores');
INSERT INTO public."Villano" ("N_Villano", "Alias", "Objetivo") VALUES ('Loki Laufeyson', 'Loki', 'Hacer travesuras a su hermano Thor');
INSERT INTO public."Villano" ("N_Villano", "Alias", "Objetivo") VALUES ('Obadiah Stane', 'Iron Monger', 'Adueñarse de Stark Industries');
INSERT INTO public."Villano" ("N_Villano", "Alias", "Objetivo") VALUES ('Hela Odinson', 'Hela', 'Ser la reina de Asgard');
INSERT INTO public."Villano" ("N_Villano", "Alias", "Objetivo") VALUES ('Wilson Fisk', 'Kingpin', 'Ser el jefe de la mafia más poderoso de Nueva York');
INSERT INTO public."Villano" ("N_Villano", "Alias", "Objetivo") VALUES ('Antonia Dreykov', 'Taskmaster', 'Obedecer ordenes de sus superiores');
INSERT INTO public."Villano" ("N_Villano", "Alias", "Objetivo") VALUES ('Otto Octavius', 'Doctor Octopus', 'Continuar sus investigaciones');
INSERT INTO public."Villano" ("N_Villano", "Alias", "Objetivo") VALUES ('Ronan', 'Ronan el Acusador', 'Complaser a su maestro Thanos');
INSERT INTO public."Villano" ("N_Villano", "Alias", "Objetivo") VALUES ('Nebula', 'Nebula', 'Superar a su hermana Gamora');
INSERT INTO public."Villano" ("N_Villano", "Alias", "Objetivo") VALUES ('Namor', 'Namor', 'Proteger a su pueblo');


--
-- TOC entry 3299 (class 2606 OID 24979)
-- Name: Villano Villano_Alias_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Villano"
    ADD CONSTRAINT "Villano_Alias_key" UNIQUE ("Alias");


--
-- TOC entry 3301 (class 2606 OID 24981)
-- Name: Villano Villano_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Villano"
    ADD CONSTRAINT "Villano_pkey" PRIMARY KEY ("N_Villano");


--
-- TOC entry 3302 (class 2606 OID 25517)
-- Name: Villano Villano_N_Villano_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Villano"
    ADD CONSTRAINT "Villano_N_Villano_fkey" FOREIGN KEY ("N_Villano") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE NOT VALID;


-- Completed on 2023-06-26 19:09:33

--
-- PostgreSQL database dump complete
--

