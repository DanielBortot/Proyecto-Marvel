--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2023-06-27 15:00:32

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
-- TOC entry 229 (class 1259 OID 24727)
-- Name: Medio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Medio" (
    "Titulo" text NOT NULL,
    "Fecha_Estreno" date NOT NULL,
    "Compania" text NOT NULL,
    "Rating" integer NOT NULL,
    "Sinopsis" text NOT NULL,
    "Imagen" text NOT NULL,
    CONSTRAINT "Medio_Rating_check" CHECK ((("Rating" >= 1) AND ("Rating" <= 5)))
);


ALTER TABLE public."Medio" OWNER TO postgres;

--
-- TOC entry 3446 (class 0 OID 24727)
-- Dependencies: 229
-- Data for Name: Medio; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Medio" ("Titulo", "Fecha_Estreno", "Compania", "Rating", "Sinopsis", "Imagen") VALUES ('Iron Man', '2008-02-05', 'Marvel Studios', 5, 'Tony Stark, un genio millonario y fabricante de armas, es secuestrado y obligado a construir un arma devastadora. En cambio, crea una poderosa armadura para escapar. Después de regresar a casa, decide usar su tecnología para convertirse en Iron Man y luchar contra el mal.', 'ironman2008.jpg');
INSERT INTO public."Medio" ("Titulo", "Fecha_Estreno", "Compania", "Rating", "Sinopsis", "Imagen") VALUES ('The Incredible Hulk', '2008-06-13', 'Marvel Studios', 5, 'Bruce Banner, un científico que se transforma en un monstruo verde cuando está enojado, busca una cura mientras es perseguido por el gobierno y lucha contra el Abominable Hulk en una batalla épica.', 'hulk2008');
INSERT INTO public."Medio" ("Titulo", "Fecha_Estreno", "Compania", "Rating", "Sinopsis", "Imagen") VALUES ('Thor', '2011-04-17', 'Marvel Studios', 4, 'Thor, el poderoso dios del trueno, es desterrado a la Tierra y debe aprender humildad para poder recuperar su martillo mágico, Mjolnir, y enfrentarse a su hermano Loki, quien busca desatar el caos y tomar el trono de Asgard.', 'thorpelicula.jpg');
INSERT INTO public."Medio" ("Titulo", "Fecha_Estreno", "Compania", "Rating", "Sinopsis", "Imagen") VALUES ('Capitán América: el primer vengador', '2011-07-22', 'Marvel Studios', 4, 'Steve Rogers, un joven débil y frágil, se ofrece como voluntario para un experimento que lo transforma en el supersoldado Capitán América. Lidera un equipo de soldados para luchar contra la organización malvada Hydra y su líder, Cráneo Rojo, durante la Segunda Guerra Mundial.', 'cappelicula.jpg');
INSERT INTO public."Medio" ("Titulo", "Fecha_Estreno", "Compania", "Rating", "Sinopsis", "Imagen") VALUES ('Iron Man 2', '2010-04-28', 'Marvel Studios', 4, 'Tony Stark, conocido como Iron Man, se enfrenta a nuevos desafíos mientras lucha contra su propia mortalidad y los planes de un villano que busca venganza. Mientras tanto, debe proteger su tecnología y encontrar un reemplazo para su reactor arc.', 'ironman2_2010.jpg');
INSERT INTO public."Medio" ("Titulo", "Fecha_Estreno", "Compania", "Rating", "Sinopsis", "Imagen") VALUES ('Marvels The Punisher', '2017-11-17', 'ABC Studios', 3, 'Frank Castle, un ex marine convertido en vigilante, busca venganza contra los responsables del asesinato de su familia. A medida que desmantela una conspiración criminal, se enfrenta a su pasado y a su propia moralidad mientras lucha incansablemente para hacer justicia de la única manera que conoce: la violencia.', 'punisherserie.jpg');
INSERT INTO public."Medio" ("Titulo", "Fecha_Estreno", "Compania", "Rating", "Sinopsis", "Imagen") VALUES ('Marvels Iron Fist', '2017-03-18', 'ABC Studios', 2, 'Danny Rand, un joven multimillonario que fue dado por muerto en un accidente de avión, regresa a Nueva York después de años de entrenamiento en artes marciales en la ciudad mística de Kun-Lun. Ahora posee el poder del Puño de Hierro y lucha contra los enemigos que amenazan su ciudad y su legado familiar.', 'ironfistserie.jpg');
INSERT INTO public."Medio" ("Titulo", "Fecha_Estreno", "Compania", "Rating", "Sinopsis", "Imagen") VALUES ('Marvels Luke Cage', '2016-09-30', 'ABC Studios', 4, 'Luke Cage, un hombre con una piel impenetrable y una fuerza sobrehumana, se convierte en un héroe de Harlem después de un experimento fallido. Mientras protege su vecindario, debe enfrentarse a peligrosos enemigos, incluyendo a Cottonmouth y Diamondback, y lidiar con su pasado traumático.', 'lukecageserie.jpg');
INSERT INTO public."Medio" ("Titulo", "Fecha_Estreno", "Compania", "Rating", "Sinopsis", "Imagen") VALUES ('Marvels Jessica Jones', '2015-11-20', 'ABC Studios', 4, 'Jessica Jones, una detective privada con habilidades superhumanas, lucha contra sus propios demonios mientras utiliza sus poderes para resolver casos. Su pasado oscuro vuelve a perseguirla cuando se enfrenta a Kilgrave, un manipulador con el poder de controlar mentes. Jessica debe confrontar sus traumas y detener a Kilgrave antes de que cause más daño.', 'jessjonesserie.jpg');
INSERT INTO public."Medio" ("Titulo", "Fecha_Estreno", "Compania", "Rating", "Sinopsis", "Imagen") VALUES ('Marvels The Defenders', '2017-08-18', 'ABC Studios', 4, 'Los héroes de Nueva York, Daredevil, Jessica Jones, Luke Cage y Iron Fist, unen fuerzas para enfrentarse a una amenaza común. Juntos, forman el equipo conocido como "The Defenders" y luchan contra la organización criminal conocida como La Mano, que busca destruir la ciudad. Cada héroe debe superar sus diferencias y trabajar en equipo para proteger a Nueva York.', 'defendersserie.jpg');
INSERT INTO public."Medio" ("Titulo", "Fecha_Estreno", "Compania", "Rating", "Sinopsis", "Imagen") VALUES ('Spiderman: Un nuevo universo', '2018-12-14', 'Sony Pictures Animation', 5, 'Spierman decubre que hay un multiverso de spidermans', 'spidermanmultiverse.jpg');
INSERT INTO public."Medio" ("Titulo", "Fecha_Estreno", "Compania", "Rating", "Sinopsis", "Imagen") VALUES ('Iron Man: Surge el tecnivoro', '2013-04-16', 'Madhouse', 3, 'Iron Man se enfrenta a un enemigo nunca antes visto', 'ironmansurgeseltecnivoro.jpg');
INSERT INTO public."Medio" ("Titulo", "Fecha_Estreno", "Compania", "Rating", "Sinopsis", "Imagen") VALUES ('Ultimate Avengers 2: Rise of the Panther', '2006-08-08', 'MLG Productions', 4, 'Los vengadores se tendran que reunir una vez mas para defender al mundo de una nueva amenaza.', 'ultimateav2.jpg');
INSERT INTO public."Medio" ("Titulo", "Fecha_Estreno", "Compania", "Rating", "Sinopsis", "Imagen") VALUES ('Marvels Daredevil', '2015-04-10', 'ABC Studios', 5, 'Matt Murdock, un abogado ciego, lleva una doble vida como el justiciero enmascarado Daredevil, luchando contra el crimen en las calles de Hells Kitchen. Enfrenta a poderosos enemigos, incluyendo a Kingpin, mientras equilibra su vida personal y su deber de proteger a los inocentes.', 'daredevilserie.jpg');
INSERT INTO public."Medio" ("Titulo", "Fecha_Estreno", "Compania", "Rating", "Sinopsis", "Imagen") VALUES ('Iron Man 3', '2013-05-03', 'Marvel Studios', 4, 'Tony Stark, también conocido como Iron Man, se enfrenta a un enemigo misterioso llamado El Mandarín, quien amenaza su vida y todo lo que él representa. Enfrentando desafíos personales y enfrentándose a la destrucción de su mundo, Tony debe confiar en su ingenio y su armadura para proteger a sus seres queridos y salvar el día.', 'ironman3_2013.jpg');
INSERT INTO public."Medio" ("Titulo", "Fecha_Estreno", "Compania", "Rating", "Sinopsis", "Imagen") VALUES ('Thor: Un mundo oscuro', '2013-11-08', 'Marvel Studios', 3, 'Thor debe enfrentarse a una antigua raza de elfos oscuros liderada por Malekith, quien busca sumir al universo en la oscuridad eterna. Thor se une a su hermano Loki en una peligrosa alianza para detener la amenaza y proteger a su amada, Jane Foster, mientras luchan por el destino de los Nueve Reinos.', 'thor2.jpg');
INSERT INTO public."Medio" ("Titulo", "Fecha_Estreno", "Compania", "Rating", "Sinopsis", "Imagen") VALUES ('Capitán América: El soldado del invierno', '2014-04-04', 'Marvel Studios', 5, 'El Capitán América, Steve Rogers, se encuentra con una conspiración dentro de S.H.I.E.L.D. y debe enfrentarse a la corrupción y la infiltración de Hydra en la organización. Con la ayuda de la Viuda Negra y Falcon, lucha por desenmascarar a los traidores y salvar al mundo de un plan maligno.', 'cap2.jpg');
INSERT INTO public."Medio" ("Titulo", "Fecha_Estreno", "Compania", "Rating", "Sinopsis", "Imagen") VALUES ('Guardianes de la Galaxia', '2014-08-01', 'Marvel Studios', 5, '
Peter Quill, un aventurero espacial conocido como Star-Lord, se une a un grupo improbable de delincuentes, incluyendo a Gamora, Drax, Rocket y Groot, para proteger una poderosa gema del infinito de caer en manos equivocadas. Juntos, se embarcan en una misión cósmica llena de acción, humor y emociones, convirtiéndose en los legendarios Guardianes de la Galaxia.', 'guardianespelicula.jpg');
INSERT INTO public."Medio" ("Titulo", "Fecha_Estreno", "Compania", "Rating", "Sinopsis", "Imagen") VALUES ('Antman', '2015-07-17', 'Marvel Studios', 4, 'Scott Lang, un ladrón con habilidades extraordinarias, se convierte en el nuevo Ant-Man bajo la tutela del Dr. Hank Pym. Utilizando un traje que le permite encogerse y aumentar su fuerza, Scott debe llevar a cabo un robo para salvar el mundo de una amenaza tecnológica y demostrar que puede ser un héroe digno.', 'antmanpelicula.jpg');
INSERT INTO public."Medio" ("Titulo", "Fecha_Estreno", "Compania", "Rating", "Sinopsis", "Imagen") VALUES ('Black Widow', '2021-07-09', 'Marvel Studios', 4, 'Natasha debera enfrentar a los fantasmas de su pasado de una vez por todas.', 'blackwidow2021.jpg');
INSERT INTO public."Medio" ("Titulo", "Fecha_Estreno", "Compania", "Rating", "Sinopsis", "Imagen") VALUES ('X-Men', '2000-07-14', 'The Donners Company', 4, 'Una escuela de jovenes mutantes esta reclutando a diferentes superheroes para enfrentar un mal comun.', 'xmen2000.jpg');
INSERT INTO public."Medio" ("Titulo", "Fecha_Estreno", "Compania", "Rating", "Sinopsis", "Imagen") VALUES ('Spiderman 2', '2004-06-30', 'Columbia Pictures', 5, 'Spiderman debera enfrentar no solo a un nuevo villano, sino tambien a su maestro.', 'spiderman2_2004.jpg');
INSERT INTO public."Medio" ("Titulo", "Fecha_Estreno", "Compania", "Rating", "Sinopsis", "Imagen") VALUES ('Thor: Ragnarok', '2017-10-10', 'Marvel Studios', 4, 'Thor debera regresar de un mundo alocado para derrotar a su hermana Hela.', 'thor2017.jpg');
INSERT INTO public."Medio" ("Titulo", "Fecha_Estreno", "Compania", "Rating", "Sinopsis", "Imagen") VALUES ('Avengers: Endgame', '2019-04-26', 'Marvel Studios', 5, 'Los sobrevivientes deberan buscar denuevo las gemas del infinito a travez del tiempo para regresar todo a la normalidad.', 'avengers2019.jpg');
INSERT INTO public."Medio" ("Titulo", "Fecha_Estreno", "Compania", "Rating", "Sinopsis", "Imagen") VALUES ('Avengers', '2012-05-04', 'Marvel Studios', 5, 'Los héroes de Marvel, como Iron Man, Capitán América, Thor y Hulk, se unen bajo la dirección de Nick Fury para formar los Vengadores. Juntos, luchan contra Loki y su ejército alienígena, que amenazan con conquistar la Tierra.', 'avengerspelicula.jpg');
INSERT INTO public."Medio" ("Titulo", "Fecha_Estreno", "Compania", "Rating", "Sinopsis", "Imagen") VALUES ('Avengers: La era de ultron', '2015-05-01', 'Marvel Studios', 4, 'Los Vengadores se reúnen nuevamente para enfrentarse a Ultron, una inteligencia artificial decidida a erradicar a la humanidad. Mientras luchan contra este nuevo enemigo, también deben confrontar sus propios conflictos internos y trabajar en equipo para proteger al mundo de la destrucción total.', 'av2.jpg');
INSERT INTO public."Medio" ("Titulo", "Fecha_Estreno", "Compania", "Rating", "Sinopsis", "Imagen") VALUES ('Capitán América: Civil War', '2016-04-12', 'Marvel Studios', 4, 'Steve Rogers y Tony Stark se enfrentan por diferencias entre su presente y su pasado.', 'capcivilwar.jpg');
INSERT INTO public."Medio" ("Titulo", "Fecha_Estreno", "Compania", "Rating", "Sinopsis", "Imagen") VALUES ('Black Panther: Wakanda Forever', '2022-11-10', 'Marvel Studios', 5, 'Despues de la muerte del rey, su familia debera luchar con una nueva amenaza.', 'wakandaforever.jpg');


--
-- TOC entry 3300 (class 2606 OID 24905)
-- Name: Medio Medio_Imagen_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Medio"
    ADD CONSTRAINT "Medio_Imagen_key" UNIQUE ("Imagen");


--
-- TOC entry 3302 (class 2606 OID 24907)
-- Name: Medio Medio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Medio"
    ADD CONSTRAINT "Medio_pkey" PRIMARY KEY ("Titulo");


--
-- TOC entry 3303 (class 2620 OID 24988)
-- Name: Medio rating_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER rating_trigger BEFORE INSERT OR UPDATE ON public."Medio" FOR EACH ROW EXECUTE FUNCTION public.numrating();


-- Completed on 2023-06-27 15:00:32

--
-- PostgreSQL database dump complete
--

