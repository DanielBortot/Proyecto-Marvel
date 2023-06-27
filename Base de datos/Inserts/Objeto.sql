--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2023-06-27 15:00:53

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
-- TOC entry 231 (class 1259 OID 24738)
-- Name: Objeto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Objeto" (
    "Nombre" text NOT NULL,
    "Descripcion" text,
    "Material" text,
    "Tipo" text NOT NULL,
    "Imagen" text NOT NULL,
    "N_Personaje" text
);


ALTER TABLE public."Objeto" OWNER TO postgres;

--
-- TOC entry 3445 (class 0 OID 24738)
-- Dependencies: 231
-- Data for Name: Objeto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Objeto" ("Nombre", "Descripcion", "Material", "Tipo", "Imagen", "N_Personaje") VALUES ('Mark III', 'Primera armadura funcional', 'Alenacion de ritanio y oro', 'Armadura', 'https://static.wikia.nocookie.net/marvelcinematicuniverse/images/d/dc/Iron_Man_-_Mark_III.png/revision/latest/scale-to-width-down/204?cb=20171203054542&path-prefix=es', 'Tony Stark');
INSERT INTO public."Objeto" ("Nombre", "Descripcion", "Material", "Tipo", "Imagen", "N_Personaje") VALUES ('Mjolnir', 'Martillo mágico', 'Uru', 'Arma', 'https://cdn.webshopapp.com/shops/305440/files/334090082/600x600x2/thor-mjolnir-hammer-full-metal-hammer.jpg', 'Thor Odinson');
INSERT INTO public."Objeto" ("Nombre", "Descripcion", "Material", "Tipo", "Imagen", "N_Personaje") VALUES ('Escudo del Capitán América', 'Escudo circular indestructible', 'Vibranio', 'Escudo', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e5/CapAward.png/320px-CapAward.png', 'Steve Rogers');
INSERT INTO public."Objeto" ("Nombre", "Descripcion", "Material", "Tipo", "Imagen", "N_Personaje") VALUES ('No Objeto', NULL, NULL, 'No aplica', 'No aplica', NULL);
INSERT INTO public."Objeto" ("Nombre", "Descripcion", "Material", "Tipo", "Imagen", "N_Personaje") VALUES ('IM Mark Uno', 'Exoesqueleto militar de alta capacidad', 'Acero Omnio', 'Armadura', 'imagen monger', 'Obadiah Stane');
INSERT INTO public."Objeto" ("Nombre", "Descripcion", "Material", "Tipo", "Imagen", "N_Personaje") VALUES ('Arco de Ojo de Halcón', 'Arco de poleas con una variedad de flechas para cada ocación.', 'Fibra de Carbono', 'Arma', 'Imagen arco', 'Clint Barton');
INSERT INTO public."Objeto" ("Nombre", "Descripcion", "Material", "Tipo", "Imagen", "N_Personaje") VALUES ('Arnes de pulpo', 'Arnes con cuatro brazos mecánicos', 'Titanio', 'Armadura', 'Imagen de arnes', 'Otto Octavius');
INSERT INTO public."Objeto" ("Nombre", "Descripcion", "Material", "Tipo", "Imagen", "N_Personaje") VALUES ('Cetro de Loki', 'Arma Chitauri que poseía la Gema de la Mente en su interior', 'Desconocido', 'Arma', 'Imagen del cetro', 'Loki Laufeyson');
INSERT INTO public."Objeto" ("Nombre", "Descripcion", "Material", "Tipo", "Imagen", "N_Personaje") VALUES ('Arco Compuesto', 'Arco de polea con diferentes funcionalidades', 'Titanio', 'Arma', 'Imagen de Arco', 'Clint Barton');
INSERT INTO public."Objeto" ("Nombre", "Descripcion", "Material", "Tipo", "Imagen", "N_Personaje") VALUES ('Gema del Poder', 'Gema del infinito del poder', 'Desconocido', 'Artefacto', 'igp', NULL);


--
-- TOC entry 3299 (class 2606 OID 24911)
-- Name: Objeto Objeto_Imagen_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Objeto"
    ADD CONSTRAINT "Objeto_Imagen_key" UNIQUE ("Imagen");


--
-- TOC entry 3301 (class 2606 OID 24913)
-- Name: Objeto Objeto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Objeto"
    ADD CONSTRAINT "Objeto_pkey" PRIMARY KEY ("Nombre");


--
-- TOC entry 3302 (class 2606 OID 25532)
-- Name: Objeto Objeto_N_Personaje_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Objeto"
    ADD CONSTRAINT "Objeto_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE NOT VALID;


-- Completed on 2023-06-27 15:00:53

--
-- PostgreSQL database dump complete
--

