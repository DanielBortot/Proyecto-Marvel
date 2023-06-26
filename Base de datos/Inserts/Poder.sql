--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2023-06-26 19:07:36

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
-- TOC entry 246 (class 1259 OID 24813)
-- Name: Poder; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Poder" (
    "Nombre" text NOT NULL,
    "Imagen" text NOT NULL,
    "Descripcion" text
);


ALTER TABLE public."Poder" OWNER TO postgres;

--
-- TOC entry 3444 (class 0 OID 24813)
-- Dependencies: 246
-- Data for Name: Poder; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Poder" ("Nombre", "Imagen", "Descripcion") VALUES ('Super Fuerza', 'imagen super fuerza', 'Aumento en la fuerza fisica del usuario');
INSERT INTO public."Poder" ("Nombre", "Imagen", "Descripcion") VALUES ('Super Velocidad', 'imagen super velocidad', 'Aumento en la velocidad de movimiento del usuario');
INSERT INTO public."Poder" ("Nombre", "Imagen", "Descripcion") VALUES ('Manipulación de la electricidad', 'imagen manipulacion electricidad', 'El usuario puede manipular a voluntad la electricidad');
INSERT INTO public."Poder" ("Nombre", "Imagen", "Descripcion") VALUES ('Volar', 'imagen volar', 'El usuario puede volar');
INSERT INTO public."Poder" ("Nombre", "Imagen", "Descripcion") VALUES ('Regeneración', 'imagen regeneracion', 'El usuario tiene un factor curativo que aumenta la regeneración de heridas');
INSERT INTO public."Poder" ("Nombre", "Imagen", "Descripcion") VALUES ('Telepatía', 'imagen telepatia', 'El usuario puede leer mentes y proyectar sus propios pensamientos a la mente de otros.');
INSERT INTO public."Poder" ("Nombre", "Imagen", "Descripcion") VALUES ('Garras Retráctiles', 'imagen de garras retractiles', 'El usuario puede extraer garras a voluntad de su cuerpo.');
INSERT INTO public."Poder" ("Nombre", "Imagen", "Descripcion") VALUES ('Super Sentidos', 'imagen super sentidos', 'Los sentidos del usuario estan sobre el nivel de un humano normal.');
INSERT INTO public."Poder" ("Nombre", "Imagen", "Descripcion") VALUES ('Esqueleto metálico', 'imagen esqueleto metalico', 'El esqueleto del usuario esta cubierto por una aleación metalica.');
INSERT INTO public."Poder" ("Nombre", "Imagen", "Descripcion") VALUES ('Manipulación del clima', 'imagen manipulacion clima', 'El usuario puede controlar el clima a voluntad');
INSERT INTO public."Poder" ("Nombre", "Imagen", "Descripcion") VALUES ('Respiración subacuatica', 'imagen', 'El usuario puede respirar bajo la superficie acuatica con total normalidad.');
INSERT INTO public."Poder" ("Nombre", "Imagen", "Descripcion") VALUES ('Ilusionista', 'imagen ilusion', 'Habilidad que tiene el usuario para crear ilusiones que puedan alterar la forma de objetos o de si mismo.');
INSERT INTO public."Poder" ("Nombre", "Imagen", "Descripcion") VALUES ('Magia Negra', 'imagen magia negra', 'Magia obscura prohibida');
INSERT INTO public."Poder" ("Nombre", "Imagen", "Descripcion") VALUES ('No Poder', 'No aplica', 'No aplica');
INSERT INTO public."Poder" ("Nombre", "Imagen", "Descripcion") VALUES ('Visión de sonar', 'imagen de sonar', 'El usuario puede ver por el rebote de las ondas de sonido sin tener que usar la vista.');
INSERT INTO public."Poder" ("Nombre", "Imagen", "Descripcion") VALUES ('Fuerza Sobrehumana', 'imagen de fuerza sobrehumana', 'El usuario puede tiene fuerza física sobre las capacidades humanas.');
INSERT INTO public."Poder" ("Nombre", "Imagen", "Descripcion") VALUES ('Resistencia Sobrehumana', 'imagen de resistencia sobrehumana', 'El usuario puede tiene resistencia física sobre las capacidades humanas.');
INSERT INTO public."Poder" ("Nombre", "Imagen", "Descripcion") VALUES ('Velocidad Sobrehumana', 'imagen de velocidad sobrehumana', 'El usuario puede tiene velocidad física sobre las capacidades humanas.');
INSERT INTO public."Poder" ("Nombre", "Imagen", "Descripcion") VALUES ('Super Resistencia', 'imagen de super resistencia', 'El usuario posee una resisitencia física ilimitada.');
INSERT INTO public."Poder" ("Nombre", "Imagen", "Descripcion") VALUES ('Puño de Hierro', 'imagen de puno de hierro', 'El usuario puede canalizar si chi en un solo punto de su mano, al golpear, la energia incrementa el impacto varias veces.');
INSERT INTO public."Poder" ("Nombre", "Imagen", "Descripcion") VALUES ('Chi', 'imagen de chi', 'El usuario puedde manipular la energia espiritual dentro de si.');


--
-- TOC entry 3299 (class 2606 OID 24947)
-- Name: Poder Poder_Imagen_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Poder"
    ADD CONSTRAINT "Poder_Imagen_key" UNIQUE ("Imagen");


--
-- TOC entry 3301 (class 2606 OID 24949)
-- Name: Poder Poder_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Poder"
    ADD CONSTRAINT "Poder_pkey" PRIMARY KEY ("Nombre");


-- Completed on 2023-06-26 19:07:36

--
-- PostgreSQL database dump complete
--

