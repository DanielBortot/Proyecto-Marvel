--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2023-06-26 19:07:00

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

INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Tony Stark', 'M', 'Marrones', 'Negro', 'Tales of Suspense #39', 'Casado', 'https://static.wikia.nocookie.net/marveldatabase/images/0/0a/Iron_Man_Vol_6_1_Brooks_Variant_Textless.jpg/revision/latest/scale-to-width-down/1200?cb=20211207231858');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Steve Rogers', 'M', 'Azul', 'Rubio', 'Capitan America Comics #1', 'Soltero', 'https://static.wikia.nocookie.net/marvelcomicsenciclopedia/images/3/3f/Capitan_america.png/revision/latest?cb=20120607203316');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Thor Odinson', 'M', 'Azul', 'Rubio', 'Journy into Mystery #83', 'Soltero', 'https://upload.wikimedia.org/wikipedia/en/1/17/Thor_by_Olivier_Coipel.png');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Bruce Banner', 'M', 'Marron', 'Marron', 'Incredible Hulk #1', 'Soltero', 'https://upload.wikimedia.org/wikipedia/en/a/aa/Hulk_%28circa_2019%29.png');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Natasha Romanoff', 'F', 'Azul', 'Rojo', 'Tales of Suspense #52', 'Soltero', 'https://www.sideshow.com/cdn-cgi/image/quality=90,f=auto/https://www.sideshow.com/storage/product-images/501155FAL/black-widow_marvel_silo.png');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Clint Barton', 'M', 'Azul', 'Rubio', 'Tales of Suspense #57', 'Casado', 'https://upload.wikimedia.org/wikipedia/en/9/99/Hawkeye_%28Clinton_Barton%29.png');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Nicholas Fury', 'M', 'Marron', 'No posee', 'Sgt. Fury and his Howling Commandos #1', 'Casado', 'https://cdn.marvel.com/content/1x/fury2023001_cov.jpg');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Maria Hill', 'F', 'Verdes', 'Marron', 'Los Nuevos Vengadores #4', 'Soltero', 'https://static.wikia.nocookie.net/marveldatabase/images/4/4b/Maria_Hill_%28Earth-616%29_from_Avengers_World_Vol_1_14_001.png/revision/latest?cb=20150220062849');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Sharon Carter', 'F', 'Marron', 'Rubio', 'Tales of Suspense #75', 'Viudo', 'https://static.wikia.nocookie.net/marveldatabase/images/6/6c/Sharon_Carter_%28Earth-616%29_from_Captain_America_Sentinel_of_Liberty_Vol_2_11_001.jpg/revision/latest?cb=20230415234335');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Charles Xavier', 'M', 'Marron', 'No tiene', 'X-Men #1', 'Casado', 'https://static.wikia.nocookie.net/marveldatabase/images/c/cc/Old_Man_Logan_Vol_2_26_X-Men_Trading_Card_Variant_Textless.jpg/revision/latest?cb=20170611175302');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Logan Howlett', 'M', 'Azul', 'Negro', 'The Incredible Hulk #180', 'Viudo', 'https://qph.cf2.quoracdn.net/main-qimg-05f66e9374d638d4d30d0d85323a34e0-lq');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Eitri', 'M', 'Verde', 'Marron', 'The Mighty Thor Annual #11', 'Viudo', 'https://static.wikia.nocookie.net/marveldatabase/images/d/d2/Eitri_%28Earth-8096%29_from_Avengers_Earth%27s_Mightiest_Heroes_%28animated_series%29_Season_2_8.png/revision/latest/scale-to-width-down/342?cb=20201027005035');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Howard Stark', 'M', 'Marron', 'Negro', 'Iron Man #28', 'Viudo', 'https://upload.wikimedia.org/wikipedia/en/thumb/a/ab/Howard_Stark_%28Earth-616%29_from_S.H.I.E.L.D._Vol_1_1_page_03.jpg/200px-Howard_Stark_%28Earth-616%29_from_S.H.I.E.L.D._Vol_1_1_page_03.jpg');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Ororo Munroe', 'F', 'Azul', 'Blanco', 'Giant Size X-Men #1', 'Divorciado', 'https://images.squarespace-cdn.com/content/v1/5ce432b1f9d2be000134d8ae/1602089815064-0A5YIMROARBPPNBQXKII/Storm+LEGAL.jpg?format=750w');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Peter Parker', 'M', 'Marron', 'Marron', 'Amazing Fantasy #15', 'Soltero', 'imagen');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Emil Blonsky', 'M', 'Verde', 'Marron', 'Tales to Astonish #90', 'Casado', 'imagen');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Johann Schmidt', 'M', 'Azul', 'No tiene', 'Capitán América Comics #7', 'Viudo', 'imagen');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Helmut Zemo', 'M', 'Azul', 'Rubio', 'Captain America #168', 'Viudo', 'imagen');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Loki Laufeyson', 'M', 'Verde', 'Negro', 'Journey into Mistery #85', 'Soltero', 'imagen');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Obadiah Stane', 'M', 'Marron', 'No tiene', 'Iron Man #163', 'Divorciado', 'imagen');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Hela Odinson', 'F', 'Verdes', 'Negro', 'Journey into Mystery #102', 'Soltero', 'imagen');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Matt Murdock', 'M', 'Blanco', 'Marron', 'Daredevil #1', 'Divorciado', 'imagen de daredevil');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Jessica Jones', 'F', 'Verde', 'Negro', 'Alias #1', 'Casado', 'imagen de jessica');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Luke Cage', 'M', 'Marron', 'No tiene', 'Luke Cage, Hero for Hire #1', 'Casado', 'imagen de luke');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Daniel Rand', 'M', 'Azul', 'Rubio', 'Marvel Premiere #15', 'Casado', 'imagen de iron fist');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Frank Castle', 'M', 'Marron', 'Negro', 'The Amazing Spiderman #129', 'Viudo', 'imagen de punisher');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Wilson Fisk', 'M', 'Marron', 'No tiene', 'The Amazing Spiderman #50', 'Casado', 'imagen de wilson');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Antonia Dreykov', 'F', 'Marron', 'Marron', 'The Avengers Vol. 1 #195', 'Soltero', 'Imagen Taskmaster');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Otto Octavius', 'M', 'Marron', 'Marron', 'The Amazing Spiderman #3', 'Viudo', 'Imagen octopus');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Peter Quill', 'M', 'Azul', 'Rubio', 'Marvel Preview #4', 'Casado', 'Imagen de starlord');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Gamora', 'F', 'Marron', 'Rojo', 'Strange Tales #4', 'Casado', 'Imagen de Gamora');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Drax', 'M', 'Marron', 'No tiene', 'Iron Man #55', 'Viudo', 'Imagen de Drax');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Groot', 'M', 'Verde', 'No tiene', 'Tales of Astonish #13', 'Soltero', 'Imagen de Groot');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Ratchet', 'M', 'Amarillo', 'Gris', 'Marvel Preview', 'Soltero', 'Imagen de Ratchet');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Ronan', 'M', 'Morado', 'No tiene', 'Fantastic Four #65', 'Casado', 'Imagen de Ronan');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Nebula', 'F', 'Azul', 'No tiene', 'Avengers #257', 'Soltero', 'Imagen de Nebula');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Namor', 'M', 'Marron', 'Negro', 'Marvel Comics #1', 'Casado', 'Imagen de namor');


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


-- Completed on 2023-06-26 19:07:00

--
-- PostgreSQL database dump complete
--

