--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2023-06-27 15:02:14

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
-- TOC entry 242 (class 1259 OID 24789)
-- Name: Personaje; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Personaje" (
    "Nombre" text NOT NULL,
    "Genero" text,
    "Color_Ojos" text,
    "Color_Pelo" text,
    "Nom_Comic" text NOT NULL,
    "E_Marital" text NOT NULL,
    imagen text NOT NULL,
    CONSTRAINT "Personaje_Color_Ojos_check" CHECK ((("Color_Ojos" !~~ '%0%'::text) AND ("Color_Ojos" !~~ '%1%'::text) AND ("Color_Ojos" !~~ '%2%'::text) AND ("Color_Ojos" !~~ '%3%'::text) AND ("Color_Ojos" !~~ '%4%'::text) AND ("Color_Ojos" !~~ '%5%'::text) AND ("Color_Ojos" !~~ '%6%'::text) AND ("Color_Ojos" !~~ '%7%'::text) AND ("Color_Ojos" !~~ '%8%'::text) AND ("Color_Ojos" !~~ '%9%'::text))),
    CONSTRAINT "Personaje_Color_Pelo_check" CHECK ((("Color_Pelo" !~~ '%0%'::text) AND ("Color_Pelo" !~~ '%1%'::text) AND ("Color_Pelo" !~~ '%2%'::text) AND ("Color_Pelo" !~~ '%3%'::text) AND ("Color_Pelo" !~~ '%4%'::text) AND ("Color_Pelo" !~~ '%5%'::text) AND ("Color_Pelo" !~~ '%6%'::text) AND ("Color_Pelo" !~~ '%7%'::text) AND ("Color_Pelo" !~~ '%8%'::text) AND ("Color_Pelo" !~~ '%9%'::text))),
    CONSTRAINT "Personaje_E_Marital_check" CHECK ((("E_Marital" = 'Soltero'::text) OR ("E_Marital" = 'Casado'::text) OR ("E_Marital" = 'Viudo'::text) OR ("E_Marital" = 'Divorciado'::text))),
    CONSTRAINT "Personaje_Genero_check" CHECK ((("Genero" = 'M'::text) OR ("Genero" = 'F'::text) OR ("Genero" = 'Desc'::text) OR ("Genero" = 'Otro'::text)))
);


ALTER TABLE public."Personaje" OWNER TO postgres;

