--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2023-06-26 19:04:54

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
-- TOC entry 233 (class 1259 OID 24748)
-- Name: Organizacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Organizacion" (
    "Nombre" text NOT NULL,
    "Eslogan" text,
    "Lider" text NOT NULL,
    "Fundador" text NOT NULL,
    "Tipo" text,
    "Nom_Comic" text NOT NULL,
    "Imagen" text NOT NULL,
    "Objetivo" text,
    "Lugar_Creacion" text NOT NULL
);


ALTER TABLE public."Organizacion" OWNER TO postgres;

--
-- TOC entry 3450 (class 0 OID 24748)
-- Dependencies: 233
-- Data for Name: Organizacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Organizacion" ("Nombre", "Eslogan", "Lider", "Fundador", "Tipo", "Nom_Comic", "Imagen", "Objetivo", "Lugar_Creacion") VALUES ('Hydra', 'Si se corta una cabeza, dos mas tomaran su lugar', 'Johann Schmidt', 'Johann Schmidt', 'Militar', 'Strange Tales #135', 'imagen', 'Dominar el mundo', 'Alemania');
INSERT INTO public."Organizacion" ("Nombre", "Eslogan", "Lider", "Fundador", "Tipo", "Nom_Comic", "Imagen", "Objetivo", "Lugar_Creacion") VALUES ('Vengadores', 'Si no podemos salvarlos, da por seguro que los vengaremos', 'Tony Stark', 'Tony Stark', 'Grupo de superheroes', 'The Avengers #1', 'https://upload.wikimedia.org/wikipedia/en/2/2b/Avengers_%28Marvel_Comics%29_vol_3_num_38.jpg', 'Salvar el mundo', 'Estados Unidos');
INSERT INTO public."Organizacion" ("Nombre", "Eslogan", "Lider", "Fundador", "Tipo", "Nom_Comic", "Imagen", "Objetivo", "Lugar_Creacion") VALUES ('SHIELD', 'Sistema Homologado de Inteligencia, Espionaje, Logística, y Defensa.', 'Nicholas Fury', 'Howard Stark', 'Agencia de inteligencia', 'Strange Tales #135', 'https://i.pinimg.com/originals/70/d1/8d/70d18dc11298dc928d60ddfead03b768.jpg', 'Investigar posibles amenazas en el mundo', 'Estados Unidos');
INSERT INTO public."Organizacion" ("Nombre", "Eslogan", "Lider", "Fundador", "Tipo", "Nom_Comic", "Imagen", "Objetivo", "Lugar_Creacion") VALUES ('X-Men', '"Bienvenido a los X-Men. Espero que sobrevivas a la experiencia".', 'Charles Xavier', 'Charles Xavier', 'Escuela para jovenes mutantes', 'X-Men #1', 'https://static.wikia.nocookie.net/marvel/images/6/6b/X-Men.jpg/revision/latest?cb=20101213233550&path-prefix=es', 'Proteger los derechos de los mutantes', 'Estados Unidos');
INSERT INTO public."Organizacion" ("Nombre", "Eslogan", "Lider", "Fundador", "Tipo", "Nom_Comic", "Imagen", "Objetivo", "Lugar_Creacion") VALUES ('Guardianes de la Galaxia', 'Ése tipo, allí. Necesito su pierna ortopédica.', 'Peter Quill', 'Peter Quill', 'Mercenarios', 'Marvel Super-Heroes # 18', 'Imagen de gg', 'Salvar la galaxia', 'Xandar');


--
-- TOC entry 3299 (class 2606 OID 24917)
-- Name: Organizacion Organizacion_Fundador_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Organizacion"
    ADD CONSTRAINT "Organizacion_Fundador_key" UNIQUE ("Fundador");


--
-- TOC entry 3301 (class 2606 OID 24919)
-- Name: Organizacion Organizacion_Imagen_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Organizacion"
    ADD CONSTRAINT "Organizacion_Imagen_key" UNIQUE ("Imagen");


--
-- TOC entry 3303 (class 2606 OID 24921)
-- Name: Organizacion Organizacion_Lider_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Organizacion"
    ADD CONSTRAINT "Organizacion_Lider_key" UNIQUE ("Lider");


--
-- TOC entry 3305 (class 2606 OID 24923)
-- Name: Organizacion Organizacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Organizacion"
    ADD CONSTRAINT "Organizacion_pkey" PRIMARY KEY ("Nombre");


--
-- TOC entry 3306 (class 2606 OID 25565)
-- Name: Organizacion Organizacion_Fundador_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Organizacion"
    ADD CONSTRAINT "Organizacion_Fundador_fkey" FOREIGN KEY ("Fundador") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE NOT VALID;


--
-- TOC entry 3307 (class 2606 OID 25560)
-- Name: Organizacion Organizacion_Lider_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Organizacion"
    ADD CONSTRAINT "Organizacion_Lider_fkey" FOREIGN KEY ("Lider") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE NOT VALID;


-- Completed on 2023-06-26 19:04:54

--
-- PostgreSQL database dump complete
--