--
-- TOC entry 3450 (class 0 OID 24789)
-- Dependencies: 242
-- Data for Name: Personaje; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Tony Stark', 'M', 'Marrones', 'Negro', 'Tales of Suspense #39', 'Casado', 'ironman.jpg');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Steve Rogers', 'M', 'Azul', 'Rubio', 'Capitan America Comics #1', 'Soltero', 'capitanamerica.jpg');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Thor Odinson', 'M', 'Azul', 'Rubio', 'Journy into Mystery #83', 'Soltero', 'thor.jpg');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Bruce Banner', 'M', 'Marron', 'Marron', 'Incredible Hulk #1', 'Soltero', 'hulk.png');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Natasha Romanoff', 'F', 'Azul', 'Rojo', 'Tales of Suspense #52', 'Soltero', 'blackwidow.jpg');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Clint Barton', 'M', 'Azul', 'Rubio', 'Tales of Suspense #57', 'Casado', 'hawkeye.jpg');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Nicholas Fury', 'M', 'Marron', 'No posee', 'Sgt. Fury and his Howling Commandos #1', 'Casado', 'fury.jpg');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Maria Hill', 'F', 'Verdes', 'Marron', 'Los Nuevos Vengadores #4', 'Soltero', 'mariahill.jpg');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Sharon Carter', 'F', 'Marron', 'Rubio', 'Tales of Suspense #75', 'Viudo', 'sharoncarter.jpg');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Charles Xavier', 'M', 'Marron', 'No tiene', 'X-Men #1', 'Casado', 'profesorx.jpg');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Logan Howlett', 'M', 'Azul', 'Negro', 'The Incredible Hulk #180', 'Viudo', 'wolverine.jpg');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Eitri', 'M', 'Verde', 'Marron', 'The Mighty Thor Annual #11', 'Viudo', 'eitri.jpg');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Howard Stark', 'M', 'Marron', 'Negro', 'Iron Man #28', 'Viudo', 'howardstark.jpg');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Ororo Munroe', 'F', 'Azul', 'Blanco', 'Giant Size X-Men #1', 'Divorciado', 'tormenta.jpg');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Peter Parker', 'M', 'Marron', 'Marron', 'Amazing Fantasy #15', 'Soltero', 'spiderman.jpg');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Emil Blonsky', 'M', 'Verde', 'Marron', 'Tales to Astonish #90', 'Casado', 'abominacion.jpg');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Johann Schmidt', 'M', 'Azul', 'No tiene', 'Capitán América Comics #7', 'Viudo', 'craneorojo.jpg');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Helmut Zemo', 'M', 'Azul', 'Rubio', 'Captain America #168', 'Viudo', 'zemo.jpg');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Loki Laufeyson', 'M', 'Verde', 'Negro', 'Journey into Mistery #85', 'Soltero', 'loki.jpg');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Obadiah Stane', 'M', 'Marron', 'No tiene', 'Iron Man #163', 'Divorciado', 'ironmonger.jpg');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Hela Odinson', 'F', 'Verdes', 'Negro', 'Journey into Mystery #102', 'Soltero', 'hela.jpg');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Matt Murdock', 'M', 'Blanco', 'Marron', 'Daredevil #1', 'Divorciado', 'daredevil.jpg');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Jessica Jones', 'F', 'Verde', 'Negro', 'Alias #1', 'Casado', 'jessjones.jpg');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Luke Cage', 'M', 'Marron', 'No tiene', 'Luke Cage, Hero for Hire #1', 'Casado', 'likecage.jpg');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Daniel Rand', 'M', 'Azul', 'Rubio', 'Marvel Premiere #15', 'Casado', 'ironfist.jpg');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Frank Castle', 'M', 'Marron', 'Negro', 'The Amazing Spiderman #129', 'Viudo', 'punisher.jpg');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Wilson Fisk', 'M', 'Marron', 'No tiene', 'The Amazing Spiderman #50', 'Casado', 'kingpin.png');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Antonia Dreykov', 'F', 'Marron', 'Marron', 'The Avengers Vol. 1 #195', 'Soltero', 'taskmaster.jpg');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Otto Octavius', 'M', 'Marron', 'Marron', 'The Amazing Spiderman #3', 'Viudo', 'octopus.jpg');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Peter Quill', 'M', 'Azul', 'Rubio', 'Marvel Preview #4', 'Casado', 'starlord.jpg');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Gamora', 'F', 'Marron', 'Rojo', 'Strange Tales #4', 'Casado', 'gamora.jpg');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Drax', 'M', 'Marron', 'No tiene', 'Iron Man #55', 'Viudo', 'drax.jpg');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Groot', 'M', 'Verde', 'No tiene', 'Tales of Astonish #13', 'Soltero', 'groot.jpg');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Ronan', 'M', 'Morado', 'No tiene', 'Fantastic Four #65', 'Casado', 'ronan.jpg');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Nebula', 'F', 'Azul', 'No tiene', 'Avengers #257', 'Soltero', 'nebula.jpg');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Namor', 'M', 'Marron', 'Negro', 'Marvel Comics #1', 'Casado', 'namor.jpg');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Rocket', 'M', 'Amarillo', 'Gris', 'Marvel Preview', 'Soltero', 'rocket.jpg');


--
-- TOC entry 3303 (class 2606 OID 24937)
-- Name: Personaje Personaje_Nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Personaje"
    ADD CONSTRAINT "Personaje_Nombre_key" UNIQUE ("Nombre");


--
-- TOC entry 3305 (class 2606 OID 24939)
-- Name: Personaje Personaje_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Personaje"
    ADD CONSTRAINT "Personaje_pkey" PRIMARY KEY ("Nombre");


--
-- TOC entry 3306 (class 2620 OID 24984)
-- Name: Personaje emarital_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER emarital_trigger BEFORE INSERT OR UPDATE ON public."Personaje" FOR EACH ROW EXECUTE FUNCTION public.emarital();


--
-- TOC entry 3307 (class 2620 OID 24986)
-- Name: Personaje genero_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER genero_trigger BEFORE INSERT OR UPDATE ON public."Personaje" FOR EACH ROW EXECUTE FUNCTION public.genero();


-- Completed on 2023-06-27 15:02:15

--
-- PostgreSQL database dump complete
--

